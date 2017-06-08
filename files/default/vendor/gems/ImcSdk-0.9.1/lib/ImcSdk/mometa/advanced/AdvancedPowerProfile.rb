#This module contains the general information for AdvancedPowerProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdvancedPowerProfileConsts
    CORR_ACTION_ALERT = "alert"
    CORR_ACTION_ALERT_SHUTDOWN = "alert,shutdown"
    CORR_ACTION_NONE = "none"
    CORR_ACTION_SHUTDOWN = "shutdown"
end


class AdvancedPowerProfile < ManagedObject
    #This is AdvancedPowerProfile class.

    @@consts = AdvancedPowerProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdvancedPowerProfile", "advancedPowerProfile", "advpwrprof", VersionMeta::VERSION202C, "InputOutput", 0x7ffff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "allow_throttle" => MoPropertyMeta.new("allow_throttle", "allowThrottle", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "corr_action" => MoPropertyMeta.new("corr_action", "corrAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["alert", "alert,shutdown", "none", "shutdown"], []), 
        "corr_time" => MoPropertyMeta.new("corr_time", "corrTime", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, [], ["0-4294967295"]), 
        "cpu_power_limit" => MoPropertyMeta.new("cpu_power_limit", "cpuPowerLimit", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x10, 0, 510, nil, [], ["0-4294967295"]), 
        "cpu_safe_throt_lvl" => MoPropertyMeta.new("cpu_safe_throt_lvl", "cpuSafeThrotLvl", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x20, 0, 510, nil, [], ["0-100"]), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "hard_cap" => MoPropertyMeta.new("hard_cap", "hardCap", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "mem_safe_throt_lvl" => MoPropertyMeta.new("mem_safe_throt_lvl", "memSafeThrotLvl", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x100, 0, 510, nil, [], ["0-100"]), 
        "memory_power_limit" => MoPropertyMeta.new("memory_power_limit", "memoryPowerLimit", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x200, 0, 510, nil, [], ["0-4294967295"]), 
        "miss_rdg_timeout" => MoPropertyMeta.new("miss_rdg_timeout", "missRdgTimeout", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x400, 0, 510, nil, [], ["0-4294967295"]), 
        "plat_safe_throt_lvl" => MoPropertyMeta.new("plat_safe_throt_lvl", "platSafeThrotLvl", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x800, 0, 510, nil, [], ["0-100"]), 
        "platform_thermal" => MoPropertyMeta.new("platform_thermal", "platformThermal", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x1000, 0, 510, nil, [], ["0-4294967295"]), 
        "power_limit" => MoPropertyMeta.new("power_limit", "powerLimit", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x2000, 0, 510, nil, [], ["0-4294967295"]), 
        "profile_enabled" => MoPropertyMeta.new("profile_enabled", "profileEnabled", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x4000, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "profile_type" => MoPropertyMeta.new("profile_type", "profileType", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x8000, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x10000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "suspend_period" => MoPropertyMeta.new("suspend_period", "suspendPeriod", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x20000, 0, 510, nil, [], []), 
        "thermal_pow_limit" => MoPropertyMeta.new("thermal_pow_limit", "thermalPowLimit", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x40000, 0, 510, nil, [], ["0-4294967295"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "allowThrottle" => "allow_throttle", 
        "childAction" => "child_action", 
        "corrAction" => "corr_action", 
        "corrTime" => "corr_time", 
        "cpuPowerLimit" => "cpu_power_limit", 
        "cpuSafeThrotLvl" => "cpu_safe_throt_lvl", 
        "dn" => "dn", 
        "hardCap" => "hard_cap", 
        "memSafeThrotLvl" => "mem_safe_throt_lvl", 
        "memoryPowerLimit" => "memory_power_limit", 
        "missRdgTimeout" => "miss_rdg_timeout", 
        "platSafeThrotLvl" => "plat_safe_throt_lvl", 
        "platformThermal" => "platform_thermal", 
        "powerLimit" => "power_limit", 
        "profileEnabled" => "profile_enabled", 
        "profileType" => "profile_type", 
        "rn" => "rn", 
        "status" => "status", 
        "suspendPeriod" => "suspend_period", 
        "thermalPowLimit" => "thermal_pow_limit", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :allow_throttle
    attr_reader :child_action
    attr_accessor :corr_action
    attr_accessor :corr_time
    attr_accessor :cpu_power_limit
    attr_accessor :cpu_safe_throt_lvl
    attr_accessor :hard_cap
    attr_accessor :mem_safe_throt_lvl
    attr_accessor :memory_power_limit
    attr_accessor :miss_rdg_timeout
    attr_accessor :plat_safe_throt_lvl
    attr_accessor :platform_thermal
    attr_accessor :power_limit
    attr_accessor :profile_enabled
    attr_reader :profile_type
    attr_accessor :status
    attr_accessor :suspend_period
    attr_accessor :thermal_pow_limit


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @allow_throttle = nil
        @child_action = nil
        @corr_action = nil
        @corr_time = nil
        @cpu_power_limit = nil
        @cpu_safe_throt_lvl = nil
        @hard_cap = nil
        @mem_safe_throt_lvl = nil
        @memory_power_limit = nil
        @miss_rdg_timeout = nil
        @plat_safe_throt_lvl = nil
        @platform_thermal = nil
        @power_limit = nil
        @profile_enabled = nil
        @profile_type = nil
        @status = nil
        @suspend_period = nil
        @thermal_pow_limit = nil

        super(class_id: "AdvancedPowerProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
