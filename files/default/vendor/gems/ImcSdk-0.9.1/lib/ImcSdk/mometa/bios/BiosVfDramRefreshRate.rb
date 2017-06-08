#This module contains the general information for BiosVfDramRefreshRate ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfDramRefreshRateConsts
    VP_DRAM_REFRESH_RATE_1X = "1x"
    VP_DRAM_REFRESH_RATE_2X = "2x"
    VP_DRAM_REFRESH_RATE_3X = "3x"
    VP_DRAM_REFRESH_RATE_4X = "4x"
    VP_DRAM_REFRESH_RATE_AUTO = "Auto"
    VP_DRAM_REFRESH_RATE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfDramRefreshRate < ManagedObject
    #This is BiosVfDramRefreshRate class.

    @@consts = BiosVfDramRefreshRateConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfDramRefreshRate", "biosVfDramRefreshRate", "dram-refresh-rate", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfDramRefreshRate", "biosVfDramRefreshRate", "dram-refresh-rate", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_dram_refresh_rate" => MoPropertyMeta.new("vp_dram_refresh_rate", "vpDramRefreshRate", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["1x", "2x", "3x", "4x", "Auto", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_dram_refresh_rate" => MoPropertyMeta.new("vp_dram_refresh_rate", "vpDramRefreshRate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["1x", "2x", "3x", "4x", "Auto", "platform-default"], []), 
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
        "vpDramRefreshRate" => "vp_dram_refresh_rate", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpDramRefreshRate" => "vp_dram_refresh_rate", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_dram_refresh_rate


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_dram_refresh_rate = nil

        super(class_id: "BiosVfDramRefreshRate", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
