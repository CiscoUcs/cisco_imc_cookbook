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
require "imccoreutils"

require "mometa/comm/CommIpmiLan"

#
# Enable IPMI over LAN.
#
# @param handle [ImcHandle] ImcHandle class object
# @param priv [String] Optional privilege level: "admin", "user", or "read-only"
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [CommIpmiLan]
# @raise [ValueError] if privilege or key is invalid
# @example
#   if ipmi_enable(handle) then puts "IPMI Enable" end
#
def ipmi_enable(handle:, priv: CommIpmiLanConsts::PRIV_ADMIN,
                key: '0'*40, server_id: 1)

    # Verify key is a hex number
    begin
        key.to_i(16).to_s(16)
    rescue
        raise ValueError.new("#{handle.ip}: ERROR: Encryption key is not hex number: #{key}")
    end
    # Create enabled IPMI object
    ipmi_mo = CommIpmiLan.new(parent_mo_or_dn: _get_comm_mo_dn(handle, server_id))

    args = {:admin_state => "enabled",
            :priv => priv,
            :key => key}
    ipmi_mo.set_prop_multiple(**args)

    # Configure IPMI object on CIMC
    handle.set_mo(mo: ipmi_mo)
    return handle.query_dn(dn: ipmi_mo.dn)
end

#
# Disable IPMI over LAN.
#
# @param handle [ImcHandle] ImcHandle class object
# @param server_id [Integer] Server Id to be specified for C3260 platforms.
# @return [CommIpmiLan]
#
def ipmi_disable(handle:, server_id: 1)

    # Create disabled IPMI object
    ipmi_mo = CommIpmiLan.new(parent_mo_or_dn: _get_comm_mo_dn(handle, server_id))
    ipmi_mo.set_prop(:admin_state, "disabled")

    # Configure IPMI object on CIMC
    handle.set_mo(mo: ipmi_mo)
    return handle.query_dn(dn: ipmi_mo.dn)
end

#
# Check if IPMI over LAN is enabled
#
# @param handle [ImcHandle] ImcHandle class object
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [TrueClass, FalseClass] true if enable, else false
#
def is_ipmi_enabled(handle:, server_id: 1)
    ipmi_mo = CommIpmiLan.new(parent_mo_or_dn:_get_comm_mo_dn(handle, server_id))
    ipmi_mo = handle.query_dn(dn: ipmi_mo.dn)

    return (ipmi_mo.admin_state.downcase == "enabled")
end

private
#
# Internal method to get the IPMI mo's parent_dn based on the type of platform
#
def _get_comm_mo_dn(handle, server_id=1)

    if handle.platform == IMC_PLATFORM::TYPE_CLASSIC
        return("sys/svc-ext")
    elsif handle.platform == IMC_PLATFORM::TYPE_MODULAR
        return(ImcCoreUtils.get_server_dn(handle, server_id) + "/svc-ext")
    else
        raise ImcValidationException("Invalid platform detected: #{handle.platform}")
    end
end