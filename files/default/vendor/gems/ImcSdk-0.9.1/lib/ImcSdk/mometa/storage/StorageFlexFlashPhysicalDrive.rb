#This module contains the general information for StorageFlexFlashPhysicalDrive ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageFlexFlashPhysicalDriveConsts
    
end


class StorageFlexFlashPhysicalDrive < ManagedObject
    #This is StorageFlexFlashPhysicalDrive class.

    @@consts = StorageFlexFlashPhysicalDriveConsts.new()
#    @@naming_props = set([u'physicalDriveId'])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageFlexFlashPhysicalDrive", "storageFlexFlashPhysicalDrive", "card-[physical_drive_id]", VersionMeta::VERSION202C, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("StorageFlexFlashPhysicalDrive", "storageFlexFlashPhysicalDrive", "card-[physical_drive_id]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "block_size" => MoPropertyMeta.new("block_size", "blockSize", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "capacity" => MoPropertyMeta.new("capacity", "capacity", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "card_mode" => MoPropertyMeta.new("card_mode", "cardMode", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "card_status" => MoPropertyMeta.new("card_status", "cardStatus", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "card_type" => MoPropertyMeta.new("card_type", "cardType", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "controller" => MoPropertyMeta.new("controller", "controller", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "drives_enabled" => MoPropertyMeta.new("drives_enabled", "drivesEnabled", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "manufacturer_date" => MoPropertyMeta.new("manufacturer_date", "manufacturerDate", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "manufacturer_id" => MoPropertyMeta.new("manufacturer_id", "manufacturerId", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "oem_id" => MoPropertyMeta.new("oem_id", "oemId", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "partition_count" => MoPropertyMeta.new("partition_count", "partitionCount", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "password_protected" => MoPropertyMeta.new("password_protected", "passwordProtected", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pd_status" => MoPropertyMeta.new("pd_status", "pdStatus", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "physical_drive" => MoPropertyMeta.new("physical_drive", "physicalDrive", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "physical_drive_id" => MoPropertyMeta.new("physical_drive_id", "physicalDriveId", "string", VersionMeta::VERSION202C, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "product_name" => MoPropertyMeta.new("product_name", "productName", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "product_revision" => MoPropertyMeta.new("product_revision", "productRevision", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "raid_role" => MoPropertyMeta.new("raid_role", "raidRole", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "read_error_count" => MoPropertyMeta.new("read_error_count", "readErrorCount", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "read_error_threshold" => MoPropertyMeta.new("read_error_threshold", "readErrorThreshold", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "serial_number" => MoPropertyMeta.new("serial_number", "serialNumber", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "signature" => MoPropertyMeta.new("signature", "signature", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "slot_number" => MoPropertyMeta.new("slot_number", "slotNumber", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "sync_mode" => MoPropertyMeta.new("sync_mode", "syncMode", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "write_enabled" => MoPropertyMeta.new("write_enabled", "writeEnabled", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "write_error_count" => MoPropertyMeta.new("write_error_count", "writeErrorCount", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "write_error_threshold" => MoPropertyMeta.new("write_error_threshold", "writeErrorThreshold", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "block_size" => MoPropertyMeta.new("block_size", "blockSize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "capacity" => MoPropertyMeta.new("capacity", "capacity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "card_mode" => MoPropertyMeta.new("card_mode", "cardMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "card_status" => MoPropertyMeta.new("card_status", "cardStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "card_type" => MoPropertyMeta.new("card_type", "cardType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "controller" => MoPropertyMeta.new("controller", "controller", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "drives_enabled" => MoPropertyMeta.new("drives_enabled", "drivesEnabled", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "manufacturer_date" => MoPropertyMeta.new("manufacturer_date", "manufacturerDate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "manufacturer_id" => MoPropertyMeta.new("manufacturer_id", "manufacturerId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "oem_id" => MoPropertyMeta.new("oem_id", "oemId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "partition_count" => MoPropertyMeta.new("partition_count", "partitionCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "password_protected" => MoPropertyMeta.new("password_protected", "passwordProtected", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pd_status" => MoPropertyMeta.new("pd_status", "pdStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "physical_drive" => MoPropertyMeta.new("physical_drive", "physicalDrive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "physical_drive_id" => MoPropertyMeta.new("physical_drive_id", "physicalDriveId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "product_name" => MoPropertyMeta.new("product_name", "productName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "product_revision" => MoPropertyMeta.new("product_revision", "productRevision", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "raid_role" => MoPropertyMeta.new("raid_role", "raidRole", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "read_error_count" => MoPropertyMeta.new("read_error_count", "readErrorCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "read_error_threshold" => MoPropertyMeta.new("read_error_threshold", "readErrorThreshold", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "serial_number" => MoPropertyMeta.new("serial_number", "serialNumber", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "signature" => MoPropertyMeta.new("signature", "signature", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "slot_number" => MoPropertyMeta.new("slot_number", "slotNumber", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "sync_mode" => MoPropertyMeta.new("sync_mode", "syncMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "write_enabled" => MoPropertyMeta.new("write_enabled", "writeEnabled", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "write_error_count" => MoPropertyMeta.new("write_error_count", "writeErrorCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "write_error_threshold" => MoPropertyMeta.new("write_error_threshold", "writeErrorThreshold", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "blockSize" => "block_size", 
        "capacity" => "capacity", 
        "cardMode" => "card_mode", 
        "cardStatus" => "card_status", 
        "cardType" => "card_type", 
        "childAction" => "child_action", 
        "controller" => "controller", 
        "dn" => "dn", 
        "drivesEnabled" => "drives_enabled", 
        "health" => "health", 
        "manufacturerDate" => "manufacturer_date", 
        "manufacturerId" => "manufacturer_id", 
        "oemId" => "oem_id", 
        "partitionCount" => "partition_count", 
        "passwordProtected" => "password_protected", 
        "pdStatus" => "pd_status", 
        "physicalDrive" => "physical_drive", 
        "physicalDriveId" => "physical_drive_id", 
        "productName" => "product_name", 
        "productRevision" => "product_revision", 
        "raidRole" => "raid_role", 
        "readErrorCount" => "read_error_count", 
        "readErrorThreshold" => "read_error_threshold", 
        "rn" => "rn", 
        "serialNumber" => "serial_number", 
        "signature" => "signature", 
        "slotNumber" => "slot_number", 
        "status" => "status", 
        "syncMode" => "sync_mode", 
        "writeEnabled" => "write_enabled", 
        "writeErrorCount" => "write_error_count", 
        "writeErrorThreshold" => "write_error_threshold", 
        },

        "modular" => {
            "blockSize" => "block_size", 
            "capacity" => "capacity", 
            "cardMode" => "card_mode", 
            "cardStatus" => "card_status", 
            "cardType" => "card_type", 
            "childAction" => "child_action", 
            "controller" => "controller", 
            "dn" => "dn", 
            "drivesEnabled" => "drives_enabled", 
            "health" => "health", 
            "manufacturerDate" => "manufacturer_date", 
            "manufacturerId" => "manufacturer_id", 
            "oemId" => "oem_id", 
            "partitionCount" => "partition_count", 
            "passwordProtected" => "password_protected", 
            "pdStatus" => "pd_status", 
            "physicalDrive" => "physical_drive", 
            "physicalDriveId" => "physical_drive_id", 
            "productName" => "product_name", 
            "productRevision" => "product_revision", 
            "raidRole" => "raid_role", 
            "readErrorCount" => "read_error_count", 
            "readErrorThreshold" => "read_error_threshold", 
            "rn" => "rn", 
            "serialNumber" => "serial_number", 
            "signature" => "signature", 
            "slotNumber" => "slot_number", 
            "status" => "status", 
            "syncMode" => "sync_mode", 
            "writeEnabled" => "write_enabled", 
            "writeErrorCount" => "write_error_count", 
            "writeErrorThreshold" => "write_error_threshold", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :physical_drive_id
    attr_reader :block_size
    attr_reader :capacity
    attr_reader :card_mode
    attr_reader :card_status
    attr_reader :card_type
    attr_reader :child_action
    attr_reader :controller
    attr_reader :drives_enabled
    attr_reader :health
    attr_reader :manufacturer_date
    attr_reader :manufacturer_id
    attr_reader :oem_id
    attr_reader :partition_count
    attr_reader :password_protected
    attr_reader :pd_status
    attr_reader :physical_drive
    attr_reader :product_name
    attr_reader :product_revision
    attr_reader :raid_role
    attr_reader :read_error_count
    attr_reader :read_error_threshold
    attr_reader :serial_number
    attr_reader :signature
    attr_reader :slot_number
    attr_reader :status
    attr_reader :sync_mode
    attr_reader :write_enabled
    attr_reader :write_error_count
    attr_reader :write_error_threshold


    def initialize(parent_mo_or_dn: nil,physical_drive_id: nil,  **kwargs)
        @dirty_mask = 0
        @physical_drive_id = physical_drive_id
        @block_size = nil
        @capacity = nil
        @card_mode = nil
        @card_status = nil
        @card_type = nil
        @child_action = nil
        @controller = nil
        @drives_enabled = nil
        @health = nil
        @manufacturer_date = nil
        @manufacturer_id = nil
        @oem_id = nil
        @partition_count = nil
        @password_protected = nil
        @pd_status = nil
        @physical_drive = nil
        @product_name = nil
        @product_revision = nil
        @raid_role = nil
        @read_error_count = nil
        @read_error_threshold = nil
        @serial_number = nil
        @signature = nil
        @slot_number = nil
        @status = nil
        @sync_mode = nil
        @write_enabled = nil
        @write_error_count = nil
        @write_error_threshold = nil

        super(class_id: "StorageFlexFlashPhysicalDrive", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
