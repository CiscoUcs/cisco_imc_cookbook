#This module contains the general information for GeneratedStorageControllerKeyId ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class GeneratedStorageControllerKeyIdConsts
    
end


class GeneratedStorageControllerKeyId < ManagedObject
    #This is GeneratedStorageControllerKeyId class.

    @@consts = GeneratedStorageControllerKeyIdConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("GeneratedStorageControllerKeyId", "generatedStorageControllerKeyId", "gen-key-id", VersionMeta::VERSION209C, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION209C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "generated_key_id" => MoPropertyMeta.new("generated_key_id", "generatedKeyId", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 256, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "generatedKeyId" => "generated_key_id", 
        "rn" => "rn", 
        "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :generated_key_id
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @generated_key_id = nil
        @status = nil

        super(class_id: "GeneratedStorageControllerKeyId", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
