#This module contains the general information for AaaUser ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AaaUserConsts
    ACCOUNT_STATUS_ACTIVE = "active"
    ACCOUNT_STATUS_INACTIVE = "inactive"
    ADMIN_ACTION_CLEAR = "clear"
    PRIV_ = ""
    PRIV_ADMIN = "admin"
    PRIV_READ_ONLY = "read-only"
    PRIV_USER = "user"
end


class AaaUser < ManagedObject
    #This is AaaUser class.

    @@consts = AaaUserConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("AaaUser", "aaaUser", "user-[id]", VersionMeta::VERSION151F, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AaaUser", "aaaUser", "user-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "account_status" => MoPropertyMeta.new("account_status", "accountStatus", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["active", "inactive"], []), 
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION208D, MoPropertyMeta::READ_WRITE, 0x4, 0, 510, nil, ["clear"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x10, nil, nil, nil, [], ["1-15"]), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, %q{[a-zA-Z0-9\._\+\-]{0,16}}, [], []), 
        "priv" => MoPropertyMeta.new("priv", "priv", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "admin", "read-only", "user"], []), 
        "pwd" => MoPropertyMeta.new("pwd", "pwd", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, %q{[!""#%&'\(\)\*\+,\-\./:;<>@\[\\\]\^_`\{\|\}~a-zA-Z0-9]{0,20}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "account_status" => MoPropertyMeta.new("account_status", "accountStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["active", "inactive"], []), 
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 510, nil, ["clear"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x10, nil, nil, nil, [], ["1-15"]), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, %q{[a-zA-Z0-9\._\+\-]{0,16}}, [], []), 
            "priv" => MoPropertyMeta.new("priv", "priv", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "admin", "read-only", "user"], []), 
            "pwd" => MoPropertyMeta.new("pwd", "pwd", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, %q{[!""#%&'\(\)\*\+,\-\./:;<>@\[\\\]\^_`\{\|\}~a-zA-Z0-9]{0,20}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "accountStatus" => "account_status", 
        "adminAction" => "admin_action", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "id" => "id", 
        "name" => "name", 
        "priv" => "priv", 
        "pwd" => "pwd", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "accountStatus" => "account_status", 
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "id" => "id", 
            "name" => "name", 
            "priv" => "priv", 
            "pwd" => "pwd", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :account_status
    attr_accessor :admin_action
    attr_reader :child_action
    attr_accessor :name
    attr_accessor :priv
    attr_accessor :pwd
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @account_status = nil
        @admin_action = nil
        @child_action = nil
        @name = nil
        @priv = nil
        @pwd = nil
        @status = nil

        super(class_id: "AaaUser", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
