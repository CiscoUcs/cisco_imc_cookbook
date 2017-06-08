#This module contains the general information for SysdebugMEpLog ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class SysdebugMEpLogConsts
    ADMIN_STATE_BACKUP = "backup"
    ADMIN_STATE_CLEAR = "clear"
    ADMIN_STATE_POLICY = "policy"
    CAPACITY_AVAILABLE = "available"
    CAPACITY_FULL = "full"
    CAPACITY_LOW = "low"
    CAPACITY_UNKNOWN = "unknown"
    CAPACITY_VERY_LOW = "very-low"
    TYPE_OBFL = "OBFL"
    TYPE_SEL = "SEL"
    TYPE_SYSLOG = "Syslog"
end


class SysdebugMEpLog < ManagedObject
    #This is SysdebugMEpLog class.

    @@consts = SysdebugMEpLogConsts.new()
#    @@naming_props = set([u'type', u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("SysdebugMEpLog", "sysdebugMEpLog", "log-[type]-[id]", VersionMeta::VERSION151F, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("SysdebugMEpLog", "sysdebugMEpLog", "log-[type]-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["backup", "clear", "policy"], []), 
        "capacity" => MoPropertyMeta.new("capacity", "capacity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["available", "full", "low", "unknown", "very-low"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], ["0-8"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x20, nil, nil, nil, ["OBFL", "SEL", "Syslog"], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["backup", "clear", "policy"], []), 
            "capacity" => MoPropertyMeta.new("capacity", "capacity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["available", "full", "low", "unknown", "very-low"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], ["0-8"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x20, nil, nil, nil, ["OBFL", "SEL", "Syslog"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "capacity" => "capacity", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "id" => "id", 
        "rn" => "rn", 
        "status" => "status", 
        "type" => "type", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "capacity" => "capacity", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "id" => "id", 
            "rn" => "rn", 
            "status" => "status", 
            "type" => "type", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :type
    attr_reader :id
    attr_accessor :admin_state
    attr_reader :capacity
    attr_reader :child_action
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,type: nil, id: nil,  **kwargs)
        @dirty_mask = 0
        @type = type
        @id = id
        @admin_state = nil
        @capacity = nil
        @child_action = nil
        @status = nil

        super(class_id: "SysdebugMEpLog", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
