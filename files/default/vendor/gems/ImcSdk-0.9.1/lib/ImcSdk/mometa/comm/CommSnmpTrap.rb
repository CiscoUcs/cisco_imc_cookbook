#This module contains the general information for CommSnmpTrap ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommSnmpTrapConsts
    ADMIN_ACTION_CLEAR = "clear"
    ADMIN_STATE_DISABLED = "disabled"
    ADMIN_STATE_ENABLED = "enabled"
    NOTIFICATION_TYPE_INFORMS = "informs"
    NOTIFICATION_TYPE_TRAPS = "traps"
    VERSION_V1 = "v1"
    VERSION_V2C = "v2c"
    VERSION_V3 = "v3"
end


class CommSnmpTrap < ManagedObject
    #This is CommSnmpTrap class.

    @@consts = CommSnmpTrapConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("CommSnmpTrap", "commSnmpTrap", "snmp-trap-[id]", VersionMeta::VERSION151F, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("CommSnmpTrap", "commSnmpTrap", "snmp-trap-[id]", VersionMeta::VERSION2013E, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION208D, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear"], []), 
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "community" => MoPropertyMeta.new("community", "community", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[!#$%\)\*\+,\-\./:<=\[\]\^_\{\}~a-zA-Z0-9]{1,32}}, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "hostname" => MoPropertyMeta.new("hostname", "hostname", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x20, nil, nil, nil, [], ["1-15"]), 
        "notification_type" => MoPropertyMeta.new("notification_type", "notificationType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["informs", "traps"], []), 
        "port" => MoPropertyMeta.new("port", "port", "uint", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], ["1-65535"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, 0, 31, nil, [], []), 
        "version" => MoPropertyMeta.new("version", "version", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["v1", "v2c", "v3"], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear"], []), 
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "community" => MoPropertyMeta.new("community", "community", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[!#$%\)\*\+,\-\./:<=\[\]\^_\{\}~a-zA-Z0-9]{1,32}}, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "hostname" => MoPropertyMeta.new("hostname", "hostname", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x20, nil, nil, nil, [], ["1-15"]), 
            "notification_type" => MoPropertyMeta.new("notification_type", "notificationType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["informs", "traps"], []), 
            "port" => MoPropertyMeta.new("port", "port", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], ["1-65535"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, 0, 31, nil, [], []), 
            "version" => MoPropertyMeta.new("version", "version", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["v1", "v2c", "v3"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "community" => "community", 
        "dn" => "dn", 
        "hostname" => "hostname", 
        "id" => "id", 
        "notificationType" => "notification_type", 
        "port" => "port", 
        "rn" => "rn", 
        "status" => "status", 
        "user" => "user", 
        "version" => "version", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "community" => "community", 
            "dn" => "dn", 
            "hostname" => "hostname", 
            "id" => "id", 
            "notificationType" => "notification_type", 
            "port" => "port", 
            "rn" => "rn", 
            "status" => "status", 
            "user" => "user", 
            "version" => "version", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :admin_action
    attr_accessor :admin_state
    attr_reader :child_action
    attr_reader :community
    attr_accessor :hostname
    attr_accessor :notification_type
    attr_accessor :port
    attr_accessor :status
    attr_accessor :user
    attr_accessor :version


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @admin_action = nil
        @admin_state = nil
        @child_action = nil
        @community = nil
        @hostname = nil
        @notification_type = nil
        @port = nil
        @status = nil
        @user = nil
        @version = nil

        super(class_id: "CommSnmpTrap", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
