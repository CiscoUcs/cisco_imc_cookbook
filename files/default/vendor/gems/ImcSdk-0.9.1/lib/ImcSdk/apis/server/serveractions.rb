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

require_relative "../utils"

#
# This method will return the oper power status of the rack server
#
# @param handle [ImcHandle] ImcHandle class object
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [String] Oper Power state
# @example
#   For classic or non-C3260 series servers:-
#   server_power_state_get(handle)
#   For modular or C3260 series servers, server_id should also be passed in the params:-
#   server_power_state_get(handle: handle, server_id: 1)
# @note If server_id is not specified, this will assume server_id="1"
#
def server_power_state_get(handle:, server_id: 1)
    server_dn = ImcCoreUtils.get_server_dn(handle, server_id)
    server_mo = handle.query_dn(dn: server_dn)
    if server_mo
        return server_mo.oper_power
    end

    raise ImcOperationError.new("Get Server Power State",
                            "Managed Object not found for dn: #{server_dn}")
end

#
# This method will send the server the power up signal, and then polls
# the server every $interval until either $timeout or it comes online.
#
# @param handle [ImcHandle] ImcHandle class object
# @param timeout [Integer] timeout in seconds
# @param interval [Integer]
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @param kwargs [Hash] key=>value paired arguments
# @return [ComputeRackUnit] for non C3260 platforms
# @return [ComputeServerNode] for C3260 platforms
# @example
#   server_power_up(handle: ImcHandle)
# @example
#   server_power_up(handle: ImcHandle, timeout: 120, interval: 10)
# @example
#   server_power_up(handle: ImcHandle, server_id: 2, timeout: 60)
#
def server_power_up(handle:, timeout: 60, interval: 5, server_id: 1, **kwargs)
    server_dn = ImcCoreUtils.get_server_dn(handle, server_id)
    # Turn power on only if not already powered up
    if server_power_state_get(handle: handle,server_id: server_id) != "on"
        _set_power_state(handle, server_dn, "up")
    end

    # Poll until the server is powered up
    _wait_for_power_state(handle, "on", timeout: timeout,
                          interval: interval, server_id: server_id)

    # Return object with current state
    return handle.query_dn(dn: server_dn)

end

#
# This method will power down the rack server, even if tasks are still
# running on it.  Then polls the server every $interval until either $timeout
#
# @param handle [ImcHandle] ImcHandle class object
# @param timeout [Integer] timeout in seconds
# @param interval [Integer]
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @param kwargs [Hash] key=>value paired arguments
# @return [ComputeRackUnit] for non C3260 platforms
# @return [ComputeServerNode] for C3260 platforms
# @example
#   server_power_down(handle: ImcHandle)
# @example
#   server_power_down(handle: ImcHandle, timeout: 120, interval: 10)
# @example
#   server_power_down(handle: ImcHandle, server_id: 2, timeout: 60)
#
def server_power_down(handle:, timeout: 60, interval: 5, server_id: 1, **kwargs)
    server_dn = ImcCoreUtils.get_server_dn(handle, server_id)
    # Turn power off only if not already powered down
    if server_power_state_get(handle: handle,server_id: server_id) != "off"
        _set_power_state(handle, server_dn, "down")
    end

    # Poll until the server is powered up
    _wait_for_power_state(handle, "off", timeout: timeout,
                          interval: interval, server_id: server_id)

    return handle.query_dn(dn: server_dn)
end

#
# This method will power down the rack server gracefully
#
# @param handle [ImcHandle] ImcHandle class object
# @param timeout [Integer] timeout in seconds
# @param interval [Integer]
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @param kwargs [Hash] key=>value paired arguments
# @return [ComputeRackUnit] for non C3260 platforms
# @return [ComputeServerNode] for C3260 platforms
# @example
#   server_power_down_gracefully(handle: ImcHandle)
# @example
#   server_power_down_gracefully(handle: ImcHandle, timeout: 120, interval: 10)
# @example
#   server_power_down_gracefully(handle: ImcHandle, server_id: 2, timeout: 60)
#
def server_power_down_gracefully(handle:, timeout: 120, interval: 5,
                                 server_id: 1, **kwargs)
    server_dn = ImcCoreUtils.get_server_dn(handle, server_id)
    # Gracefully power off only if not already powered down
    if server_power_state_get(handle: handle, server_id: server_id) != "off"
        _set_power_state(handle, server_dn, "graceful-down")
    end

    # Poll until the server is powered up
    _wait_for_power_state(handle, "off", timeout: timeout,
                          interval: interval, server_id: server_id)

    return handle.query_dn(dn: server_dn)

end

#
# This method will power cycle the rack server immediately.
#
# @param handle [ImcHandle] ImcHandle class object
# @param timeout [Integer] timeout in seconds
# @param interval [Integer]
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @param kwargs [Hash] key=>value paired arguments
# @return [ComputeRackUnit] for non C3260 platforms
# @return [ComputeServerNode] for C3260 platforms
# @example
#   server_power_cycle(handle: ImcHandle)
# @example
#   server_power_cycle(handle: ImcHandle, timeout: 120, interval: 10)
# @example
#   server_power_cycle(handle: ImcHandle, server_id: 2, timeout: 60)
#
def server_power_cycle(handle:, timeout: 120, interval: 5, server_id: 1, **kwargs)
    server_dn = ImcCoreUtils.get_server_dn(handle, server_id)
    _set_power_state(handle, server_dn, "cycle")

    # Poll until the server is powered up
    _wait_for_power_state(handle, "on", timeout: timeout,
                          interval: interval, server_id: server_id)

    return handle.query_dn(dn: server_dn)
end

#
# This method will return the locator led status on the server or chassis
#
# @param handle [ImcHandle] ImcHandle class object
# @param kwargs [Hash] key=>value paired arguments
# @return [string] status of locator led
# @example Turns on locator led on the server (for non-C3260 platforms)
#   get_locator_led_status(handle: ImcHandle)
# @example Turns on locator led on the specified server (for C3260 platforms)
#   get_locator_led_status(handle: ImcHandle, :server_id => 1)
# @example Turns on locator led on the chassis (for C3260 platforms)
#   get_locator_led_status(handle: ImcHandle, :chassis_id => 1)
#
def get_locator_led_status(handle:, **kwargs)
    led_mo = nil
    led_status = String.new
    if _is_valid_arg("chassis_id", kwargs)
        led_mo = _get_chassis_locator_led_state(handle, kwargs)
    end

    if _is_valid_arg("server_id", kwargs) or \
            handle.platform == IMC_PLATFORM::TYPE_CLASSIC
        led_mo = _get_server_locator_led_state(handle, kwargs)
    end
    if !led_mo.nil?
        led_status = led_mo.oper_state
    end
    return led_status
end

#
# This method will turn on the locator led on the server or chassis
#
# @param handle [ImcHandle] ImcHandle class object
# @param kwargs [Hash] key=>value paired arguments
# @return [nil]
# @example Turns on locator led on the server (for non-C3260 platforms)
#   locator_led_on(handle: ImcHandle)
# @example Turns on locator led on the specified server (for C3260 platforms)
#   locator_led_on(handle: ImcHandle, :server_id => 1)
# @example Turns on locator led on the chassis (for C3260 platforms)
#   locator_led_on(handle: ImcHandle, :chassis_id => 1)
#
def locator_led_on(handle:, **kwargs)

    if _is_valid_arg("chassis_id", kwargs)
        _set_chassis_locator_led_state(handle, true, kwargs)
    end

    if _is_valid_arg("server_id", kwargs) or \
            handle.platform == IMC_PLATFORM::TYPE_CLASSIC
        _set_server_locator_led_state(handle, true, kwargs)
    end
end

#
# This method will turn off the locator led on the server or on the chassis
#
# @param handle [ImcHandle] ImcHandle class object
# @param kwargs [Hash] key=>value paired arguments
# @return [nil]
# @example Turns off locator led on the server (for non-C3260 platforms)
#   locator_led_off(handle: ImcHandle)
# @example Turns off locator led on the specified server (for C3260 platforms)
#   locator_led_off(handle: ImcHandle, :server_id => 1)
# @example Turns off locator led on the chassis (for C3260 platforms)
#   locator_led_off(handle: ImcHandle, :chassis_id => 1)
#
def locator_led_off(handle:, **kwargs)
    if _is_valid_arg("chassis_id", kwargs)
        _set_chassis_locator_led_state(handle, false, kwargs)
    end

    if _is_valid_arg("server_id", kwargs) or \
            handle.platform == IMC_PLATFORM::TYPE_CLASSIC
        _set_server_locator_led_state(handle, false, kwargs)
    end
end

#
# This method will tag the server with the label specified.
# Applicable to non-C3260 platforms
#
# @param handle [ImcHandle] ImcHandle class object
# @param tag [String] Label to be used to tag the asset
# @return [ComputeRackUnit]
# @example
#   tag_server(handle: ImcHandle, tag: "Row21-Rack10-Slot10")
#
def tag_server(handle:, tag:)
    require "mometa/compute/ComputeRackUnit"
    mo = ComputeRackUnit.new(parent_mo_or_dn: "sys", server_id: '1')
    mo.set_prop(:asset_tag, tag.to_s)
    handle.set_mo(mo: mo)
    return handle.query_dn(dn: mo.dn)
end

#
# This method will tag the chassis with the label specified.
# Applicable to C3260 platforms
#
# @param handle [ImcHandle] ImcHandle class object
# @param tag [String] Label to be used to tag the asset
# @return [EquipmentChassis]
# @example
#   tag_chassis(handle: ImcHandle, tag: "Row21-Rack10-Slot10")
#
def tag_chassis(handle:, tag:)
    require "mometa/equipment/EquipmentChassis"
    mo = EquipmentChassis.new(parent_mo_or_dn: "sys")
    mo.set_prop(:asset_tag, tag.to_s)
    handle.set_mo(mo: mo)
    return handle.query_dn(dn: mo.dn)
end

private

def _set_chassis_locator_led_state(handle, enabled, kwargs)
    chassis_id = kwargs[:chassis_id].to_s
    chassis_dn = "sys/chassis-" + chassis_id
    require "mometa/equipment/EquipmentChassisLocatorLed"
    led_mo = EquipmentChassisLocatorLed.new(parent_mo_or_dn: chassis_dn)
    if enabled
        led_mo.set_prop(:admin_state, EquipmentChassisLocatorLedConsts::ADMIN_STATE_ON)
    else
        led_mo.set_prop(:admin_state, EquipmentChassisLocatorLedConsts::ADMIN_STATE_OFF)
    end
    handle.set_mo(mo: led_mo)
end

def _get_chassis_locator_led_state(handle, kwargs)
    chassis_id = kwargs[:chassis_id].to_s
    chassis_dn = "sys/chassis-" + chassis_id
    require "mometa/equipment/EquipmentChassisLocatorLed"
    led_mo = EquipmentChassisLocatorLed.new(parent_mo_or_dn: chassis_dn)
    handle.query_dn(dn: led_mo.dn)
end

def _set_server_locator_led_state(handle, enabled, kwargs)
    server_dn = ImcCoreUtils.set_server_dn(handle, kwargs)
    require "mometa/equipment/EquipmentLocatorLed"
    led_mo = EquipmentLocatorLed.new(parent_mo_or_dn: server_dn)
    if enabled
        led_mo.set_prop(:admin_state, EquipmentLocatorLedConsts::ADMIN_STATE_ON)
    else
        led_mo.set_prop(:admin_state, EquipmentLocatorLedConsts::ADMIN_STATE_OFF)
    end
            
    handle.set_mo(mo: led_mo)
end

def _get_server_locator_led_state(handle, kwargs)
    server_dn = ImcCoreUtils.set_server_dn(handle, kwargs)
    require "mometa/equipment/EquipmentLocatorLed"
    led_mo = EquipmentLocatorLed.new(parent_mo_or_dn: server_dn)
    handle.query_dn(dn: led_mo.dn)
end

def _set_power_state(handle, server_dn, state)
    server_mo = handle.query_dn(dn: server_dn)
    if handle.platform == IMC_PLATFORM::TYPE_CLASSIC
        mo_class = ComputeRackUnitConsts
    elsif handle.platform == IMC_PLATFORM::TYPE_MODULAR
        mo_class = ComputeServerNodeConsts
    else
        raise ImcOperationError.new("Set Power State", "Unknown platform: #{handle.platform} found")
    end

    state_dict = {
        :up => mo_class::ADMIN_POWER_UP,
        :down => mo_class::ADMIN_POWER_DOWN,
        "graceful-down".to_sym => mo_class::ADMIN_POWER_SOFT_SHUT_DOWN,
        :cycle => mo_class::ADMIN_POWER_CYCLE_IMMEDIATE
    }
    server_mo.set_prop(:admin_power, state_dict[state.to_sym] )
    handle.set_mo(mo: server_mo)
end

def _wait_for_power_state(handle, state, timeout: 60, interval: 5, server_id: 1)
=begin
    This method should be called after a power state change has been triggered.
    It will poll the server and return when the desired state is achieved.
    Args:
        handle(ImcHandle)
        state(str)
        timeout(int)
        interval(int)
        server_id (int): Server Id to be specified for C3260 platforms
    Returns:
        bool
=end
    # Verify desired state is valid
    if !(["on", "off"].include? state)
        raise ValueError.new("ERROR invalid state:#{state}")
    end

    # Verify interval not set to zero
    if interval < 1 or !(interval.is_a? Integer)
        raise ValueError.new("ERROR: interval must be positive integer")
    end

    wait_time = 0
    while server_power_state_get(handle: handle,server_id: server_id) != state do
        # Raise error if we've reached timeout
        if wait_time > timeout
            raise ImcOperationError.new( \
                "Power State Change", \
                "#{handle.ip}: ERROR - Power #{state} did not complete within #{timeout} sec")
        end
        # Wait interval sec between checks
        sleep(interval)
        wait_time += interval
    end
end