#This module contains the general information for StorageVirtualDriveCreatorUsingVirtualDriveGroup ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageVirtualDriveCreatorUsingVirtualDriveGroupConsts
    ACCESS_POLICY_ = ""
    ACCESS_POLICY_BLOCKED = "blocked"
    ACCESS_POLICY_DEFAULT = "default"
    ACCESS_POLICY_HIDDEN = "hidden"
    ACCESS_POLICY_READ_ONLY = "read-only"
    ACCESS_POLICY_READ_WRITE = "read-write"
    ADMIN_STATE_TRIGGER = "trigger"
    ADMIN_STATE_TRIGGERED = "triggered"
    CACHE_POLICY_ = ""
    CACHE_POLICY_CACHED_IO = "cached-io"
    CACHE_POLICY_DEFAULT = "default"
    CACHE_POLICY_DIRECT_IO = "direct-io"
    DISK_CACHE_POLICY_ = ""
    DISK_CACHE_POLICY_DEFAULT = "default"
    DISK_CACHE_POLICY_DISABLED = "disabled"
    DISK_CACHE_POLICY_ENABLED = "enabled"
    DISK_CACHE_POLICY_UNCHANGED = "unchanged"
    READ_POLICY_ = ""
    READ_POLICY_ALWAYS_READ_AHEAD = "always-read-ahead"
    READ_POLICY_DEFAULT = "default"
    READ_POLICY_NO_READ_AHEAD = "no-read-ahead"
    SHARED_VIRTUAL_DRIVE_ID_ = ""
    STRIP_SIZE_ = ""
    STRIP_SIZE_1024K = "1024k"
    STRIP_SIZE_128K = "128k"
    STRIP_SIZE_16K = "16k"
    STRIP_SIZE_256K = "256k"
    STRIP_SIZE_32K = "32k"
    STRIP_SIZE_512K = "512k"
    STRIP_SIZE_64K = "64k"
    STRIP_SIZE_8K = "8k"
    STRIP_SIZE_DEFAULT = "default"
    WRITE_POLICY_ = ""
    WRITE_POLICY_ALWAYS_WRITE_BACK = "Always Write Back"
    WRITE_POLICY_WRITE_BACK_GOOD_BBU = "Write Back Good BBU"
    WRITE_POLICY_WRITE_THROUGH = "Write Through"
    _WRITE_POLICY_ALWAYS_WRITE_BACK = "always-write-back"
    WRITE_POLICY_DEFAULT = "default"
    _WRITE_POLICY_WRITE_BACK_GOOD_BBU = "write-back-good-bbu"
    _WRITE_POLICY_WRITE_THROUGH = "write-through"
end


class StorageVirtualDriveCreatorUsingVirtualDriveGroup < ManagedObject
    #This is StorageVirtualDriveCreatorUsingVirtualDriveGroup class.

    @@consts = StorageVirtualDriveCreatorUsingVirtualDriveGroupConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageVirtualDriveCreatorUsingVirtualDriveGroup", "storageVirtualDriveCreatorUsingVirtualDriveGroup", "virtual-drive-carve", VersionMeta::VERSION201A, "InputOutput", 0x3fff, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("StorageVirtualDriveCreatorUsingVirtualDriveGroup", "storageVirtualDriveCreatorUsingVirtualDriveGroup", "virtual-drive-carve", VersionMeta::VERSION2013E, "InputOutput", 0x3fff, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "access_policy" => MoPropertyMeta.new("access_policy", "accessPolicy", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["", "blocked", "default", "hidden", "read-only", "read-write"], []), 
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["trigger", "triggered"], []), 
        "cache_policy" => MoPropertyMeta.new("cache_policy", "cachePolicy", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "cached-io", "default", "direct-io"], []), 
        "created_virtual_drive_dn" => MoPropertyMeta.new("created_virtual_drive_dn", "createdVirtualDriveDn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "disk_cache_policy" => MoPropertyMeta.new("disk_cache_policy", "diskCachePolicy", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "default", "disabled", "enabled", "unchanged"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "oper_status" => MoPropertyMeta.new("oper_status", "operStatus", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "read_policy" => MoPropertyMeta.new("read_policy", "readPolicy", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "always-read-ahead", "default", "no-read-ahead"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
        "shared_virtual_drive_id" => MoPropertyMeta.new("shared_virtual_drive_id", "sharedVirtualDriveId", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, [""], ["0-4294967295"]), 
        "size" => MoPropertyMeta.new("size", "size", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x200, 1, 510, %q{(\d+\s?([MGT]B)?)}, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "strip_size" => MoPropertyMeta.new("strip_size", "stripSize", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["", "1024k", "128k", "16k", "256k", "32k", "512k", "64k", "8k", "default"], []), 
        "virtual_drive_name" => MoPropertyMeta.new("virtual_drive_name", "virtualDriveName", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x1000, 0, 15, nil, [], []), 
        "write_policy" => MoPropertyMeta.new("write_policy", "writePolicy", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, ["", "Always Write Back", "Write Back Good BBU", "Write Through", "always-write-back", "default", "write-back-good-bbu", "write-through"], []), 
        },

        "modular" => {
            "access_policy" => MoPropertyMeta.new("access_policy", "accessPolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["", "blocked", "hidden", "read-only", "read-write"], []), 
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["trigger", "triggered"], []), 
            "cache_policy" => MoPropertyMeta.new("cache_policy", "cachePolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "cached-io", "direct-io"], []), 
            "created_virtual_drive_dn" => MoPropertyMeta.new("created_virtual_drive_dn", "createdVirtualDriveDn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "disk_cache_policy" => MoPropertyMeta.new("disk_cache_policy", "diskCachePolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "disabled", "enabled", "unchanged"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "oper_status" => MoPropertyMeta.new("oper_status", "operStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "read_policy" => MoPropertyMeta.new("read_policy", "readPolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "always-read-ahead", "no-read-ahead"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
            "shared_virtual_drive_id" => MoPropertyMeta.new("shared_virtual_drive_id", "sharedVirtualDriveId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 510, nil, [], ["0-4294967295"]), 
            "size" => MoPropertyMeta.new("size", "size", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 1, 510, %q{(\d+\s?([MGT]B)?)}, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "strip_size" => MoPropertyMeta.new("strip_size", "stripSize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, 0, 510, nil, ["1024k", "128k", "256k", "512k", "64k"], []), 
            "virtual_drive_name" => MoPropertyMeta.new("virtual_drive_name", "virtualDriveName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, 0, 15, nil, [], []), 
            "write_policy" => MoPropertyMeta.new("write_policy", "writePolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, ["", "Always Write Back", "Write Back Good BBU", "Write Through", "default"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "accessPolicy" => "access_policy", 
        "adminState" => "admin_state", 
        "cachePolicy" => "cache_policy", 
        "createdVirtualDriveDn" => "created_virtual_drive_dn", 
        "description" => "description", 
        "diskCachePolicy" => "disk_cache_policy", 
        "dn" => "dn", 
        "operStatus" => "oper_status", 
        "readPolicy" => "read_policy", 
        "rn" => "rn", 
        "sharedVirtualDriveId" => "shared_virtual_drive_id", 
        "size" => "size", 
        "status" => "status", 
        "stripSize" => "strip_size", 
        "virtualDriveName" => "virtual_drive_name", 
        "writePolicy" => "write_policy", 
        },

        "modular" => {
            "accessPolicy" => "access_policy", 
            "adminState" => "admin_state", 
            "cachePolicy" => "cache_policy", 
            "createdVirtualDriveDn" => "created_virtual_drive_dn", 
            "description" => "description", 
            "diskCachePolicy" => "disk_cache_policy", 
            "dn" => "dn", 
            "operStatus" => "oper_status", 
            "readPolicy" => "read_policy", 
            "rn" => "rn", 
            "sharedVirtualDriveId" => "shared_virtual_drive_id", 
            "size" => "size", 
            "status" => "status", 
            "stripSize" => "strip_size", 
            "virtualDriveName" => "virtual_drive_name", 
            "writePolicy" => "write_policy", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :access_policy
    attr_accessor :admin_state
    attr_accessor :cache_policy
    attr_reader :created_virtual_drive_dn
    attr_reader :description
    attr_accessor :disk_cache_policy
    attr_reader :oper_status
    attr_accessor :read_policy
    attr_accessor :shared_virtual_drive_id
    attr_accessor :size
    attr_accessor :status
    attr_accessor :strip_size
    attr_accessor :virtual_drive_name
    attr_accessor :write_policy


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @access_policy = nil
        @admin_state = nil
        @cache_policy = nil
        @created_virtual_drive_dn = nil
        @description = nil
        @disk_cache_policy = nil
        @oper_status = nil
        @read_policy = nil
        @shared_virtual_drive_id = nil
        @size = nil
        @status = nil
        @strip_size = nil
        @virtual_drive_name = nil
        @write_policy = nil

        super(class_id: "StorageVirtualDriveCreatorUsingVirtualDriveGroup", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
