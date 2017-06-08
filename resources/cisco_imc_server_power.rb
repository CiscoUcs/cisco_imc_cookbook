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
---------------------------
Resource name: cisco_imc_server_power_config
short_description: Set the power state on a Cisco IMC Server
version_added: "0.9.1.0"
description:
    - Sets the Power State on a Cisco IMC Server
Input Params:
    power_state:
        description: desired power state of the server
        required: true
        choices: ["on", "shutdown", "off", "reset", "boot"]
    timeout:
        description: number of seconds to wait for state change
        required: False
        default: 120
    interval:
        description: number of seconds to wait for between state change valudation tests
        default: 5
    server_id:
        description: Server Id to be specified for C3260 platforms
        required: false
requirements: ['imcsdk']
author: "Amit Mandal (amimanda@cisco.com)"
=end

=begin
RECIPE EXAMPLES
---------------------
- name: boot server
    cisco_imc_server_power_config 'boot server' do
        ipaddress "10.105.219.15"
        auth_data "imc_account"
        power_state "on"
        interval 5
        timeout 60
        action :on
    end

- name: Switch off server
    cisco_imc_server_power_config 'Switch Off server' do
        ipaddress "10.105.219.15"
        auth_data "imc_account"
        power_state "off"
        interval 5
        timeout 60
        action :off
    end

=end


require_relative './cisco_imc_utils'
require 'ImcSdk/apis/server/serveractions'

resource_name :cisco_imc_server_power_config

provides :cisco_imc_server_power_config

    property :ipaddress, String, required: true
    property :auth_data, String, required: true # data bag item name under cisco_imc_accounts data bag
    property :power_state, String, equal_to: ['on', 'off', 'shutdown', 'reset', 'boot'], required: true
    property :interval, Integer, default: 5
    property :timeout, Integer, default: 120
    property :server_id, Integer, default: 1

    load_current_value do |property|

        account = data_bag_item(node[:databag][:name], property.auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(property.ipaddress, account)
        handle = imc_connection.login()

        begin
            power_state server_power_state_get(handle: handle, server_id: server_id)

        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()  
        end
    end

    action :on do

        if !property_is_set?(:power_state)
            Chef::Log.error("Power State property not set")
            return
        end
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false        
        begin
            if handle.nil?
                raise "handle is nil"
            end
            converge_if_changed :power_state do
                converge = true
            end
        
            if converge
                server_power_up(handle: handle, timeout: timeout, interval: interval, server_id: server_id)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout() 
        end
    end

    action :off do

        if !property_is_set?(:power_state)
            Chef::Log.error("Power State property not set")
            return
        end
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false        
        begin
            if handle.nil?
                raise "handle is nil"
            end
            converge_if_changed :power_state do
                converge = true
            end
        
            if converge
                server_power_down(handle: handle, timeout: timeout, interval: interval, server_id: server_id)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout() 
        end
    end

    action :shutdown do

        if !property_is_set?(:power_state)
            Chef::Log.error("Power State property not set")
            return
        end
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false        
        begin
            if handle.nil?
                raise "handle is nil"
            end
            converge_if_changed :power_state do
                converge = true
            end
        
            if converge
                server_power_down_gracefully(handle: handle, timeout: timeout, interval: interval, server_id: server_id)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout() 
        end
    end

    action :reset do
        
        if !property_is_set?(:power_state)
            Chef::Log.error("Power State property not set")
            return
        end
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        begin
            if handle.nil?
                raise "handle is nil"
            end
            converge_if_changed :power_state do
                converge = true
            end
        
            if converge
                server_power_cycle(handle: handle, timeout: timeout, interval: interval, server_id: server_id)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout() 
        end
    end

    action :boot do
        if !property_is_set?(:power_state)
            Chef::Log.error("Power State property not set")
            return
        end
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        begin
            if handle.nil?
                raise "handle is nil"
            end 
            converge_if_changed :power_state do
                converge = true
            end
        
            if converge
                server_power_cycle(handle: handle, timeout: timeout, interval: interval, server_id: server_id)
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