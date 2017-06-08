#This module contains the general information for ChassisPowerBudget ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class ChassisPowerBudgetConsts
    ADMIN_ACTION_RESET_POWER_PROFILE_DEFAULT = "reset-power-profile-default"
    ADMIN_ACTION_START_POWER_CHAR = "start-power-char"
end


class ChassisPowerBudget < ManagedObject
    #This is ChassisPowerBudget class.

    @@consts = ChassisPowerBudgetConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("ChassisPowerBudget", "chassisPowerBudget", "budget", VersionMeta::VERSION2013E, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["reset-power-profile-default", "start-power-char"], []), 
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "auto_min_budget" => MoPropertyMeta.new("auto_min_budget", "autoMinBudget", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "budget" => MoPropertyMeta.new("budget", "budget", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, [], ["0-4294967295"]), 
            "cap_budget" => MoPropertyMeta.new("cap_budget", "capBudget", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "max_power" => MoPropertyMeta.new("max_power", "maxPower", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "min_power" => MoPropertyMeta.new("min_power", "minPower", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pow_char_enable" => MoPropertyMeta.new("pow_char_enable", "powCharEnable", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "power_char_status" => MoPropertyMeta.new("power_char_status", "powerCharStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "adminAction" => "admin_action", 
            "adminState" => "admin_state", 
            "autoMinBudget" => "auto_min_budget", 
            "budget" => "budget", 
            "capBudget" => "cap_budget", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "maxPower" => "max_power", 
            "minPower" => "min_power", 
            "powCharEnable" => "pow_char_enable", 
            "powerCharStatus" => "power_char_status", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_action
    attr_accessor :admin_state
    attr_reader :auto_min_budget
    attr_accessor :budget
    attr_reader :cap_budget
    attr_reader :child_action
    attr_reader :max_power
    attr_reader :min_power
    attr_accessor :pow_char_enable
    attr_reader :power_char_status
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_action = nil
        @admin_state = nil
        @auto_min_budget = nil
        @budget = nil
        @cap_budget = nil
        @child_action = nil
        @max_power = nil
        @min_power = nil
        @pow_char_enable = nil
        @power_char_status = nil
        @status = nil

        super(class_id: "ChassisPowerBudget", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
