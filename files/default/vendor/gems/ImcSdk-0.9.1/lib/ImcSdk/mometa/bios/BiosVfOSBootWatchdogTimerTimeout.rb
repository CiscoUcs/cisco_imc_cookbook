#This module contains the general information for BiosVfOSBootWatchdogTimerTimeout ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfOSBootWatchdogTimerTimeoutConsts
    VP_OSBOOT_WATCHDOG_TIMER_TIMEOUT_10_MINUTES = "10-minutes"
    VP_OSBOOT_WATCHDOG_TIMER_TIMEOUT_15_MINUTES = "15-minutes"
    VP_OSBOOT_WATCHDOG_TIMER_TIMEOUT_20_MINUTES = "20-minutes"
    VP_OSBOOT_WATCHDOG_TIMER_TIMEOUT_5_MINUTES = "5-minutes"
    VP_OSBOOT_WATCHDOG_TIMER_TIMEOUT_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfOSBootWatchdogTimerTimeout < ManagedObject
    #This is BiosVfOSBootWatchdogTimerTimeout class.

    @@consts = BiosVfOSBootWatchdogTimerTimeoutConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfOSBootWatchdogTimerTimeout", "biosVfOSBootWatchdogTimerTimeout", "OS-Boot-Watchdog-Timer-Time-Out", VersionMeta::VERSION151X, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfOSBootWatchdogTimerTimeout", "biosVfOSBootWatchdogTimerTimeout", "OS-Boot-Watchdog-Timer-Time-Out", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151X, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_os_boot_watchdog_timer_timeout" => MoPropertyMeta.new("vp_os_boot_watchdog_timer_timeout", "vpOSBootWatchdogTimerTimeout", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["10-minutes", "15-minutes", "20-minutes", "5-minutes", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_os_boot_watchdog_timer_timeout" => MoPropertyMeta.new("vp_os_boot_watchdog_timer_timeout", "vpOSBootWatchdogTimerTimeout", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["10-minutes", "15-minutes", "20-minutes", "5-minutes", "platform-default"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "vpOSBootWatchdogTimerTimeout" => "vp_os_boot_watchdog_timer_timeout", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpOSBootWatchdogTimerTimeout" => "vp_os_boot_watchdog_timer_timeout", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_os_boot_watchdog_timer_timeout


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_os_boot_watchdog_timer_timeout = nil

        super(class_id: "BiosVfOSBootWatchdogTimerTimeout", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
