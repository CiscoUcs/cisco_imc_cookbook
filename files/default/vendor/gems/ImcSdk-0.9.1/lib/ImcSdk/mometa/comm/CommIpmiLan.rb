#This module contains the general information for CommIpmiLan ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommIpmiLanConsts
    PRIV_ADMIN = "admin"
    PRIV_READ_ONLY = "read-only"
    PRIV_USER = "user"
end


class CommIpmiLan < ManagedObject
    #This is CommIpmiLan class.

    @@consts = CommIpmiLanConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("CommIpmiLan", "commIpmiLan", "ipmi-lan-svc", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("CommIpmiLan", "commIpmiLan", "ipmi-lan-svc", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "key" => MoPropertyMeta.new("key", "key", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{[a-fA-F0-9]{40}}, [], []), 
        "priv" => MoPropertyMeta.new("priv", "priv", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["admin", "read-only", "user"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "key" => MoPropertyMeta.new("key", "key", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{[a-fA-F0-9]{40}}, [], []), 
            "priv" => MoPropertyMeta.new("priv", "priv", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["admin", "read-only", "user"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "key" => "key", 
        "priv" => "priv", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "key" => "key", 
            "priv" => "priv", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_reader :child_action
    attr_accessor :key
    attr_accessor :priv
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @child_action = nil
        @key = nil
        @priv = nil
        @status = nil

        super(class_id: "CommIpmiLan", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
