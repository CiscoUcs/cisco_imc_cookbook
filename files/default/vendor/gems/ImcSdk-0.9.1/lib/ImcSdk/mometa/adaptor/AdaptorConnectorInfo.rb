#This module contains the general information for AdaptorConnectorInfo ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorConnectorInfoConsts
    
end


class AdaptorConnectorInfo < ManagedObject
    #This is AdaptorConnectorInfo class.

    @@consts = AdaptorConnectorInfoConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorConnectorInfo", "adaptorConnectorInfo", "connector-info", VersionMeta::VERSION204C, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION204C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "part_number" => MoPropertyMeta.new("part_number", "partNumber", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "part_revision" => MoPropertyMeta.new("part_revision", "partRevision", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "present" => MoPropertyMeta.new("present", "present", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "supported" => MoPropertyMeta.new("supported", "supported", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "partNumber" => "part_number", 
        "partRevision" => "part_revision", 
        "present" => "present", 
        "rn" => "rn", 
        "status" => "status", 
        "supported" => "supported", 
        "type" => "type", 
        "vendor" => "vendor", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :part_number
    attr_reader :part_revision
    attr_reader :present
    attr_reader :status
    attr_reader :supported
    attr_reader :type
    attr_reader :vendor


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @part_number = nil
        @part_revision = nil
        @present = nil
        @status = nil
        @supported = nil
        @type = nil
        @vendor = nil

        super(class_id: "AdaptorConnectorInfo", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
