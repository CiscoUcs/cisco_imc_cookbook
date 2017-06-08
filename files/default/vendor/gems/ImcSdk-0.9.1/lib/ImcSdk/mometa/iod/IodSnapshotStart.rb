#This module contains the general information for IodSnapshotStart ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class IodSnapshotStartConsts
    ADMIN_STATE_TRIGGER = "trigger"
    ADMIN_STATE_TRIGGERED = "triggered"
    ISO_SHARE_TYPE_CIFS = "cifs"
    ISO_SHARE_TYPE_NFS = "nfs"
    ISO_SHARE_TYPE_SD = "sd"
    ISO_SHARE_TYPE_WWW = "www"
    REMOTE_SHARE_TYPE_SCP = "scp"
    REMOTE_SHARE_TYPE_SFTP = "sftp"
    REMOTE_SHARE_TYPE_TFTP = "tftp"
end


class IodSnapshotStart < ManagedObject
    #This is IodSnapshotStart class.

    @@consts = IodSnapshotStartConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("IodSnapshotStart", "iodSnapshotStart", "snapshotStart", VersionMeta::VERSION151X, "InputOutput", 0x3ffff, [], ["admin"], [nil]),
        "modular" => MoMeta.new("IodSnapshotStart", "iodSnapshotStart", "snapshotStart", VersionMeta::VERSION2013E, "InputOutput", 0x3ffff, [], ["admin"], [nil])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151X, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "iso_share" => MoPropertyMeta.new("iso_share", "isoShare", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,255}}, [], []), 
        "iso_share_file" => MoPropertyMeta.new("iso_share_file", "isoShareFile", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "iso_share_ip" => MoPropertyMeta.new("iso_share_ip", "isoShareIp", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [], []), 
        "iso_share_path" => MoPropertyMeta.new("iso_share_path", "isoSharePath", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "iso_share_type" => MoPropertyMeta.new("iso_share_type", "isoShareType", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["cifs", "nfs", "sd", "www"], []), 
        "mount_option" => MoPropertyMeta.new("mount_option", "mountOption", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], []), 
        "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], []), 
        "remote_share_file" => MoPropertyMeta.new("remote_share_file", "remoteShareFile", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x100, 0, 510, nil, [], []), 
        "remote_share_ip" => MoPropertyMeta.new("remote_share_ip", "remoteShareIp", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, %q{(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])}, [], []), 
        "remote_share_password" => MoPropertyMeta.new("remote_share_password", "remoteSharePassword", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, [], []), 
        "remote_share_path" => MoPropertyMeta.new("remote_share_path", "remoteSharePath", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x800, 0, 510, nil, [], []), 
        "remote_share_type" => MoPropertyMeta.new("remote_share_type", "remoteShareType", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, ["scp", "sftp", "tftp"], []), 
        "remote_share_username" => MoPropertyMeta.new("remote_share_username", "remoteShareUsername", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x4000, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x8000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "time_out" => MoPropertyMeta.new("time_out", "timeOut", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x10000, nil, nil, nil, [], ["30-240"]), 
        "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x20000, nil, nil, nil, [], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "iso_share" => MoPropertyMeta.new("iso_share", "isoShare", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,255}}, [], []), 
            "iso_share_file" => MoPropertyMeta.new("iso_share_file", "isoShareFile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "iso_share_ip" => MoPropertyMeta.new("iso_share_ip", "isoShareIp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "iso_share_path" => MoPropertyMeta.new("iso_share_path", "isoSharePath", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "iso_share_type" => MoPropertyMeta.new("iso_share_type", "isoShareType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["cifs", "nfs", "sd", "www"], []), 
            "mount_option" => MoPropertyMeta.new("mount_option", "mountOption", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], []), 
            "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], []), 
            "remote_share_file" => MoPropertyMeta.new("remote_share_file", "remoteShareFile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 510, nil, [], []), 
            "remote_share_ip" => MoPropertyMeta.new("remote_share_ip", "remoteShareIp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, %q{(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])}, [], []), 
            "remote_share_password" => MoPropertyMeta.new("remote_share_password", "remoteSharePassword", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, [], []), 
            "remote_share_path" => MoPropertyMeta.new("remote_share_path", "remoteSharePath", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, 0, 510, nil, [], []), 
            "remote_share_type" => MoPropertyMeta.new("remote_share_type", "remoteShareType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, ["scp", "sftp", "tftp"], []), 
            "remote_share_username" => MoPropertyMeta.new("remote_share_username", "remoteShareUsername", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4000, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "time_out" => MoPropertyMeta.new("time_out", "timeOut", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10000, nil, nil, nil, [], ["30-240"]), 
            "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20000, nil, nil, nil, [], []), 
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
        "isoShare" => "iso_share", 
        "isoShareFile" => "iso_share_file", 
        "isoShareIp" => "iso_share_ip", 
        "isoSharePath" => "iso_share_path", 
        "isoShareType" => "iso_share_type", 
        "mountOption" => "mount_option", 
        "password" => "password", 
        "remoteShareFile" => "remote_share_file", 
        "remoteShareIp" => "remote_share_ip", 
        "remoteSharePassword" => "remote_share_password", 
        "remoteSharePath" => "remote_share_path", 
        "remoteShareType" => "remote_share_type", 
        "remoteShareUsername" => "remote_share_username", 
        "rn" => "rn", 
        "status" => "status", 
        "timeOut" => "time_out", 
        "username" => "username", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "isoShare" => "iso_share", 
            "isoShareFile" => "iso_share_file", 
            "isoShareIp" => "iso_share_ip", 
            "isoSharePath" => "iso_share_path", 
            "isoShareType" => "iso_share_type", 
            "mountOption" => "mount_option", 
            "password" => "password", 
            "remoteShareFile" => "remote_share_file", 
            "remoteShareIp" => "remote_share_ip", 
            "remoteSharePassword" => "remote_share_password", 
            "remoteSharePath" => "remote_share_path", 
            "remoteShareType" => "remote_share_type", 
            "remoteShareUsername" => "remote_share_username", 
            "rn" => "rn", 
            "status" => "status", 
            "timeOut" => "time_out", 
            "username" => "username", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_reader :child_action
    attr_reader :iso_share
    attr_reader :iso_share_file
    attr_accessor :iso_share_ip
    attr_reader :iso_share_path
    attr_accessor :iso_share_type
    attr_accessor :mount_option
    attr_accessor :password
    attr_accessor :remote_share_file
    attr_accessor :remote_share_ip
    attr_accessor :remote_share_password
    attr_accessor :remote_share_path
    attr_accessor :remote_share_type
    attr_accessor :remote_share_username
    attr_accessor :status
    attr_accessor :time_out
    attr_accessor :username


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @child_action = nil
        @iso_share = nil
        @iso_share_file = nil
        @iso_share_ip = nil
        @iso_share_path = nil
        @iso_share_type = nil
        @mount_option = nil
        @password = nil
        @remote_share_file = nil
        @remote_share_ip = nil
        @remote_share_password = nil
        @remote_share_path = nil
        @remote_share_type = nil
        @remote_share_username = nil
        @status = nil
        @time_out = nil
        @username = nil

        super(class_id: "IodSnapshotStart", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
