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
---------------------------------------------
Resource Name: cisco_imc_ipmi
short_description: Configures ipmi a Cisco IMC Server
version_added: "0.9.1.0"
description:
    - Configures the IPMI Over Lan(IPMI) service on a Cisco IMC Server
Input Params:
    priv:
        description: Privilege to be used
        required: false
        choices: ["admin", "user", "read-only"]
        default: 'user'

    key:
        description: Hexadecimal Key to be used for authentication
        required: false

    server_id:
        description: Server Id to be specified for C3260 platforms
        default: 1
        required: false

    admin_state:
        description: Used to enable or disable the IPMI
        choices: ["enabled", "disabled"]
        required: true

requirements: ['imcsdk']
author: "Amit Mandal (amimanda@cisco.com)"
=end

=begin
RECIPE EXAMPLES
----------------------------------
- name: enable IPMI
    cisco_imc_ipmi_config 'enable IPMI' do
        ipaddress "10.105.219.15"
        auth_data "imc_account"
        admin_state 'enabled'
        priv 'admin'
        key '1111111111111111111111111111122222222222'
        action :enable
    end

- name: disable IPMI
    cisco_imc_ipmi_config 'disable IPMI' do
        ipaddress "10.105.219.15"
        auth_data "imc_account"
        admin_state 'disabled'
        action :disable
    end


=end
require_relative './cisco_imc_utils'
require 'ImcSdk/apis/admin/ipmi'

resource_name :cisco_imc_ipmi_config

provides :cisco_imc_ipmi_config

    property :ipaddress, String, required: true
    property :auth_data, String, required: true # data bag item name under cisco_imc_accounts data bag
    property :admin_state, String, equal_to: ['enabled', 'disabled'], required: true
    property :priv, String, equal_to: ['read-only', 'admin', 'user'], default: 'user'
    property :key, String, default: '0'*40
    property :server_id, Integer, default: 1

    load_current_value do |property|

        account = data_bag_item(node[:databag][:name], property.auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(property.ipaddress, account)
        handle = imc_connection.login()

        begin
            admin_state_from_server = is_ipmi_enabled(handle: handle, server_id: property.server_id)
            admin_state admin_state_from_server ? "enabled" : "disabled"
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()  
        end
    end

    action :enable do

        if !property_is_set?(:admin_state)
            Chef::Log.error("Admin State property not set")
            return            
        end        
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()

        converge = false        
        begin
            if handle.nil?
                Chef::Log.error("handle is nil")
            end
            converge_if_changed :admin_state do
                converge = true
            end
        
            if converge
                ipmi_enable(handle: handle,
                            priv: priv,
                            key: key,
                            server_id: server_id)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout() 
        end
    end

    action :disable do

        if !property_is_set?(:admin_state)
            Chef::Log.error("Admin State property not set")
            return            
        end
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()

        converge = false
        begin
            if handle.nil?
                Chef::Log.error("handle is nil")
            end   
            converge_if_changed :admin_state do
                converge = true
            end
            if converge
                ipmi_disable(handle: handle, server_id: server_id)
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