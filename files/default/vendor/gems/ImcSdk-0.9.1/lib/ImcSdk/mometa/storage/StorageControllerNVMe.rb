#This module contains the general information for StorageControllerNVMe ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageControllerNVMeConsts
    
end


class StorageControllerNVMe < ManagedObject
    #This is StorageControllerNVMe class.

    @@consts = StorageControllerNVMeConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageControllerNVMe", "storageControllerNVMe", "storage-NVMe-[id]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("StorageControllerNVMe", "storageControllerNVMe", "storage-NVMe-[id]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "controller_chip_temp_celsius" => MoPropertyMeta.new("controller_chip_temp_celsius", "controllerChipTempCelsius", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "controller_status" => MoPropertyMeta.new("controller_status", "controllerStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "drive_life_used" => MoPropertyMeta.new("drive_life_used", "driveLifeUsed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "led_fault_status" => MoPropertyMeta.new("led_fault_status", "ledFaultStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "percentage_total_power_on_hour" => MoPropertyMeta.new("percentage_total_power_on_hour", "percentageTotalPowerOnHour", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "performance_level" => MoPropertyMeta.new("performance_level", "performanceLevel", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "controller_chip_temp_celsius" => MoPropertyMeta.new("controller_chip_temp_celsius", "controllerChipTempCelsius", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "controller_status" => MoPropertyMeta.new("controller_status", "controllerStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "drive_life_used" => MoPropertyMeta.new("drive_life_used", "driveLifeUsed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "led_fault_status" => MoPropertyMeta.new("led_fault_status", "ledFaultStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "percentage_total_power_on_hour" => MoPropertyMeta.new("percentage_total_power_on_hour", "percentageTotalPowerOnHour", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "performance_level" => MoPropertyMeta.new("performance_level", "performanceLevel", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "controllerChipTempCelsius" => "controller_chip_temp_celsius", 
        "controllerStatus" => "controller_status", 
        "dn" => "dn", 
        "driveLifeUsed" => "drive_life_used", 
        "health" => "health", 
        "id" => "id", 
        "ledFaultStatus" => "led_fault_status", 
        "model" => "model", 
        "percentageTotalPowerOnHour" => "percentage_total_power_on_hour", 
        "performanceLevel" => "performance_level", 
        "rn" => "rn", 
        "serial" => "serial", 
        "status" => "status", 
        "vendor" => "vendor", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "controllerChipTempCelsius" => "controller_chip_temp_celsius", 
            "controllerStatus" => "controller_status", 
            "dn" => "dn", 
            "driveLifeUsed" => "drive_life_used", 
            "health" => "health", 
            "id" => "id", 
            "ledFaultStatus" => "led_fault_status", 
            "model" => "model", 
            "percentageTotalPowerOnHour" => "percentage_total_power_on_hour", 
            "performanceLevel" => "performance_level", 
            "rn" => "rn", 
            "serial" => "serial", 
            "status" => "status", 
            "vendor" => "vendor", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_reader :child_action
    attr_reader :controller_chip_temp_celsius
    attr_reader :controller_status
    attr_reader :drive_life_used
    attr_reader :health
    attr_reader :led_fault_status
    attr_reader :model
    attr_reader :percentage_total_power_on_hour
    attr_reader :performance_level
    attr_reader :serial
    attr_reader :status
    attr_reader :vendor


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @child_action = nil
        @controller_chip_temp_celsius = nil
        @controller_status = nil
        @drive_life_used = nil
        @health = nil
        @led_fault_status = nil
        @model = nil
        @percentage_total_power_on_hour = nil
        @performance_level = nil
        @serial = nil
        @status = nil
        @vendor = nil

        super(class_id: "StorageControllerNVMe", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
