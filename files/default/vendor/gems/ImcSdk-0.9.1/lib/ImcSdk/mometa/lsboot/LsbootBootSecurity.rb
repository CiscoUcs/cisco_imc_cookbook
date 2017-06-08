#This module contains the general information for LsbootBootSecurity ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class LsbootBootSecurityConsts
    SECURE_BOOT_DISABLED = "Disabled"
    SECURE_BOOT_ENABLED = "Enabled"
    SECURE_BOOT_DISABLE = "disable"
    _SECURE_BOOT_DISABLED = "disabled"
    SECURE_BOOT_ENABLE = "enable"
    _SECURE_BOOT_ENABLED = "enabled"
end


class LsbootBootSecurity < ManagedObject
    #This is LsbootBootSecurity class.

    @@consts = LsbootBootSecurityConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("LsbootBootSecurity", "lsbootBootSecurity", "boot-security", VersionMeta::VERSION201A, "InputOutput", 0x1f, [], ["admin", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("LsbootBootSecurity", "lsbootBootSecurity", "boot-security", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "secure_boot" => MoPropertyMeta.new("secure_boot", "secureBoot", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disable", "disabled", "enable", "enabled"], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "secure_boot" => MoPropertyMeta.new("secure_boot", "secureBoot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disable", "disabled", "enable", "enabled"], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "rn" => "rn", 
        "secureBoot" => "secure_boot", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "secureBoot" => "secure_boot", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :secure_boot
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @secure_boot = nil
        @status = nil

        super(class_id: "LsbootBootSecurity", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
