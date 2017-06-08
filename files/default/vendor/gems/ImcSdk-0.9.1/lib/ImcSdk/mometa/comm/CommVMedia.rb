#This module contains the general information for CommVMedia ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommVMediaConsts
    ADMIN_ACTION_DELETE_ALL_SAVED_MAPPINGS = "delete-all-saved-mappings"
end


class CommVMedia < ManagedObject
    #This is CommVMedia class.

    @@consts = CommVMediaConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("CommVMedia", "commVMedia", "vmedia-svc", VersionMeta::VERSION151F, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("CommVMedia", "commVMedia", "vmedia-svc", VersionMeta::VERSION2013E, "InputOutput", 0x1ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "active_sessions" => MoPropertyMeta.new("active_sessions", "activeSessions", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["delete-all-saved-mappings"], []), 
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "encryption_state" => MoPropertyMeta.new("encryption_state", "encryptionState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "low_power_usb_state" => MoPropertyMeta.new("low_power_usb_state", "lowPowerUsbState", "string", VersionMeta::VERSION208D, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        },

        "modular" => {
            "active_sessions" => MoPropertyMeta.new("active_sessions", "activeSessions", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["delete-all-saved-mappings"], []), 
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "encryption_state" => MoPropertyMeta.new("encryption_state", "encryptionState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "low_power_usb" => MoPropertyMeta.new("low_power_usb", "lowPowerUsb", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "max_sessions" => MoPropertyMeta.new("max_sessions", "maxSessions", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, [], ["1-4"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "activeSessions" => "active_sessions", 
        "adminAction" => "admin_action", 
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "encryptionState" => "encryption_state", 
        "rn" => "rn", 
        "status" => "status", 
        "lowPowerUsbState" => "low_power_usb_state", 
        },

        "modular" => {
            "activeSessions" => "active_sessions", 
            "adminAction" => "admin_action", 
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "encryptionState" => "encryption_state", 
            "rn" => "rn", 
            "status" => "status", 
            "lowPowerUsb" => "low_power_usb", 
            "maxSessions" => "max_sessions", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :active_sessions
    attr_accessor :admin_action
    attr_accessor :admin_state
    attr_reader :child_action
    attr_accessor :encryption_state
    attr_accessor :status
    attr_accessor :low_power_usb_state


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @active_sessions = nil
        @admin_action = nil
        @admin_state = nil
        @child_action = nil
        @encryption_state = nil
        @status = nil
        @low_power_usb_state = nil
        @low_power_usb = nil
        @max_sessions = nil

        super(class_id: "CommVMedia", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
