#This module contains the general information for BiosVfExtendedAPIC ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfExtendedAPICConsts
    VP_EXTENDED_APIC_DISABLED = "Disabled"
    VP_EXTENDED_APIC_ENABLED = "Enabled"
    VP_EXTENDED_APIC_X2_APIC = "X2APIC"
    VP_EXTENDED_APIC_XAPIC = "XAPIC"
    VP_EXTENDED_APIC_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfExtendedAPIC < ManagedObject
    #This is BiosVfExtendedAPIC class.

    @@consts = BiosVfExtendedAPICConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfExtendedAPIC", "biosVfExtendedAPIC", "Extended-APIC", VersionMeta::VERSION201A, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfExtendedAPIC", "biosVfExtendedAPIC", "Extended-APIC", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_extended_apic" => MoPropertyMeta.new("vp_extended_apic", "vpExtendedAPIC", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "X2APIC", "XAPIC", "platform-default"], []), 
        },

        "modular" => {
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_extended_apic" => MoPropertyMeta.new("vp_extended_apic", "vpExtendedAPIC", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "X2APIC", "XAPIC", "disabled", "enabled", "platform-default"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "vpExtendedAPIC" => "vp_extended_apic", 
        },

        "modular" => {
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpExtendedAPIC" => "vp_extended_apic", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :status
    attr_accessor :vp_extended_apic


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @status = nil
        @vp_extended_apic = nil

        super(class_id: "BiosVfExtendedAPIC", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
