#This module contains the general information for LsbootDevPrecision ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class LsbootDevPrecisionConsts
    CONFIGURED_BOOT_MODE_LEGACY = "Legacy"
    CONFIGURED_BOOT_MODE_NONE = "None"
    CONFIGURED_BOOT_MODE_UEFI = "Uefi"
    LAST_CONFIGURED_BOOT_ORDER_SOURCE_BIOS = "BIOS"
    LAST_CONFIGURED_BOOT_ORDER_SOURCE_CIMC = "CIMC"
    LAST_CONFIGURED_BOOT_ORDER_SOURCE_UNKNOWN = "UNKNOWN"
    PURPOSE_OPERATIONAL = "operational"
    PURPOSE_UTILITY = "utility"
    REAPPLY_FALSE = "false"
    REAPPLY_NO = "no"
    REAPPLY_TRUE = "true"
    REAPPLY_YES = "yes"
    REBOOT_ON_UPDATE_FALSE = "false"
    REBOOT_ON_UPDATE_NO = "no"
    REBOOT_ON_UPDATE_TRUE = "true"
    REBOOT_ON_UPDATE_YES = "yes"
end


class LsbootDevPrecision < ManagedObject
    #This is LsbootDevPrecision class.

    @@consts = LsbootDevPrecisionConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("LsbootDevPrecision", "lsbootDevPrecision", "boot-precision", VersionMeta::VERSION201A, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("LsbootDevPrecision", "lsbootDevPrecision", "boot-precision", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "configured_boot_mode" => MoPropertyMeta.new("configured_boot_mode", "configuredBootMode", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Legacy", "None", "Uefi"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "last_configured_boot_order_source" => MoPropertyMeta.new("last_configured_boot_order_source", "lastConfiguredBootOrderSource", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["BIOS", "CIMC", "UNKNOWN"], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,16}}, [], []), 
        "purpose" => MoPropertyMeta.new("purpose", "purpose", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["operational", "utility"], []), 
        "reapply" => MoPropertyMeta.new("reapply", "reapply", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "reboot_on_update" => MoPropertyMeta.new("reboot_on_update", "rebootOnUpdate", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "configured_boot_mode" => MoPropertyMeta.new("configured_boot_mode", "configuredBootMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Legacy", "None", "Uefi"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "last_configured_boot_order_source" => MoPropertyMeta.new("last_configured_boot_order_source", "lastConfiguredBootOrderSource", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["BIOS", "CIMC", "UNKNOWN"], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,16}}, [], []), 
            "purpose" => MoPropertyMeta.new("purpose", "purpose", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["operational", "utility"], []), 
            "reapply" => MoPropertyMeta.new("reapply", "reapply", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "reboot_on_update" => MoPropertyMeta.new("reboot_on_update", "rebootOnUpdate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "configuredBootMode" => "configured_boot_mode", 
        "dn" => "dn", 
        "lastConfiguredBootOrderSource" => "last_configured_boot_order_source", 
        "name" => "name", 
        "purpose" => "purpose", 
        "reapply" => "reapply", 
        "rebootOnUpdate" => "reboot_on_update", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "configuredBootMode" => "configured_boot_mode", 
            "dn" => "dn", 
            "lastConfiguredBootOrderSource" => "last_configured_boot_order_source", 
            "name" => "name", 
            "purpose" => "purpose", 
            "reapply" => "reapply", 
            "rebootOnUpdate" => "reboot_on_update", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :configured_boot_mode
    attr_reader :last_configured_boot_order_source
    attr_reader :name
    attr_reader :purpose
    attr_accessor :reapply
    attr_accessor :reboot_on_update
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @configured_boot_mode = nil
        @last_configured_boot_order_source = nil
        @name = nil
        @purpose = nil
        @reapply = nil
        @reboot_on_update = nil
        @status = nil

        super(class_id: "LsbootDevPrecision", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
