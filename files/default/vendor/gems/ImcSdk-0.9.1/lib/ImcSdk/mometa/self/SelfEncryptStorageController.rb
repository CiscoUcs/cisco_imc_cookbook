#This module contains the general information for SelfEncryptStorageController ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class SelfEncryptStorageControllerConsts
    ADMIN_ACTION_DISABLE_SELF_ENCRYPT = "disable-self-encrypt"
    ADMIN_ACTION_ENABLE_SELF_ENCRYPT = "enable-self-encrypt"
    ADMIN_ACTION_MODIFY_SELF_ENCRYPT = "modify-self-encrypt"
    ADMIN_ACTION_UNLOCK_SECURED_DRIVES = "unlock-secured-drives"
    KEY_MANAGEMENT_LOCAL = "local"
    KEY_MANAGEMENT_REMOTE = "remote"
end


class SelfEncryptStorageController < ManagedObject
    #This is SelfEncryptStorageController class.

    @@consts = SelfEncryptStorageControllerConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("SelfEncryptStorageController", "selfEncryptStorageController", "ctr-self-encrypt", VersionMeta::VERSION209C, "InputOutput", 0x1ff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["disable-self-encrypt", "enable-self-encrypt", "modify-self-encrypt", "unlock-secured-drives"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION209C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "existing_security_key" => MoPropertyMeta.new("existing_security_key", "existingSecurityKey", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x8, 1, 33, nil, [], []), 
        "key_id" => MoPropertyMeta.new("key_id", "keyId", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x10, 1, 256, nil, [], []), 
        "key_management" => MoPropertyMeta.new("key_management", "keyManagement", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["local", "remote"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "security_key" => MoPropertyMeta.new("security_key", "securityKey", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x80, 1, 33, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
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
        "existingSecurityKey" => "existing_security_key", 
        "keyId" => "key_id", 
        "keyManagement" => "key_management", 
        "rn" => "rn", 
        "securityKey" => "security_key", 
        "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_action
    attr_reader :child_action
    attr_accessor :existing_security_key
    attr_accessor :key_id
    attr_accessor :key_management
    attr_accessor :security_key
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_action = nil
        @child_action = nil
        @existing_security_key = nil
        @key_id = nil
        @key_management = nil
        @security_key = nil
        @status = nil

        super(class_id: "SelfEncryptStorageController", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
