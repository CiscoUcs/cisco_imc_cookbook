#This module contains the general information for StorageRaidBattery ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageRaidBatteryConsts
    ADMIN_ACTION_DISABLE_AUTO_LEARN = "disable-auto-learn"
    ADMIN_ACTION_ENABLE_AUTO_LEARN = "enable-auto-learn"
    ADMIN_ACTION_START_LEARN_CYCLE = "start-learn-cycle"
end


class StorageRaidBattery < ManagedObject
    #This is StorageRaidBattery class.

    @@consts = StorageRaidBatteryConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageRaidBattery", "storageRaidBattery", "raid-battery", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("StorageRaidBattery", "storageRaidBattery", "raid-battery", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "absolute_state_of_charge" => MoPropertyMeta.new("absolute_state_of_charge", "absoluteStateOfCharge", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["disable-auto-learn", "enable-auto-learn", "start-learn-cycle"], []), 
        "battery_present" => MoPropertyMeta.new("battery_present", "batteryPresent", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "battery_status" => MoPropertyMeta.new("battery_status", "batteryStatus", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "battery_type" => MoPropertyMeta.new("battery_type", "batteryType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "charging_state" => MoPropertyMeta.new("charging_state", "chargingState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "completed_charge_cycles" => MoPropertyMeta.new("completed_charge_cycles", "completedChargeCycles", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "current" => MoPropertyMeta.new("current", "current", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "date_of_manufacture" => MoPropertyMeta.new("date_of_manufacture", "dateOfManufacture", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "design_capacity" => MoPropertyMeta.new("design_capacity", "designCapacity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "design_voltage" => MoPropertyMeta.new("design_voltage", "designVoltage", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "expected_margin_of_error" => MoPropertyMeta.new("expected_margin_of_error", "expectedMarginOfError", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "firmware_version" => MoPropertyMeta.new("firmware_version", "firmwareVersion", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "full_capacity" => MoPropertyMeta.new("full_capacity", "fullCapacity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "learn_cycle_requested" => MoPropertyMeta.new("learn_cycle_requested", "learnCycleRequested", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "learn_cycle_status" => MoPropertyMeta.new("learn_cycle_status", "learnCycleStatus", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "learn_mode" => MoPropertyMeta.new("learn_mode", "learnMode", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "manufacturer" => MoPropertyMeta.new("manufacturer", "manufacturer", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "next_learn_cycle" => MoPropertyMeta.new("next_learn_cycle", "nextLearnCycle", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "relative_state_of_charge" => MoPropertyMeta.new("relative_state_of_charge", "relativeStateOfCharge", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "remaining_capacity" => MoPropertyMeta.new("remaining_capacity", "remainingCapacity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "retention_time" => MoPropertyMeta.new("retention_time", "retentionTime", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "serial_number" => MoPropertyMeta.new("serial_number", "serialNumber", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "temperature" => MoPropertyMeta.new("temperature", "temperature", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "temperature_high" => MoPropertyMeta.new("temperature_high", "temperatureHigh", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "voltage" => MoPropertyMeta.new("voltage", "voltage", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "absolute_state_of_charge" => MoPropertyMeta.new("absolute_state_of_charge", "absoluteStateOfCharge", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["disable-auto-learn", "enable-auto-learn", "start-learn-cycle"], []), 
            "battery_present" => MoPropertyMeta.new("battery_present", "batteryPresent", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "battery_status" => MoPropertyMeta.new("battery_status", "batteryStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "battery_type" => MoPropertyMeta.new("battery_type", "batteryType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "charging_state" => MoPropertyMeta.new("charging_state", "chargingState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "completed_charge_cycles" => MoPropertyMeta.new("completed_charge_cycles", "completedChargeCycles", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "current" => MoPropertyMeta.new("current", "current", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "date_of_manufacture" => MoPropertyMeta.new("date_of_manufacture", "dateOfManufacture", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "design_capacity" => MoPropertyMeta.new("design_capacity", "designCapacity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "design_voltage" => MoPropertyMeta.new("design_voltage", "designVoltage", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "expected_margin_of_error" => MoPropertyMeta.new("expected_margin_of_error", "expectedMarginOfError", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "firmware_version" => MoPropertyMeta.new("firmware_version", "firmwareVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "full_capacity" => MoPropertyMeta.new("full_capacity", "fullCapacity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "learn_cycle_requested" => MoPropertyMeta.new("learn_cycle_requested", "learnCycleRequested", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "learn_cycle_status" => MoPropertyMeta.new("learn_cycle_status", "learnCycleStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "learn_mode" => MoPropertyMeta.new("learn_mode", "learnMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "manufacturer" => MoPropertyMeta.new("manufacturer", "manufacturer", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "next_learn_cycle" => MoPropertyMeta.new("next_learn_cycle", "nextLearnCycle", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "relative_state_of_charge" => MoPropertyMeta.new("relative_state_of_charge", "relativeStateOfCharge", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "remaining_capacity" => MoPropertyMeta.new("remaining_capacity", "remainingCapacity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "retention_time" => MoPropertyMeta.new("retention_time", "retentionTime", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "serial_number" => MoPropertyMeta.new("serial_number", "serialNumber", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "temperature" => MoPropertyMeta.new("temperature", "temperature", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "temperature_high" => MoPropertyMeta.new("temperature_high", "temperatureHigh", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "voltage" => MoPropertyMeta.new("voltage", "voltage", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "absoluteStateOfCharge" => "absolute_state_of_charge", 
        "adminAction" => "admin_action", 
        "batteryPresent" => "battery_present", 
        "batteryStatus" => "battery_status", 
        "batteryType" => "battery_type", 
        "chargingState" => "charging_state", 
        "childAction" => "child_action", 
        "completedChargeCycles" => "completed_charge_cycles", 
        "current" => "current", 
        "dateOfManufacture" => "date_of_manufacture", 
        "designCapacity" => "design_capacity", 
        "designVoltage" => "design_voltage", 
        "dn" => "dn", 
        "expectedMarginOfError" => "expected_margin_of_error", 
        "firmwareVersion" => "firmware_version", 
        "fullCapacity" => "full_capacity", 
        "health" => "health", 
        "learnCycleRequested" => "learn_cycle_requested", 
        "learnCycleStatus" => "learn_cycle_status", 
        "learnMode" => "learn_mode", 
        "manufacturer" => "manufacturer", 
        "nextLearnCycle" => "next_learn_cycle", 
        "relativeStateOfCharge" => "relative_state_of_charge", 
        "remainingCapacity" => "remaining_capacity", 
        "retentionTime" => "retention_time", 
        "rn" => "rn", 
        "serialNumber" => "serial_number", 
        "status" => "status", 
        "temperature" => "temperature", 
        "temperatureHigh" => "temperature_high", 
        "voltage" => "voltage", 
        },

        "modular" => {
            "absoluteStateOfCharge" => "absolute_state_of_charge", 
            "adminAction" => "admin_action", 
            "batteryPresent" => "battery_present", 
            "batteryStatus" => "battery_status", 
            "batteryType" => "battery_type", 
            "chargingState" => "charging_state", 
            "childAction" => "child_action", 
            "completedChargeCycles" => "completed_charge_cycles", 
            "current" => "current", 
            "dateOfManufacture" => "date_of_manufacture", 
            "designCapacity" => "design_capacity", 
            "designVoltage" => "design_voltage", 
            "dn" => "dn", 
            "expectedMarginOfError" => "expected_margin_of_error", 
            "firmwareVersion" => "firmware_version", 
            "fullCapacity" => "full_capacity", 
            "health" => "health", 
            "learnCycleRequested" => "learn_cycle_requested", 
            "learnCycleStatus" => "learn_cycle_status", 
            "learnMode" => "learn_mode", 
            "manufacturer" => "manufacturer", 
            "nextLearnCycle" => "next_learn_cycle", 
            "relativeStateOfCharge" => "relative_state_of_charge", 
            "remainingCapacity" => "remaining_capacity", 
            "retentionTime" => "retention_time", 
            "rn" => "rn", 
            "serialNumber" => "serial_number", 
            "status" => "status", 
            "temperature" => "temperature", 
            "temperatureHigh" => "temperature_high", 
            "voltage" => "voltage", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :absolute_state_of_charge
    attr_accessor :admin_action
    attr_reader :battery_present
    attr_reader :battery_status
    attr_reader :battery_type
    attr_reader :charging_state
    attr_reader :child_action
    attr_reader :completed_charge_cycles
    attr_reader :current
    attr_reader :date_of_manufacture
    attr_reader :design_capacity
    attr_reader :design_voltage
    attr_reader :expected_margin_of_error
    attr_reader :firmware_version
    attr_reader :full_capacity
    attr_reader :health
    attr_reader :learn_cycle_requested
    attr_reader :learn_cycle_status
    attr_reader :learn_mode
    attr_reader :manufacturer
    attr_reader :next_learn_cycle
    attr_reader :relative_state_of_charge
    attr_reader :remaining_capacity
    attr_reader :retention_time
    attr_reader :serial_number
    attr_accessor :status
    attr_reader :temperature
    attr_reader :temperature_high
    attr_reader :voltage


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @absolute_state_of_charge = nil
        @admin_action = nil
        @battery_present = nil
        @battery_status = nil
        @battery_type = nil
        @charging_state = nil
        @child_action = nil
        @completed_charge_cycles = nil
        @current = nil
        @date_of_manufacture = nil
        @design_capacity = nil
        @design_voltage = nil
        @expected_margin_of_error = nil
        @firmware_version = nil
        @full_capacity = nil
        @health = nil
        @learn_cycle_requested = nil
        @learn_cycle_status = nil
        @learn_mode = nil
        @manufacturer = nil
        @next_learn_cycle = nil
        @relative_state_of_charge = nil
        @remaining_capacity = nil
        @retention_time = nil
        @serial_number = nil
        @status = nil
        @temperature = nil
        @temperature_high = nil
        @voltage = nil

        super(class_id: "StorageRaidBattery", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
