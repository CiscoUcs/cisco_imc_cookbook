#This module contains the general information for EquipmentSharedIOModule ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class EquipmentSharedIOModuleConsts
    
end


class EquipmentSharedIOModule < ManagedObject
    #This is EquipmentSharedIOModule class.

    @@consts = EquipmentSharedIOModuleConsts.new()
#    @@naming_props = set([u'slotId'])

    @@mo_meta = {
        "modular" => MoMeta.new("EquipmentSharedIOModule", "equipmentSharedIOModule", "shared-io-module-[slot_id]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "adapter_hw_revision" => MoPropertyMeta.new("adapter_hw_revision", "adapterHWRevision", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "current_firmware_version" => MoPropertyMeta.new("current_firmware_version", "currentFirmwareVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "fip_mode" => MoPropertyMeta.new("fip_mode", "fipMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "iscsi_boot_capable" => MoPropertyMeta.new("iscsi_boot_capable", "iscsiBootCapable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "lldp" => MoPropertyMeta.new("lldp", "lldp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "product_id" => MoPropertyMeta.new("product_id", "productId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "serial_number" => MoPropertyMeta.new("serial_number", "serialNumber", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "slot_id" => MoPropertyMeta.new("slot_id", "slotId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "usnic_capable" => MoPropertyMeta.new("usnic_capable", "usnicCapable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "vid" => MoPropertyMeta.new("vid", "vid", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "vntag_mode" => MoPropertyMeta.new("vntag_mode", "vntagMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "adapterHWRevision" => "adapter_hw_revision", 
            "childAction" => "child_action", 
            "currentFirmwareVersion" => "current_firmware_version", 
            "description" => "description", 
            "dn" => "dn", 
            "fipMode" => "fip_mode", 
            "iscsiBootCapable" => "iscsi_boot_capable", 
            "lldp" => "lldp", 
            "productId" => "product_id", 
            "rn" => "rn", 
            "serialNumber" => "serial_number", 
            "slotId" => "slot_id", 
            "status" => "status", 
            "usnicCapable" => "usnic_capable", 
            "vendor" => "vendor", 
            "vid" => "vid", 
            "vntagMode" => "vntag_mode", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :slot_id
    attr_reader :adapter_hw_revision
    attr_reader :child_action
    attr_reader :current_firmware_version
    attr_reader :description
    attr_reader :fip_mode
    attr_reader :iscsi_boot_capable
    attr_reader :lldp
    attr_reader :product_id
    attr_reader :serial_number
    attr_reader :status
    attr_reader :usnic_capable
    attr_reader :vendor
    attr_reader :vid
    attr_reader :vntag_mode


    def initialize(parent_mo_or_dn: nil,slot_id: nil,  **kwargs)
        @dirty_mask = 0
        @slot_id = slot_id
        @adapter_hw_revision = nil
        @child_action = nil
        @current_firmware_version = nil
        @description = nil
        @fip_mode = nil
        @iscsi_boot_capable = nil
        @lldp = nil
        @product_id = nil
        @serial_number = nil
        @status = nil
        @usnic_capable = nil
        @vendor = nil
        @vid = nil
        @vntag_mode = nil

        super(class_id: "EquipmentSharedIOModule", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
