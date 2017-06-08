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
Resource Name: cisco_imc_ntp_config
short_description: Setup NTP on a Cisco IMC server.
version_added: "0.9.1.0"
description:
  - Setup NTP on a Cisco IMC server.
options:
  enable:
    description: Enable/Disable NTP
    choices: ["yes", "no"]
    required: true
  ntp_server1:
    description: Configure NTP server ip for id : 1
    required: false
  ntp_server2:
    description: Configure NTP server ip for id : 2
    required: false
  ntp_server3:
    description: Configure NTP server ip for id : 3
    required: false
  ntp_server4:
    description: Configure NTP server ip for id : 4
    required: false


requirements: ['imcsdk']
author: "Amit Mandal(amimanda@cisco.com)"
=end

=begin
RECIPE EXAMPLES
-------------------------
- name: enable ntp
    cisco_imc_ntp_config "enable_ntp" do
        ipaddress "10.105.219.15"
        auth_data "imc_account"
        enable 'yes'
        ntp_server2 '10.105.219.95'
        ntp_server3 '10.105.219.106'
        action :enable
    end

    - name: disable ntp
    cisco_imc_ntp_config "disable_ntp" do
        ipaddress "10.105.219.15"
        auth_data "imc_account"
        enable 'no'
        action :disable
    end

    - name: modify ntp
    cisco_imc_ntp_config "modify_ntp" do
        ipaddress "10.105.219.15"
        auth_data "imc_account"
        enable 'yes'
        ntp_server2 '10.105.219.95'
        ntp_server3 '10.105.219.106'
        action :modify
    end

=end



require_relative './cisco_imc_utils'
require 'ImcSdk/apis/admin/ntp'

resource_name :cisco_imc_ntp_config

provides :cisco_imc_ntp_config
    
    property :ipaddress, String, required: true
    property :auth_data, String, required: true # data bag item name under cisco_imc_accounts data bag
    property :enable, String, equal_to: ['yes', 'no'], required: true
    property :ntp_server1, String
    property :ntp_server2, String
    property :ntp_server3, String
    property :ntp_server4, String

    load_current_value do |property|

        account = data_bag_item(node[:databag][:name], property.auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(property.ipaddress, account)
        handle = imc_connection.login()
        begin
            ntp_servers = []
            if property_is_set?(:ntp_server1)
                ntp_servers.push({:id => 1, :ip => property.ntp_server1})
            end
            if property_is_set?(:ntp_server2)
                ntp_servers.push({:id => 2, :ip => property.ntp_server2})
            end
            if property_is_set?(:ntp_server3)
                ntp_servers.push({:id => 3, :ip => property.ntp_server3})
            end
            if property_is_set?(:ntp_server4)
                ntp_servers.push({:id => 4, :ip => property.ntp_server4})
            end
            match, ntp_mo = ntp_settings_match(handle: handle,
                                            :ntp_enable => property.enable, 
                                            :ntp_servers => ntp_servers )
  
            if !ntp_mo.nil?
                #if property_is_set?(:enable)
                    enable ntp_mo.ntp_enable
                #end
                #if property_is_set?(:ntp_server1)
                    ntp_server1 ntp_mo.ntp_server1
                #end
                #if property_is_set?(:ntp_server2)
                    ntp_server2 ntp_mo.ntp_server2
                #end
                #if property_is_set?(:ntp_server3)
                    ntp_server3 ntp_mo.ntp_server3
                #end
                #if property_is_set?(:ntp_server4)
                    ntp_server4 ntp_mo.ntp_server4
                #end
            elsif !match
                #if property_is_set?(:enable)
                    enable property.enable.downcase == "yes" ? "no" : "yes"
                #end
                #if property_is_set?(:ntp_server1)
                    ntp_server1 ''
                #end
                #if property_is_set?(:ntp_server2)
                    ntp_server2 ''
                #end
                #if property_is_set?(:ntp_server3)
                    ntp_server3 ''
                #end
                #if property_is_set?(:ntp_server4)
                    ntp_server4 ''
                #end
            else 
                #not supposed to hit this case
            end
        rescue Exception => ex
            Chef::Log.error("Exception Occurred: #{ex.message}")
            Chef::Log.error("Exception Occurred: #{ex.backtrace.join("\n\t")}")
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
            ntp_servers = []
            if property_is_set?(:enable)
                converge_if_changed :enable do
                    converge = true
                end
            end
            if property_is_set?(:ntp_server1)
                converge_if_changed :ntp_server1 do
                    converge = true
                    ntp_servers.push({:id => 1, :ip => ntp_server1})
                end
            end
            if property_is_set?(:ntp_server2)
                converge_if_changed :ntp_server2 do
                    converge = true
                    ntp_servers.push({:id => 2, :ip => ntp_server2})
                end
            end
            if property_is_set?(:ntp_server3)
                converge_if_changed :ntp_server3 do
                    converge = true
                    ntp_servers.push({:id => 3, :ip => ntp_server3})
                end
            end
            if property_is_set?(:ntp_server4)
                converge_if_changed :ntp_server4 do
                    converge = true
                    ntp_servers.push({:id => 4, :ip => ntp_server4})
                end
            end
            if converge
                ntp_enable(handle: handle, ntp_servers: ntp_servers)
            end
        rescue Exception => ex
            Chef::Log.error("Exception Occurred: #{ex.message}")
            Chef::Log.error("Exception Occurred: #{ex.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()
        end
    end

    action :modify do

        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        begin
            ntp_servers = []

            if property_is_set?(:ntp_server1)
                converge_if_changed :ntp_server1 do
                    converge = true
                    ntp_servers.push({:id => 1, :ip => ntp_server1})
                end
            end
            if property_is_set?(:ntp_server2)
                converge_if_changed :ntp_server2 do
                    converge = true
                    ntp_servers.push({:id => 2, :ip => ntp_server2})
                end
            end
            if property_is_set?(:ntp_server3)
                converge_if_changed :ntp_server3 do
                    converge = true
                    ntp_servers.push({:id => 3, :ip => ntp_server3})
                end
            end
            if property_is_set?(:ntp_server4)
                converge_if_changed :ntp_server4 do
                    converge = true
                    ntp_servers.push({:id => 4, :ip => ntp_server4})
                end
            end
            if converge
                ntp_servers_modify(handle: handle, ntp_servers: ntp_servers)
            end
        rescue Exception => ex
            Chef::Log.error("Exception Occurred: #{ex.message}")
            Chef::Log.error("Exception Occurred: #{ex.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()
        end
    end

    action :disable do

        #if !property_is_set?(:enable)
        #    Chef::Log.error("enable property not set")
        #    return
        #end
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        begin
            if handle.nil?
                raise "handle is nil"
            end
            if property_is_set?(:enable)
                converge_if_changed :enable do
                    converge = true
                end
            end
            if converge
                    ntp_disable(handle: handle)
            end
        rescue => ex
            Chef::Log.error("Exception Occurred: #{ex.message}")
            Chef::Log.error("Exception Occurred: #{ex.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()
        end
    end

    action_class do
        def whyrun_supported?
            true
        end
    end