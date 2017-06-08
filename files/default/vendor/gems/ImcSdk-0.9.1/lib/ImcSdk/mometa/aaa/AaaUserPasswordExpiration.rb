#This module contains the general information for AaaUserPasswordExpiration ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AaaUserPasswordExpirationConsts
    ADMIN_ACTION_RESTORE_DEFAULT = "restore-default"
end


class AaaUserPasswordExpiration < ManagedObject
    #This is AaaUserPasswordExpiration class.

    @@consts = AaaUserPasswordExpirationConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AaaUserPasswordExpiration", "aaaUserPasswordExpiration", "password-expiration", VersionMeta::VERSION301C, "InputOutput", 0x1ff, [], ["admin", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AaaUserPasswordExpiration", "aaaUserPasswordExpiration", "password-expiration", VersionMeta::VERSION301C, "InputOutput", 0x1ff, [], ["admin", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["restore-default"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "password_expiry_duration" => MoPropertyMeta.new("password_expiry_duration", "passwordExpiryDuration", "uint", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["0-3650"]), 
        "password_grace_period" => MoPropertyMeta.new("password_grace_period", "passwordGracePeriod", "uint", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["0-5"]), 
        "password_history" => MoPropertyMeta.new("password_history", "passwordHistory", "uint", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["0-5"]), 
        "password_notification_period" => MoPropertyMeta.new("password_notification_period", "passwordNotificationPeriod", "uint", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["0-15"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["restore-default"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "password_expiry_duration" => MoPropertyMeta.new("password_expiry_duration", "passwordExpiryDuration", "uint", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["0-3650"]), 
            "password_grace_period" => MoPropertyMeta.new("password_grace_period", "passwordGracePeriod", "uint", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["0-5"]), 
            "password_history" => MoPropertyMeta.new("password_history", "passwordHistory", "uint", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["0-5"]), 
            "password_notification_period" => MoPropertyMeta.new("password_notification_period", "passwordNotificationPeriod", "uint", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["0-15"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
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
        "passwordExpiryDuration" => "password_expiry_duration", 
        "passwordGracePeriod" => "password_grace_period", 
        "passwordHistory" => "password_history", 
        "passwordNotificationPeriod" => "password_notification_period", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "passwordExpiryDuration" => "password_expiry_duration", 
            "passwordGracePeriod" => "password_grace_period", 
            "passwordHistory" => "password_history", 
            "passwordNotificationPeriod" => "password_notification_period", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_action
    attr_reader :child_action
    attr_accessor :password_expiry_duration
    attr_accessor :password_grace_period
    attr_accessor :password_history
    attr_accessor :password_notification_period
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_action = nil
        @child_action = nil
        @password_expiry_duration = nil
        @password_grace_period = nil
        @password_history = nil
        @password_notification_period = nil
        @status = nil

        super(class_id: "AaaUserPasswordExpiration", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
