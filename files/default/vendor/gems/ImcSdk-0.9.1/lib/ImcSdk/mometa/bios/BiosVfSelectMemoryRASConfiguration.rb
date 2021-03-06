#This module contains the general information for BiosVfSelectMemoryRASConfiguration ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfSelectMemoryRASConfigurationConsts
    VP_SELECT_MEMORY_RASCONFIGURATION_LOCKSTEP = "lockstep"
    VP_SELECT_MEMORY_RASCONFIGURATION_MAXIMUM_PERFORMANCE = "maximum-performance"
    VP_SELECT_MEMORY_RASCONFIGURATION_MIRRORING = "mirroring"
    VP_SELECT_MEMORY_RASCONFIGURATION_PLATFORM_DEFAULT = "platform-default"
    VP_SELECT_MEMORY_RASCONFIGURATION_SPARING = "sparing"
end


class BiosVfSelectMemoryRASConfiguration < ManagedObject
    #This is BiosVfSelectMemoryRASConfiguration class.

    @@consts = BiosVfSelectMemoryRASConfigurationConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfSelectMemoryRASConfiguration", "biosVfSelectMemoryRASConfiguration", "SelectMemory-RAS-configuration", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfSelectMemoryRASConfiguration", "biosVfSelectMemoryRASConfiguration", "SelectMemory-RAS-configuration", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
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
        "vp_select_memory_ras_configuration" => MoPropertyMeta.new("vp_select_memory_ras_configuration", "vpSelectMemoryRASConfiguration", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["lockstep", "maximum-performance", "mirroring", "platform-default", "sparing"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_select_memory_ras_configuration" => MoPropertyMeta.new("vp_select_memory_ras_configuration", "vpSelectMemoryRASConfiguration", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["lockstep", "maximum-performance", "mirroring", "platform-default", "sparing"], []), 
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
        "vpSelectMemoryRASConfiguration" => "vp_select_memory_ras_configuration", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpSelectMemoryRASConfiguration" => "vp_select_memory_ras_configuration", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_select_memory_ras_configuration


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_select_memory_ras_configuration = nil

        super(class_id: "BiosVfSelectMemoryRASConfiguration", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
