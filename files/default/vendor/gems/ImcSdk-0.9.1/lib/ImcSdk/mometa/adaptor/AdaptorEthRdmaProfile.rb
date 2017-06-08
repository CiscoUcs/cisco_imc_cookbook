#This module contains the general information for AdaptorEthRdmaProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorEthRdmaProfileConsts
    
end


class AdaptorEthRdmaProfile < ManagedObject
    #This is AdaptorEthRdmaProfile class.

    @@consts = AdaptorEthRdmaProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorEthRdmaProfile", "adaptorEthRdmaProfile", "rdmaprofile", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorEthRdmaProfile", "adaptorEthRdmaProfile", "rdmaprofile", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "memory_regions" => MoPropertyMeta.new("memory_regions", "memoryRegions", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["0-524288"]), 
        "queue_pairs" => MoPropertyMeta.new("queue_pairs", "queuePairs", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["0-8192"]), 
        "resource_groups" => MoPropertyMeta.new("resource_groups", "resourceGroups", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["0-128"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "memory_regions" => MoPropertyMeta.new("memory_regions", "memoryRegions", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["0-524288"]), 
            "queue_pairs" => MoPropertyMeta.new("queue_pairs", "queuePairs", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["0-8192"]), 
            "resource_groups" => MoPropertyMeta.new("resource_groups", "resourceGroups", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["0-128"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "memoryRegions" => "memory_regions", 
        "queuePairs" => "queue_pairs", 
        "resourceGroups" => "resource_groups", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "memoryRegions" => "memory_regions", 
            "queuePairs" => "queue_pairs", 
            "resourceGroups" => "resource_groups", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :memory_regions
    attr_accessor :queue_pairs
    attr_accessor :resource_groups
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @memory_regions = nil
        @queue_pairs = nil
        @resource_groups = nil
        @status = nil

        super(class_id: "AdaptorEthRdmaProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
