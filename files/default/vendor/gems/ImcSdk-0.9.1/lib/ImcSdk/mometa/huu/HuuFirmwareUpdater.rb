#This module contains the general information for HuuFirmwareUpdater ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class HuuFirmwareUpdaterConsts
    ADMIN_STATE_TRIGGER = "trigger"
    ADMIN_STATE_TRIGGERED = "triggered"
    MAP_TYPE_CIFS = "cifs"
    MAP_TYPE_NFS = "nfs"
    MAP_TYPE_WWW = "www"
end


class HuuFirmwareUpdater < ManagedObject
    #This is HuuFirmwareUpdater class.

    @@consts = HuuFirmwareUpdaterConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("HuuFirmwareUpdater", "huuFirmwareUpdater", "firmwareUpdater", VersionMeta::VERSION151F, "InputOutput", 0xffff, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("HuuFirmwareUpdater", "huuFirmwareUpdater", "firmwareUpdater", VersionMeta::VERSION2013E, "InputOutput", 0x1ffff, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "cimc_secure_boot" => MoPropertyMeta.new("cimc_secure_boot", "cimcSecureBoot", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "map_type" => MoPropertyMeta.new("map_type", "mapType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["cifs", "nfs", "www"], []), 
        "mount_option" => MoPropertyMeta.new("mount_option", "mountOption", "string", VersionMeta::VERSION208D, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], []), 
        "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], []), 
        "remote_ip" => MoPropertyMeta.new("remote_ip", "remoteIp", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [], []), 
        "remote_share" => MoPropertyMeta.new("remote_share", "remoteShare", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, 0, 510, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,255}}, [], []), 
        "remote_share_file" => MoPropertyMeta.new("remote_share_file", "remoteShareFile", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "remote_share_path" => MoPropertyMeta.new("remote_share_path", "remoteSharePath", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "stop_on_error" => MoPropertyMeta.new("stop_on_error", "stopOnError", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "time_out" => MoPropertyMeta.new("time_out", "timeOut", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, [], ["30-240"]), 
        "update_component" => MoPropertyMeta.new("update_component", "updateComponent", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, [], []), 
        "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4000, nil, nil, nil, [], []), 
        "verify_update" => MoPropertyMeta.new("verify_update", "verifyUpdate", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8000, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "cimc_secure_boot" => MoPropertyMeta.new("cimc_secure_boot", "cimcSecureBoot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "map_type" => MoPropertyMeta.new("map_type", "mapType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["cifs", "nfs", "www"], []), 
            "mount_option" => MoPropertyMeta.new("mount_option", "mountOption", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], []), 
            "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], []), 
            "remote_ip" => MoPropertyMeta.new("remote_ip", "remoteIp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "remote_share" => MoPropertyMeta.new("remote_share", "remoteShare", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 510, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,255}}, [], []), 
            "remote_share_file" => MoPropertyMeta.new("remote_share_file", "remoteShareFile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "remote_share_path" => MoPropertyMeta.new("remote_share_path", "remoteSharePath", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "stop_on_error" => MoPropertyMeta.new("stop_on_error", "stopOnError", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "time_out" => MoPropertyMeta.new("time_out", "timeOut", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, [], ["30-240"]), 
            "update_component" => MoPropertyMeta.new("update_component", "updateComponent", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, [], []), 
            "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4000, nil, nil, nil, [], []), 
            "verify_update" => MoPropertyMeta.new("verify_update", "verifyUpdate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8000, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "cmc_secure_boot" => MoPropertyMeta.new("cmc_secure_boot", "cmcSecureBoot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10000, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "cimcSecureBoot" => "cimc_secure_boot", 
        "dn" => "dn", 
        "mapType" => "map_type", 
        "mountOption" => "mount_option", 
        "password" => "password", 
        "remoteIp" => "remote_ip", 
        "remoteShare" => "remote_share", 
        "remoteShareFile" => "remote_share_file", 
        "remoteSharePath" => "remote_share_path", 
        "rn" => "rn", 
        "status" => "status", 
        "stopOnError" => "stop_on_error", 
        "timeOut" => "time_out", 
        "updateComponent" => "update_component", 
        "username" => "username", 
        "verifyUpdate" => "verify_update", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "cimcSecureBoot" => "cimc_secure_boot", 
            "dn" => "dn", 
            "mapType" => "map_type", 
            "mountOption" => "mount_option", 
            "password" => "password", 
            "remoteIp" => "remote_ip", 
            "remoteShare" => "remote_share", 
            "remoteShareFile" => "remote_share_file", 
            "remoteSharePath" => "remote_share_path", 
            "rn" => "rn", 
            "status" => "status", 
            "stopOnError" => "stop_on_error", 
            "timeOut" => "time_out", 
            "updateComponent" => "update_component", 
            "username" => "username", 
            "verifyUpdate" => "verify_update", 
            "cmcSecureBoot" => "cmc_secure_boot", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_reader :child_action
    attr_accessor :cimc_secure_boot
    attr_accessor :map_type
    attr_accessor :mount_option
    attr_accessor :password
    attr_accessor :remote_ip
    attr_accessor :remote_share
    attr_reader :remote_share_file
    attr_reader :remote_share_path
    attr_accessor :status
    attr_accessor :stop_on_error
    attr_accessor :time_out
    attr_accessor :update_component
    attr_accessor :username
    attr_accessor :verify_update


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @child_action = nil
        @cimc_secure_boot = nil
        @map_type = nil
        @mount_option = nil
        @password = nil
        @remote_ip = nil
        @remote_share = nil
        @remote_share_file = nil
        @remote_share_path = nil
        @status = nil
        @stop_on_error = nil
        @time_out = nil
        @update_component = nil
        @username = nil
        @verify_update = nil
        @cmc_secure_boot = nil

        super(class_id: "HuuFirmwareUpdater", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
