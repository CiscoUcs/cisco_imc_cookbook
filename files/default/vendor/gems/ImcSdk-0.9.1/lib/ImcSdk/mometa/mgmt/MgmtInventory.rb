#This module contains the general information for MgmtInventory ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class MgmtInventoryConsts
    ADMIN_STATE_TRIGGER = "trigger"
    ADMIN_STATE_TRIGGERED = "triggered"
    PROTO_FTP = "ftp"
    PROTO_HTTP = "http"
    PROTO_NONE = "none"
    PROTO_SCP = "scp"
    PROTO_SFTP = "sftp"
    PROTO_TFTP = "tftp"
end


class MgmtInventory < ManagedObject
    #This is MgmtInventory class.

    @@consts = MgmtInventoryConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("MgmtInventory", "mgmtInventory", "inventory", VersionMeta::VERSION301C, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], [nil]),
        "modular" => MoMeta.new("MgmtInventory", "mgmtInventory", "inventory", VersionMeta::VERSION301C, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], [nil])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "fsm_status" => MoPropertyMeta.new("fsm_status", "fsmStatus", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "hostname" => MoPropertyMeta.new("hostname", "hostname", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [], []), 
        "progress" => MoPropertyMeta.new("progress", "progress", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "proto" => MoPropertyMeta.new("proto", "proto", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["ftp", "http", "none", "scp", "sftp", "tftp"], []), 
        "pwd" => MoPropertyMeta.new("pwd", "pwd", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, 0, 256, nil, [], []), 
        "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, 0, 128, %q{[^\(\)~`'\?\\"";<>\|&\*\^$%]{1,128}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x200, 0, 256, nil, [], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "fsm_status" => MoPropertyMeta.new("fsm_status", "fsmStatus", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "hostname" => MoPropertyMeta.new("hostname", "hostname", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "progress" => MoPropertyMeta.new("progress", "progress", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "proto" => MoPropertyMeta.new("proto", "proto", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["ftp", "http", "none", "scp", "sftp", "tftp"], []), 
            "pwd" => MoPropertyMeta.new("pwd", "pwd", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, 0, 256, nil, [], []), 
            "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, 0, 128, %q{[^\(\)~`'\?\\"";<>\|&\*\^$%]{1,128}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x200, 0, 256, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "fsmStatus" => "fsm_status", 
        "hostname" => "hostname", 
        "progress" => "progress", 
        "proto" => "proto", 
        "pwd" => "pwd", 
        "remoteFile" => "remote_file", 
        "rn" => "rn", 
        "status" => "status", 
        "user" => "user", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "fsmStatus" => "fsm_status", 
            "hostname" => "hostname", 
            "progress" => "progress", 
            "proto" => "proto", 
            "pwd" => "pwd", 
            "remoteFile" => "remote_file", 
            "rn" => "rn", 
            "status" => "status", 
            "user" => "user", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_reader :child_action
    attr_reader :fsm_status
    attr_accessor :hostname
    attr_reader :progress
    attr_accessor :proto
    attr_accessor :pwd
    attr_accessor :remote_file
    attr_accessor :status
    attr_accessor :user


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @child_action = nil
        @fsm_status = nil
        @hostname = nil
        @progress = nil
        @proto = nil
        @pwd = nil
        @remote_file = nil
        @status = nil
        @user = nil

        super(class_id: "MgmtInventory", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
