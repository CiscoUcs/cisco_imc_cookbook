#This module contains the general information for CommVMediaMap ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommVMediaMapConsts
    ADMIN_ACTION_SAVE_UNMAPPED_VOLUME = "save-unmapped-volume"
    DRIVE_TYPE_CD = "cd"
    DRIVE_TYPE_FLOPPY = "floppy"
    MAP_CIFS = "cifs"
    MAP_NFS = "nfs"
    MAP_WWW = "www"
end


class CommVMediaMap < ManagedObject
    #This is CommVMediaMap class.

    @@consts = CommVMediaMapConsts.new()
#    @@naming_props = set([u'volumeName'])

    @@mo_meta = {
        "classic" => MoMeta.new("CommVMediaMap", "commVMediaMap", "vmmap-[volume_name]", VersionMeta::VERSION151F, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Add", "Get"]),
        "modular" => MoMeta.new("CommVMediaMap", "commVMediaMap", "vmmap-[volume_name]", VersionMeta::VERSION2013E, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Add", "Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["save-unmapped-volume"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "drive_type" => MoPropertyMeta.new("drive_type", "driveType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cd", "floppy"], []), 
        "map" => MoPropertyMeta.new("map", "map", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["cifs", "nfs", "www"], []), 
        "mapping_status" => MoPropertyMeta.new("mapping_status", "mappingStatus", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "mount_options" => MoPropertyMeta.new("mount_options", "mountOptions", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 1, 248, nil, [], []), 
        "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], []), 
        "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
        "remote_share" => MoPropertyMeta.new("remote_share", "remoteShare", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, [], []), 
        "volume_name" => MoPropertyMeta.new("volume_name", "volumeName", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x800, nil, nil, %q{[\-\.:_a-zA-Z0-9]{1,47}}, [], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["save-unmapped-volume"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "drive_type" => MoPropertyMeta.new("drive_type", "driveType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cd", "floppy"], []), 
            "map" => MoPropertyMeta.new("map", "map", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["cifs", "nfs", "www"], []), 
            "mapping_status" => MoPropertyMeta.new("mapping_status", "mappingStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "mount_options" => MoPropertyMeta.new("mount_options", "mountOptions", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 1, 248, nil, [], []), 
            "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], []), 
            "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
            "remote_share" => MoPropertyMeta.new("remote_share", "remoteShare", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, [], []), 
            "volume_name" => MoPropertyMeta.new("volume_name", "volumeName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x800, nil, nil, %q{[\-\.:_a-zA-Z0-9]{1,47}}, [], []), 
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
        "mappingStatus" => "mapping_status", 
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
            "mappingStatus" => "mapping_status", 
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
    attr_accessor :map
    attr_reader :mapping_status
    attr_accessor :mount_options
    attr_accessor :password
    attr_accessor :remote_file
    attr_accessor :remote_share
    attr_accessor :status
    attr_accessor :username


    def initialize(parent_mo_or_dn: nil,volume_name: nil,  **kwargs)
        @dirty_mask = 0
        @volume_name = volume_name
        @admin_action = nil
        @child_action = nil
        @drive_type = nil
        @map = nil
        @mapping_status = nil
        @mount_options = nil
        @password = nil
        @remote_file = nil
        @remote_share = nil
        @status = nil
        @username = nil

        super(class_id: "CommVMediaMap", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
