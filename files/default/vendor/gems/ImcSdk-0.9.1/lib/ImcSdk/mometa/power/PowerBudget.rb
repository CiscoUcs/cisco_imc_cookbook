#This module contains the general information for PowerBudget ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class PowerBudgetConsts
    ADMIN_ACTION_RESET_POWER_PROFILE_DEFAULT = "reset-power-profile-default"
    ADMIN_ACTION_START_POWER_CHAR = "start-power-char"
end


class PowerBudget < ManagedObject
    #This is PowerBudget class.

    @@consts = PowerBudgetConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("PowerBudget", "powerBudget", "budget", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("PowerBudget", "powerBudget", "budget", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "max_cpu_power" => MoPropertyMeta.new("max_cpu_power", "maxCpuPower", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "max_memory_power" => MoPropertyMeta.new("max_memory_power", "maxMemoryPower", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "max_power" => MoPropertyMeta.new("max_power", "maxPower", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "min_cpu_power" => MoPropertyMeta.new("min_cpu_power", "minCpuPower", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "min_memory_power" => MoPropertyMeta.new("min_memory_power", "minMemoryPower", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "min_power" => MoPropertyMeta.new("min_power", "minPower", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "power_char_status" => MoPropertyMeta.new("power_char_status", "powerCharStatus", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x10, 0, 510, nil, ["reset-power-profile-default", "start-power-char"], []), 
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "pow_char_enable" => MoPropertyMeta.new("pow_char_enable", "powCharEnable", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "max_cpu_power" => MoPropertyMeta.new("max_cpu_power", "maxCpuPower", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "max_memory_power" => MoPropertyMeta.new("max_memory_power", "maxMemoryPower", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "max_power" => MoPropertyMeta.new("max_power", "maxPower", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "min_cpu_power" => MoPropertyMeta.new("min_cpu_power", "minCpuPower", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "min_memory_power" => MoPropertyMeta.new("min_memory_power", "minMemoryPower", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "min_power" => MoPropertyMeta.new("min_power", "minPower", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "power_char_status" => MoPropertyMeta.new("power_char_status", "powerCharStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "maxCpuPower" => "max_cpu_power", 
        "maxMemoryPower" => "max_memory_power", 
        "maxPower" => "max_power", 
        "minCpuPower" => "min_cpu_power", 
        "minMemoryPower" => "min_memory_power", 
        "minPower" => "min_power", 
        "powerCharStatus" => "power_char_status", 
        "rn" => "rn", 
        "status" => "status", 
        "adminAction" => "admin_action", 
        "adminState" => "admin_state", 
        "powCharEnable" => "pow_char_enable", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "maxCpuPower" => "max_cpu_power", 
            "maxMemoryPower" => "max_memory_power", 
            "maxPower" => "max_power", 
            "minCpuPower" => "min_cpu_power", 
            "minMemoryPower" => "min_memory_power", 
            "minPower" => "min_power", 
            "powerCharStatus" => "power_char_status", 
            "rn" => "rn", 
            "status" => "status", 
            "description" => "description", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :max_cpu_power
    attr_reader :max_memory_power
    attr_reader :max_power
    attr_reader :min_cpu_power
    attr_reader :min_memory_power
    attr_reader :min_power
    attr_reader :power_char_status
    attr_accessor :status
    attr_accessor :admin_action
    attr_accessor :admin_state
    attr_accessor :pow_char_enable


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @max_cpu_power = nil
        @max_memory_power = nil
        @max_power = nil
        @min_cpu_power = nil
        @min_memory_power = nil
        @min_power = nil
        @power_char_status = nil
        @status = nil
        @admin_action = nil
        @admin_state = nil
        @pow_char_enable = nil
        @description = nil

        super(class_id: "PowerBudget", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
