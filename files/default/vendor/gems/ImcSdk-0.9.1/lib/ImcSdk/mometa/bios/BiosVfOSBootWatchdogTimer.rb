#This module contains the general information for BiosVfOSBootWatchdogTimer ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfOSBootWatchdogTimerConsts
    VP_OSBOOT_WATCHDOG_TIMER_DISABLED = "Disabled"
    VP_OSBOOT_WATCHDOG_TIMER_ENABLED = "Enabled"
    _VP_OSBOOT_WATCHDOG_TIMER_DISABLED = "disabled"
    _VP_OSBOOT_WATCHDOG_TIMER_ENABLED = "enabled"
    VP_OSBOOT_WATCHDOG_TIMER_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfOSBootWatchdogTimer < ManagedObject
    #This is BiosVfOSBootWatchdogTimer class.

    @@consts = BiosVfOSBootWatchdogTimerConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfOSBootWatchdogTimer", "biosVfOSBootWatchdogTimer", "OS-Boot-Watchdog-Timer-Param", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfOSBootWatchdogTimer", "biosVfOSBootWatchdogTimer", "OS-Boot-Watchdog-Timer-Param", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_os_boot_watchdog_timer" => MoPropertyMeta.new("vp_os_boot_watchdog_timer", "vpOSBootWatchdogTimer", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_os_boot_watchdog_timer" => MoPropertyMeta.new("vp_os_boot_watchdog_timer", "vpOSBootWatchdogTimer", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpOSBootWatchdogTimer" => "vp_os_boot_watchdog_timer", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpOSBootWatchdogTimer" => "vp_os_boot_watchdog_timer", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_os_boot_watchdog_timer


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_os_boot_watchdog_timer = nil

        super(class_id: "BiosVfOSBootWatchdogTimer", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
