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
require "imccoreutils"
require "mometa/lsboot/LsbootDevPrecision"
require_relative "../utils"

PRECISION_DEVICE_DICT = {
    :hdd => {
        :class_id => "LsbootHdd",
        :type => "LOCALHDD"
    },
    :iscsi => {
        :class_id => "LsbootIscsi",
        :type => "ISCSI",
        :subtype => "ISCSI"
    },
    :pchstorage => {
        :class_id => "LsbootPchStorage",
        :type => "PCHSTORAGE"
    },
    :pxe => {
        :class_id => "LsbootPxe",
        :type => "PXE",
        :subtype => "PXE"
    },
    :san => {
        :class_id => "LsbootSan",
        :type => "SAN",
        :subtype => "SAN"
    },
    :sdcard => {
        :class_id => "LsbootSd",
        :type => "SDCARD",
        :subtype => "SDCARD"
    },
    :uefishell => {
        :class_id => "LsbootUefiShell",
        :type => "UEFISHELL"
    },
    :usb => {
        :class_id => "LsbootUsb",
        :type => "USB"
    },
    :vmedia => {
        :class_id => "LsbootVMedia",
        :type => "VMEDIA"
    },
    :nvme => {
        :class_id => "LsbootNVMe",
        :type => "NVME"
    },
}


POLICY_DEVICE_DICT = {
    :efi => {:class_id => "LsbootEfi", :access => "read-only"},
    :lan => {:class_id => "LsbootLan", :access => "read-only"},
    :storage => {:class_id => "LsbootStorage", :access => "read-write"},
    :cdrom => {:class_id => "LsbootVirtualMedia", :access => "read-only"},
    :fdd => {:class_id => "LsbootVirtualMedia", :access => "read-write"}
}

#
# This method will set the boot order precision.
#
# @param handle [ImcHandle] ImcHandle class object
# @param reboot_on_update [TrueClass, FalseClass]
# @param reapply [TrueClass, FalseClass]
# @param configured_boot_mode [String] Configured boot mode, ex. "Legacy", "Uefi", "None"
# @param boot_devices [Array<Hash>] format
#               [{"order" => '1', "device-type" => "vmedia", "name" => "vmedia"},
#               {"order" => '2', "device-type" => "hdd", "name" => "hdd"}]
#               boot-order(string): Order
#               boot-device-type(string): "hdd", "iscsi", "pchstorage", "pxe",
#                                      "san", "sdcard", "uefishell", "usb",
#                                      "vmedia"
#               boot-device-name(string): Unique label for the boot device
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [LsBootDevPrecision]
#
# @example
#           boot_order_precision_set(handle: ImcHandle,
#                                   reboot_on_update: false,
#                                   reapply: false,
#                                   configured_boot_mode: "Uefi",
#                                   boot_devices: [{"order" => '1', "device-type" => "vmedia", "name" => "vmedia"},
#                                   {"order" => '2', "device-type" => "hdd", "name" => "hdd"}]
#
def boot_order_precision_set(
        handle:,
        reboot_on_update: false,
        reapply: false,
        configured_boot_mode: "Legacy",
        boot_devices: Array.new,
        server_id: 1)

    # Insert version check here to gracefully handle older versions of CIMC

    # IMC expects the devices to be configured in sorted order
    boot_devices = boot_devices.sort_by { |x| x[:order] }
    server_dn = ImcCoreUtils.get_server_dn(handle, server_id)
    lsbootdevprecision_mo = LsbootDevPrecision.new(parent_mo_or_dn: server_dn)
    args = Hash.new
    args[:reboot_on_update] = "no"
    lsbootdevprecision_mo.reboot_on_update = "no"
    if reboot_on_update
        args[:reboot_on_update] = "yes"
    end

    args[:reapply] = "no"
    if reapply
        args[:reapply] = "yes"
    end
    args[:configured_boot_mode] = configured_boot_mode
    lsbootdevprecision_mo.set_prop_multiple(**args)
    #lsbootdevprecision_mo.set_prop(:configured_boot_mode, configured_boot_mode)
    handle.set_mo(mo: lsbootdevprecision_mo)

    boot_order_child_mos = handle.query_children(in_dn: lsbootdevprecision_mo.dn)
    for mo in boot_order_child_mos
        handle.remove_mo(mo: mo)
    end

    for device in boot_devices
        _add_boot_device(handle, lsbootdevprecision_mo.dn, device)
    end

    lsbootdevprecision_mo = handle.query_classid(class_id: "LsbootDevPrecision")
    return lsbootdevprecision_mo
end

#
# Check if boot order precision match
#
# @param handle [ImcHandle] ImcHandle class object
# @param kwargs [Hash]
# @return [FalseClass, String, nil] if LsbootDevPrecision mo not found
# @return [FalseClass, String, LsbootDevPrecision] if settings do not match
# @return [TrueClass, nil, LsbootDevPrecision] if settings match
#
def boot_order_precision_exists(handle:, **kwargs)

    server_dn = ImcCoreUtils.set_server_dn(handle, kwargs)
    mos = handle.query_children(in_dn: server_dn,
                                class_id: "LsbootDevPrecision")
    if mos.size == 0
        return false, "no Mos found", nil
    end
    mo = mos[0]
    args = {}
    if _is_valid_arg(:reboot_on_update, kwargs)
        reboot_on_update = kwargs.fetch(:reboot_on_update)
        if reboot_on_update.is_a? TrueClass or reboot_on_update.is_a? FalseClass 
            reboot_on_update = reboot_on_update ? "yes" : "no"
        end
        args[:reboot_on_update] = reboot_on_update
    end
    if _is_valid_arg(:configured_boot_mode, kwargs)
        args[:configured_boot_mode] = kwargs.fetch(:configured_boot_mode)
    end
    #args = {:reboot_on_update => reboot_on_update,
    #        :configured_boot_mode => kwargs.fetch(:configured_boot_mode, 'Uefi')}

    if !mo.check_prop_match(**args)
        return false, "parent MO property values do not match", mo
    end

    if _is_valid_arg(:boot_devices, kwargs)
        in_boot_order = kwargs[:boot_devices].sort_by { |x| x[:order]}
        configured_boot_order = boot_precision_configured_get(
            handle: handle, server_id: kwargs.fetch(:server_id, 1))

        if in_boot_order.size != configured_boot_order.size
            return false, "length mismatch", mo
        end

        for i in (0..in_boot_order.size-1)
            if !(in_boot_order[i][:order] == configured_boot_order[i][:order] and
                    in_boot_order[i][:'device-type'] == configured_boot_order[i][:'device-type'] and
                    in_boot_order[i][:name] == configured_boot_order[i][:name])
                return false, "dictionaries do not match", mo
            end
        end
    end
    return true, nil, mo
end

#
# Get the configured boot precision settings
#
# @param handle [ImcHandle] ImcHandle class object
# @param server_id [Integer] Server Id to be specified for C3260 platforms
# @return [Array<Hash>]
def boot_precision_configured_get(handle:, server_id: 1)

    configured_boot_order = []
    class_to_name_dict = {}
    PRECISION_DEVICE_DICT.each do |key, value|
        classname = value[:class_id]
        class_to_name_dict[classname.to_sym] = key
    end

    server_dn = ImcCoreUtils.get_server_dn(handle, server_id)
    pmo = LsbootDevPrecision.new(parent_mo_or_dn: server_dn)
    mos = handle.query_children(in_dn: pmo.dn)
    for mo in mos
        #class_id = mo.instance_variable_get("@class_id")
        device = {:order => mo.order,
                  :'device-type' => class_to_name_dict[mo.instance_variable_get("@class_id").to_sym].to_s,
                  :name => mo.name}
        configured_boot_order.push(device)
    end
    return configured_boot_order.sort_by {|x| x[:order]}
end

private

def _add_boot_device(handle, parent_dn, boot_device)
=begin
    This method verifies and adds the boot device in the boot order
    Used by boot_order_precision_set and boot_order_policy_set
    Args:
        handle(ImcHandle)
        boot_device(dict): This is a dictionary of the format
                    {"order" => '1', "device-type" => "vmedia", "name" => "vmedia"}
    Returns:
        None
=end

    device = _get_device(parent_dn,
                         boot_device[:'device-type'],
                         boot_device[:name])
    if device.nil?
        raise ValueError.new("Unsupported boot-device #{boot_device["device-type"]} with label #{boot_device["name"]}")
    end

    device.order = boot_device[:order]
    device_props = {}
    #for key, value in boot_device.iteritems()
    boot_device.each do |key, value|
        if !(["order", "device-type", "name"].include? key.to_s)
            device_props[key.to_sym] = value
        end
    end

    device.set_prop_multiple(**device_props)
    if device.instance_variable_defined? ("@state")
        device.set_prop(:state, "enabled")
    end
    handle.add_mo(mo: device, modify_present: true)
end

def _get_device(parent_dn, device_type, device_name)

    if _is_boot_order_precision(parent_dn)
        if !(PRECISION_DEVICE_DICT.has_key? (device_type.to_sym))
            return nil
        end
        #class_struct = load_class(PRECISION_DEVICE_DICT[device_type.to_sym][:class_id])
        mo_class = ImcCoreUtils.load_class(PRECISION_DEVICE_DICT[device_type.to_sym][:class_id].to_s)
        mo_class_param_hash = {}
        mo_class.prop_map.each do |key, value|
            mo_class_param_hash[:value] = nil
        end
        class_obj = mo_class.new(parent_mo_or_dn: parent_dn, :name => device_name)
        #class_obj = class_struct(parent_mo_or_dn=parent_dn, name=device_name)
        if PRECISION_DEVICE_DICT[device_type.to_sym].has_key? "type".to_sym
            class_obj.set_prop(:type, PRECISION_DEVICE_DICT[device_type.to_sym][:type] )
        end
        if PRECISION_DEVICE_DICT[device_type.to_sym].has_key? "subtype".to_sym
            class_obj.set_prop(:subtype, PRECISION_DEVICE_DICT[device_type.to_sym][:subtype])
        end
    elsif _is_boot_order_policy(parent_dn)
        if !(POLICY_DEVICE_DICT.has_key? device_type.to_sym)
            return nil
        end
        #class_struct = load_class(POLICY_DEVICE_DICT[device_type.to_sym][:class_id])
        mo_class = ImcCoreUtils.load_class(POLICY_DEVICE_DICT[device_type.to_sym][:class_id].to_s)
        access = POLICY_DEVICE_DICT[device_type.to_sym][:access]
=begin
        cdrom and fdd are of type LsbootVirtualMedia and have "access" as the
        naming property. Other objects under LsbootDef do not need this.
        Hence cdrom and fdd need special handling below.
=end
        if ["cdrom", "fdd"].include?(device_type)
            class_obj = mo_class.new(parent_mo_or_dn: parent_dn, access: access)
        else
            class_obj = mo_class.new(parent_mo_or_dn: parent_dn)
            class_obj.set_prop(:access, access)
        end
    else
        return nil
    end
    return class_obj
end

def _is_boot_order_precision(dn)
    return dn.include?("precision")
end