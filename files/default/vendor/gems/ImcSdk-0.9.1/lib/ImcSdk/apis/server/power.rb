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
require "mometa/power/PowerBudget"
require "mometa/standard/StandardPowerProfile"
require "imccoreutils"
require_relative "../utils"

# This list is currently maintained manually.
# Ideally all such config/capabilites should come from a capability file
SUPPORTED_MODELS = ['UCSC-C220-M4', 'UCSC-C240-M4', 'UCSC-C3K-M4']
SUPPORTED_VARIANTS = ['M4', 'M5']

#
# This api returns the list of rack server models that support power cap and power budgeting
#
def get_supported_models()
    return SUPPORTED_MODELS
end

#
# This api gets the min and max power limits for the platform, cpu and memory
# for this specific server
#
# @param handle [ImcHandle] ImcHandle class object
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [PowerBudget]
#
def server_power_budget_get(handle: , server_id: 1)
    if !_is_supported_model(handle)
        return
    end

    power_budget_mo = handle.query_children(in_dn: ImcCoreUtils.get_server_dn(handle, server_id),
                                            class_id: "PowerBudget")
    if !power_budget_mo
        raise ImcOperationError.new("Get Power Budget",
                                "Invalid Server Id configured")
    end

    return power_budget_mo[0]
end

#
# Enables power characterization.
#
# @param handle [ImcHandle] ImcHandle class object.
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [PowerBudget]
#
def server_power_characterization_enable(handle:, server_id: 1)
    if  !_is_supported_model(handle)
        return
    end
    power_budget_mo = PowerBudget.new(parent_mo_or_dn: ImcCoreUtils.get_server_dn(handle, server_id))

    power_budget_mo.set_prop(:pow_char_enable, "enabled")
    handle.set_mo(mo: power_budget_mo)
    return handle.query_dn(dn: power_budget_mo.dn)
end

#
# Disables power characterization.
#
# @param handle [ImcHandle] ImcHandle class object.
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [PowerBudget]
#
def server_power_characterization_disable(handle:, server_id: 1)

    if  !_is_supported_model(handle)
        return
    end
    server_standard_power_cap_disable(handle: handle, server_id: server_id)
    power_budget_mo = PowerBudget.new(parent_mo_or_dn: ImcCoreUtils.get_server_dn(handle, server_id))

    power_budget_mo.set_prop(:pow_char_enable, "disabled")
    handle.set_mo(mo: power_budget_mo)
    return handle.query_dn(dn: power_budget_mo.dn)
end

#
# Enables power capping feature on the server.
#
# @param handle [ImcHandle] ImcHandle class object.
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [PowerBudget]
#
def server_power_capping_enable(handle:, server_id: 1)
    if !_is_supported_model(handle)
        return
    end
    power_budget_mo = PowerBudget.new(parent_mo_or_dn: ImcCoreUtils.get_server_dn(handle, server_id))
    power_budget_mo.set_prop(:admin_state, "enabled")
    handle.set_mo(mo: power_budget_mo)
    return power_budget_mo
end

#
# Disables power capping feature on the server.
#
# @param handle [ImcHandle] ImcHandle class object.
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [PowerBudget]
#
def server_power_capping_disable(handle:, server_id: 1)

    if !_is_supported_model(handle)
        return
    end
    power_budget_mo = PowerBudget.new(parent_mo_or_dn: ImcCoreUtils.get_server_dn(handle, server_id))
    power_budget_mo.set_prop(:admin_state, "disabled")
    handle.set_mo(mo: power_budget_mo)
    return power_budget_mo
end

#
# This method sets up the standard power cap configuration profile
#
# @param handle [ImcHandle] ImcHandle class object
# @param throttle [TrueClass, FalseClass] Power limit in Watts.
#   Range can be retrieved from min_power and max_power
#   fields of PowerBudget object
# @param correction_time [Integer] Time in seconds before power_limit is enforced
#   and corrective action is taken. Range (1-600)s
# @param corrective_action [String] valid values ["none","alert","shutdown","alert,shutdown"]
# @param hard_cap [TrueClass, FalseClass] Enable hard power cap
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [StandardPowerProfile]'
# @example
#   server_standard_power_cap_set(handle,
#                               correction_time: 5,
#                               corrective_action: "alert")
# @example
#   server_standard_power_cap_set(handle, throttle: true,
#                               power_limit: 200, correction_time: 5,
#                               corrective_action: "alert, shutdown")
def server_standard_power_cap_set(handle:, power_limit:, throttle: false,
                                  correction_time: 3, corrective_action: "alert",
                                  hard_cap: false, server_id: 1)
    if !_is_supported_model(handle)
        return
    end

    power_budget_dn = ImcCoreUtils.get_server_dn(handle, server_id) + "/budget"
    stdpowerprof_mo = StandardPowerProfile.new(parent_mo_or_dn: power_budget_dn)

    params = {
        :allow_throttle => throttle ? "yes" : "no",
        :power_limit => power_limit.to_s,
        :corr_time => correction_time.to_s,
        :corr_action => corrective_action,
        :profile_enabled => "yes",
        :hard_cap => hard_cap ? "yes" : "no"
    }

    stdpowerprof_mo.set_prop_multiple(**params)
    handle.set_mo(mo: stdpowerprof_mo)
    return stdpowerprof_mo
end

#
# This method disables the standard power profile
#
# @param handle [ImcHandle] ImcHandle class object.
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [nil]
#
def server_standard_power_cap_disable(handle:, server_id: 1)
    if !_is_supported_model(handle)
        return
    end
    server_dn = ImcCoreUtils.get_server_dn(handle, server_id)
    power_budget_dn = server_dn + "/budget"
    stdpowerprof_mo = StandardPowerProfile.new(parent_mo_or_dn: power_budget_dn)
    stdpowerprof_mo.set_prop(:profile_enabled, "no")
    handle.set_mo(mo: stdpowerprof_mo)
end

#
# Starts a power characterization run.
# From 3.0(1c) onwards, server_power_characterization_enable needs to be
# explicitly done, before invoking this api.
#
# @param handle [ImcHandle] ImcHandle class object.
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [PowerBudget]
#
def server_power_characterization_start(handle:, server_id: 1)
    if !_is_supported_model(handle)
        return
    end
    power_budget_mo = PowerBudget.new(parent_mo_or_dn: ImcCoreUtils.get_server_dn(handle, server_id))
    power_budget_mo.set_prop(:admin_action, PowerBudgetConsts::ADMIN_ACTION_START_POWER_CHAR)
    handle.set_mo(mo: power_budget_mo)
    return handle.query_dn(dn: power_budget_mo.dn)
end

private
def _is_supported_model(handle)
    for variant in SUPPORTED_VARIANTS
        if handle.model.include? variant
            return true
        end
    end
    return false
end
