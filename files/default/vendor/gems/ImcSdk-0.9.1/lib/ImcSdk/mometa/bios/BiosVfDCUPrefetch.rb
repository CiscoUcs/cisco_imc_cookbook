#This module contains the general information for BiosVfDCUPrefetch ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfDCUPrefetchConsts
    VP_IPPREFETCH_DISABLED = "Disabled"
    VP_IPPREFETCH_ENABLED = "Enabled"
    _VP_IPPREFETCH_DISABLED = "disabled"
    _VP_IPPREFETCH_ENABLED = "enabled"
    VP_IPPREFETCH_PLATFORM_DEFAULT = "platform-default"
    VP_STREAMER_PREFETCH_DISABLED = "Disabled"
    VP_STREAMER_PREFETCH_ENABLED = "Enabled"
    _VP_STREAMER_PREFETCH_DISABLED = "disabled"
    _VP_STREAMER_PREFETCH_ENABLED = "enabled"
    VP_STREAMER_PREFETCH_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfDCUPrefetch < ManagedObject
    #This is BiosVfDCUPrefetch class.

    @@consts = BiosVfDCUPrefetchConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfDCUPrefetch", "biosVfDCUPrefetch", "DCU-Prefetch", VersionMeta::VERSION151F, "InputOutput", 0x3f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfDCUPrefetch", "biosVfDCUPrefetch", "DCU-Prefetch", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin"], ["Get", "Set"])
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
        "vp_ip_prefetch" => MoPropertyMeta.new("vp_ip_prefetch", "vpIPPrefetch", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        "vp_streamer_prefetch" => MoPropertyMeta.new("vp_streamer_prefetch", "vpStreamerPrefetch", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_ip_prefetch" => MoPropertyMeta.new("vp_ip_prefetch", "vpIPPrefetch", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
            "vp_streamer_prefetch" => MoPropertyMeta.new("vp_streamer_prefetch", "vpStreamerPrefetch", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpIPPrefetch" => "vp_ip_prefetch", 
        "vpStreamerPrefetch" => "vp_streamer_prefetch", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpIPPrefetch" => "vp_ip_prefetch", 
            "vpStreamerPrefetch" => "vp_streamer_prefetch", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_ip_prefetch
    attr_accessor :vp_streamer_prefetch


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_ip_prefetch = nil
        @vp_streamer_prefetch = nil

        super(class_id: "BiosVfDCUPrefetch", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
