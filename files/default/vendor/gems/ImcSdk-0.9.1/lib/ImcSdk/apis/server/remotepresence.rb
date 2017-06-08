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

require "apis/admin/ipmi"
require "mometa/comm/CommKvm"
require "mometa/sol/SolIf"

#
# This method will setup and enable kvm console access
#
# @param handle [ImcHandle] ImcHandle class object
# @param max_sessions [Integer] Max no. of sessions allowed (1-4)
# @param port [Integer] Port used for kvm communication
# @param encrypt [TrueClass, FalseClass] Encrypt video information sent over kvm
# @param mirror_locally [TrueClass, FalseClass] Mirror the kvm session on local monitor
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [CommKvm]
# @example
#   kvm_setup(handle: ImcHandle,
#                  max_sessions: 4,
#                  port: 4000,
#                  encrypt: true,
#                  mirror_locally: false)
#
def kvm_setup(handle: , max_sessions: 1, port: 2068,\
              encrypt: false, mirror_locally: false, server_id: 1)
    kvm_mo = CommKvm.new(parent_mo_or_dn: _get_comm_mo_dn(handle, server_id))
    params = {
        :admin_state => "enabled",
        :total_sessions => max_sessions.to_s,
        :port => port.to_s,
        :encryption_state => encrypt ? "enabled" : "disabled",
        :local_video_state => mirror_locally ? "enabled" : "disabled"
    }

    kvm_mo.set_prop_multiple(**params)
    handle.set_mo(mo: kvm_mo)
    return kvm_mo
end

#
# This method will disable kvm console access
#
# @param handle [ImcHandle] ImcHandle class object
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [nil]
#
def kvm_disable(handle:, server_id: 1)
    kvm_mo = CommKvm.new(parent_mo_or_dn: _get_comm_mo_dn(handle, server_id))
    kvm_mo.set_prop(:admin_state, "disabled")
    handle.set_mo(mo: kvm_mo)
end

#
# This method will check if kvm console access is enabled
#
# @param handle [ImcHandle] ImcHandle class object
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [nil]
#
def is_kvm_enabled(handle:, server_id: 1)
    kvm_mo = CommKvm.new(parent_mo_or_dn: _get_comm_mo_dn(handle, server_id))
    kvm_mo = handle.query_dn(dn: kvm_mo.dn)
    return(kvm_mo.admin_state.downcase == "enabled")
end

#
# This method will setup serial over lan connection
#
# @param handle [ImcHandle] ImcHandle class object
# @param speed [String] valid values - "9600", "19200", "38400", "57600", "115200"
# @param comport [Strong] valid values :- "com0", "com1"
# @param ssh_port [Integer] port for ssh
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [SolIf]
def sol_setup(handle:, speed:, comport:, ssh_port: nil, server_id: 1)
    solif_mo = SolIf.new(parent_mo_or_dn: ImcCoreUtils.get_server_dn(handle, server_id))
    params = {
        :admin_state => SolIfConsts::ADMIN_STATE_ENABLE,
        :speed => speed.to_s,
        :comport => comport
    }
    if !ssh_port.nil?
        params[:ssh_port] = ssh_port.to_s
    end

    solif_mo.set_prop_multiple(**params)
    handle.set_mo(mo: solif_mo)
    return handle.query_dn(dn: solif_mo.dn)
end

#
# This method will disable Serial over Lan connection
#
# @param handle [ImcHandle] ImcHandle class object
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [nil]
#
def sol_disable(handle:, server_id: 1)
    solif_mo = SolIf.new(parent_mo_or_dn: ImcCoreUtils.get_server_dn(handle, server_id))
    solif_mo.set_prop(:admin_state, SolIfConsts::ADMIN_STATE_DISABLE)
    handle.set_mo(mo: solif_mo)
end

#
# This method will check if Serial over Lan connection is enabled
#
# @param handle [ImcHandle] ImcHandle class object
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [nil]
#
def is_sol_enabled(handle:, server_id: 1)
    solif_mo = SolIf.new(parent_mo_or_dn: ImcCoreUtils.get_server_dn(handle, server_id))
    solif_mo = handle.query_dn(dn: solif_mo.dn)
    return ["enable", "enabled"].include? solif_mo.admin_state.downcase
end


#
# This method will check if the specified SOL settings are already applied.
#
# @param handle [ImcHandle] ImcHandle class object
# @param server_id [Integer] ServerId to be specified for C3260 platforms
# @param kwargs [Hash] key-value paired arguments.
# @return [TrueClass, SolIf] if settings match
# @return [FalseClass, SolIf] if settings don't match
#
def sol_settings_exist(handle:, server_id: 1, **kwargs)
    exists = true
    solif_mo = SolIf.new(parent_mo_or_dn: ImcCoreUtils.get_server_dn(handle, server_id))
    solif_mo = handle.query_dn(dn: solif_mo.dn)
    if _is_valid_arg("admin_state", kwargs)
        if solif_mo.admin_state.downcase != kwargs[:admin_state].downcase
            exists = false
        end
    end

    if _is_valid_arg("speed", kwargs)
        if solif_mo.speed.to_s != kwargs[:speed].to_s
            exists = false
        end
    end

    if _is_valid_arg("comport", kwargs)
        if solif_mo.comport != kwargs[:comport]
            exists = false
        end
    end

    if _is_valid_arg("ssh_port", kwargs)
        if solif_mo.ssh_port.to_s != kwargs[:ssh_port].to_s
            exists = false
        end
    end

    return exists, solif_mo
end