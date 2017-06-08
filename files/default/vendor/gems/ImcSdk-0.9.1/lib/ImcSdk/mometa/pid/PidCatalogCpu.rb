#This module contains the general information for PidCatalogCpu ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class PidCatalogCpuConsts
    
end


class PidCatalogCpu < ManagedObject
    #This is PidCatalogCpu class.

    @@consts = PidCatalogCpuConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("PidCatalogCpu", "pidCatalogCpu", "pid-cpu-[id]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("PidCatalogCpu", "pidCatalogCpu", "pid-cpu-[id]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "currentspeed" => MoPropertyMeta.new("currentspeed", "currentspeed", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "oper_state" => MoPropertyMeta.new("oper_state", "operState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pid" => MoPropertyMeta.new("pid", "pid", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "signature" => MoPropertyMeta.new("signature", "signature", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "socketdesignation" => MoPropertyMeta.new("socketdesignation", "socketdesignation", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "currentspeed" => MoPropertyMeta.new("currentspeed", "currentspeed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "oper_state" => MoPropertyMeta.new("oper_state", "operState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pid" => MoPropertyMeta.new("pid", "pid", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "signature" => MoPropertyMeta.new("signature", "signature", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "socketdesignation" => MoPropertyMeta.new("socketdesignation", "socketdesignation", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "currentspeed" => "currentspeed", 
        "description" => "description", 
        "dn" => "dn", 
        "id" => "id", 
        "model" => "model", 
        "operState" => "oper_state", 
        "pid" => "pid", 
        "rn" => "rn", 
        "signature" => "signature", 
        "socketdesignation" => "socketdesignation", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "currentspeed" => "currentspeed", 
            "description" => "description", 
            "dn" => "dn", 
            "id" => "id", 
            "model" => "model", 
            "operState" => "oper_state", 
            "pid" => "pid", 
            "rn" => "rn", 
            "signature" => "signature", 
            "socketdesignation" => "socketdesignation", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_reader :child_action
    attr_reader :currentspeed
    attr_reader :description
    attr_reader :model
    attr_reader :oper_state
    attr_reader :pid
    attr_reader :signature
    attr_reader :socketdesignation
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @child_action = nil
        @currentspeed = nil
        @description = nil
        @model = nil
        @oper_state = nil
        @pid = nil
        @signature = nil
        @socketdesignation = nil
        @status = nil

        super(class_id: "PidCatalogCpu", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
