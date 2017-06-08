#This module contains the general information for BiosVfMMCFGBase ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfMMCFGBaseConsts
    VP_MMCFGBASE_1_GB = "1 GB"
    VP_MMCFGBASE_2_GB = "2 GB"
    VP_MMCFGBASE_2_5_GB = "2.5 GB"
    VP_MMCFGBASE_3_GB = "3 GB"
    VP_MMCFGBASE_AUTO = "Auto"
    VP_MMCFGBASE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfMMCFGBase < ManagedObject
    #This is BiosVfMMCFGBase class.

    @@consts = BiosVfMMCFGBaseConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfMMCFGBase", "biosVfMMCFGBase", "MMCFG-Base", VersionMeta::VERSION201A, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfMMCFGBase", "biosVfMMCFGBase", "MMCFG-Base", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_mmcfg_base" => MoPropertyMeta.new("vp_mmcfg_base", "vpMMCFGBase", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["1 GB", "2 GB", "2.5 GB", "3 GB", "Auto", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_mmcfg_base" => MoPropertyMeta.new("vp_mmcfg_base", "vpMMCFGBase", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["1 GB", "2 GB", "2.5 GB", "3 GB", "Auto", "platform-default"], []), 
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
        "vpMMCFGBase" => "vp_mmcfg_base", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpMMCFGBase" => "vp_mmcfg_base", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_mmcfg_base


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_mmcfg_base = nil

        super(class_id: "BiosVfMMCFGBase", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
