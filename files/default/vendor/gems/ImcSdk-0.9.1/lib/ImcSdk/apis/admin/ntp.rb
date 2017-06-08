# Copyright 2017 Cisco Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$:.unshift(*Dir[::File.expand_path('./../../', File.dirname(__FILE__))])

require_relative "../utils.rb"
require "imcexception"


COMM_EXT_DN = "sys/svc-ext"
NTP_DN = "sys/svc-ext/ntp-svc"
NTP_SERVER_LIST = ["ntp_server1", "ntp_server2", "ntp_server3", "ntp_server4"]

#
# Enables NTP and configures the NTP servers provided
#
# @param handle [ImcHandle] ImcHandle class object
# @param ntp_servers [Array] List of dictionaries in the format
#                           [{:id => 1, :ip => "192.168.1.1"},
#                           {:id => 2, :ip => "192.168.1.2"}]
# @note Upto 4 ntp servers can be specified.
# @return [CommNtpProvider]
# @example
#   ntp_enable(handle: handle,
#               ntp_servers = [{:id => 1, :ip => "192.168.1.1"},
#               {:id => 2, :ip => "192.168.1.2"}]
#
def ntp_enable(handle:, ntp_servers: Array.new)
    mo = _get_mo(handle: handle, dn: NTP_DN)
    mo.set_prop(:ntp_enable, "yes")
    _set_ntp_servers(mo, ntp_servers)
    handle.set_mo(mo: mo)
    return handle.query_dn(dn: mo.dn)

end

#
# Disables NTP
#
# @param handle [ImcHandle] ImcHandle class object
# @return [CommNtpProvider]
#
def ntp_disable(handle:)
    mo = _get_mo(handle: handle, dn: NTP_DN)
    mo.set_prop(:ntp_enable, "no")
    handle.set_mo(mo: mo)
    return handle.query_dn(dn: mo.dn)
end

#
# Clears the NTP servers provided in the arguments.
# Clears all the NTP servers, only if ntp is disabled.
#
# @param handle [ImcHandle] ImcHandle class object
# @param ntp_servers [Array] List of NTP servers in the format ["192.168.1.1", "192.168.1.2"]
# @return [CommNtpProvider]
#
def ntp_servers_clear(handle:, ntp_servers: Array.new)
    mo = _get_mo(handle: handle, dn: NTP_DN)
    args = {}

    if ntp_servers.size > 0
        NTP_SERVER_LIST.each do |x|
            ntp_server_ip = mo.instance_variable_get("@" + x )
            if ntp_servers.include? ntp_server_ip
                args[x.to_sym] = ""
            end
        end
        #args = {x => "" for x in NTP_SERVER_LIST if mo.instance_variable_get("@" + x) in ntp_servers}
    else
        NTP_SERVER_LIST.each do |x|
            args[x.to_sym] = ""
        end
    end

    if ["yes", "true"].include? mo.ntp_enable.downcase and args.size == NTP_SERVER_LIST.size
        raise ImcOperationError.new("Clear NTP Servers", "Cannot clear all NTP servers when NTP is enabled")
    end
    mo.set_prop(:ntp_enable, mo.ntp_enable)
    mo.set_prop_multiple(**args)
    handle.set_mo(mo: mo)
    return handle.query_dn(dn: mo.dn)
end

#
# Modifies the configured NTP servers
#
# @param handle [ImcHandle] ImcHandle class object
# @param ntp_servers [Array] List of dictionaries in the format
#                           [{:id => 1, :ip => "192.168.1.1"},
#                           {:id => 2, :ip => "192.168.1.2"}]
# @note Upto 4 ntp servers can be specified.
# @return [CommNtpProvider]
# @example
#   ntp_servers_modify(handle: handle,
#               ntp_servers = [{:id => 1, :ip => "192.168.1.1"},
#               {:id => 2, :ip => "192.168.1.2"},
#               {:id => 3, :ip => ""}]
#
def ntp_servers_modify(handle:, ntp_servers: Array.new)

    # While sending the modified list of servers, it is imperative to send
    # ntp_enable property in the request.
    # Hence, query the MO and reassign the same value to ntp_enable
    mo = _get_mo(handle: handle, dn: NTP_DN)
    mo.set_prop(:ntp_enable, mo.ntp_enable)
    _set_ntp_servers(mo, ntp_servers)
    handle.set_mo(mo: mo)
    return handle.query_dn(dn: mo.dn)
end

#
# Check if NTP is enabled
#
# @param handle [ImcHandle] ImcHandle class object
# @return [TrueClass, FalseClass] true if enabled, else false
#
def is_ntp_enabled(handle:)
    mo = _get_mo(handle: handle, dn: NTP_DN)
    return (["true", "yes"].include? mo.ntp_enable.downcase)
end
=begin
def get_ntp_server_list(ntp_mo, ntp_servers)

    ntp_server_list = []
    for x in ntp_servers
        key = "ntp_server" + x[:id].to_s
        value = ntp_mo.instance_variable_get("@" + prop)
        ntp_server_list.push({:id => x[:id].to_s, :ip => value.to_s })
    end
    return ntp_Server_list
end
=end

#
# Check if the specified NTP settings are already applied
#
# @param handle [ImcHandle] ImcHandle class object
# @param kwargs [Hash] key-value paired arguments
# @return [TrueClass, CommNtpProvider] if settings match
# @return [FalseClass, CommNtpProvider] if settings don't match
#
def ntp_settings_match(handle:, **kwargs)
    ntp_mo = _get_mo(handle: handle, dn: NTP_DN)

    if _is_valid_arg("ntp_enable", kwargs)
        if ntp_mo.ntp_enable != kwargs[:ntp_enable]
            return false, ntp_mo
        end
    end

    if _is_valid_arg("ntp_servers", kwargs)
        require "mometa/comm/CommNtpProvider"
        mo = CommNtpProvider.new( parent_mo_or_dn: COMM_EXT_DN)
        _set_ntp_servers(mo, kwargs[:ntp_servers])
        if !_check_ntp_server_match(ntp_mo, mo)
            return false, ntp_mo
        end
    end

    return true, ntp_mo
end

private
def _check_ntp_server_match(ntp_mo, mo)
    for prop in NTP_SERVER_LIST
        configured_value = ntp_mo.instance_variable_get("@" + prop)
        in_value = mo.instance_variable_get("@" + prop)

        if _is_invalid_value(configured_value) and 
                _is_invalid_value(in_value)
            next
        end
        if configured_value != in_value
            return false
        end
    end
    return true
end

def _set_ntp_servers(mo, ntp_servers)
    if ntp_servers.size > NTP_SERVER_LIST.size
        raise ImcOperationError.new("Set NTP Servers", "Cannot specify more than #{NTP_SERVER_LIST.size} servers")
    end
    args = {}
    for x in ntp_servers
        key = "ntp_server" + x[:id].to_s
        value = x[:ip]
        args[key.to_sym] = value
    end
    mo.set_prop_multiple(**args)
end