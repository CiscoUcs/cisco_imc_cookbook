#This module contains the general information for AdaptorFcPortFLogiProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorFcPortFLogiProfileConsts
    RETRIES_INFINITE = "INFINITE"
end


class AdaptorFcPortFLogiProfile < ManagedObject
    #This is AdaptorFcPortFLogiProfile class.

    @@consts = AdaptorFcPortFLogiProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorFcPortFLogiProfile", "adaptorFcPortFLogiProfile", "fc-port-flogi", VersionMeta::VERSION151F, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorFcPortFLogiProfile", "adaptorFcPortFLogiProfile", "fc-port-flogi", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "retries" => MoPropertyMeta.new("retries", "retries", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["INFINITE"], ["0-4294967295"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "timeout" => MoPropertyMeta.new("timeout", "timeout", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["1000-255000"]), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "retries" => MoPropertyMeta.new("retries", "retries", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["INFINITE"], ["0-4294967295"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "timeout" => MoPropertyMeta.new("timeout", "timeout", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["1000-255000"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "retries" => "retries", 
        "rn" => "rn", 
        "status" => "status", 
        "timeout" => "timeout", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "retries" => "retries", 
            "rn" => "rn", 
            "status" => "status", 
            "timeout" => "timeout", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :retries
    attr_accessor :status
    attr_accessor :timeout


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @retries = nil
        @status = nil
        @timeout = nil

        super(class_id: "AdaptorFcPortFLogiProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
