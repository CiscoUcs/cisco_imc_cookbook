#This module contains the general information for EquipmentPsuFan ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class EquipmentPsuFanConsts
    OPERABILITY_ACCESSIBILITY_PROBLEM = "accessibility-problem"
    OPERABILITY_AUTO_UPGRADE = "auto-upgrade"
    OPERABILITY_BIOS_POST_TIMEOUT = "bios-post-timeout"
    OPERABILITY_CHASSIS_LIMIT_EXCEEDED = "chassis-limit-exceeded"
    OPERABILITY_CONFIG = "config"
    OPERABILITY_DECOMISSIONING = "decomissioning"
    OPERABILITY_DEGRADED = "degraded"
    OPERABILITY_DISABLED = "disabled"
    OPERABILITY_DISCOVERY = "discovery"
    OPERABILITY_DISCOVERY_FAILED = "discovery-failed"
    OPERABILITY_EQUIPMENT_PROBLEM = "equipment-problem"
    OPERABILITY_FABRIC_CONN_PROBLEM = "fabric-conn-problem"
    OPERABILITY_FABRIC_UNSUPPORTED_CONN = "fabric-unsupported-conn"
    OPERABILITY_IDENTIFY = "identify"
    OPERABILITY_IDENTITY_UNESTABLISHABLE = "identity-unestablishable"
    OPERABILITY_INOPERABLE = "inoperable"
    OPERABILITY_MALFORMED_FRU = "malformed-fru"
    OPERABILITY_NOT_SUPPORTED = "not-supported"
    OPERABILITY_OPERABLE = "operable"
    OPERABILITY_PEER_COMM_PROBLEM = "peer-comm-problem"
    OPERABILITY_PERFORMANCE_PROBLEM = "performance-problem"
    OPERABILITY_POST_FAILURE = "post-failure"
    OPERABILITY_POWER_PROBLEM = "power-problem"
    OPERABILITY_POWERED_OFF = "powered-off"
    OPERABILITY_REMOVED = "removed"
    OPERABILITY_THERMAL_PROBLEM = "thermal-problem"
    OPERABILITY_UNKNOWN = "unknown"
    OPERABILITY_UPGRADE_PROBLEM = "upgrade-problem"
    OPERABILITY_VOLTAGE_PROBLEM = "voltage-problem"
    POWER_DEGRADED = "degraded"
    POWER_ERROR = "error"
    POWER_NOT_SUPPORTED = "not-supported"
    POWER_OFF = "off"
    POWER_OFFDUTY = "offduty"
    POWER_OFFLINE = "offline"
    POWER_ON = "on"
    POWER_ONLINE = "online"
    POWER_POWER_SAVE = "power-save"
    POWER_TEST = "test"
    POWER_UNKNOWN = "unknown"
    PRESENCE_EMPTY = "empty"
    PRESENCE_EQUIPPED = "equipped"
    PRESENCE_EQUIPPED_IDENTITY_UNESTABLISHABLE = "equipped-identity-unestablishable"
    PRESENCE_EQUIPPED_NOT_PRIMARY = "equipped-not-primary"
    PRESENCE_EQUIPPED_WITH_MALFORMED_FRU = "equipped-with-malformed-fru"
    PRESENCE_INACCESSIBLE = "inaccessible"
    PRESENCE_MISMATCH = "mismatch"
    PRESENCE_MISMATCH_IDENTITY_UNESTABLISHABLE = "mismatch-identity-unestablishable"
    PRESENCE_MISSING = "missing"
    PRESENCE_NOT_SUPPORTED = "not-supported"
    PRESENCE_UNAUTHORIZED = "unauthorized"
    PRESENCE_UNKNOWN = "unknown"
    THERMAL_LOWER_CRITICAL = "lower-critical"
    THERMAL_LOWER_NON_CRITICAL = "lower-non-critical"
    THERMAL_LOWER_NON_RECOVERABLE = "lower-non-recoverable"
    THERMAL_NOT_SUPPORTED = "not-supported"
    THERMAL_OK = "ok"
    THERMAL_UNKNOWN = "unknown"
    THERMAL_UPPER_CRITICAL = "upper-critical"
    THERMAL_UPPER_NON_CRITICAL = "upper-non-critical"
    THERMAL_UPPER_NON_RECOVERABLE = "upper-non-recoverable"
    VOLTAGE_LOWER_CRITICAL = "lower-critical"
    VOLTAGE_LOWER_NON_CRITICAL = "lower-non-critical"
    VOLTAGE_LOWER_NON_RECOVERABLE = "lower-non-recoverable"
    VOLTAGE_NOT_SUPPORTED = "not-supported"
    VOLTAGE_OK = "ok"
    VOLTAGE_UNKNOWN = "unknown"
    VOLTAGE_UPPER_CRITICAL = "upper-critical"
    VOLTAGE_UPPER_NON_CRITICAL = "upper-non-critical"
    VOLTAGE_UPPER_NON_RECOVERABLE = "upper-non-recoverable"
end


class EquipmentPsuFan < ManagedObject
    #This is EquipmentPsuFan class.

    @@consts = EquipmentPsuFanConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("EquipmentPsuFan", "equipmentPsuFan", "fan-[id]", VersionMeta::VERSION202C, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION202C, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], ["1-8"]), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "module" => MoPropertyMeta.new("module", "module", "uint", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], ["1-8"]), 
        "operability" => MoPropertyMeta.new("operability", "operability", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["accessibility-problem", "auto-upgrade", "bios-post-timeout", "chassis-limit-exceeded", "config", "decomissioning", "degraded", "disabled", "discovery", "discovery-failed", "equipment-problem", "fabric-conn-problem", "fabric-unsupported-conn", "identify", "identity-unestablishable", "inoperable", "malformed-fru", "not-supported", "operable", "peer-comm-problem", "performance-problem", "post-failure", "power-problem", "powered-off", "removed", "thermal-problem", "unknown", "upgrade-problem", "voltage-problem"], []), 
        "power" => MoPropertyMeta.new("power", "power", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["degraded", "error", "not-supported", "off", "offduty", "offline", "on", "online", "power-save", "test", "unknown"], []), 
        "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "equipped-identity-unestablishable", "equipped-not-primary", "equipped-with-malformed-fru", "inaccessible", "mismatch", "mismatch-identity-unestablishable", "missing", "not-supported", "unauthorized", "unknown"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "thermal" => MoPropertyMeta.new("thermal", "thermal", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["lower-critical", "lower-non-critical", "lower-non-recoverable", "not-supported", "ok", "unknown", "upper-critical", "upper-non-critical", "upper-non-recoverable"], []), 
        "tray" => MoPropertyMeta.new("tray", "tray", "uint", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], ["1-8"]), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "voltage" => MoPropertyMeta.new("voltage", "voltage", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["lower-critical", "lower-non-critical", "lower-non-recoverable", "not-supported", "ok", "unknown", "upper-critical", "upper-non-critical", "upper-non-recoverable"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "id" => "id", 
        "model" => "model", 
        "module" => "module", 
        "operability" => "operability", 
        "power" => "power", 
        "presence" => "presence", 
        "rn" => "rn", 
        "serial" => "serial", 
        "status" => "status", 
        "thermal" => "thermal", 
        "tray" => "tray", 
        "vendor" => "vendor", 
        "voltage" => "voltage", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_reader :child_action
    attr_reader :model
    attr_reader :module
    attr_reader :operability
    attr_reader :power
    attr_reader :presence
    attr_reader :serial
    attr_reader :status
    attr_reader :thermal
    attr_reader :tray
    attr_reader :vendor
    attr_reader :voltage


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @child_action = nil
        @model = nil
        @module = nil
        @operability = nil
        @power = nil
        @presence = nil
        @serial = nil
        @status = nil
        @thermal = nil
        @tray = nil
        @vendor = nil
        @voltage = nil

        super(class_id: "EquipmentPsuFan", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
