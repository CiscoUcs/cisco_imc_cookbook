#Copyright 2017 Cisco Systems, Inc.
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#    http://www.apache.org/licenses/LICENSE-2.0
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

$:.unshift *Dir[::File.expand_path('../../files/default/vendor/gems/**/lib', __FILE__)]

=begin
DOCUMENTATION
-------------------------
Resource: cisco_imc_server_led_config
short_description: Switch ON/OFF the led on a Cisco IMC Server
version_added: "0.9.1.0"
description:
    - Switch ON/OFF the led on a Cisco IMC Server
Input Params:

    server_id:
        description: Server Id to be specified for C3260 platforms
        required: false
    chassis_id:
        description: chassis Id to be specified for C3260 platforms, 
            if specified on LED it will light the chassis id.
        required: false

requirements: ['imcsdk']
author: "Amit Mandal (amimanda@cisco.com)"
=end

=begin
RECIPE EXAMPLES
-------------------
- name: shutdown and enable indicator
    cisco_imc_server_led_config 'Led On' do
        ipaddress '10.105.219.15'
        auth_data "imc_account"
        admin_state "on"
        server_id 1
        action :on
    end
    cisco_imc_server_led_config 'Led Off' do
        ipaddress '10.105.219.15'
        auth_data "imc_account"
        admin_state "off"
        server_id 1
        action :off
    end
=end


require_relative './cisco_imc_utils'
require 'ImcSdk/apis/server/serveractions'

resource_name :cisco_imc_led_config

provides :cisco_imc_led_config

    property :ipaddress, String, required: true
    property :auth_data, String, required: true # data bag item name under cisco_imc_accounts data bag
    property :admin_state, String, equal_to: ["on","off"], required: true
    property :server_id, Integer
    property :chassis_id, Integer

    load_current_value do |property|

        account = data_bag_item(node[:databag][:name], property.auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(property.ipaddress, account)
        handle = imc_connection.login()

        begin
            props = Hash.new
            #if property_is_set?(:server_id)
                props[:server_id] = property.server_id
            #end
            #if property_is_set?(:chassis_id)
                props[:chassis_id] = property.chassis_id
            #end

            led_status = get_locator_led_status(handle: handle, **props)
            admin_state led_status
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()  
        end
    end

    action :on do
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        begin
            props = {}
            if property_is_set?(:server_id)
                props[:server_id] = server_id
            end
            if property_is_set?(:chassis_id)
                props[:chassis_id] = chassis_id
            end
            converge_if_changed :admin_state do
                converge = true
            end
            if converge
                locator_led_on(handle: handle, **props)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout() 
        end
    end

    action :off do
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        begin
            props = {}
            if property_is_set?(:server_id)
                props[:server_id] = server_id
            end
            if property_is_set?(:chassis_id)
                props[:chassis_id] = chassis_id
            end
            converge_if_changed :admin_state do
                converge = true
            end
            if converge
                locator_led_off(handle: handle, **props)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout() 
        end
    end

    action_class do
        def whyrun_supported?
            true
        end
    end