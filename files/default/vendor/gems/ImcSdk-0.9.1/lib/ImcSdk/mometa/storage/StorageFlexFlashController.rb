#This module contains the general information for StorageFlexFlashController ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageFlexFlashControllerConsts
    ADMIN_ACTION_CONFIGURE_CARDS = "configure-cards"
    ADMIN_ACTION_CONFIGURE_FIRMWARE_MODE = "configure-firmware-mode"
    ADMIN_ACTION_RESET_FLEXFLASH_CONTROLLER = "reset-flexflash-controller"
    ADMIN_ACTION_RESET_PARTITION_DEFAULT = "reset-partition-default"
    ADMIN_ACTION_SYNC_CARD_CONFIGURATION = "sync-card-configuration"
    CARD_SLOT_NONE = "none"
    CARD_SLOT_SLOT_1 = "slot-1"
    CARD_SLOT_SLOT_2 = "slot-2"
    CONFIGURED_MODE_MIRROR = "mirror"
    CONFIGURED_MODE_UTIL = "util"
end


class StorageFlexFlashController < ManagedObject
    #This is StorageFlexFlashController class.

    @@consts = StorageFlexFlashControllerConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageFlexFlashController", "storageFlexFlashController", "storage-flexflash-[id]", VersionMeta::VERSION202C, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("StorageFlexFlashController", "storageFlexFlashController", "storage-flexflash-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["configure-cards", "configure-firmware-mode", "reset-flexflash-controller", "reset-partition-default", "sync-card-configuration"], []), 
        "auto_sync" => MoPropertyMeta.new("auto_sync", "autoSync", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "card_slot" => MoPropertyMeta.new("card_slot", "cardSlot", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, ["none", "slot-1", "slot-2"], []), 
        "cards_manageable" => MoPropertyMeta.new("cards_manageable", "cardsManageable", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "configured_mode" => MoPropertyMeta.new("configured_mode", "configuredMode", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x10, nil, nil, nil, ["mirror", "util"], []), 
        "controller_status" => MoPropertyMeta.new("controller_status", "controllerStatus", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "fw_version" => MoPropertyMeta.new("fw_version", "fwVersion", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION202C, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
        "internal_state" => MoPropertyMeta.new("internal_state", "internalState", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "non_util_partition_name" => MoPropertyMeta.new("non_util_partition_name", "nonUtilPartitionName", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x40, 0, 510, nil, [], []), 
        "partition_name" => MoPropertyMeta.new("partition_name", "partitionName", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x80, 0, 510, nil, [], []), 
        "product_name" => MoPropertyMeta.new("product_name", "productName", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
        "running_fw_version" => MoPropertyMeta.new("running_fw_version", "runningFwVersion", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "startup_fw_version" => MoPropertyMeta.new("startup_fw_version", "startupFwVersion", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["configure-cards", "configure-firmware-mode", "reset-flexflash-controller", "reset-partition-default", "sync-card-configuration"], []), 
            "auto_sync" => MoPropertyMeta.new("auto_sync", "autoSync", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "card_slot" => MoPropertyMeta.new("card_slot", "cardSlot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, ["none", "slot-1", "slot-2"], []), 
            "cards_manageable" => MoPropertyMeta.new("cards_manageable", "cardsManageable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "configured_mode" => MoPropertyMeta.new("configured_mode", "configuredMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x10, nil, nil, nil, ["mirror", "util"], []), 
            "controller_status" => MoPropertyMeta.new("controller_status", "controllerStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "fw_version" => MoPropertyMeta.new("fw_version", "fwVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
            "internal_state" => MoPropertyMeta.new("internal_state", "internalState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "non_util_partition_name" => MoPropertyMeta.new("non_util_partition_name", "nonUtilPartitionName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 510, nil, [], []), 
            "partition_name" => MoPropertyMeta.new("partition_name", "partitionName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, 0, 510, nil, [], []), 
            "product_name" => MoPropertyMeta.new("product_name", "productName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
            "running_fw_version" => MoPropertyMeta.new("running_fw_version", "runningFwVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "startup_fw_version" => MoPropertyMeta.new("startup_fw_version", "startupFwVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
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
        "controllerStatus" => "controller_status", 
        "dn" => "dn", 
        "fwVersion" => "fw_version", 
        "health" => "health", 
        "id" => "id", 
        "internalState" => "internal_state", 
        "nonUtilPartitionName" => "non_util_partition_name", 
        "partitionName" => "partition_name", 
        "productName" => "product_name", 
        "rn" => "rn", 
        "runningFwVersion" => "running_fw_version", 
        "startupFwVersion" => "startup_fw_version", 
        "status" => "status", 
        "vendor" => "vendor", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "autoSync" => "auto_sync", 
            "cardSlot" => "card_slot", 
            "cardsManageable" => "cards_manageable", 
            "childAction" => "child_action", 
            "configuredMode" => "configured_mode", 
            "controllerStatus" => "controller_status", 
            "dn" => "dn", 
            "fwVersion" => "fw_version", 
            "health" => "health", 
            "id" => "id", 
            "internalState" => "internal_state", 
            "nonUtilPartitionName" => "non_util_partition_name", 
            "partitionName" => "partition_name", 
            "productName" => "product_name", 
            "rn" => "rn", 
            "runningFwVersion" => "running_fw_version", 
            "startupFwVersion" => "startup_fw_version", 
            "status" => "status", 
            "vendor" => "vendor", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :admin_action
    attr_accessor :auto_sync
    attr_accessor :card_slot
    attr_reader :cards_manageable
    attr_reader :child_action
    attr_reader :configured_mode
    attr_reader :controller_status
    attr_reader :fw_version
    attr_reader :health
    attr_reader :internal_state
    attr_accessor :non_util_partition_name
    attr_accessor :partition_name
    attr_reader :product_name
    attr_reader :running_fw_version
    attr_reader :startup_fw_version
    attr_accessor :status
    attr_reader :vendor


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @admin_action = nil
        @auto_sync = nil
        @card_slot = nil
        @cards_manageable = nil
        @child_action = nil
        @configured_mode = nil
        @controller_status = nil
        @fw_version = nil
        @health = nil
        @internal_state = nil
        @non_util_partition_name = nil
        @partition_name = nil
        @product_name = nil
        @running_fw_version = nil
        @startup_fw_version = nil
        @status = nil
        @vendor = nil

        super(class_id: "StorageFlexFlashController", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
