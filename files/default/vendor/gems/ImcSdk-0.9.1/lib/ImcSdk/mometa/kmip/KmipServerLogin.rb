#This module contains the general information for KmipServerLogin ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class KmipServerLoginConsts
    ADMIN_ACTION_CLEAR = "clear"
end


class KmipServerLogin < ManagedObject
    #This is KmipServerLogin class.

    @@consts = KmipServerLoginConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("KmipServerLogin", "kmipServerLogin", "kmip-login", VersionMeta::VERSION302B, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "account_status" => MoPropertyMeta.new("account_status", "accountStatus", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x4, 0, 510, nil, ["clear"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION302B, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "pwd" => MoPropertyMeta.new("pwd", "pwd", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
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
        "name" => "name", 
        "pwd" => "pwd", 
        "rn" => "rn", 
        "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :account_status
    attr_accessor :admin_action
    attr_reader :child_action
    attr_accessor :name
    attr_accessor :pwd
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @account_status = nil
        @admin_action = nil
        @child_action = nil
        @name = nil
        @pwd = nil
        @status = nil

        super(class_id: "KmipServerLogin", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
