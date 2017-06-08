#This module contains the general information for SystemIOController ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class SystemIOControllerConsts
    
end


class SystemIOController < ManagedObject
    #This is SystemIOController class.

    @@consts = SystemIOControllerConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("SystemIOController", "systemIOController", "sioc-[id]", VersionMeta::VERSION202C, "OutputOnly", 0xf, [], ["read-only"], ["Get"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], ["0-999"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
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
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_reader :child_action
    attr_reader :description
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @child_action = nil
        @description = nil
        @status = nil

        super(class_id: "SystemIOController", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
