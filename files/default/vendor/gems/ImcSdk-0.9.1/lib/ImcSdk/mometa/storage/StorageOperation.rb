#This module contains the general information for StorageOperation ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageOperationConsts
    
end


class StorageOperation < ManagedObject
    #This is StorageOperation class.

    @@consts = StorageOperationConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageOperation", "storageOperation", "storage-operation", VersionMeta::VERSION201A, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("StorageOperation", "storageOperation", "storage-operation", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "current_lrop" => MoPropertyMeta.new("current_lrop", "currentLrop", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "elapsed_seconds" => MoPropertyMeta.new("elapsed_seconds", "elapsedSeconds", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "lrop_in_progress" => MoPropertyMeta.new("lrop_in_progress", "lropInProgress", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "progress_percent" => MoPropertyMeta.new("progress_percent", "progressPercent", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "current_lrop" => MoPropertyMeta.new("current_lrop", "currentLrop", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "elapsed_seconds" => MoPropertyMeta.new("elapsed_seconds", "elapsedSeconds", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "lrop_in_progress" => MoPropertyMeta.new("lrop_in_progress", "lropInProgress", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "progress_percent" => MoPropertyMeta.new("progress_percent", "progressPercent", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "currentLrop" => "current_lrop", 
        "dn" => "dn", 
        "elapsedSeconds" => "elapsed_seconds", 
        "lropInProgress" => "lrop_in_progress", 
        "progressPercent" => "progress_percent", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "currentLrop" => "current_lrop", 
            "dn" => "dn", 
            "elapsedSeconds" => "elapsed_seconds", 
            "lropInProgress" => "lrop_in_progress", 
            "progressPercent" => "progress_percent", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :current_lrop
    attr_reader :elapsed_seconds
    attr_reader :lrop_in_progress
    attr_reader :progress_percent
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @current_lrop = nil
        @elapsed_seconds = nil
        @lrop_in_progress = nil
        @progress_percent = nil
        @status = nil

        super(class_id: "StorageOperation", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
