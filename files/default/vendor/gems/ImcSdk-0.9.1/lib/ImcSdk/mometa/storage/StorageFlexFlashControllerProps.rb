#This module contains the general information for StorageFlexFlashControllerProps ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageFlexFlashControllerPropsConsts
    
end


class StorageFlexFlashControllerProps < ManagedObject
    #This is StorageFlexFlashControllerProps class.

    @@consts = StorageFlexFlashControllerPropsConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageFlexFlashControllerProps", "storageFlexFlashControllerProps", "flexflashcontroller-props", VersionMeta::VERSION202C, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("StorageFlexFlashControllerProps", "storageFlexFlashControllerProps", "flexflashcontroller-props", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "auto_sync" => MoPropertyMeta.new("auto_sync", "autoSync", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "card_slot" => MoPropertyMeta.new("card_slot", "cardSlot", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "cards_manageable" => MoPropertyMeta.new("cards_manageable", "cardsManageable", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "configured_mode" => MoPropertyMeta.new("configured_mode", "configuredMode", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "controller_name" => MoPropertyMeta.new("controller_name", "controllerName", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "controller_status" => MoPropertyMeta.new("controller_status", "controllerStatus", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "fw_version" => MoPropertyMeta.new("fw_version", "fwVersion", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "internal_state" => MoPropertyMeta.new("internal_state", "internalState", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "non_util_partition_name" => MoPropertyMeta.new("non_util_partition_name", "nonUtilPartitionName", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "operating_mode" => MoPropertyMeta.new("operating_mode", "operatingMode", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "partition_name" => MoPropertyMeta.new("partition_name", "partitionName", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "physical_drive_count" => MoPropertyMeta.new("physical_drive_count", "physicalDriveCount", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "product_name" => MoPropertyMeta.new("product_name", "productName", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "running_fw_version" => MoPropertyMeta.new("running_fw_version", "runningFwVersion", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "startup_fw_version" => MoPropertyMeta.new("startup_fw_version", "startupFwVersion", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "virtual_drive_count" => MoPropertyMeta.new("virtual_drive_count", "virtualDriveCount", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "auto_sync" => MoPropertyMeta.new("auto_sync", "autoSync", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "card_slot" => MoPropertyMeta.new("card_slot", "cardSlot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "cards_manageable" => MoPropertyMeta.new("cards_manageable", "cardsManageable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "configured_mode" => MoPropertyMeta.new("configured_mode", "configuredMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "controller_name" => MoPropertyMeta.new("controller_name", "controllerName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "controller_status" => MoPropertyMeta.new("controller_status", "controllerStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "fw_version" => MoPropertyMeta.new("fw_version", "fwVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "internal_state" => MoPropertyMeta.new("internal_state", "internalState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "non_util_partition_name" => MoPropertyMeta.new("non_util_partition_name", "nonUtilPartitionName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "operating_mode" => MoPropertyMeta.new("operating_mode", "operatingMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "partition_name" => MoPropertyMeta.new("partition_name", "partitionName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "physical_drive_count" => MoPropertyMeta.new("physical_drive_count", "physicalDriveCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "product_name" => MoPropertyMeta.new("product_name", "productName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "running_fw_version" => MoPropertyMeta.new("running_fw_version", "runningFwVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "startup_fw_version" => MoPropertyMeta.new("startup_fw_version", "startupFwVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "virtual_drive_count" => MoPropertyMeta.new("virtual_drive_count", "virtualDriveCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "autoSync" => "auto_sync", 
        "cardSlot" => "card_slot", 
        "cardsManageable" => "cards_manageable", 
        "childAction" => "child_action", 
        "configuredMode" => "configured_mode", 
        "controllerName" => "controller_name", 
        "controllerStatus" => "controller_status", 
        "dn" => "dn", 
        "fwVersion" => "fw_version", 
        "health" => "health", 
        "internalState" => "internal_state", 
        "nonUtilPartitionName" => "non_util_partition_name", 
        "operatingMode" => "operating_mode", 
        "partitionName" => "partition_name", 
        "physicalDriveCount" => "physical_drive_count", 
        "productName" => "product_name", 
        "rn" => "rn", 
        "runningFwVersion" => "running_fw_version", 
        "startupFwVersion" => "startup_fw_version", 
        "status" => "status", 
        "vendor" => "vendor", 
        "virtualDriveCount" => "virtual_drive_count", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "autoSync" => "auto_sync", 
            "cardSlot" => "card_slot", 
            "cardsManageable" => "cards_manageable", 
            "childAction" => "child_action", 
            "configuredMode" => "configured_mode", 
            "controllerName" => "controller_name", 
            "controllerStatus" => "controller_status", 
            "dn" => "dn", 
            "fwVersion" => "fw_version", 
            "health" => "health", 
            "internalState" => "internal_state", 
            "nonUtilPartitionName" => "non_util_partition_name", 
            "operatingMode" => "operating_mode", 
            "partitionName" => "partition_name", 
            "physicalDriveCount" => "physical_drive_count", 
            "productName" => "product_name", 
            "rn" => "rn", 
            "runningFwVersion" => "running_fw_version", 
            "startupFwVersion" => "startup_fw_version", 
            "status" => "status", 
            "vendor" => "vendor", 
            "virtualDriveCount" => "virtual_drive_count", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :admin_action
    attr_reader :auto_sync
    attr_reader :card_slot
    attr_reader :cards_manageable
    attr_reader :child_action
    attr_reader :configured_mode
    attr_reader :controller_name
    attr_reader :controller_status
    attr_reader :fw_version
    attr_reader :health
    attr_reader :internal_state
    attr_reader :non_util_partition_name
    attr_reader :operating_mode
    attr_reader :partition_name
    attr_reader :physical_drive_count
    attr_reader :product_name
    attr_reader :running_fw_version
    attr_reader :startup_fw_version
    attr_reader :status
    attr_reader :vendor
    attr_reader :virtual_drive_count


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_action = nil
        @auto_sync = nil
        @card_slot = nil
        @cards_manageable = nil
        @child_action = nil
        @configured_mode = nil
        @controller_name = nil
        @controller_status = nil
        @fw_version = nil
        @health = nil
        @internal_state = nil
        @non_util_partition_name = nil
        @operating_mode = nil
        @partition_name = nil
        @physical_drive_count = nil
        @product_name = nil
        @running_fw_version = nil
        @startup_fw_version = nil
        @status = nil
        @vendor = nil
        @virtual_drive_count = nil

        super(class_id: "StorageFlexFlashControllerProps", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
