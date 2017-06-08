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
------------------------
Resource Name: cisco_imc_bootorder_config
short_description: Set boot order precision for a Cisco IMC server.
version_added: "0.9.1.0"
description:
  - Set boot order precision for a Cisco IMC server
options:
  boot_devices:
    description: dictionary {"order":"", "device-type": "", "name":""}
    required: true
  configured_boot_mode:
    description: Configure boot mode
    required: false
    choices: ["Legacy", "None", "Uefi"]
  reapply:
    description: Configure reapply
    required: false
    default: "no"
    choices: ["yes", "no"]
  reboot_on_update:
    description: Enable reboot on update
    required: false
    default: "no"
    choices: ["yes", "no"]
  server_id:
    description: Specify server id for UCS C3260 modular servers
    default: 1
    required: false
requirements: ['imcsdk']
author: "Amit Mandal(amimanda@cisco.com)"
=end

=begin
RECIPE EXAMPLES
-------------------------------------
- name: Set the boot order precision
    cisco_imc_bootorder_precision_config 'set boot order precision' do
        ipaddress '10.105.219.15'
        auth_data "imc_account"
        configured_boot_mode 'Legacy'
        boot_devices [{:'order'=>'1', :'device-type'=>'usb', :'name'=>'usb'}, 
                     {:'order'=>'2', :'device-type'=>'san', :'name'=>'san'},
                     {:'order'=>'3', :'device-type'=>'hdd', :'name'=>'hdd'}]
        reapply 'yes'
        reboot_on_update 'yes'
    end
=end


require 'ImcSdk/apis/server/bios'

resource_name :cisco_imc_bootorder_precision_config

provides :cisco_imc_bootorder_precision_config

    property :ipaddress, String, required: true
    property :auth_data, String, required: true # data bag item name under cisco_imc_accounts data bag
    property :boot_devices, Array, required: true
    property :configured_boot_mode, String, equal_to: ["Legacy", "None", "Uefi"]
    property :reapply, String, equal_to: ['yes', 'no'], default: 'no'
    property :reboot_on_update, String, equal_to: ['yes', 'no'], default: 'no'
    property :server_id, Integer, default: 1

    load_current_value do |property|

        account = data_bag_item(node[:databag][:name], property.auth_data)
        #Login to Cisco IMC
        imc_connection = ImcConnection.new(property.ipaddress, account)
        handle = imc_connection.login()

        begin
            if handle.nil?
                Chef::Log.error("handle is nil")
            end 
            props = {}
            if property_is_set?(:reboot_on_update)
                props[:reboot_on_update] = property.reboot_on_update
            end
            #if property_is_set?(:reapply)
                props[:reapply] = property.reapply
            #end
            #if property_is_set?(:configured_boot_mode)
                props[:configured_boot_mode] = property.configured_boot_mode
            #end
            #if property_is_set?(:boot_devices)
                props[:boot_devices] = property.boot_devices
            #end
            #if property_is_set?(:server_id)
                props[:server_id] = property.server_id
            #end                         
            exists, err, mo = boot_order_precision_exists(handle: handle, **props)

            if !mo.nil?
                reboot_on_update mo.reboot_on_update
                reapply mo.reapply
                configured_boot_mode mo.configured_boot_mode
            else
            end

        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        end

        imc_connection.logout()  
    end

    action :set do
        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        props = {}
        converge = false        
        converge_if_changed :reboot_on_update do
            converge = true
            props[:reboot_on_update] = reboot_on_update=='yes' ? true : false
        end
        converge_if_changed :reapply do
            converge = true
            props [:reapply] = reapply=='yes' ? true : false
        end
        converge_if_changed :configured_boot_mode do
            converge = true
            props[:configured_boot_mode] = configured_boot_mode
        end
        
        if property_is_set?(:boot_devices)
            converge = true
            props[:boot_devices] = boot_devices
        end

        if property_is_set?(:server_id)
            converge = true
            props[:server_id] = server_id
        end


        begin
            if handle.nil?
                Chef::Log.error("handle is nil")
            end
            if converge
                boot_order_precision_set(handle: handle, **props)
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