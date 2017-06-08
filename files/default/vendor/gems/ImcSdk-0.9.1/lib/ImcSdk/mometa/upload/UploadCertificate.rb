#This module contains the general information for UploadCertificate ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class UploadCertificateConsts
    ADMIN_ACTION_REMOTE_CERT_UPLOAD = "remote-cert-upload"
    PROTOCOL_FTP = "ftp"
    PROTOCOL_HTTP = "http"
    PROTOCOL_NONE = "none"
    PROTOCOL_SCP = "scp"
    PROTOCOL_SFTP = "sftp"
    PROTOCOL_TFTP = "tftp"
end


class UploadCertificate < ManagedObject
    #This is UploadCertificate class.

    @@consts = UploadCertificateConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("UploadCertificate", "uploadCertificate", "upload-cert", VersionMeta::VERSION209C, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], [nil]),
        "modular" => MoMeta.new("UploadCertificate", "uploadCertificate", "upload-cert", VersionMeta::VERSION2013E, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], [nil])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["remote-cert-upload"], []), 
        "certificate_content" => MoPropertyMeta.new("certificate_content", "certificateContent", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION209C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "protocol" => MoPropertyMeta.new("protocol", "protocol", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["ftp", "http", "none", "scp", "sftp", "tftp"], []), 
        "pwd" => MoPropertyMeta.new("pwd", "pwd", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x20, 0, 256, nil, [], []), 
        "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, %q{[^\(\)~`'\?\\"";<>\|&\*\^$%]{0,128}}, [], []), 
        "remote_server" => MoPropertyMeta.new("remote_server", "remoteServer", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x400, 0, 256, nil, [], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["remote-cert-upload"], []), 
            "certificate_content" => MoPropertyMeta.new("certificate_content", "certificateContent", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "protocol" => MoPropertyMeta.new("protocol", "protocol", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["ftp", "http", "none", "scp", "sftp", "tftp"], []), 
            "pwd" => MoPropertyMeta.new("pwd", "pwd", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 256, nil, [], []), 
            "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, %q{[^\(\)~`'\?\\"";<>\|&\*\^$%]{0,128}}, [], []), 
            "remote_server" => MoPropertyMeta.new("remote_server", "remoteServer", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, 0, 256, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "certificateContent" => "certificate_content", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "protocol" => "protocol", 
        "pwd" => "pwd", 
        "remoteFile" => "remote_file", 
        "remoteServer" => "remote_server", 
        "rn" => "rn", 
        "status" => "status", 
        "user" => "user", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "certificateContent" => "certificate_content", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "protocol" => "protocol", 
            "pwd" => "pwd", 
            "remoteFile" => "remote_file", 
            "remoteServer" => "remote_server", 
            "rn" => "rn", 
            "status" => "status", 
            "user" => "user", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_action
    attr_accessor :certificate_content
    attr_reader :child_action
    attr_accessor :protocol
    attr_accessor :pwd
    attr_accessor :remote_file
    attr_accessor :remote_server
    attr_accessor :status
    attr_accessor :user


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_action = nil
        @certificate_content = nil
        @child_action = nil
        @protocol = nil
        @pwd = nil
        @remote_file = nil
        @remote_server = nil
        @status = nil
        @user = nil

        super(class_id: "UploadCertificate", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
