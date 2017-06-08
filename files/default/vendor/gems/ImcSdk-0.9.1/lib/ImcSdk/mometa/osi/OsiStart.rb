#This module contains the general information for OsiStart ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class OsiStartConsts
    ADMIN_STATE_TRIGGER = "trigger"
    ADMIN_STATE_TRIGGERED = "triggered"
    ANSWER_FILE_SHARE_TYPE_SCP = "scp"
    ANSWER_FILE_SHARE_TYPE_SFTP = "sftp"
    ANSWER_FILE_SHARE_TYPE_WWW = "www"
    CONFIG_SHARE_TYPE_HTTP = "http"
    CONFIG_SHARE_TYPE_SCP = "scp"
    CONFIG_SHARE_TYPE_SFTP = "sftp"
    CONFIG_SHARE_TYPE_TFTP = "tftp"
    ISO_SHARE_TYPE_CIFS = "cifs"
    ISO_SHARE_TYPE_NFS = "nfs"
    ISO_SHARE_TYPE_SD = "sd"
    ISO_SHARE_TYPE_WWW = "www"
    REMOTE_SHARE_TYPE_SCP = "scp"
    REMOTE_SHARE_TYPE_SFTP = "sftp"
    REMOTE_SHARE_TYPE_TFTP = "tftp"
    CONFIG_SHARE_TYPE_WWW = "www"
end


class OsiStart < ManagedObject
    #This is OsiStart class.

    @@consts = OsiStartConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("OsiStart", "osiStart", "osiStart", VersionMeta::VERSION301C, "InputOutput", 0x1fffffff, [], ["admin"], ["Get"]),
        "modular" => MoMeta.new("OsiStart", "osiStart", "osiStart", VersionMeta::VERSION301C, "InputOutput", 0x1fffffff, [], ["admin"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
        "answer_file_password" => MoPropertyMeta.new("answer_file_password", "answerFilePassword", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], []), 
        "answer_file_share_file" => MoPropertyMeta.new("answer_file_share_file", "answerFileShareFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, [], []), 
        "answer_file_share_ip" => MoPropertyMeta.new("answer_file_share_ip", "answerFileShareIp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, %q{(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])}, [], []), 
        "answer_file_share_path" => MoPropertyMeta.new("answer_file_share_path", "answerFileSharePath", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, 0, 510, nil, [], []), 
        "answer_file_share_type" => MoPropertyMeta.new("answer_file_share_type", "answerFileShareType", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["scp", "sftp", "www"], []), 
        "answer_file_username" => MoPropertyMeta.new("answer_file_username", "answerFileUsername", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "config_share_file" => MoPropertyMeta.new("config_share_file", "configShareFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100, 0, 510, nil, [], []), 
        "config_share_ip" => MoPropertyMeta.new("config_share_ip", "configShareIp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, %q{(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])}, [], []), 
        "config_share_password" => MoPropertyMeta.new("config_share_password", "configSharePassword", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, [], []), 
        "config_share_path" => MoPropertyMeta.new("config_share_path", "configSharePath", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x800, 0, 510, nil, [], []), 
        "config_share_type" => MoPropertyMeta.new("config_share_type", "configShareType", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, ["http", "scp", "sftp", "tftp"], []), 
        "config_share_username" => MoPropertyMeta.new("config_share_username", "configShareUsername", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4000, 0, 255, nil, [], []), 
        "iso_share" => MoPropertyMeta.new("iso_share", "isoShare", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x8000, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,255}}, [], []), 
        "iso_share_file" => MoPropertyMeta.new("iso_share_file", "isoShareFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "iso_share_ip" => MoPropertyMeta.new("iso_share_ip", "isoShareIp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10000, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [], []), 
        "iso_share_path" => MoPropertyMeta.new("iso_share_path", "isoSharePath", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "iso_share_type" => MoPropertyMeta.new("iso_share_type", "isoShareType", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20000, nil, nil, nil, ["cifs", "nfs", "sd", "www"], []), 
        "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40000, nil, nil, nil, [], []), 
        "remote_share_file" => MoPropertyMeta.new("remote_share_file", "remoteShareFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80000, 0, 510, nil, [], []), 
        "remote_share_ip" => MoPropertyMeta.new("remote_share_ip", "remoteShareIp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100000, 0, 255, %q{(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])}, [], []), 
        "remote_share_password" => MoPropertyMeta.new("remote_share_password", "remoteSharePassword", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x200000, nil, nil, nil, [], []), 
        "remote_share_path" => MoPropertyMeta.new("remote_share_path", "remoteSharePath", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x400000, 0, 510, nil, [], []), 
        "remote_share_type" => MoPropertyMeta.new("remote_share_type", "remoteShareType", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x800000, nil, nil, nil, ["scp", "sftp", "tftp"], []), 
        "remote_share_username" => MoPropertyMeta.new("remote_share_username", "remoteShareUsername", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x1000000, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2000000, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4000000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "time_out" => MoPropertyMeta.new("time_out", "timeOut", "uint", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8000000, nil, nil, nil, [], ["30-240"]), 
        "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10000000, nil, nil, nil, [], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
            "answer_file_password" => MoPropertyMeta.new("answer_file_password", "answerFilePassword", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], []), 
            "answer_file_share_file" => MoPropertyMeta.new("answer_file_share_file", "answerFileShareFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, [], []), 
            "answer_file_share_ip" => MoPropertyMeta.new("answer_file_share_ip", "answerFileShareIp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, %q{(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])}, [], []), 
            "answer_file_share_path" => MoPropertyMeta.new("answer_file_share_path", "answerFileSharePath", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, 0, 510, nil, [], []), 
            "answer_file_share_type" => MoPropertyMeta.new("answer_file_share_type", "answerFileShareType", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["scp", "sftp", "www"], []), 
            "answer_file_username" => MoPropertyMeta.new("answer_file_username", "answerFileUsername", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "config_share_file" => MoPropertyMeta.new("config_share_file", "configShareFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100, 0, 510, nil, [], []), 
            "config_share_ip" => MoPropertyMeta.new("config_share_ip", "configShareIp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, %q{(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])}, [], []), 
            "config_share_password" => MoPropertyMeta.new("config_share_password", "configSharePassword", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, [], []), 
            "config_share_path" => MoPropertyMeta.new("config_share_path", "configSharePath", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x800, 0, 510, nil, [], []), 
            "config_share_type" => MoPropertyMeta.new("config_share_type", "configShareType", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, ["scp", "sftp", "www"], []), 
            "config_share_username" => MoPropertyMeta.new("config_share_username", "configShareUsername", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4000, 0, 255, nil, [], []), 
            "iso_share" => MoPropertyMeta.new("iso_share", "isoShare", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x8000, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,255}}, [], []), 
            "iso_share_file" => MoPropertyMeta.new("iso_share_file", "isoShareFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "iso_share_ip" => MoPropertyMeta.new("iso_share_ip", "isoShareIp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "iso_share_path" => MoPropertyMeta.new("iso_share_path", "isoSharePath", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "iso_share_type" => MoPropertyMeta.new("iso_share_type", "isoShareType", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20000, nil, nil, nil, ["cifs", "nfs", "sd", "www"], []), 
            "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40000, nil, nil, nil, [], []), 
            "remote_share_file" => MoPropertyMeta.new("remote_share_file", "remoteShareFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80000, 0, 510, nil, [], []), 
            "remote_share_ip" => MoPropertyMeta.new("remote_share_ip", "remoteShareIp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100000, 0, 255, %q{(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])}, [], []), 
            "remote_share_password" => MoPropertyMeta.new("remote_share_password", "remoteSharePassword", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x200000, nil, nil, nil, [], []), 
            "remote_share_path" => MoPropertyMeta.new("remote_share_path", "remoteSharePath", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x400000, 0, 510, nil, [], []), 
            "remote_share_type" => MoPropertyMeta.new("remote_share_type", "remoteShareType", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x800000, nil, nil, nil, ["scp", "sftp", "tftp"], []), 
            "remote_share_username" => MoPropertyMeta.new("remote_share_username", "remoteShareUsername", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x1000000, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2000000, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4000000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "time_out" => MoPropertyMeta.new("time_out", "timeOut", "uint", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8000000, nil, nil, nil, [], ["30-240"]), 
            "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10000000, nil, nil, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "answerFilePassword" => "answer_file_password", 
        "answerFileShareFile" => "answer_file_share_file", 
        "answerFileShareIp" => "answer_file_share_ip", 
        "answerFileSharePath" => "answer_file_share_path", 
        "answerFileShareType" => "answer_file_share_type", 
        "answerFileUsername" => "answer_file_username", 
        "childAction" => "child_action", 
        "configShareFile" => "config_share_file", 
        "configShareIp" => "config_share_ip", 
        "configSharePassword" => "config_share_password", 
        "configSharePath" => "config_share_path", 
        "configShareType" => "config_share_type", 
        "configShareUsername" => "config_share_username", 
        "dn" => "dn", 
        "isoShare" => "iso_share", 
        "isoShareFile" => "iso_share_file", 
        "isoShareIp" => "iso_share_ip", 
        "isoSharePath" => "iso_share_path", 
        "isoShareType" => "iso_share_type", 
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
            "answerFilePassword" => "answer_file_password", 
            "answerFileShareFile" => "answer_file_share_file", 
            "answerFileShareIp" => "answer_file_share_ip", 
            "answerFileSharePath" => "answer_file_share_path", 
            "answerFileShareType" => "answer_file_share_type", 
            "answerFileUsername" => "answer_file_username", 
            "childAction" => "child_action", 
            "configShareFile" => "config_share_file", 
            "configShareIp" => "config_share_ip", 
            "configSharePassword" => "config_share_password", 
            "configSharePath" => "config_share_path", 
            "configShareType" => "config_share_type", 
            "configShareUsername" => "config_share_username", 
            "dn" => "dn", 
            "isoShare" => "iso_share", 
            "isoShareFile" => "iso_share_file", 
            "isoShareIp" => "iso_share_ip", 
            "isoSharePath" => "iso_share_path", 
            "isoShareType" => "iso_share_type", 
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
    attr_accessor :answer_file_password
    attr_accessor :answer_file_share_file
    attr_accessor :answer_file_share_ip
    attr_accessor :answer_file_share_path
    attr_accessor :answer_file_share_type
    attr_accessor :answer_file_username
    attr_reader :child_action
    attr_accessor :config_share_file
    attr_accessor :config_share_ip
    attr_accessor :config_share_password
    attr_accessor :config_share_path
    attr_accessor :config_share_type
    attr_accessor :config_share_username
    attr_reader :iso_share
    attr_reader :iso_share_file
    attr_accessor :iso_share_ip
    attr_reader :iso_share_path
    attr_accessor :iso_share_type
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
        @answer_file_password = nil
        @answer_file_share_file = nil
        @answer_file_share_ip = nil
        @answer_file_share_path = nil
        @answer_file_share_type = nil
        @answer_file_username = nil
        @child_action = nil
        @config_share_file = nil
        @config_share_ip = nil
        @config_share_password = nil
        @config_share_path = nil
        @config_share_type = nil
        @config_share_username = nil
        @iso_share = nil
        @iso_share_file = nil
        @iso_share_ip = nil
        @iso_share_path = nil
        @iso_share_type = nil
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

        super(class_id: "OsiStart", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
