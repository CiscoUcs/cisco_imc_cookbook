#This module contains the general information for BiosVfAdjacentCacheLinePrefetch ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfAdjacentCacheLinePrefetchConsts
    VP_ADJACENT_CACHE_LINE_PREFETCH_DISABLED = "Disabled"
    VP_ADJACENT_CACHE_LINE_PREFETCH_ENABLED = "Enabled"
    _VP_ADJACENT_CACHE_LINE_PREFETCH_DISABLED = "disabled"
    _VP_ADJACENT_CACHE_LINE_PREFETCH_ENABLED = "enabled"
    VP_ADJACENT_CACHE_LINE_PREFETCH_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfAdjacentCacheLinePrefetch < ManagedObject
    #This is BiosVfAdjacentCacheLinePrefetch class.

    @@consts = BiosVfAdjacentCacheLinePrefetchConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfAdjacentCacheLinePrefetch", "biosVfAdjacentCacheLinePrefetch", "Adjacent-Cache-Line-Prefetch", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfAdjacentCacheLinePrefetch", "biosVfAdjacentCacheLinePrefetch", "Adjacent-Cache-Line-Prefetch", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
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
        "vp_adjacent_cache_line_prefetch" => MoPropertyMeta.new("vp_adjacent_cache_line_prefetch", "vpAdjacentCacheLinePrefetch", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_adjacent_cache_line_prefetch" => MoPropertyMeta.new("vp_adjacent_cache_line_prefetch", "vpAdjacentCacheLinePrefetch", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpAdjacentCacheLinePrefetch" => "vp_adjacent_cache_line_prefetch", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpAdjacentCacheLinePrefetch" => "vp_adjacent_cache_line_prefetch", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_adjacent_cache_line_prefetch


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_adjacent_cache_line_prefetch = nil

        super(class_id: "BiosVfAdjacentCacheLinePrefetch", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
