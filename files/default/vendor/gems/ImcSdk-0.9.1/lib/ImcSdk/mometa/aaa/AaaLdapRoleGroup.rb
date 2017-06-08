#This module contains the general information for AaaLdapRoleGroup ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AaaLdapRoleGroupConsts
    ADMIN_ACTION_CLEAR = "clear"
    ROLE_ = ""
    ROLE_ADMIN = "admin"
    ROLE_READ_ONLY = "read-only"
    ROLE_USER = "user"
end


class AaaLdapRoleGroup < ManagedObject
    #This is AaaLdapRoleGroup class.

    @@consts = AaaLdapRoleGroupConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("AaaLdapRoleGroup", "aaaLdapRoleGroup", "rolegroup-[id]", VersionMeta::VERSION151F, "InputOutput", 0x1ff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AaaLdapRoleGroup", "aaaLdapRoleGroup", "rolegroup-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x1ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "domain" => MoPropertyMeta.new("domain", "domain", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 1, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x10, nil, nil, nil, [], ["1-28"]), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 127, %q{([^+\-][a-zA-Z0-9=!#$%()*+,-.:;@ _{|}~?&]*){0,127}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "role" => MoPropertyMeta.new("role", "role", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "admin", "read-only", "user"], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "domain" => MoPropertyMeta.new("domain", "domain", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 1, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x10, nil, nil, nil, [], ["1-28"]), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 127, %q{([^+\-][a-zA-Z0-9=!#$%()*+,-.:;@ _{|}~?&]*){0,127}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
            "role" => MoPropertyMeta.new("role", "role", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "admin", "read-only", "user"], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "domain" => "domain", 
        "id" => "id", 
        "name" => "name", 
        "rn" => "rn", 
        "role" => "role", 
        "status" => "status", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "domain" => "domain", 
            "id" => "id", 
            "name" => "name", 
            "rn" => "rn", 
            "role" => "role", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :admin_action
    attr_reader :child_action
    attr_accessor :domain
    attr_accessor :name
    attr_accessor :role
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @admin_action = nil
        @child_action = nil
        @domain = nil
        @name = nil
        @role = nil
        @status = nil

        super(class_id: "AaaLdapRoleGroup", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
