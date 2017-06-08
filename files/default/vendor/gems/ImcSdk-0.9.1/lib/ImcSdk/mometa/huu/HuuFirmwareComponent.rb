#This module contains the general information for HuuFirmwareComponent ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class HuuFirmwareComponentConsts
    
end


class HuuFirmwareComponent < ManagedObject
    #This is HuuFirmwareComponent class.

    @@consts = HuuFirmwareComponentConsts.new()
#    @@naming_props = set([u'component'])

    @@mo_meta = {
        "classic" => MoMeta.new("HuuFirmwareComponent", "huuFirmwareComponent", "component-[component]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("HuuFirmwareComponent", "huuFirmwareComponent", "component-[component]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "cntrl_id" => MoPropertyMeta.new("cntrl_id", "cntrlId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "component" => MoPropertyMeta.new("component", "component", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "device_id" => MoPropertyMeta.new("device_id", "deviceId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION154, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "mac_addr" => MoPropertyMeta.new("mac_addr", "macAddr", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "running_version" => MoPropertyMeta.new("running_version", "runningVersion", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "sub_device_id" => MoPropertyMeta.new("sub_device_id", "subDeviceId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "sub_vendor_id" => MoPropertyMeta.new("sub_vendor_id", "subVendorId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "vendor_id" => MoPropertyMeta.new("vendor_id", "vendorId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "cntrl_id" => MoPropertyMeta.new("cntrl_id", "cntrlId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "component" => MoPropertyMeta.new("component", "component", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "device_id" => MoPropertyMeta.new("device_id", "deviceId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "mac_addr" => MoPropertyMeta.new("mac_addr", "macAddr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "running_version" => MoPropertyMeta.new("running_version", "runningVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "sub_device_id" => MoPropertyMeta.new("sub_device_id", "subDeviceId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sub_vendor_id" => MoPropertyMeta.new("sub_vendor_id", "subVendorId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "vendor_id" => MoPropertyMeta.new("vendor_id", "vendorId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "cntrlId" => "cntrl_id", 
        "component" => "component", 
        "description" => "description", 
        "deviceId" => "device_id", 
        "dn" => "dn", 
        "id" => "id", 
        "macAddr" => "mac_addr", 
        "rn" => "rn", 
        "runningVersion" => "running_version", 
        "slot" => "slot", 
        "status" => "status", 
        "subDeviceId" => "sub_device_id", 
        "subVendorId" => "sub_vendor_id", 
        "vendorId" => "vendor_id", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "cntrlId" => "cntrl_id", 
            "component" => "component", 
            "description" => "description", 
            "deviceId" => "device_id", 
            "dn" => "dn", 
            "id" => "id", 
            "macAddr" => "mac_addr", 
            "rn" => "rn", 
            "runningVersion" => "running_version", 
            "slot" => "slot", 
            "status" => "status", 
            "subDeviceId" => "sub_device_id", 
            "subVendorId" => "sub_vendor_id", 
            "vendorId" => "vendor_id", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :component
    attr_reader :child_action
    attr_reader :cntrl_id
    attr_reader :description
    attr_reader :device_id
    attr_reader :id
    attr_reader :mac_addr
    attr_reader :running_version
    attr_reader :slot
    attr_reader :status
    attr_reader :sub_device_id
    attr_reader :sub_vendor_id
    attr_reader :vendor_id


    def initialize(parent_mo_or_dn: nil,component: nil,  **kwargs)
        @dirty_mask = 0
        @component = component
        @child_action = nil
        @cntrl_id = nil
        @description = nil
        @device_id = nil
        @id = nil
        @mac_addr = nil
        @running_version = nil
        @slot = nil
        @status = nil
        @sub_device_id = nil
        @sub_vendor_id = nil
        @vendor_id = nil

        super(class_id: "HuuFirmwareComponent", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
