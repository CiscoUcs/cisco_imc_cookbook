#This module contains the general information for StorageVirtualDrive ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageVirtualDriveConsts
    ACCESS_POLICY_ = ""
    ACCESS_POLICY_TRANSPORT_READY = "Transport Ready"
    ACCESS_POLICY_BLOCKED = "blocked"
    ACCESS_POLICY_DEFAULT = "default"
    ACCESS_POLICY_HIDDEN = "hidden"
    ACCESS_POLICY_READ_ONLY = "read-only"
    ACCESS_POLICY_READ_WRITE = "read-write"
    ADMIN_ACTION_CANCEL_INITIALIZATION = "cancel-initialization"
    ADMIN_ACTION_CLEAR_TRANSPORT_READY = "clear-transport-ready"
    ADMIN_ACTION_ENABLE_SELF_ENCRYPT = "enable-self-encrypt"
    ADMIN_ACTION_RECONSTRUCT_VIRTUAL_DRIVE = "reconstruct-virtual-drive"
    ADMIN_ACTION_SET_BOOT_DRIVE = "set-boot-drive"
    ADMIN_ACTION_SET_TRANSPORT_READY = "set-transport-ready"
    ADMIN_ACTION_START_FAST_INITIALIZATION = "start-fast-initialization"
    ADMIN_ACTION_START_FULL_INITIALIZATION = "start-full-initialization"
    CACHE_POLICY_ = ""
    CACHE_POLICY_CACHED_IO = "cached-io"
    CACHE_POLICY_DEFAULT = "default"
    CACHE_POLICY_DIRECT_IO = "direct-io"
    DISK_CACHE_POLICY_ = ""
    DISK_CACHE_POLICY_DEFAULT = "default"
    DISK_CACHE_POLICY_DISABLED = "disabled"
    DISK_CACHE_POLICY_ENABLED = "enabled"
    DISK_CACHE_POLICY_UNCHANGED = "unchanged"
    HOTSPARE_ACTION_EXCLUDE_ALL = "exclude-all"
    HOTSPARE_ACTION_INCLUDE_ALL = "include-all"
    HOTSPARE_ACTION_INCLUDE_DHSP = "include-dhsp"
    RAID_LEVEL_0 = "0"
    RAID_LEVEL_1 = "1"
    RAID_LEVEL_5 = "5"
    RAID_LEVEL_6 = "6"
    READ_POLICY_ = ""
    READ_POLICY_ALWAYS_READ_AHEAD = "always-read-ahead"
    READ_POLICY_DEFAULT = "default"
    READ_POLICY_NO_READ_AHEAD = "no-read-ahead"
    REQUESTED_WRITE_CACHE_POLICY_ALWAYS_WRITE_BACK = "Always Write Back"
    REQUESTED_WRITE_CACHE_POLICY_WRITE_BACK_GOOD_BBU = "Write Back Good BBU"
    REQUESTED_WRITE_CACHE_POLICY_WRITE_THROUGH = "Write Through"
    _REQUESTED_WRITE_CACHE_POLICY_ALWAYS_WRITE_BACK = "always-write-back"
    REQUESTED_WRITE_CACHE_POLICY_DEFAULT = "default"
    _REQUESTED_WRITE_CACHE_POLICY_WRITE_BACK_GOOD_BBU = "write-back-good-bbu"
    _REQUESTED_WRITE_CACHE_POLICY_WRITE_THROUGH = "write-through"
    STRIP_SIZE_ = ""
    STRIP_SIZE_1024K = "1024k"
    STRIP_SIZE_128K = "128k"
    STRIP_SIZE_16K = "16k"
    STRIP_SIZE_256K = "256k"
    STRIP_SIZE_32K = "32k"
    STRIP_SIZE_512K = "512k"
    STRIP_SIZE_64K = "64k"
    STRIP_SIZE_8K = "8k"
    ADMIN_ACTION_HIDE_VIRTUAL_DRIVE = "hide-virtual-drive"
    ADMIN_ACTION_UNHIDE_VIRTUAL_DRIVE = "unhide-virtual-drive"
end


class StorageVirtualDrive < ManagedObject
    #This is StorageVirtualDrive class.

    @@consts = StorageVirtualDriveConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageVirtualDrive", "storageVirtualDrive", "vd-[id]", VersionMeta::VERSION151F, "InputOutput", 0x7fff, [], ["admin", "read-only", "user"], ["Get", "Remove", "Set"]),
        "modular" => MoMeta.new("StorageVirtualDrive", "storageVirtualDrive", "vd-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x7fff, [], ["admin", "read-only", "user"], ["Get", "Remove", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "access_policy" => MoPropertyMeta.new("access_policy", "accessPolicy", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["", "Transport Ready", "blocked", "default", "hidden", "read-only", "read-write"], []), 
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x4, 0, 510, nil, ["cancel-initialization", "clear-transport-ready", "enable-self-encrypt", "reconstruct-virtual-drive", "set-boot-drive", "set-transport-ready", "start-fast-initialization", "start-full-initialization"], []), 
        "allow_background_init" => MoPropertyMeta.new("allow_background_init", "allowBackgroundInit", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "auto_delete_oldest" => MoPropertyMeta.new("auto_delete_oldest", "autoDeleteOldest", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "auto_snapshot" => MoPropertyMeta.new("auto_snapshot", "autoSnapshot", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "boot_drive" => MoPropertyMeta.new("boot_drive", "bootDrive", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "cache_policy" => MoPropertyMeta.new("cache_policy", "cachePolicy", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "cached-io", "default", "direct-io"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "current_write_cache_policy" => MoPropertyMeta.new("current_write_cache_policy", "currentWriteCachePolicy", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "disk_cache_policy" => MoPropertyMeta.new("disk_cache_policy", "diskCachePolicy", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "default", "disabled", "enabled", "unchanged"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "drive_state" => MoPropertyMeta.new("drive_state", "driveState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "drives_per_span" => MoPropertyMeta.new("drives_per_span", "drivesPerSpan", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "hotspare_action" => MoPropertyMeta.new("hotspare_action", "hotspareAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 510, nil, ["exclude-all", "include-all", "include-dhsp"], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x80, 0, 510, nil, [], ["0-4294967295"]), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "physical_drives_list" => MoPropertyMeta.new("physical_drives_list", "physicalDrivesList", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x100, 1, 510, %q{(\d+(,\d+)*)}, [], []), 
        "raid_level" => MoPropertyMeta.new("raid_level", "raidLevel", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, 0, 510, nil, ["0", "1", "5", "6"], []), 
        "read_policy" => MoPropertyMeta.new("read_policy", "readPolicy", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "always-read-ahead", "default", "no-read-ahead"], []), 
        "requested_write_cache_policy" => MoPropertyMeta.new("requested_write_cache_policy", "requestedWriteCachePolicy", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x800, 0, 510, nil, ["Always Write Back", "Write Back Good BBU", "Write Through", "always-write-back", "default", "write-back-good-bbu", "write-through"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x1000, 0, 255, nil, [], []), 
        "size" => MoPropertyMeta.new("size", "size", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "span_depth" => MoPropertyMeta.new("span_depth", "spanDepth", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "strip_size" => MoPropertyMeta.new("strip_size", "stripSize", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["", "1024k", "128k", "16k", "256k", "32k", "512k", "64k", "8k"], []), 
        "target_id" => MoPropertyMeta.new("target_id", "targetId", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "vd_status" => MoPropertyMeta.new("vd_status", "vdStatus", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "virtual_drive_name" => MoPropertyMeta.new("virtual_drive_name", "virtualDriveName", "string", VersionMeta::VERSION208D, MoPropertyMeta::READ_ONLY, 0x4000, 0, 15, nil, [], []), 
        "write_cache_policy" => MoPropertyMeta.new("write_cache_policy", "writeCachePolicy", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "fde_capable" => MoPropertyMeta.new("fde_capable", "fdeCapable", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "fde_enabled" => MoPropertyMeta.new("fde_enabled", "fdeEnabled", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        },

        "modular" => {
            "access_policy" => MoPropertyMeta.new("access_policy", "accessPolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["blocked", "read-only", "read-write"], []), 
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 510, nil, ["cancel-initialization", "clear-transport-ready", "hide-virtual-drive", "reconstruct-virtual-drive", "set-boot-drive", "set-transport-ready", "start-fast-initialization", "start-full-initialization", "unhide-virtual-drive"], []), 
            "allow_background_init" => MoPropertyMeta.new("allow_background_init", "allowBackgroundInit", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "auto_delete_oldest" => MoPropertyMeta.new("auto_delete_oldest", "autoDeleteOldest", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "auto_snapshot" => MoPropertyMeta.new("auto_snapshot", "autoSnapshot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "boot_drive" => MoPropertyMeta.new("boot_drive", "bootDrive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "cache_policy" => MoPropertyMeta.new("cache_policy", "cachePolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, ["cached-io", "direct-io"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "current_write_cache_policy" => MoPropertyMeta.new("current_write_cache_policy", "currentWriteCachePolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "disk_cache_policy" => MoPropertyMeta.new("disk_cache_policy", "diskCachePolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 510, nil, ["disabled", "enabled", "unchanged"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "drive_state" => MoPropertyMeta.new("drive_state", "driveState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "drives_per_span" => MoPropertyMeta.new("drives_per_span", "drivesPerSpan", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "hotspare_action" => MoPropertyMeta.new("hotspare_action", "hotspareAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 510, nil, ["exclude-all", "include-all", "include-dhsp"], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x80, 0, 510, nil, [], ["0-4294967295"]), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "physical_drives_list" => MoPropertyMeta.new("physical_drives_list", "physicalDrivesList", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 1, 510, %q{(\d+(,\d+)*)}, [], []), 
            "raid_level" => MoPropertyMeta.new("raid_level", "raidLevel", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 0, 510, nil, ["0", "1", "5", "6"], []), 
            "read_policy" => MoPropertyMeta.new("read_policy", "readPolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x400, nil, nil, nil, ["always-read-ahead", "no-read-ahead"], []), 
            "requested_write_cache_policy" => MoPropertyMeta.new("requested_write_cache_policy", "requestedWriteCachePolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, 0, 510, nil, ["Always Write Back", "Write Back Good BBU", "Write Through", "default"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, 0, 255, nil, [], []), 
            "size" => MoPropertyMeta.new("size", "size", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "span_depth" => MoPropertyMeta.new("span_depth", "spanDepth", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "strip_size" => MoPropertyMeta.new("strip_size", "stripSize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "target_id" => MoPropertyMeta.new("target_id", "targetId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "vd_status" => MoPropertyMeta.new("vd_status", "vdStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "virtual_drive_name" => MoPropertyMeta.new("virtual_drive_name", "virtualDriveName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4000, 0, 15, nil, [], []), 
            "write_cache_policy" => MoPropertyMeta.new("write_cache_policy", "writeCachePolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "read_ahead_policy" => MoPropertyMeta.new("read_ahead_policy", "readAheadPolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "accessPolicy" => "access_policy", 
        "adminAction" => "admin_action", 
        "allowBackgroundInit" => "allow_background_init", 
        "autoDeleteOldest" => "auto_delete_oldest", 
        "autoSnapshot" => "auto_snapshot", 
        "bootDrive" => "boot_drive", 
        "cachePolicy" => "cache_policy", 
        "childAction" => "child_action", 
        "currentWriteCachePolicy" => "current_write_cache_policy", 
        "diskCachePolicy" => "disk_cache_policy", 
        "dn" => "dn", 
        "driveState" => "drive_state", 
        "drivesPerSpan" => "drives_per_span", 
        "health" => "health", 
        "hotspareAction" => "hotspare_action", 
        "id" => "id", 
        "name" => "name", 
        "physicalDrivesList" => "physical_drives_list", 
        "raidLevel" => "raid_level", 
        "readPolicy" => "read_policy", 
        "requestedWriteCachePolicy" => "requested_write_cache_policy", 
        "rn" => "rn", 
        "size" => "size", 
        "spanDepth" => "span_depth", 
        "status" => "status", 
        "stripSize" => "strip_size", 
        "targetId" => "target_id", 
        "vdStatus" => "vd_status", 
        "virtualDriveName" => "virtual_drive_name", 
        "writeCachePolicy" => "write_cache_policy", 
        "fdeCapable" => "fde_capable", 
        "fdeEnabled" => "fde_enabled", 
        },

        "modular" => {
            "accessPolicy" => "access_policy", 
            "adminAction" => "admin_action", 
            "allowBackgroundInit" => "allow_background_init", 
            "autoDeleteOldest" => "auto_delete_oldest", 
            "autoSnapshot" => "auto_snapshot", 
            "bootDrive" => "boot_drive", 
            "cachePolicy" => "cache_policy", 
            "childAction" => "child_action", 
            "currentWriteCachePolicy" => "current_write_cache_policy", 
            "diskCachePolicy" => "disk_cache_policy", 
            "dn" => "dn", 
            "driveState" => "drive_state", 
            "drivesPerSpan" => "drives_per_span", 
            "health" => "health", 
            "hotspareAction" => "hotspare_action", 
            "id" => "id", 
            "name" => "name", 
            "physicalDrivesList" => "physical_drives_list", 
            "raidLevel" => "raid_level", 
            "readPolicy" => "read_policy", 
            "requestedWriteCachePolicy" => "requested_write_cache_policy", 
            "rn" => "rn", 
            "size" => "size", 
            "spanDepth" => "span_depth", 
            "status" => "status", 
            "stripSize" => "strip_size", 
            "targetId" => "target_id", 
            "vdStatus" => "vd_status", 
            "virtualDriveName" => "virtual_drive_name", 
            "writeCachePolicy" => "write_cache_policy", 
            "readAheadPolicy" => "read_ahead_policy", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :access_policy
    attr_accessor :admin_action
    attr_reader :allow_background_init
    attr_reader :auto_delete_oldest
    attr_reader :auto_snapshot
    attr_reader :boot_drive
    attr_accessor :cache_policy
    attr_reader :child_action
    attr_reader :current_write_cache_policy
    attr_accessor :disk_cache_policy
    attr_reader :drive_state
    attr_reader :drives_per_span
    attr_reader :health
    attr_accessor :hotspare_action
    attr_reader :name
    attr_accessor :physical_drives_list
    attr_accessor :raid_level
    attr_accessor :read_policy
    attr_accessor :requested_write_cache_policy
    attr_reader :size
    attr_reader :span_depth
    attr_accessor :status
    attr_reader :strip_size
    attr_reader :target_id
    attr_reader :vd_status
    attr_reader :virtual_drive_name
    attr_reader :write_cache_policy
    attr_reader :fde_capable
    attr_reader :fde_enabled


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @access_policy = nil
        @admin_action = nil
        @allow_background_init = nil
        @auto_delete_oldest = nil
        @auto_snapshot = nil
        @boot_drive = nil
        @cache_policy = nil
        @child_action = nil
        @current_write_cache_policy = nil
        @disk_cache_policy = nil
        @drive_state = nil
        @drives_per_span = nil
        @health = nil
        @hotspare_action = nil
        @name = nil
        @physical_drives_list = nil
        @raid_level = nil
        @read_policy = nil
        @requested_write_cache_policy = nil
        @size = nil
        @span_depth = nil
        @status = nil
        @strip_size = nil
        @target_id = nil
        @vd_status = nil
        @virtual_drive_name = nil
        @write_cache_policy = nil
        @fde_capable = nil
        @fde_enabled = nil
        @read_ahead_policy = nil

        super(class_id: "StorageVirtualDrive", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
