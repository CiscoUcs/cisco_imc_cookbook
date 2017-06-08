#This module contains the general information for BiosVfOSBootWatchdogTimerPolicy ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfOSBootWatchdogTimerPolicyConsts
    VP_OSBOOT_WATCHDOG_TIMER_POLICY_DO_NOTHING = "do-nothing"
    VP_OSBOOT_WATCHDOG_TIMER_POLICY_PLATFORM_DEFAULT = "platform-default"
    VP_OSBOOT_WATCHDOG_TIMER_POLICY_POWER_OFF = "power-off"
    VP_OSBOOT_WATCHDOG_TIMER_POLICY_RESET = "reset"
end


class BiosVfOSBootWatchdogTimerPolicy < ManagedObject
    #This is BiosVfOSBootWatchdogTimerPolicy class.

    @@consts = BiosVfOSBootWatchdogTimerPolicyConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfOSBootWatchdogTimerPolicy", "biosVfOSBootWatchdogTimerPolicy", "OS-Boot-Watchdog-Timer-Policy", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfOSBootWatchdogTimerPolicy", "biosVfOSBootWatchdogTimerPolicy", "OS-Boot-Watchdog-Timer-Policy", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
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
        "vp_os_boot_watchdog_timer_policy" => MoPropertyMeta.new("vp_os_boot_watchdog_timer_policy", "vpOSBootWatchdogTimerPolicy", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["do-nothing", "platform-default", "power-off", "reset"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_os_boot_watchdog_timer_policy" => MoPropertyMeta.new("vp_os_boot_watchdog_timer_policy", "vpOSBootWatchdogTimerPolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["do-nothing", "platform-default", "power-off", "reset"], []), 
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
        "vpOSBootWatchdogTimerPolicy" => "vp_os_boot_watchdog_timer_policy", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpOSBootWatchdogTimerPolicy" => "vp_os_boot_watchdog_timer_policy", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_os_boot_watchdog_timer_policy


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_os_boot_watchdog_timer_policy = nil

        super(class_id: "BiosVfOSBootWatchdogTimerPolicy", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
