#This module contains the general information for ComputeMbPowerStats ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class ComputeMbPowerStatsConsts
    
end


class ComputeMbPowerStats < ManagedObject
    #This is ComputeMbPowerStats class.

    @@consts = ComputeMbPowerStatsConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("ComputeMbPowerStats", "computeMbPowerStats", "power-stats", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("ComputeMbPowerStats", "computeMbPowerStats", "power-stats", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "consumed_power" => MoPropertyMeta.new("consumed_power", "consumedPower", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "input_current" => MoPropertyMeta.new("input_current", "inputCurrent", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "input_voltage" => MoPropertyMeta.new("input_voltage", "inputVoltage", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "time_collected" => MoPropertyMeta.new("time_collected", "timeCollected", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{([0-9]){4}-([0-9]){2}-([0-9]){2}T([0-9]){2}:([0-9]){2}:([0-9]){2}((\.([0-9]){3})){0,1}}, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "consumed_power" => MoPropertyMeta.new("consumed_power", "consumedPower", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "input_current" => MoPropertyMeta.new("input_current", "inputCurrent", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "input_voltage" => MoPropertyMeta.new("input_voltage", "inputVoltage", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "time_collected" => MoPropertyMeta.new("time_collected", "timeCollected", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{([0-9]){4}-([0-9]){2}-([0-9]){2}T([0-9]){2}:([0-9]){2}:([0-9]){2}((\.([0-9]){3})){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "consumedPower" => "consumed_power", 
        "dn" => "dn", 
        "inputCurrent" => "input_current", 
        "inputVoltage" => "input_voltage", 
        "rn" => "rn", 
        "status" => "status", 
        "timeCollected" => "time_collected", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "consumedPower" => "consumed_power", 
            "dn" => "dn", 
            "inputCurrent" => "input_current", 
            "inputVoltage" => "input_voltage", 
            "rn" => "rn", 
            "status" => "status", 
            "timeCollected" => "time_collected", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :consumed_power
    attr_reader :input_current
    attr_reader :input_voltage
    attr_reader :status
    attr_reader :time_collected


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @consumed_power = nil
        @input_current = nil
        @input_voltage = nil
        @status = nil
        @time_collected = nil

        super(class_id: "ComputeMbPowerStats", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
