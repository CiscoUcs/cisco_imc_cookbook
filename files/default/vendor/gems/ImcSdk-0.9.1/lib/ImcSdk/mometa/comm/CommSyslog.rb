#This module contains the general information for CommSyslog ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommSyslogConsts
    ADMIN_STATE_DISABLED = "disabled"
    ADMIN_STATE_ENABLED = "enabled"
    LOCAL_SEVERITY_ALERT = "alert"
    LOCAL_SEVERITY_CRITICAL = "critical"
    LOCAL_SEVERITY_DEBUG = "debug"
    LOCAL_SEVERITY_EMERGENCY = "emergency"
    LOCAL_SEVERITY_ERROR = "error"
    LOCAL_SEVERITY_INFORMATIONAL = "informational"
    LOCAL_SEVERITY_NOTICE = "notice"
    LOCAL_SEVERITY_WARNING = "warning"
    PROTO_ALL = "all"
    PROTO_NONE = "none"
    PROTO_TCP = "tcp"
    PROTO_UDP = "udp"
    REMOTE_SEVERITY_ALERT = "alert"
    REMOTE_SEVERITY_CRITICAL = "critical"
    REMOTE_SEVERITY_DEBUG = "debug"
    REMOTE_SEVERITY_EMERGENCY = "emergency"
    REMOTE_SEVERITY_ERROR = "error"
    REMOTE_SEVERITY_INFORMATIONAL = "informational"
    REMOTE_SEVERITY_NOTICE = "notice"
    REMOTE_SEVERITY_WARNING = "warning"
end


class CommSyslog < ManagedObject
    #This is CommSyslog class.

    @@consts = CommSyslogConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("CommSyslog", "commSyslog", "syslog", VersionMeta::VERSION151F, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("CommSyslog", "commSyslog", "syslog", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["disabled", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{0,256}}, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "local_severity" => MoPropertyMeta.new("local_severity", "localSeverity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["alert", "critical", "debug", "emergency", "error", "informational", "notice", "warning"], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,16}}, [], []), 
        "port" => MoPropertyMeta.new("port", "port", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], ["0-65535"]), 
        "proto" => MoPropertyMeta.new("proto", "proto", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["all", "none", "tcp", "udp"], []), 
        "remote_severity" => MoPropertyMeta.new("remote_severity", "remoteSeverity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["alert", "critical", "debug", "emergency", "error", "informational", "notice", "warning"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["disabled", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{0,256}}, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "local_severity" => MoPropertyMeta.new("local_severity", "localSeverity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["alert", "critical", "debug", "emergency", "error", "informational", "notice", "warning"], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,16}}, [], []), 
            "port" => MoPropertyMeta.new("port", "port", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], ["0-65535"]), 
            "proto" => MoPropertyMeta.new("proto", "proto", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["all", "none", "tcp", "udp"], []), 
            "remote_severity" => MoPropertyMeta.new("remote_severity", "remoteSeverity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["alert", "critical", "debug", "emergency", "error", "informational", "notice", "warning"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "descr" => "descr", 
        "dn" => "dn", 
        "localSeverity" => "local_severity", 
        "name" => "name", 
        "port" => "port", 
        "proto" => "proto", 
        "remoteSeverity" => "remote_severity", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "descr" => "descr", 
            "dn" => "dn", 
            "localSeverity" => "local_severity", 
            "name" => "name", 
            "port" => "port", 
            "proto" => "proto", 
            "remoteSeverity" => "remote_severity", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :admin_state
    attr_reader :child_action
    attr_reader :descr
    attr_accessor :local_severity
    attr_reader :name
    attr_reader :port
    attr_reader :proto
    attr_accessor :remote_severity
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @child_action = nil
        @descr = nil
        @local_severity = nil
        @name = nil
        @port = nil
        @proto = nil
        @remote_severity = nil
        @status = nil

        super(class_id: "CommSyslog", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
