#This module contains the general information for CommSnmpUser ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommSnmpUserConsts
    ADMIN_ACTION_CLEAR = "clear"
    AUTH_ = ""
    AUTH_MD5 = "MD5"
    AUTH_SHA = "SHA"
    PRIVACY_ = ""
    PRIVACY_AES = "AES"
    PRIVACY_DES = "DES"
    SECURITY_LEVEL_ = ""
    SECURITY_LEVEL_AUTHNOPRIV = "authnopriv"
    SECURITY_LEVEL_AUTHPRIV = "authpriv"
    SECURITY_LEVEL_NOAUTHNOPRIV = "noauthnopriv"
    PRIVACY_SHA = "SHA"
end


class CommSnmpUser < ManagedObject
    #This is CommSnmpUser class.

    @@consts = CommSnmpUserConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("CommSnmpUser", "commSnmpUser", "snmpv3-user-[id]", VersionMeta::VERSION151F, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("CommSnmpUser", "commSnmpUser", "snmpv3-user-[id]", VersionMeta::VERSION2013E, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION208D, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear"], []), 
        "auth" => MoPropertyMeta.new("auth", "auth", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["", "MD5", "SHA"], []), 
        "auth_pwd" => MoPropertyMeta.new("auth_pwd", "authPwd", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{(.{8,64})?}, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x20, nil, nil, nil, [], ["1-15"]), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, 0, 31, nil, [], []), 
        "privacy" => MoPropertyMeta.new("privacy", "privacy", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "AES", "DES"], []), 
        "privacy_pwd" => MoPropertyMeta.new("privacy_pwd", "privacyPwd", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, %q{(.{8,64})?}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, nil, [], []), 
        "security_level" => MoPropertyMeta.new("security_level", "securityLevel", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "authnopriv", "authpriv", "noauthnopriv"], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear"], []), 
            "auth" => MoPropertyMeta.new("auth", "auth", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["", "MD5", "SHA"], []), 
            "auth_pwd" => MoPropertyMeta.new("auth_pwd", "authPwd", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{(.{8,64})?}, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x20, nil, nil, nil, [], ["1-15"]), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 31, nil, [], []), 
            "privacy" => MoPropertyMeta.new("privacy", "privacy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "AES", "DES", "SHA"], []), 
            "privacy_pwd" => MoPropertyMeta.new("privacy_pwd", "privacyPwd", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, %q{(.{8,64})?}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, nil, [], []), 
            "security_level" => MoPropertyMeta.new("security_level", "securityLevel", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "authnopriv", "authpriv", "noauthnopriv"], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "auth" => "auth", 
        "authPwd" => "auth_pwd", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "id" => "id", 
        "name" => "name", 
        "privacy" => "privacy", 
        "privacyPwd" => "privacy_pwd", 
        "rn" => "rn", 
        "securityLevel" => "security_level", 
        "status" => "status", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "auth" => "auth", 
            "authPwd" => "auth_pwd", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "id" => "id", 
            "name" => "name", 
            "privacy" => "privacy", 
            "privacyPwd" => "privacy_pwd", 
            "rn" => "rn", 
            "securityLevel" => "security_level", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :admin_action
    attr_accessor :auth
    attr_accessor :auth_pwd
    attr_reader :child_action
    attr_accessor :name
    attr_accessor :privacy
    attr_accessor :privacy_pwd
    attr_accessor :security_level
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @admin_action = nil
        @auth = nil
        @auth_pwd = nil
        @child_action = nil
        @name = nil
        @privacy = nil
        @privacy_pwd = nil
        @security_level = nil
        @status = nil

        super(class_id: "CommSnmpUser", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
