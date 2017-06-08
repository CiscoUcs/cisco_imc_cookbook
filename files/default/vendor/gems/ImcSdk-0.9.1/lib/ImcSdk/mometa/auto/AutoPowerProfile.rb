#This module contains the general information for AutoPowerProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AutoPowerProfileConsts
    CORR_ACTION_ALERT = "alert"
    CORR_ACTION_ALERT_SHUTDOWN = "alert,shutdown"
    CORR_ACTION_NONE = "none"
    PRIORITY_DYNAMIC = "dynamic"
    PRIORITY_MANUAL = "manual"
end


class AutoPowerProfile < ManagedObject
    #This is AutoPowerProfile class.

    @@consts = AutoPowerProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("AutoPowerProfile", "autoPowerProfile", "auto-prof", VersionMeta::VERSION2013E, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "allow_throttle" => MoPropertyMeta.new("allow_throttle", "allowThrottle", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "corr_action" => MoPropertyMeta.new("corr_action", "corrAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["alert", "alert,shutdown", "none"], []), 
            "corr_time" => MoPropertyMeta.new("corr_time", "corrTime", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, [], ["0-4294967295"]), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "power_limit_server1" => MoPropertyMeta.new("power_limit_server1", "powerLimitServer1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "power_limit_server2" => MoPropertyMeta.new("power_limit_server2", "powerLimitServer2", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "prior_server_id" => MoPropertyMeta.new("prior_server_id", "priorServerId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 510, nil, [], ["1-2"]), 
            "priority" => MoPropertyMeta.new("priority", "priority", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 510, nil, ["dynamic", "manual"], []), 
            "profile_enabled" => MoPropertyMeta.new("profile_enabled", "profileEnabled", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "profile_type" => MoPropertyMeta.new("profile_type", "profileType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "suspend_period" => MoPropertyMeta.new("suspend_period", "suspendPeriod", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "allowThrottle" => "allow_throttle", 
            "childAction" => "child_action", 
            "corrAction" => "corr_action", 
            "corrTime" => "corr_time", 
            "dn" => "dn", 
            "powerLimitServer1" => "power_limit_server1", 
            "powerLimitServer2" => "power_limit_server2", 
            "priorServerId" => "prior_server_id", 
            "priority" => "priority", 
            "profileEnabled" => "profile_enabled", 
            "profileType" => "profile_type", 
            "rn" => "rn", 
            "status" => "status", 
            "suspendPeriod" => "suspend_period", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :allow_throttle
    attr_reader :child_action
    attr_accessor :corr_action
    attr_accessor :corr_time
    attr_reader :power_limit_server1
    attr_reader :power_limit_server2
    attr_accessor :prior_server_id
    attr_accessor :priority
    attr_accessor :profile_enabled
    attr_reader :profile_type
    attr_accessor :status
    attr_accessor :suspend_period


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @allow_throttle = nil
        @child_action = nil
        @corr_action = nil
        @corr_time = nil
        @power_limit_server1 = nil
        @power_limit_server2 = nil
        @prior_server_id = nil
        @priority = nil
        @profile_enabled = nil
        @profile_type = nil
        @status = nil
        @suspend_period = nil

        super(class_id: "AutoPowerProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
