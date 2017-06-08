#This module contains the general information for IpBlocking ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class IpBlockingConsts
    
end


class IpBlocking < ManagedObject
    #This is IpBlocking class.

    @@consts = IpBlockingConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("IpBlocking", "ipBlocking", "ip-block", VersionMeta::VERSION151F, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("IpBlocking", "ipBlocking", "ip-block", VersionMeta::VERSION2013E, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "enable" => MoPropertyMeta.new("enable", "enable", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "fail_count" => MoPropertyMeta.new("fail_count", "failCount", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["3-10"]), 
        "fail_window" => MoPropertyMeta.new("fail_window", "failWindow", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["60-120"]), 
        "penalty_time" => MoPropertyMeta.new("penalty_time", "penaltyTime", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["300-900"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "enable" => MoPropertyMeta.new("enable", "enable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "fail_count" => MoPropertyMeta.new("fail_count", "failCount", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["3-10"]), 
            "fail_window" => MoPropertyMeta.new("fail_window", "failWindow", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["60-120"]), 
            "penalty_time" => MoPropertyMeta.new("penalty_time", "penaltyTime", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["300-900"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
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
        "enable" => "enable", 
        "failCount" => "fail_count", 
        "failWindow" => "fail_window", 
        "penaltyTime" => "penalty_time", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "description" => "description", 
            "dn" => "dn", 
            "enable" => "enable", 
            "failCount" => "fail_count", 
            "failWindow" => "fail_window", 
            "penaltyTime" => "penalty_time", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :description
    attr_accessor :enable
    attr_accessor :fail_count
    attr_accessor :fail_window
    attr_accessor :penalty_time
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @description = nil
        @enable = nil
        @fail_count = nil
        @fail_window = nil
        @penalty_time = nil
        @status = nil

        super(class_id: "IpBlocking", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
