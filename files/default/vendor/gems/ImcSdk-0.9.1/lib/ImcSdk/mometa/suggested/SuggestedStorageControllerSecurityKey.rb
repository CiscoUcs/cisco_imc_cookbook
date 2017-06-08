#This module contains the general information for SuggestedStorageControllerSecurityKey ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class SuggestedStorageControllerSecurityKeyConsts
    
end


class SuggestedStorageControllerSecurityKey < ManagedObject
    #This is SuggestedStorageControllerSecurityKey class.

    @@consts = SuggestedStorageControllerSecurityKeyConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("SuggestedStorageControllerSecurityKey", "suggestedStorageControllerSecurityKey", "suggested-sec-key", VersionMeta::VERSION209C, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION209C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "suggested_security_key" => MoPropertyMeta.new("suggested_security_key", "suggestedSecurityKey", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 33, nil, [], []), 
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
        "suggestedSecurityKey" => "suggested_security_key", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :status
    attr_reader :suggested_security_key


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @suggested_security_key = nil

        super(class_id: "SuggestedStorageControllerSecurityKey", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
