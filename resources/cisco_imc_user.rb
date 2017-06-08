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
--------------------------
Resource Name: cisco_imc_user_config
short_description: Configures a local user on a Cisco IMC Server
version_added: "0.9.1.0"
description:
    - Configures a local user on a Cisco IMC Server
Input Params:
    username:
        description: Username for the local user
        required: true
    pwd:
        description: Password for the local user
        required: true
    priv:
        description: Privilege level of the local user
        choices: ["admin", "read-only", "user"]
        default: "read-only"
        required: false
    account_status:
        description: descibes the desired state of the local user
        choices: ["active", "inactive"]
        required: true
requirements: ['imcsdk']
author: "Amit Mandal(amimanda@cisco.com)"
=end

=begin
EXAMPLES
---------------------------------
- name: create local user
cisco_imc_user_config 'create_user' do
    ipaddress "10.105.219.15"
    auth_data "imc_account"
    account_status 'active'
    username 'amit'
    password 'Nbv12345'
    priv "read-only"
    action :create
end

- name: Modify local user
cisco_imc_user_config 'modify_user' do
    ipaddress "10.105.219.15"
    auth_data "imc_account"
    account_status 'active'
    username 'amit'
    password 'Nbv12345'
    priv "admin"
    action :modify
end

- name: delete local user
cisco_imc_user_config 'delete_user' do
    ipaddress "10.105.219.220"
    auth_data "imc_account"
    account_status 'inactive'
    username 'amit'
    action :delete
end
=end



require_relative './cisco_imc_utils'
require 'ImcSdk/apis/admin/user'

resource_name :cisco_imc_user_config

provides :cisco_imc_user_config

    property :ipaddress, String, required: true
    property :auth_data, String, required: true # data bag item name under cisco_imc_accounts data bag
    property :account_status, String, equal_to: ['active', 'inactive'], required: true
    property :username, String, required: true
    property :password, String
    property :priv, String, equal_to: ['read-only', 'admin', 'user'], default: 'read-only'

    load_current_value do |property|

        account = data_bag_item(node[:databag][:name], property.auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(property.ipaddress, account)
        handle = imc_connection.login()
        begin
            if handle.nil?
                raise "handle is nil"
            end
            exists, user = local_user_exists(handle: handle,
                                        :name => property.username)
                                        #:priv => priv )

            if exists
                if !user.nil?
                    account_status user.account_status
		            username user.name.to_s
                    priv user.priv.to_s
                end
            else
                account_status 'inactive'
                username ''
                #priv ''
	        end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()
        end   
    end

    action :create do
        account = data_bag_item(node[:databag][:name], auth_data)

        if !property_is_set?(:account_status) or !property_is_set?(:username)  or !property_is_set?(:password)
            Chef::Log.error("Username or Password or Account Status property not set")
            return
        end

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        begin
            if handle.nil?
                raise "handle is nil"
            end
            converge_if_changed :account_status do
                converge = true
            end
            converge_if_changed :username do
                converge = true
            end
            converge_if_changed :priv do
                converge = true
            end
            if converge
                local_user_create(handle: handle, 
                                    name: username.to_s, 
                                    pwd: password.to_s, 
                                    priv: priv.to_s)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()
        end
        
    end

    action :delete do
        if !property_is_set?(:username) or !property_is_set?(:account_status)
            Chef::Log.error("User Name or Account Status property not set")
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
            converge_if_changed :account_status do
                converge = true
            end

            if converge
                local_user_delete(handle: handle, 
                                    name: username)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout() 
        end
        
    end

    action :modify do

        if !property_is_set?(:username) or !property_is_set?(:account_status)
            Chef::Log.error("User Name or Account Status property not set")
            return
        end
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()  
        converge = false
        begin
            if handle.nil?
                raise "handle is null"
            end
            converge_if_changed :priv do
                converge = true
            end
            if converge
                local_user_modify(handle: handle, 
                                name: username, 
                                :pwd => password, 
                                :priv => priv)
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