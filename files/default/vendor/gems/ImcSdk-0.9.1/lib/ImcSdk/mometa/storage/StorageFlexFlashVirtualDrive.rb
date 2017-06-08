#This module contains the general information for StorageFlexFlashVirtualDrive ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageFlexFlashVirtualDriveConsts
    ADMIN_ACTION_DISABLE_VD = "disable-vd"
    ADMIN_ACTION_ENABLE_VD = "enable-vd"
    ADMIN_ACTION_ERASE_VD = "erase-vd"
    ADMIN_ACTION_SYNC_VD = "sync-vd"
    ADMIN_ACTION_UPDATE_VD = "update-vd"
end


class StorageFlexFlashVirtualDrive < ManagedObject
    #This is StorageFlexFlashVirtualDrive class.

    @@consts = StorageFlexFlashVirtualDriveConsts.new()
#    @@naming_props = set([u'partitionId'])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageFlexFlashVirtualDrive", "storageFlexFlashVirtualDrive", "vd-[partition_id]", VersionMeta::VERSION202C, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("StorageFlexFlashVirtualDrive", "storageFlexFlashVirtualDrive", "vd-[partition_id]", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["disable-vd", "enable-vd", "erase-vd", "sync-vd", "update-vd"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "drive_scope" => MoPropertyMeta.new("drive_scope", "driveScope", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "drive_status" => MoPropertyMeta.new("drive_status", "driveStatus", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "drive_type" => MoPropertyMeta.new("drive_type", "driveType", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "host_accessible" => MoPropertyMeta.new("host_accessible", "hostAccessible", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "last_operation_status" => MoPropertyMeta.new("last_operation_status", "lastOperationStatus", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "operation_in_progress" => MoPropertyMeta.new("operation_in_progress", "operationInProgress", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "partition_id" => MoPropertyMeta.new("partition_id", "partitionId", "string", VersionMeta::VERSION202C, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "size" => MoPropertyMeta.new("size", "size", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "virtual_drive" => MoPropertyMeta.new("virtual_drive", "virtualDrive", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["disable-vd", "enable-vd", "erase-vd", "sync-vd", "update-vd"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "drive_scope" => MoPropertyMeta.new("drive_scope", "driveScope", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "drive_status" => MoPropertyMeta.new("drive_status", "driveStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "drive_type" => MoPropertyMeta.new("drive_type", "driveType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "host_accessible" => MoPropertyMeta.new("host_accessible", "hostAccessible", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "last_operation_status" => MoPropertyMeta.new("last_operation_status", "lastOperationStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "operation_in_progress" => MoPropertyMeta.new("operation_in_progress", "operationInProgress", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "partition_id" => MoPropertyMeta.new("partition_id", "partitionId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "size" => MoPropertyMeta.new("size", "size", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "virtual_drive" => MoPropertyMeta.new("virtual_drive", "virtualDrive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
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
        "driveScope" => "drive_scope", 
        "driveStatus" => "drive_status", 
        "driveType" => "drive_type", 
        "hostAccessible" => "host_accessible", 
        "lastOperationStatus" => "last_operation_status", 
        "operationInProgress" => "operation_in_progress", 
        "partitionId" => "partition_id", 
        "rn" => "rn", 
        "size" => "size", 
        "status" => "status", 
        "virtualDrive" => "virtual_drive", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "driveScope" => "drive_scope", 
            "driveStatus" => "drive_status", 
            "driveType" => "drive_type", 
            "hostAccessible" => "host_accessible", 
            "lastOperationStatus" => "last_operation_status", 
            "operationInProgress" => "operation_in_progress", 
            "partitionId" => "partition_id", 
            "rn" => "rn", 
            "size" => "size", 
            "status" => "status", 
            "virtualDrive" => "virtual_drive", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :partition_id
    attr_accessor :admin_action
    attr_reader :child_action
    attr_reader :drive_scope
    attr_reader :drive_status
    attr_reader :drive_type
    attr_reader :host_accessible
    attr_reader :last_operation_status
    attr_reader :operation_in_progress
    attr_reader :size
    attr_accessor :status
    attr_reader :virtual_drive


    def initialize(parent_mo_or_dn: nil,partition_id: nil,  **kwargs)
        @dirty_mask = 0
        @partition_id = partition_id
        @admin_action = nil
        @child_action = nil
        @drive_scope = nil
        @drive_status = nil
        @drive_type = nil
        @host_accessible = nil
        @last_operation_status = nil
        @operation_in_progress = nil
        @size = nil
        @status = nil
        @virtual_drive = nil

        super(class_id: "StorageFlexFlashVirtualDrive", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
