#This module contains the general information for AdaptorEthGenProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorEthGenProfileConsts
    ARFS_DISABLED = "Disabled"
    ARFS_ENABLED = "Enabled"
    _ARFS_DISABLED = "disabled"
    _ARFS_ENABLED = "enabled"
    ORDER_ANY = "ANY"
    RATE_LIMIT_OFF = "OFF"
    UPLINK_FAILOVER_DISABLED = "Disabled"
    UPLINK_FAILOVER_ENABLED = "Enabled"
    _UPLINK_FAILOVER_DISABLED = "disabled"
    _UPLINK_FAILOVER_ENABLED = "enabled"
    VLAN_NONE = "NONE"
    VLAN_MODE_ACCESS = "ACCESS"
    VLAN_MODE_TRUNK = "TRUNK"
    VMQ_DISABLED = "Disabled"
    VMQ_ENABLED = "Enabled"
    _VMQ_DISABLED = "disabled"
    _VMQ_ENABLED = "enabled"
end


class AdaptorEthGenProfile < ManagedObject
    #This is AdaptorEthGenProfile class.

    @@consts = AdaptorEthGenProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorEthGenProfile", "adaptorEthGenProfile", "general", VersionMeta::VERSION151F, "InputOutput", 0x1fff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorEthGenProfile", "adaptorEthGenProfile", "general", VersionMeta::VERSION2013E, "InputOutput", 0x1fff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "arfs" => MoPropertyMeta.new("arfs", "arfs", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "order" => MoPropertyMeta.new("order", "order", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{[0-9]|1[0-7]}, ["ANY"], []), 
        "rate_limit" => MoPropertyMeta.new("rate_limit", "rateLimit", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, %q{(([1-9]\d?\d?\d?|10000) Mbps)}, ["OFF"], ["1-40000"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "trusted_class_of_service" => MoPropertyMeta.new("trusted_class_of_service", "trustedClassOfService", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "uplink_failback_timeout" => MoPropertyMeta.new("uplink_failback_timeout", "uplinkFailbackTimeout", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, %q{(0{0,2}[0-9]|0?[1-9][0-9]|[1-5][0-9][0-9]|600)}, [], []), 
        "uplink_failover" => MoPropertyMeta.new("uplink_failover", "uplinkFailover", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "vlan" => MoPropertyMeta.new("vlan", "vlan", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["NONE"], ["1-4094"]), 
        "vlan_mode" => MoPropertyMeta.new("vlan_mode", "vlanMode", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["ACCESS", "TRUNK"], []), 
        "vmq" => MoPropertyMeta.new("vmq", "vmq", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        },

        "modular" => {
            "arfs" => MoPropertyMeta.new("arfs", "arfs", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "order" => MoPropertyMeta.new("order", "order", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{[0-9]|1[0-7]}, ["ANY"], []), 
            "rate_limit" => MoPropertyMeta.new("rate_limit", "rateLimit", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, %q{(([1-9]\d?\d?\d?|10000) Mbps)}, ["OFF"], ["1-40000"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "trusted_class_of_service" => MoPropertyMeta.new("trusted_class_of_service", "trustedClassOfService", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "uplink_failback_timeout" => MoPropertyMeta.new("uplink_failback_timeout", "uplinkFailbackTimeout", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, %q{(0{0,2}[0-9]|0?[1-9][0-9]|[1-5][0-9][0-9]|600)}, [], []), 
            "uplink_failover" => MoPropertyMeta.new("uplink_failover", "uplinkFailover", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "vlan" => MoPropertyMeta.new("vlan", "vlan", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["NONE"], ["1-4094"]), 
            "vlan_mode" => MoPropertyMeta.new("vlan_mode", "vlanMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["ACCESS", "TRUNK"], []), 
            "vmq" => MoPropertyMeta.new("vmq", "vmq", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "arfs" => "arfs", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "order" => "order", 
        "rateLimit" => "rate_limit", 
        "rn" => "rn", 
        "status" => "status", 
        "trustedClassOfService" => "trusted_class_of_service", 
        "uplinkFailbackTimeout" => "uplink_failback_timeout", 
        "uplinkFailover" => "uplink_failover", 
        "vlan" => "vlan", 
        "vlanMode" => "vlan_mode", 
        "vmq" => "vmq", 
        },

        "modular" => {
            "arfs" => "arfs", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "order" => "order", 
            "rateLimit" => "rate_limit", 
            "rn" => "rn", 
            "status" => "status", 
            "trustedClassOfService" => "trusted_class_of_service", 
            "uplinkFailbackTimeout" => "uplink_failback_timeout", 
            "uplinkFailover" => "uplink_failover", 
            "vlan" => "vlan", 
            "vlanMode" => "vlan_mode", 
            "vmq" => "vmq", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :arfs
    attr_reader :child_action
    attr_accessor :order
    attr_accessor :rate_limit
    attr_accessor :status
    attr_accessor :trusted_class_of_service
    attr_accessor :uplink_failback_timeout
    attr_accessor :uplink_failover
    attr_accessor :vlan
    attr_accessor :vlan_mode
    attr_accessor :vmq


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @arfs = nil
        @child_action = nil
        @order = nil
        @rate_limit = nil
        @status = nil
        @trusted_class_of_service = nil
        @uplink_failback_timeout = nil
        @uplink_failover = nil
        @vlan = nil
        @vlan_mode = nil
        @vmq = nil

        super(class_id: "AdaptorEthGenProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
