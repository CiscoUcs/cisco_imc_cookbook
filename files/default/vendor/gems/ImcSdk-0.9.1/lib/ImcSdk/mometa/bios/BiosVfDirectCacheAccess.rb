#This module contains the general information for BiosVfDirectCacheAccess ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfDirectCacheAccessConsts
    VP_DIRECT_CACHE_ACCESS_AUTO = "Auto"
    VP_DIRECT_CACHE_ACCESS_DISABLED = "Disabled"
    VP_DIRECT_CACHE_ACCESS_ENABLED = "Enabled"
    _VP_DIRECT_CACHE_ACCESS_AUTO = "auto"
    _VP_DIRECT_CACHE_ACCESS_DISABLED = "disabled"
    _VP_DIRECT_CACHE_ACCESS_ENABLED = "enabled"
    VP_DIRECT_CACHE_ACCESS_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfDirectCacheAccess < ManagedObject
    #This is BiosVfDirectCacheAccess class.

    @@consts = BiosVfDirectCacheAccessConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfDirectCacheAccess", "biosVfDirectCacheAccess", "Direct-Cache-Access", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfDirectCacheAccess", "biosVfDirectCacheAccess", "Direct-Cache-Access", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
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
        "vp_direct_cache_access" => MoPropertyMeta.new("vp_direct_cache_access", "vpDirectCacheAccess", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Auto", "Disabled", "Enabled", "auto", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_direct_cache_access" => MoPropertyMeta.new("vp_direct_cache_access", "vpDirectCacheAccess", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "auto", "disabled", "enabled", "platform-default"], []), 
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
        "vpDirectCacheAccess" => "vp_direct_cache_access", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpDirectCacheAccess" => "vp_direct_cache_access", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_direct_cache_access


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_direct_cache_access = nil

        super(class_id: "BiosVfDirectCacheAccess", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
