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
---------------------------------
Resource Name: cisco_imc_vd_config
short_description: Create and Delete virtual drives
version_added: "0.9.1.0"
description:
  - Create and Delete virtual drives on a Cisco IMC server
options:
  boot_drive:
    description: Set as boot drive
                example - True
    required: false
  drive_group:
    description: A list of drive groups. It needs to be a list of list.
                example - [[1]]
                        - [[1, 2]]
                        - [[1, 2],[3, 4]]
    required: true
  controller_type:
    description: Name of the controller
                example - 'SAS'
    required: true
  controller_slot:
    description: Name of the SAS controller slot
                example - "MEZZ", "0", .. , "9"
    required: true
  raid_level:
    description: Select the RAID level for the new virtual drives.
                 This can be one of the following,
                 Raid 0 Simple striping.
                 Raid 1 Simple mirroring.
                 Raid 5 Striping with parity.
                 Raid 6 Striping with two parity drives.
                 Raid 10 Spanned mirroring.
                 Raid 50 Spanned striping with parity.
                 Raid 60 Spanned striping with two parity drives.
    choices: [0, 1, 10, 5, 50, 6, 60]
    default: "0"
    required: false
  virtual_drive_name:
    description: name of the virtual drive
    required: false
  access_policy:
    description: Defines the host access level to the virtual drive.
                 This can be one of the following,
                  "read-write" Enables host to perform read-write on the VD.
                  "read-only" Host can only read from the VD.
                  "blocked" Host can neither read nor write to the VD.
    choices: ["blocked", "read-only", "read-write"]
    default: "read-write"
    required: false
  read_policy:
    description: The read-ahead cache mode.
    choices: ["always-read-ahead", "no-read-ahead"]
    default: "no-read-ahead"
    required: false
  cache_policy:
    description: The cache policy used for buffering reads.
    choices: ["cached-io", "direct-io"]
    default: "direct-io"
    required: false
  disk_cache_policy:
    description: The cache policy used for buffering reads.
                 This can be one of the following,
                  "unchanged" The disk cache policy is unchanged.
                  "enabled" Allows IO caching on the disk.
                  "disabled" Disallows disk caching.
    choices: ["disabled", "enabled", "unchanged"]
    default: "unchanged"
    required: false
  write_policy:
    description: This can be one of the following,
                  "Write Through" Data is written through the cache and to the physical drives. Performance is improved, because subsequent reads of that data can be satisfied from the cache.
                  "Write Back" Data is stored in the cache, and is only written to the physical drives when space in the cache is needed. Virtual drives requesting this policy fall back to Write Through caching when the BBU cannot guarantee the safety of the cache in the event of a power failure.
                  "Write Back Bad BBU" With this policy, write caching remains Write Back even if the battery backup unit is defective or discharged.
    choices: ["Always Write Back", "Write Back Good BBU", "Write Through", "always-write-back", "write-back-good-bbu", "write-through"]
    default: "Write Through"
    required: false
  strip_size:
    description: The size of each strip
    choices: ["1024k", "128k", "16k", "256k", "32k", "512k", "64k", "8k"]
    default: "64k"
    required: false
  size:
    description: The size of the virtual drive you want to create. Enter a value and select one of the following units - MB, GB, TB
    required: false
  admin_action:
    description: Enables drive security on classic platforms
    choices: ["enable-self-encrypt"]
    required: false
  server_id:
    description: Specify server id for UCS C3260 modular servers
    default: 1
    required: false
requirements: ['imcsdk']
author: "Amit Mandal(amimanda@cisco.com)"
=end

=begin
RECIPE EXAMPLES
------------------------------
- name: Create virtual drive
    cisco_imc_vd_config 'create virtual_drive' do
        ipaddress '10.65.182.245'
        auth_data "imc_account"
        state 'create'
        boot_drive true
        drive_group [[1,2]]
        raid_level 0
        controller_slot "SLOT-MEZZ"
        virtual_drive_name 'RAID0_5'
        action :create
    end

    cisco_imc_vd_config 'delete virtual_drive' do
        ipaddress '10.65.182.245'
        auth_data "imc_account"
        state 'delete'
        controller_slot "SLOT-HBA"
        controller_type "SAS"
        virtual_drive_name 'RAID0_2'
        action :delete
    end
=end
require_relative './cisco_imc_utils'
require 'ImcSdk/apis/server/storage'

resource_name :cisco_imc_vd_config

provides :cisco_imc_vd_config

    property :ipaddress, String, required: true
    property :auth_data, String, required: true # data bag item name under cisco_imc_accounts data bag
    property :state, String, equal_to: ['create', 'delete'], required: true
    property :controller_slot, String, required: true
    property :boot_drive, [TrueClass, FalseClass], default: false
    property :drive_group, Array
    property :controller_type, String, required: true
    property :raid_level, Integer, equal_to: [0, 1, 10, 5, 50, 6, 60], default: 0
    property :virtual_drive_name, String
    property :access_policy, String, equal_to: ['blocked', 'read-only', 'read-write'], default: 'read-only'
    property :read_policy, String, equal_to: ['always-read-ahead', 'no-read-ahead'], default: 'no-read-ahead'
    property :cache_policy, String, equal_to: ['cached-io', 'direct-io'], default: 'direct-io'
    property :disk_cache_policy, String, equal_to: ['disabled', 'enabled', 'unchanged'], default: 'unchanged'
    property :write_policy, String, equal_to: ["Always Write Back", "Write Back Good BBU", "Write Through", "always-write-back", "write-back-good-bbu", "write-through"], default: "Write Through"
    property :strip_size, String, equal_to: ["1024k", "128k", "16k", "256k", "32k", "512k", "64k", "8k"], default: "64k"
    property :size, String
    property :self_encrypt, String
    property :server_id, Integer, default: 1

    load_current_value do |property|

        account = data_bag_item(node[:databag][:name], property.auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(property.ipaddress, account)
        handle = imc_connection.login()

        begin


            if property.virtual_drive_name.nil? and (property.raid_level.nil? or property.drive_group.nil?)
                raise "When virtual_drive_name is nil, both raid_level and drive_group cannot be nil. 
                        Take either of the following actions  
                        1) Set virtual_drive_name in the request. 
                        2) Set both raid_level and drive_group."
            elsif property.virtual_drive_name.nil? and (!property.raid_level.nil? and !property.drive_group.nil?)
                property.virtual_drive_name vd_name_derive(property.raid_level, property.drive_group)
            end

            exists, vd_mo = virtual_drive_exists(   handle: handle, 
                                                    controller_type: property.controller_type, 
                                                    controller_slot: property.controller_slot, 
                                                    virtual_drive_name: property.virtual_drive_name,
                                                    server_id: server_id )
	        if exists
                if !vd_mo.nil?
                    state 'create'
                    #raid_level vd_mo.raid_level
                    #access_policy vd_mo.access_policy
                    #read_policy vd_mo.read_policy
                    #cache_policy vd_mo.cache_policy
                    #disk_cache_policy vd_mo.disk_cache_policy
                    #write_policy vd_mo.requested_write_cache_policy
                    #strip_size vd_mo.strip_size
                    #size vd_mo.size
                    #self_encrypt vd_mo.self_encrypt
                end
	        else
		        state 'delete'
                #raid_level ''
                #size ''
                #self_encrypt ''
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

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        begin
            if handle.nil?
                raise "handle is nil"
            end
            converge_if_changed :state do
                converge = true
            end
            #converge_if_changed :raid_level do
            #    converge = true
            #end
            #converge_if_changed :access_policy do
            #    converge = true
            #end
            #converge_if_changed :read_policy do
            #    converge = true
            #end
            #converge_if_changed :cache_policy do
            #    converge = true
            #end
            #converge_if_changed :disk_cache_policy do
            #    converge = true
            #end
            #converge_if_changed :write_policy do
            #    converge = true
            #end
            #converge_if_changed :strip_size do
            #    converge = true
            #end
            #converge_if_changed :size do
            #    converge = true
            #end
            #converge_if_changed :self_encrypt do
            #    converge = true
            #end
        
            if converge
                mo = virtual_drive_create(  handle: handle,
                                            drive_group: drive_group, 
                                            controller_type: controller_type,
                                            controller_slot: controller_slot,
                                            raid_level: raid_level,
                                            virtual_drive_name: virtual_drive_name,
                                            access_policy: access_policy,
                                            read_policy: read_policy,
                                            cache_policy: cache_policy,
                                            disk_cache_policy: disk_cache_policy,
                                            write_policy: write_policy,
                                            strip_size: strip_size,
                                            size: size,
                                            self_encrypt: self_encrypt,
                                            server_id: server_id)
                if boot_drive
                    set_as_boot_drive(handle: handle,
                                        controller_type: controller_type,
                                        controller_slot: controller_slot,
                                        virtual_drive_name: virtual_drive_name,
                                        raid_level: raid_level,
                                        drive_group: drive_group,
                                        server_id: server_id)
                    #mo.set_prop(:admin_action,"set-boot-drive")
                    #handle.set_mo(mo: mo)
                end
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()  
        end
    end

    action :delete do

        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        begin
            if handle.nil?
                raise "handle is nil"
            end
            converge_if_changed :state do
                converge = true
            end
            if converge
                virtual_drive_delete(   handle: handle,
                                        :controller_type => controller_type, 
                                        :controller_slot => controller_slot,
                                        :virtual_drive_name => virtual_drive_name,
                                        :server_id => server_id
                                    )
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