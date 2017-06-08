#This module contains the general information for StorageFlexFlashVirtualDriveImageMap ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageFlexFlashVirtualDriveImageMapConsts
    ADMIN_ACTION_MAP = "map"
    ADMIN_ACTION_UNMAP = "unmap"
    MAP_CIFS = "cifs"
    MAP_NFS = "nfs"
end


class StorageFlexFlashVirtualDriveImageMap < ManagedObject
    #This is StorageFlexFlashVirtualDriveImageMap class.

    @@consts = StorageFlexFlashVirtualDriveImageMapConsts.new()
#    @@naming_props = set([u'virtualDrive'])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageFlexFlashVirtualDriveImageMap", "storageFlexFlashVirtualDriveImageMap", "vdrive-map-[virtual_drive]", VersionMeta::VERSION202C, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("StorageFlexFlashVirtualDriveImageMap", "storageFlexFlashVirtualDriveImageMap", "vdrive-map-[virtual_drive]", VersionMeta::VERSION2013E, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["map", "unmap"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "map" => MoPropertyMeta.new("map", "map", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, ["cifs", "nfs"], []), 
        "mount_options" => MoPropertyMeta.new("mount_options", "mountOptions", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x10, 1, 510, nil, [], []), 
        "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x20, 0, 510, nil, [], []), 
        "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x40, 0, 510, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
        "remote_share" => MoPropertyMeta.new("remote_share", "remoteShare", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x80, 0, 510, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "to_enable_mapping" => MoPropertyMeta.new("to_enable_mapping", "toEnableMapping", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x400, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x800, 0, 510, nil, [], []), 
        "virtual_drive" => MoPropertyMeta.new("virtual_drive", "virtualDrive", "string", VersionMeta::VERSION202C, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["map", "unmap"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "map" => MoPropertyMeta.new("map", "map", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, ["cifs", "nfs"], []), 
            "mount_options" => MoPropertyMeta.new("mount_options", "mountOptions", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 1, 510, nil, [], []), 
            "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 510, nil, [], []), 
            "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 510, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
            "remote_share" => MoPropertyMeta.new("remote_share", "remoteShare", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, 0, 510, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{1,235}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "to_enable_mapping" => MoPropertyMeta.new("to_enable_mapping", "toEnableMapping", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x400, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "username" => MoPropertyMeta.new("username", "username", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, 0, 510, nil, [], []), 
            "virtual_drive" => MoPropertyMeta.new("virtual_drive", "virtualDrive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
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
        "map" => "map", 
        "mountOptions" => "mount_options", 
        "password" => "password", 
        "remoteFile" => "remote_file", 
        "remoteShare" => "remote_share", 
        "rn" => "rn", 
        "status" => "status", 
        "toEnableMapping" => "to_enable_mapping", 
        "username" => "username", 
        "virtualDrive" => "virtual_drive", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "map" => "map", 
            "mountOptions" => "mount_options", 
            "password" => "password", 
            "remoteFile" => "remote_file", 
            "remoteShare" => "remote_share", 
            "rn" => "rn", 
            "status" => "status", 
            "toEnableMapping" => "to_enable_mapping", 
            "username" => "username", 
            "virtualDrive" => "virtual_drive", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :virtual_drive
    attr_accessor :admin_action
    attr_reader :child_action
    attr_accessor :map
    attr_accessor :mount_options
    attr_accessor :password
    attr_accessor :remote_file
    attr_accessor :remote_share
    attr_accessor :status
    attr_reader :to_enable_mapping
    attr_accessor :username


    def initialize(parent_mo_or_dn: nil,virtual_drive: nil,  **kwargs)
        @dirty_mask = 0
        @virtual_drive = virtual_drive
        @admin_action = nil
        @child_action = nil
        @map = nil
        @mount_options = nil
        @password = nil
        @remote_file = nil
        @remote_share = nil
        @status = nil
        @to_enable_mapping = nil
        @username = nil

        super(class_id: "StorageFlexFlashVirtualDriveImageMap", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
