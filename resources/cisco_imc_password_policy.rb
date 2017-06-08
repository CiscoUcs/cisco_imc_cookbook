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

$:.unshift *Dir[::File.expand_path('../../files/default/vendor/gems/**/lib',__FILE__)]

=begin
DOCUMENTATION
------------------
Resource Name: cisco_imc_user_password_policy
short_description:
Configures the password policy for local users on a Cisco IMC server.
version_added: "0.9.1.0"
description:
    - Configures the password policy for local users on a Cisco IMC server.
options:
    strong_password:
        description: This enables the strong password policy.
        choices: [true, false]
        required: true
requirements: ['imcsdk']
author: "Amit Mandal(amimanda@cisco.com)"
=end

=begin
RECIPE EXAMPLES
- name: set strong password policy
  cisco_imc_password_policy_config 'set strong password' do
        ipaddress '10.105.219.15'
        auth_data "imc_account"
        strong_password true
        action :enable
    end

    cisco_imc_password_policy_config 'set strong password' do
        ipaddress '10.105.219.15'
        auth_data "imc_account"
        strong_password false
        action :disable
    end
=end


require_relative './cisco_imc_utils'
require 'ImcSdk/apis/admin/user'

resource_name :cisco_imc_password_policy_config

provides :cisco_imc_password_policy_config

    property :ipaddress, String, required: true
    property :auth_data, String, required: true # data bag item name under cisco_imc_accounts data bag
    property :strong_password, [TrueClass, FalseClass], required: true


    load_current_value do |property|

        account = data_bag_item(node[:databag][:name], property.auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(property.ipaddress, account)
        handle = imc_connection.login()
        begin
            strong_password is_strong_password_set(handle: handle)
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
        begin
            if handle.nil?
                raise "handle is nil"
            end
            converge_if_changed :strong_password do
                converge = true
            end

            if converge
                set_strong_password(handle: handle, 
                                    enable: true)
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
            converge_if_changed :strong_password do
                converge = true
            end
            if converge
                set_strong_password(handle: handle, 
                                    enable: false)
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