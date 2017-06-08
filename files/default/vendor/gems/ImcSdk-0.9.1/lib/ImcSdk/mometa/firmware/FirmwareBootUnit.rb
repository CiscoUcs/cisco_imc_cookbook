#This module contains the general information for FirmwareBootUnit ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class FirmwareBootUnitConsts
    ADMIN_STATE_TRIGGER = "trigger"
    ADMIN_STATE_TRIGGERED = "triggered"
    IGNORE_COMP_CHECK_FALSE = "false"
    IGNORE_COMP_CHECK_NO = "no"
    IGNORE_COMP_CHECK_TRUE = "true"
    IGNORE_COMP_CHECK_YES = "yes"
    IMAGE_BACKUP = "backup"
    IMAGE_RUNNING = "running"
    OPER_STATE_ACTIVATING = "activating"
    OPER_STATE_BAD_IMAGE = "bad-image"
    OPER_STATE_FAILED = "failed"
    OPER_STATE_PENDING_NEXT_BOOT = "pending-next-boot"
    OPER_STATE_READY = "ready"
    OPER_STATE_REBOOTING = "rebooting"
    OPER_STATE_SCHEDULED = "scheduled"
    OPER_STATE_SET_STARTUP = "set-startup"
    OPER_STATE_THROTTLED = "throttled"
    OPER_STATE_UPDATING = "updating"
    RESET_ON_ACTIVATE_NO = "No"
    RESET_ON_ACTIVATE_YES = "Yes"
    RESET_ON_ACTIVATE_FALSE = "false"
    _RESET_ON_ACTIVATE_NO = "no"
    RESET_ON_ACTIVATE_TRUE = "true"
    _RESET_ON_ACTIVATE_YES = "yes"
end


class FirmwareBootUnit < ManagedObject
    #This is FirmwareBootUnit class.

    @@consts = FirmwareBootUnitConsts.new()
#    @@naming_props = set([u'type'])

    @@mo_meta = {
        "classic" => MoMeta.new("FirmwareBootUnit", "firmwareBootUnit", "bootunit-[type]", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("FirmwareBootUnit", "firmwareBootUnit", "bootunit-[type]", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "ignore_comp_check" => MoPropertyMeta.new("ignore_comp_check", "ignoreCompCheck", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["false", "no", "true", "yes"], []), 
        "image" => MoPropertyMeta.new("image", "image", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["backup", "running"], []), 
        "oper_state" => MoPropertyMeta.new("oper_state", "operState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["activating", "bad-image", "failed", "pending-next-boot", "ready", "rebooting", "scheduled", "set-startup", "throttled", "updating"], []), 
        "reset_on_activate" => MoPropertyMeta.new("reset_on_activate", "resetOnActivate", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
        "version" => MoPropertyMeta.new("version", "version", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "ignore_comp_check" => MoPropertyMeta.new("ignore_comp_check", "ignoreCompCheck", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["false", "no", "true", "yes"], []), 
            "image" => MoPropertyMeta.new("image", "image", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["backup", "running"], []), 
            "oper_state" => MoPropertyMeta.new("oper_state", "operState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["activating", "bad-image", "failed", "pending-next-boot", "ready", "rebooting", "scheduled", "set-startup", "throttled", "updating"], []), 
            "reset_on_activate" => MoPropertyMeta.new("reset_on_activate", "resetOnActivate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
            "version" => MoPropertyMeta.new("version", "version", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "description" => "description", 
        "dn" => "dn", 
        "ignoreCompCheck" => "ignore_comp_check", 
        "image" => "image", 
        "operState" => "oper_state", 
        "resetOnActivate" => "reset_on_activate", 
        "rn" => "rn", 
        "status" => "status", 
        "type" => "type", 
        "version" => "version", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "description" => "description", 
            "dn" => "dn", 
            "ignoreCompCheck" => "ignore_comp_check", 
            "image" => "image", 
            "operState" => "oper_state", 
            "resetOnActivate" => "reset_on_activate", 
            "rn" => "rn", 
            "status" => "status", 
            "type" => "type", 
            "version" => "version", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :type
    attr_accessor :admin_state
    attr_reader :child_action
    attr_reader :description
    attr_reader :ignore_comp_check
    attr_accessor :image
    attr_reader :oper_state
    attr_accessor :reset_on_activate
    attr_accessor :status
    attr_reader :version


    def initialize(parent_mo_or_dn: nil,type: nil,  **kwargs)
        @dirty_mask = 0
        @type = type
        @admin_state = nil
        @child_action = nil
        @description = nil
        @ignore_comp_check = nil
        @image = nil
        @oper_state = nil
        @reset_on_activate = nil
        @status = nil
        @version = nil

        super(class_id: "FirmwareBootUnit", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
