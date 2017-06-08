#This module contains the general information for StorageLocalDiskUsage ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageLocalDiskUsageConsts
    
end


class StorageLocalDiskUsage < ManagedObject
    #This is StorageLocalDiskUsage class.

    @@consts = StorageLocalDiskUsageConsts.new()
#    @@naming_props = set([u'physicalDrive'])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageLocalDiskUsage", "storageLocalDiskUsage", "pd-[physical_drive]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("StorageLocalDiskUsage", "storageLocalDiskUsage", "pd-[physical_drive]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "number_of_blocks" => MoPropertyMeta.new("number_of_blocks", "numberOfBlocks", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "physical_drive" => MoPropertyMeta.new("physical_drive", "physicalDrive", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "span" => MoPropertyMeta.new("span", "span", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "starting_block" => MoPropertyMeta.new("starting_block", "startingBlock", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "state" => MoPropertyMeta.new("state", "state", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "virtual_drive" => MoPropertyMeta.new("virtual_drive", "virtualDrive", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "number_of_blocks" => MoPropertyMeta.new("number_of_blocks", "numberOfBlocks", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "physical_drive" => MoPropertyMeta.new("physical_drive", "physicalDrive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "span" => MoPropertyMeta.new("span", "span", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "starting_block" => MoPropertyMeta.new("starting_block", "startingBlock", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "state" => MoPropertyMeta.new("state", "state", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "virtual_drive" => MoPropertyMeta.new("virtual_drive", "virtualDrive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "numberOfBlocks" => "number_of_blocks", 
        "physicalDrive" => "physical_drive", 
        "rn" => "rn", 
        "span" => "span", 
        "startingBlock" => "starting_block", 
        "state" => "state", 
        "status" => "status", 
        "virtualDrive" => "virtual_drive", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "numberOfBlocks" => "number_of_blocks", 
            "physicalDrive" => "physical_drive", 
            "rn" => "rn", 
            "span" => "span", 
            "startingBlock" => "starting_block", 
            "state" => "state", 
            "status" => "status", 
            "virtualDrive" => "virtual_drive", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :physical_drive
    attr_reader :child_action
    attr_reader :number_of_blocks
    attr_reader :span
    attr_reader :starting_block
    attr_reader :state
    attr_reader :status
    attr_reader :virtual_drive


    def initialize(parent_mo_or_dn: nil,physical_drive: nil,  **kwargs)
        @dirty_mask = 0
        @physical_drive = physical_drive
        @child_action = nil
        @number_of_blocks = nil
        @span = nil
        @starting_block = nil
        @state = nil
        @status = nil
        @virtual_drive = nil

        super(class_id: "StorageLocalDiskUsage", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
