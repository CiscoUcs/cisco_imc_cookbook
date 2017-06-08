#This module contains the general information for BiosVfSataModeSelect ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfSataModeSelectConsts
    VP_SATA_MODE_SELECT_AHCI = "AHCI"
    VP_SATA_MODE_SELECT_DISABLED = "Disabled"
    VP_SATA_MODE_SELECT_LSI_SW_RAID = "LSI SW RAID"
    VP_SATA_MODE_SELECT_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfSataModeSelect < ManagedObject
    #This is BiosVfSataModeSelect class.

    @@consts = BiosVfSataModeSelectConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfSataModeSelect", "biosVfSataModeSelect", "Pch-Sata-Mode", VersionMeta::VERSION202C, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfSataModeSelect", "biosVfSataModeSelect", "Pch-Sata-Mode", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_sata_mode_select" => MoPropertyMeta.new("vp_sata_mode_select", "vpSataModeSelect", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["AHCI", "Disabled", "LSI SW RAID", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_sata_mode_select" => MoPropertyMeta.new("vp_sata_mode_select", "vpSataModeSelect", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["AHCI", "Disabled", "LSI SW RAID", "platform-default"], []), 
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
        "status" => "status", 
        "vpSataModeSelect" => "vp_sata_mode_select", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpSataModeSelect" => "vp_sata_mode_select", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_sata_mode_select


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_sata_mode_select = nil

        super(class_id: "BiosVfSataModeSelect", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
