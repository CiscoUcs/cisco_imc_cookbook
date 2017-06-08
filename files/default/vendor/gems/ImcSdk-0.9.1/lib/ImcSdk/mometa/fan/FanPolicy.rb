#This module contains the general information for FanPolicy ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class FanPolicyConsts
    CONFIGURED_FAN_POLICY_BALANCED = "Balanced"
    CONFIGURED_FAN_POLICY_HIGH_POWER = "High Power"
    CONFIGURED_FAN_POLICY_LOW_POWER = "Low Power"
    CONFIGURED_FAN_POLICY_MAXIMUM_POWER = "Maximum Power"
    CONFIGURED_FAN_POLICY_PERFORMANCE = "Performance"
end


class FanPolicy < ManagedObject
    #This is FanPolicy class.

    @@consts = FanPolicyConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("FanPolicy", "fanPolicy", "fan-policy", VersionMeta::VERSION301C, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "applied_fan_policy" => MoPropertyMeta.new("applied_fan_policy", "appliedFanPolicy", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "configuration_status" => MoPropertyMeta.new("configuration_status", "configurationStatus", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "configured_fan_policy" => MoPropertyMeta.new("configured_fan_policy", "configuredFanPolicy", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Balanced", "High Power", "Low Power", "Maximum Power", "Performance"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "appliedFanPolicy" => "applied_fan_policy", 
        "childAction" => "child_action", 
        "configurationStatus" => "configuration_status", 
        "configuredFanPolicy" => "configured_fan_policy", 
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :applied_fan_policy
    attr_reader :child_action
    attr_reader :configuration_status
    attr_accessor :configured_fan_policy
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @applied_fan_policy = nil
        @child_action = nil
        @configuration_status = nil
        @configured_fan_policy = nil
        @status = nil

        super(class_id: "FanPolicy", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
