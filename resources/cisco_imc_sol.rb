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
----------------------
Resource Name: cisco_imc_sol_config
short_description: Configures sol on a Cisco IMC Server
version_added: "0.9.1.0"
description:
    - Configures the Serial Over Lan(SOL) service on a Cisco IMC Server
Input Params:
    speed:
        description: speed of the connection
        required: false
        choices: ["9600", "19200", "38400", "57600", "115200"]
        default: 115200
    comport:
        description: Comport on the server side
        required: false
        choices: ["com0", "com1"]
    server_id:
        description: Server Id to be specified for C3260 platforms
        default: 1
        required: false
    ssh_port: 
        description: the SSH port for access to the console
        default: 1024
    admin_state:
        description: Used to enable or disable the SOL console
        choices: ["enable", "disable"]
        required: true        
requirements: ['imcsdk']
author: "Amit Mandal (brmathes@cisco.com)"
=end

=begin
RECIPE EXAMPLES
- name: enable SOL over ssh
    cisco_imc_sol_config 'sol_enable' do
        ipaddress '10.105.219.15'
        auth_data "imc_account"
        admin_state 'enable'
        comport "com0"
        speed 115200
        ssh_port 1024
        action :enable
    end

    cisco_imc_sol_config 'sol_disable' do
        ipaddress '10.105.219.15'
        auth_data "imc_account"
        admin_state 'disable'
        action :disable
    end

=end


require_relative './cisco_imc_utils'
require 'ImcSdk/apis/server/remotepresence'

resource_name :cisco_imc_sol_config

provides :cisco_imc_sol_config

    property :ipaddress, String, required: true
    property :auth_data, String, required: true # data bag item name under cisco_imc_accounts data bag
    property :admin_state, String, equal_to: ['enable', 'disable'], required: true
    property :speed, Integer, default: 115200, required: true
    property :comport, String, required: true
    property :ssh_port, Integer, default: 1024
    property :server_id, Integer, default: 1

    load_current_value do |property|

        account = data_bag_item(node[:databag][:name], property.auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(property.ipaddress, account)
        handle = imc_connection.login()

        begin
            #admin_state_from_server = is_sol_enabled(handle: handle, server_id: server_id)
            #admin_state admin_state_from_server ? "enable" : "disable"
            props = {}
            #admin_state is required property
            props[:admin_state] = property.admin_state
            
            if property_is_set?(:speed)
                props[:speed] = property.speed
            end

            if property_is_set?(:comport)
                props[:comport] = property.comport
            end

            if property_is_set?(:ssh_port)
                props[:ssh_port] = property.ssh_port
            end

            exists, solIf_mo = sol_settings_exist(handle: handle, server_id: server_id, **props)

            if !solIf_mo.nil?
                if !solIf_mo.admin_state.nil?
                    admin_state solIf_mo.admin_state
                end
                if !solIf_mo.speed.nil?
                    speed solIf_mo.speed.to_i
                end
                if !solIf_mo.comport.nil?
                    comport solIf_mo.comport
                end
                if !solIf_mo.ssh_port.nil?
                    ssh_port solIf_mo.ssh_port.to_i
                end
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()  
        end
    end

    action :enable do
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        props = Hash.new
        begin
            if handle.nil?
                raise "handle is nil"
            end
            converge_if_changed :admin_state do
                converge = true
                #props[:admin_state] = admin_state
            end

            converge_if_changed :speed do
                converge = true 
            end
            props[:speed] = speed

            converge_if_changed :comport do
                converge = true
            end
            props[:comport] = comport

            converge_if_changed :ssh_port do
                converge = true
                props[:ssh_port] = ssh_port
            end

            if converge
                sol_setup(handle: handle,
                            server_id: server_id, 
                            **props)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout() 
        end
    end

    action :disable do
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false 
        begin
            if handle.nil?
                raise "handle is nil"
            end       
            converge_if_changed :admin_state do
                converge = true
            end
        
            if converge
                sol_disable(handle: handle, server_id: server_id)
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