#This module contains the general information for CommSnmp ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommSnmpConsts
    ADMIN_STATE_DISABLED = "disabled"
    ADMIN_STATE_ENABLED = "enabled"
    COM2_SEC_NONE = "None"
    COM2_SEC_DISABLED = "disabled"
    COM2_SEC_FULL = "full"
    COM2_SEC_LIMITED = "limited"
    PROTO_ALL = "all"
    PROTO_NONE = "none"
    PROTO_TCP = "tcp"
    PROTO_UDP = "udp"
end


class CommSnmp < ManagedObject
    #This is CommSnmp class.

    @@consts = CommSnmpConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("CommSnmp", "commSnmp", "snmp-svc", VersionMeta::VERSION151F, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("CommSnmp", "commSnmp", "snmp-svc", VersionMeta::VERSION2013E, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "com2_sec" => MoPropertyMeta.new("com2_sec", "com2Sec", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["None", "disabled", "full", "limited"], []), 
        "community" => MoPropertyMeta.new("community", "community", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{[!#$%\(\)\*\+,\-\./:<=\[\]\^_\{\}~a-zA-Z0-9]{0,18}}, [], []), 
        "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{0,256}}, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "engine_id" => MoPropertyMeta.new("engine_id", "engineId", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 0, 255, nil, [], []), 
        "engine_id_key" => MoPropertyMeta.new("engine_id_key", "engineIdKey", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 27, %q{[^#!&]{0,27}}, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,16}}, [], []), 
        "port" => MoPropertyMeta.new("port", "port", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["1-65535"]), 
        "proto" => MoPropertyMeta.new("proto", "proto", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["all", "none", "tcp", "udp"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "sys_contact" => MoPropertyMeta.new("sys_contact", "sysContact", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, 0, 64, nil, [], []), 
        "sys_location" => MoPropertyMeta.new("sys_location", "sysLocation", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, 0, 64, nil, [], []), 
        "trap_community" => MoPropertyMeta.new("trap_community", "trapCommunity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, %q{[!#$%\(\)\*\+,\-\./:<=\[\]\^_\{\}~a-zA-Z0-9]{0,18}}, [], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "com2_sec" => MoPropertyMeta.new("com2_sec", "com2Sec", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["None", "disabled", "full", "limited"], []), 
            "community" => MoPropertyMeta.new("community", "community", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{[!#$%\(\)\*\+,\-\./:<=\[\]\^_\{\}~a-zA-Z0-9]{0,18}}, [], []), 
            "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{0,256}}, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "engine_id" => MoPropertyMeta.new("engine_id", "engineId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 255, nil, [], []), 
            "engine_id_key" => MoPropertyMeta.new("engine_id_key", "engineIdKey", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 27, %q{[^#!&]{0,27}}, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,16}}, [], []), 
            "port" => MoPropertyMeta.new("port", "port", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["1-65535"]), 
            "proto" => MoPropertyMeta.new("proto", "proto", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["all", "none", "tcp", "udp"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "sys_contact" => MoPropertyMeta.new("sys_contact", "sysContact", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 0, 64, nil, [], []), 
            "sys_location" => MoPropertyMeta.new("sys_location", "sysLocation", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, 0, 64, nil, [], []), 
            "trap_community" => MoPropertyMeta.new("trap_community", "trapCommunity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, %q{[!#$%\(\)\*\+,\-\./:<=\[\]\^_\{\}~a-zA-Z0-9]{0,18}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "com2Sec" => "com2_sec", 
        "community" => "community", 
        "descr" => "descr", 
        "dn" => "dn", 
        "engineId" => "engine_id", 
        "engineIdKey" => "engine_id_key", 
        "name" => "name", 
        "port" => "port", 
        "proto" => "proto", 
        "rn" => "rn", 
        "status" => "status", 
        "sysContact" => "sys_contact", 
        "sysLocation" => "sys_location", 
        "trapCommunity" => "trap_community", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "com2Sec" => "com2_sec", 
            "community" => "community", 
            "descr" => "descr", 
            "dn" => "dn", 
            "engineId" => "engine_id", 
            "engineIdKey" => "engine_id_key", 
            "name" => "name", 
            "port" => "port", 
            "proto" => "proto", 
            "rn" => "rn", 
            "status" => "status", 
            "sysContact" => "sys_contact", 
            "sysLocation" => "sys_location", 
            "trapCommunity" => "trap_community", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_reader :child_action
    attr_accessor :com2_sec
    attr_accessor :community
    attr_reader :descr
    attr_reader :engine_id
    attr_accessor :engine_id_key
    attr_reader :name
    attr_accessor :port
    attr_reader :proto
    attr_accessor :status
    attr_accessor :sys_contact
    attr_accessor :sys_location
    attr_accessor :trap_community


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @child_action = nil
        @com2_sec = nil
        @community = nil
        @descr = nil
        @engine_id = nil
        @engine_id_key = nil
        @name = nil
        @port = nil
        @proto = nil
        @status = nil
        @sys_contact = nil
        @sys_location = nil
        @trap_community = nil

        super(class_id: "CommSnmp", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
