#This module contains the general information for StorageEnclosureDiskSlotEp ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageEnclosureDiskSlotEpConsts
    
end


class StorageEnclosureDiskSlotEp < ManagedObject
    #This is StorageEnclosureDiskSlotEp class.

    @@consts = StorageEnclosureDiskSlotEpConsts.new()
#    @@naming_props = set([u'slot'])

    @@mo_meta = {
        "modular" => MoMeta.new("StorageEnclosureDiskSlotEp", "storageEnclosureDiskSlotEp", "disk-slot-[slot]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "health" => "health", 
            "presence" => "presence", 
            "rn" => "rn", 
            "slot" => "slot", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :slot
    attr_reader :child_action
    attr_reader :health
    attr_reader :presence
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,slot: nil,  **kwargs)
        @dirty_mask = 0
        @slot = slot
        @child_action = nil
        @health = nil
        @presence = nil
        @status = nil

        super(class_id: "StorageEnclosureDiskSlotEp", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
