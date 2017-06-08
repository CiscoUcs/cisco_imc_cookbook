#This module contains the general information for MemoryUnitEnvStats ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class MemoryUnitEnvStatsConsts
    
end


class MemoryUnitEnvStats < ManagedObject
    #This is MemoryUnitEnvStats class.

    @@consts = MemoryUnitEnvStatsConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("MemoryUnitEnvStats", "memoryUnitEnvStats", "dimm-env-stats", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("MemoryUnitEnvStats", "memoryUnitEnvStats", "dimm-env-stats", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "temperature" => MoPropertyMeta.new("temperature", "temperature", "float", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "time_collected" => MoPropertyMeta.new("time_collected", "timeCollected", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{([0-9]){4}-([0-9]){2}-([0-9]){2}T([0-9]){2}:([0-9]){2}:([0-9]){2}((\.([0-9]){3})){0,1}}, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "temperature" => MoPropertyMeta.new("temperature", "temperature", "float", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "time_collected" => MoPropertyMeta.new("time_collected", "timeCollected", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{([0-9]){4}-([0-9]){2}-([0-9]){2}T([0-9]){2}:([0-9]){2}:([0-9]){2}((\.([0-9]){3})){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "description" => "description", 
        "dn" => "dn", 
        "id" => "id", 
        "rn" => "rn", 
        "status" => "status", 
        "temperature" => "temperature", 
        "timeCollected" => "time_collected", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "description" => "description", 
            "dn" => "dn", 
            "id" => "id", 
            "rn" => "rn", 
            "status" => "status", 
            "temperature" => "temperature", 
            "timeCollected" => "time_collected", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :description
    attr_reader :id
    attr_reader :status
    attr_reader :temperature
    attr_reader :time_collected


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @description = nil
        @id = nil
        @status = nil
        @temperature = nil
        @time_collected = nil

        super(class_id: "MemoryUnitEnvStats", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
