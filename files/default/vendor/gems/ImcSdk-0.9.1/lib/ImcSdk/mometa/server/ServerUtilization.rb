#This module contains the general information for ServerUtilization ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class ServerUtilizationConsts
    
end


class ServerUtilization < ManagedObject
    #This is ServerUtilization class.

    @@consts = ServerUtilizationConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("ServerUtilization", "serverUtilization", "utilization", VersionMeta::VERSION202C, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("ServerUtilization", "serverUtilization", "utilization", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "cpu_utilization" => MoPropertyMeta.new("cpu_utilization", "cpuUtilization", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "io_utilization" => MoPropertyMeta.new("io_utilization", "ioUtilization", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "memory_utilization" => MoPropertyMeta.new("memory_utilization", "memoryUtilization", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "overall_utilization" => MoPropertyMeta.new("overall_utilization", "overallUtilization", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "cpu_utilization" => MoPropertyMeta.new("cpu_utilization", "cpuUtilization", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "io_utilization" => MoPropertyMeta.new("io_utilization", "ioUtilization", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "memory_utilization" => MoPropertyMeta.new("memory_utilization", "memoryUtilization", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "overall_utilization" => MoPropertyMeta.new("overall_utilization", "overallUtilization", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "cpuUtilization" => "cpu_utilization", 
        "dn" => "dn", 
        "ioUtilization" => "io_utilization", 
        "memoryUtilization" => "memory_utilization", 
        "overallUtilization" => "overall_utilization", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "cpuUtilization" => "cpu_utilization", 
            "dn" => "dn", 
            "ioUtilization" => "io_utilization", 
            "memoryUtilization" => "memory_utilization", 
            "overallUtilization" => "overall_utilization", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :cpu_utilization
    attr_reader :io_utilization
    attr_reader :memory_utilization
    attr_reader :overall_utilization
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @cpu_utilization = nil
        @io_utilization = nil
        @memory_utilization = nil
        @overall_utilization = nil
        @status = nil

        super(class_id: "ServerUtilization", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
