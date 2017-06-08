#This module contains the general information for CommSyslogClient ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommSyslogClientConsts
    ADMIN_ACTION_CLEAR = "clear"
    ADMIN_STATE_DISABLED = "disabled"
    ADMIN_STATE_ENABLED = "enabled"
    NAME_PRIMARY = "primary"
    NAME_SECONDARY = "secondary"
    NAME_TERTIARY = "tertiary"
end


class CommSyslogClient < ManagedObject
    #This is CommSyslogClient class.

    @@consts = CommSyslogClientConsts.new()
#    @@naming_props = set([u'name'])

    @@mo_meta = {
        "classic" => MoMeta.new("CommSyslogClient", "commSyslogClient", "client-[name]", VersionMeta::VERSION151F, "InputOutput", 0x1ff, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("CommSyslogClient", "commSyslogClient", "client-[name]", VersionMeta::VERSION2013E, "InputOutput", 0x1ff, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION208D, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear"], []), 
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "hostname" => MoPropertyMeta.new("hostname", "hostname", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x20, nil, nil, nil, ["primary", "secondary", "tertiary"], []), 
        "port" => MoPropertyMeta.new("port", "port", "uint", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["1-65535"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear"], []), 
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "hostname" => MoPropertyMeta.new("hostname", "hostname", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x20, nil, nil, nil, ["primary", "secondary", "tertiary"], []), 
            "port" => MoPropertyMeta.new("port", "port", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["1-65535"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
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
        "dn" => "dn", 
        "hostname" => "hostname", 
        "name" => "name", 
        "port" => "port", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "hostname" => "hostname", 
            "name" => "name", 
            "port" => "port", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :name
    attr_accessor :admin_action
    attr_accessor :admin_state
    attr_reader :child_action
    attr_accessor :hostname
    attr_accessor :port
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,name: nil,  **kwargs)
        @dirty_mask = 0
        @name = name
        @admin_action = nil
        @admin_state = nil
        @child_action = nil
        @hostname = nil
        @port = nil
        @status = nil

        super(class_id: "CommSyslogClient", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
