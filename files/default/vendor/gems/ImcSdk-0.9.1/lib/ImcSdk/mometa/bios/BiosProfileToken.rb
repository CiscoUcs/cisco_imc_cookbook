#This module contains the general information for BiosProfileToken ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosProfileTokenConsts
    
end


class BiosProfileToken < ManagedObject
    #This is BiosProfileToken class.

    @@consts = BiosProfileTokenConsts.new()
#    @@naming_props = set([u'name'])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosProfileToken", "biosProfileToken", "token-[name]", VersionMeta::VERSION301C, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("BiosProfileToken", "biosProfileToken", "token-[name]", VersionMeta::VERSION301C, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "actual_value" => MoPropertyMeta.new("actual_value", "actualValue", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "configured_value" => MoPropertyMeta.new("configured_value", "configuredValue", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION301C, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

        "modular" => {
            "actual_value" => MoPropertyMeta.new("actual_value", "actualValue", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "configured_value" => MoPropertyMeta.new("configured_value", "configuredValue", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION301C, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "actualValue" => "actual_value", 
        "childAction" => "child_action", 
        "configuredValue" => "configured_value", 
        "dn" => "dn", 
        "name" => "name", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "actualValue" => "actual_value", 
            "childAction" => "child_action", 
            "configuredValue" => "configured_value", 
            "dn" => "dn", 
            "name" => "name", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :name
    attr_reader :actual_value
    attr_reader :child_action
    attr_reader :configured_value
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,name: nil,  **kwargs)
        @dirty_mask = 0
        @name = name
        @actual_value = nil
        @child_action = nil
        @configured_value = nil
        @status = nil

        super(class_id: "BiosProfileToken", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
