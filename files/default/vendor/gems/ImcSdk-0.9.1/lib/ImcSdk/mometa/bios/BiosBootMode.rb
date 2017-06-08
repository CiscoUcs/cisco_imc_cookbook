#This module contains the general information for BiosBootMode ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosBootModeConsts
    ACTUAL_BOOT_MODE_LEGACY = "Legacy"
    ACTUAL_BOOT_MODE_UEFI = "Uefi"
    ACTUAL_BOOT_MODE_UNKNOWN = "Unknown"
end


class BiosBootMode < ManagedObject
    #This is BiosBootMode class.

    @@consts = BiosBootModeConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosBootMode", "biosBootMode", "boot-mode", VersionMeta::VERSION201A, "OutputOnly", 0xf, [], ["admin", "user"], ["Get"]),
        "modular" => MoMeta.new("BiosBootMode", "biosBootMode", "boot-mode", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "actual_boot_mode" => MoPropertyMeta.new("actual_boot_mode", "actualBootMode", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["Legacy", "Uefi", "Unknown"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

        "modular" => {
            "actual_boot_mode" => MoPropertyMeta.new("actual_boot_mode", "actualBootMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["Legacy", "Uefi", "Unknown"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "actualBootMode" => "actual_boot_mode", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "actualBootMode" => "actual_boot_mode", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :actual_boot_mode
    attr_reader :child_action
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @actual_boot_mode = nil
        @child_action = nil
        @status = nil

        super(class_id: "BiosBootMode", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
