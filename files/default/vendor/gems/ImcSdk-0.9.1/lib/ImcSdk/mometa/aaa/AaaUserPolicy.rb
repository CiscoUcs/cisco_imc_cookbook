#This module contains the general information for AaaUserPolicy ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AaaUserPolicyConsts
    
end


class AaaUserPolicy < ManagedObject
    #This is AaaUserPolicy class.

    @@consts = AaaUserPolicyConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AaaUserPolicy", "aaaUserPolicy", "policy", VersionMeta::VERSION209C, "InputOutput", 0x1f, [], ["admin", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AaaUserPolicy", "aaaUserPolicy", "policy", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION209C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "password_policy_rules" => MoPropertyMeta.new("password_policy_rules", "passwordPolicyRules", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 0, 2500, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "user_password_policy" => MoPropertyMeta.new("user_password_policy", "userPasswordPolicy", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "password_policy_rules" => MoPropertyMeta.new("password_policy_rules", "passwordPolicyRules", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 2500, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "user_password_policy" => MoPropertyMeta.new("user_password_policy", "userPasswordPolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "passwordPolicyRules" => "password_policy_rules", 
        "rn" => "rn", 
        "status" => "status", 
        "userPasswordPolicy" => "user_password_policy", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "passwordPolicyRules" => "password_policy_rules", 
            "rn" => "rn", 
            "status" => "status", 
            "userPasswordPolicy" => "user_password_policy", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :password_policy_rules
    attr_accessor :status
    attr_accessor :user_password_policy


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @password_policy_rules = nil
        @status = nil
        @user_password_policy = nil

        super(class_id: "AaaUserPolicy", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
