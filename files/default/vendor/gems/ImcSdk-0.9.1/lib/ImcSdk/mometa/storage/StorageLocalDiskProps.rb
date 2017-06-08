#This module contains the general information for StorageLocalDiskProps ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageLocalDiskPropsConsts
    
end


class StorageLocalDiskProps < ManagedObject
    #This is StorageLocalDiskProps class.

    @@consts = StorageLocalDiskPropsConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageLocalDiskProps", "storageLocalDiskProps", "general-props", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("StorageLocalDiskProps", "storageLocalDiskProps", "general-props", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "block_count" => MoPropertyMeta.new("block_count", "blockCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "block_size" => MoPropertyMeta.new("block_size", "blockSize", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "boot_drive" => MoPropertyMeta.new("boot_drive", "bootDrive", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "coerced_size" => MoPropertyMeta.new("coerced_size", "coercedSize", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "device_id" => MoPropertyMeta.new("device_id", "deviceId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "enclosure_device_id" => MoPropertyMeta.new("enclosure_device_id", "enclosureDeviceId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "interface_type" => MoPropertyMeta.new("interface_type", "interfaceType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "link_speed" => MoPropertyMeta.new("link_speed", "linkSpeed", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "media_error_count" => MoPropertyMeta.new("media_error_count", "mediaErrorCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "media_type" => MoPropertyMeta.new("media_type", "mediaType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "non_coerced_size" => MoPropertyMeta.new("non_coerced_size", "nonCoercedSize", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "operating_temperature" => MoPropertyMeta.new("operating_temperature", "operatingTemperature", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "other_error_count" => MoPropertyMeta.new("other_error_count", "otherErrorCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pd_status" => MoPropertyMeta.new("pd_status", "pdStatus", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "percentage_life_left" => MoPropertyMeta.new("percentage_life_left", "percentageLifeLeft", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "physical_block_size" => MoPropertyMeta.new("physical_block_size", "physicalBlockSize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "physical_drive" => MoPropertyMeta.new("physical_drive", "physicalDrive", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "power_cycle_count" => MoPropertyMeta.new("power_cycle_count", "powerCycleCount", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "power_on_hours" => MoPropertyMeta.new("power_on_hours", "powerOnHours", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "power_state" => MoPropertyMeta.new("power_state", "powerState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "predictive_failure_count" => MoPropertyMeta.new("predictive_failure_count", "predictiveFailureCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "raw_size" => MoPropertyMeta.new("raw_size", "rawSize", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "sas_address0" => MoPropertyMeta.new("sas_address0", "sasAddress0", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "sas_address1" => MoPropertyMeta.new("sas_address1", "sasAddress1", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "sequence_number" => MoPropertyMeta.new("sequence_number", "sequenceNumber", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "wear_status_in_days" => MoPropertyMeta.new("wear_status_in_days", "wearStatusInDays", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "block_count" => MoPropertyMeta.new("block_count", "blockCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "block_size" => MoPropertyMeta.new("block_size", "blockSize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "boot_drive" => MoPropertyMeta.new("boot_drive", "bootDrive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "coerced_size" => MoPropertyMeta.new("coerced_size", "coercedSize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "device_id" => MoPropertyMeta.new("device_id", "deviceId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "enclosure_device_id" => MoPropertyMeta.new("enclosure_device_id", "enclosureDeviceId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "interface_type" => MoPropertyMeta.new("interface_type", "interfaceType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "link_speed" => MoPropertyMeta.new("link_speed", "linkSpeed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "media_error_count" => MoPropertyMeta.new("media_error_count", "mediaErrorCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "media_type" => MoPropertyMeta.new("media_type", "mediaType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "non_coerced_size" => MoPropertyMeta.new("non_coerced_size", "nonCoercedSize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "operating_temperature" => MoPropertyMeta.new("operating_temperature", "operatingTemperature", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "other_error_count" => MoPropertyMeta.new("other_error_count", "otherErrorCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pd_status" => MoPropertyMeta.new("pd_status", "pdStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "percentage_life_left" => MoPropertyMeta.new("percentage_life_left", "percentageLifeLeft", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "physical_block_size" => MoPropertyMeta.new("physical_block_size", "physicalBlockSize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "physical_drive" => MoPropertyMeta.new("physical_drive", "physicalDrive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "power_cycle_count" => MoPropertyMeta.new("power_cycle_count", "powerCycleCount", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "power_on_hours" => MoPropertyMeta.new("power_on_hours", "powerOnHours", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "power_state" => MoPropertyMeta.new("power_state", "powerState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "predictive_failure_count" => MoPropertyMeta.new("predictive_failure_count", "predictiveFailureCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "raw_size" => MoPropertyMeta.new("raw_size", "rawSize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "sas_address0" => MoPropertyMeta.new("sas_address0", "sasAddress0", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sas_address1" => MoPropertyMeta.new("sas_address1", "sasAddress1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sequence_number" => MoPropertyMeta.new("sequence_number", "sequenceNumber", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "wear_status_in_days" => MoPropertyMeta.new("wear_status_in_days", "wearStatusInDays", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "blockCount" => "block_count", 
        "blockSize" => "block_size", 
        "bootDrive" => "boot_drive", 
        "childAction" => "child_action", 
        "coercedSize" => "coerced_size", 
        "deviceId" => "device_id", 
        "dn" => "dn", 
        "enclosureDeviceId" => "enclosure_device_id", 
        "health" => "health", 
        "interfaceType" => "interface_type", 
        "linkSpeed" => "link_speed", 
        "mediaErrorCount" => "media_error_count", 
        "mediaType" => "media_type", 
        "nonCoercedSize" => "non_coerced_size", 
        "operatingTemperature" => "operating_temperature", 
        "otherErrorCount" => "other_error_count", 
        "pdStatus" => "pd_status", 
        "percentageLifeLeft" => "percentage_life_left", 
        "physicalBlockSize" => "physical_block_size", 
        "physicalDrive" => "physical_drive", 
        "powerCycleCount" => "power_cycle_count", 
        "powerOnHours" => "power_on_hours", 
        "powerState" => "power_state", 
        "predictiveFailureCount" => "predictive_failure_count", 
        "rawSize" => "raw_size", 
        "rn" => "rn", 
        "sasAddress0" => "sas_address0", 
        "sasAddress1" => "sas_address1", 
        "sequenceNumber" => "sequence_number", 
        "status" => "status", 
        "wearStatusInDays" => "wear_status_in_days", 
        },

        "modular" => {
            "blockCount" => "block_count", 
            "blockSize" => "block_size", 
            "bootDrive" => "boot_drive", 
            "childAction" => "child_action", 
            "coercedSize" => "coerced_size", 
            "deviceId" => "device_id", 
            "dn" => "dn", 
            "enclosureDeviceId" => "enclosure_device_id", 
            "health" => "health", 
            "interfaceType" => "interface_type", 
            "linkSpeed" => "link_speed", 
            "mediaErrorCount" => "media_error_count", 
            "mediaType" => "media_type", 
            "nonCoercedSize" => "non_coerced_size", 
            "operatingTemperature" => "operating_temperature", 
            "otherErrorCount" => "other_error_count", 
            "pdStatus" => "pd_status", 
            "percentageLifeLeft" => "percentage_life_left", 
            "physicalBlockSize" => "physical_block_size", 
            "physicalDrive" => "physical_drive", 
            "powerCycleCount" => "power_cycle_count", 
            "powerOnHours" => "power_on_hours", 
            "powerState" => "power_state", 
            "predictiveFailureCount" => "predictive_failure_count", 
            "rawSize" => "raw_size", 
            "rn" => "rn", 
            "sasAddress0" => "sas_address0", 
            "sasAddress1" => "sas_address1", 
            "sequenceNumber" => "sequence_number", 
            "status" => "status", 
            "wearStatusInDays" => "wear_status_in_days", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :block_count
    attr_reader :block_size
    attr_reader :boot_drive
    attr_reader :child_action
    attr_reader :coerced_size
    attr_reader :device_id
    attr_reader :enclosure_device_id
    attr_reader :health
    attr_reader :interface_type
    attr_reader :link_speed
    attr_reader :media_error_count
    attr_reader :media_type
    attr_reader :non_coerced_size
    attr_reader :operating_temperature
    attr_reader :other_error_count
    attr_reader :pd_status
    attr_reader :percentage_life_left
    attr_reader :physical_block_size
    attr_reader :physical_drive
    attr_reader :power_cycle_count
    attr_reader :power_on_hours
    attr_reader :power_state
    attr_reader :predictive_failure_count
    attr_reader :raw_size
    attr_reader :sas_address0
    attr_reader :sas_address1
    attr_reader :sequence_number
    attr_reader :status
    attr_reader :wear_status_in_days


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @block_count = nil
        @block_size = nil
        @boot_drive = nil
        @child_action = nil
        @coerced_size = nil
        @device_id = nil
        @enclosure_device_id = nil
        @health = nil
        @interface_type = nil
        @link_speed = nil
        @media_error_count = nil
        @media_type = nil
        @non_coerced_size = nil
        @operating_temperature = nil
        @other_error_count = nil
        @pd_status = nil
        @percentage_life_left = nil
        @physical_block_size = nil
        @physical_drive = nil
        @power_cycle_count = nil
        @power_on_hours = nil
        @power_state = nil
        @predictive_failure_count = nil
        @raw_size = nil
        @sas_address0 = nil
        @sas_address1 = nil
        @sequence_number = nil
        @status = nil
        @wear_status_in_days = nil

        super(class_id: "StorageLocalDiskProps", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
