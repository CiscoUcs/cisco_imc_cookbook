#This module contains the general information for LdapCACertificate ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class LdapCACertificateConsts
    ADMIN_ACTION_DELETE_CA_CERTIFICATE = "delete-ca-certificate"
    ADMIN_ACTION_TEST_LDAP_BINDING = "test-ldap-binding"
end


class LdapCACertificate < ManagedObject
    #This is LdapCACertificate class.

    @@consts = LdapCACertificateConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("LdapCACertificate", "ldapCACertificate", "ldap-ca-cert", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("LdapCACertificate", "ldapCACertificate", "ldap-ca-cert", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["delete-ca-certificate", "test-ldap-binding"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "pwd" => MoPropertyMeta.new("pwd", "pwd", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 510, nil, [], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["delete-ca-certificate", "test-ldap-binding"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "pwd" => MoPropertyMeta.new("pwd", "pwd", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 256, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 256, nil, [], []), 
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
        "pwd" => "pwd", 
        "rn" => "rn", 
        "status" => "status", 
        "user" => "user", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "pwd" => "pwd", 
            "rn" => "rn", 
            "status" => "status", 
            "user" => "user", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_action
    attr_reader :child_action
    attr_accessor :pwd
    attr_accessor :status
    attr_accessor :user


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_action = nil
        @child_action = nil
        @pwd = nil
        @status = nil
        @user = nil

        super(class_id: "LdapCACertificate", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
