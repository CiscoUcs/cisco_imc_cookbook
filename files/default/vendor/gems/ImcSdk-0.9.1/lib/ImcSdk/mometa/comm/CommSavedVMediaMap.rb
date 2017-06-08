#This module contains the general information for CommSavedVMediaMap ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommSavedVMediaMapConsts
    ADMIN_ACTION_DELETE_VOLUME = "delete-volume"
    ADMIN_ACTION_REMAP_VOLUME = "remap-volume"
    DRIVE_TYPE_CD = "cd"
    DRIVE_TYPE_FLOPPY = "floppy"
    MAP_CIFS = "cifs"
    MAP_NFS = "nfs"
    MAP_WWW = "www"
end


class CommSavedVMediaMap < ManagedObject
    #This is CommSavedVMediaMap class.

    @@consts = CommSavedVMediaMapConsts.new()
#    @@naming_props = set([u'volumeName'])

    @@mo_meta = {
        "classic" => MoMeta.new("CommSavedVMediaMap", "commSavedVMediaMap", "saved-vmmap-[volume_name]", VersionMeta::VERSION301C, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Remove", "Set"]),
        "modular" => MoMeta.new("CommSavedVMediaMap", "commSavedVMediaMap", "saved-vmmap-[volume_name]", VersionMeta::VERSION301C, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Remove", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["delete-volume", "remap-volume"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "drive_type" => MoPropertyMeta.new("drive_type", "driveType", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cd", "floppy"], []), 
        "map" => MoPropertyMeta.new("map", "map", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cifs", "nfs", "www"], []), 
        "mount_options" => MoPropertyMeta.new("mount_options", "mountOptions", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 1, 248, nil, [], []), 
        "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
        "remote_share" => MoPropertyMeta.new("remote_share", "remoteShare", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "volume_name" => MoPropertyMeta.new("volume_name", "volumeName", "string", VersionMeta::VERSION301C, MoPropertyMeta::NAMING, 0x20, nil, nil, %q{[\-\.:_a-zA-Z0-9]{1,47}}, [], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["delete-volume", "remap-volume"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "drive_type" => MoPropertyMeta.new("drive_type", "driveType", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cd", "floppy"], []), 
            "map" => MoPropertyMeta.new("map", "map", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cifs", "nfs", "www"], []), 
            "mount_options" => MoPropertyMeta.new("mount_options", "mountOptions", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 1, 248, nil, [], []), 
            "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
            "remote_share" => MoPropertyMeta.new("remote_share", "remoteShare", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "volume_name" => MoPropertyMeta.new("volume_name", "volumeName", "string", VersionMeta::VERSION301C, MoPropertyMeta::NAMING, 0x20, nil, nil, %q{[\-\.:_a-zA-Z0-9]{1,47}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "driveType" => "drive_type", 
        "map" => "map", 
        "mountOptions" => "mount_options", 
        "password" => "password", 
        "remoteFile" => "remote_file", 
        "remoteShare" => "remote_share", 
        "rn" => "rn", 
        "status" => "status", 
        "username" => "username", 
        "volumeName" => "volume_name", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "driveType" => "drive_type", 
            "map" => "map", 
            "mountOptions" => "mount_options", 
            "password" => "password", 
            "remoteFile" => "remote_file", 
            "remoteShare" => "remote_share", 
            "rn" => "rn", 
            "status" => "status", 
            "username" => "username", 
            "volumeName" => "volume_name", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :volume_name
    attr_accessor :admin_action
    attr_reader :child_action
    attr_reader :drive_type
    attr_reader :map
    attr_reader :mount_options
    attr_reader :password
    attr_reader :remote_file
    attr_reader :remote_share
    attr_accessor :status
    attr_reader :username


    def initialize(parent_mo_or_dn: nil,volume_name: nil,  **kwargs)
        @dirty_mask = 0
        @volume_name = volume_name
        @admin_action = nil
        @child_action = nil
        @drive_type = nil
        @map = nil
        @mount_options = nil
        @password = nil
        @remote_file = nil
        @remote_share = nil
        @status = nil
        @username = nil

        super(class_id: "CommSavedVMediaMap", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
