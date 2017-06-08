#This module contains the general information for BiosVfWorkLoadConfig ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfWorkLoadConfigConsts
    VP_WORK_LOAD_CONFIG_BALANCED = "Balanced"
    VP_WORK_LOAD_CONFIG_I_O_SENSITIVE = "I/O Sensitive"
    VP_WORK_LOAD_CONFIG_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfWorkLoadConfig < ManagedObject
    #This is BiosVfWorkLoadConfig class.

    @@consts = BiosVfWorkLoadConfigConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfWorkLoadConfig", "biosVfWorkLoadConfig", "work-load-config", VersionMeta::VERSION204C, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfWorkLoadConfig", "biosVfWorkLoadConfig", "work-load-config", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_work_load_config" => MoPropertyMeta.new("vp_work_load_config", "vpWorkLoadConfig", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Balanced", "I/O Sensitive", "platform-default"], []), 
        },

        "modular" => {
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_work_load_config" => MoPropertyMeta.new("vp_work_load_config", "vpWorkLoadConfig", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Balanced", "I/O Sensitive", "platform-default"], []), 
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
        "vpWorkLoadConfig" => "vp_work_load_config", 
        },

        "modular" => {
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpWorkLoadConfig" => "vp_work_load_config", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :status
    attr_accessor :vp_work_load_config


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @status = nil
        @vp_work_load_config = nil

        super(class_id: "BiosVfWorkLoadConfig", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
