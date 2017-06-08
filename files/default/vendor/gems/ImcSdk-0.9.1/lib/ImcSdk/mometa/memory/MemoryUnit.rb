#This module contains the general information for MemoryUnit ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class MemoryUnitConsts
    CAPACITY_UNSPECIFIED = "unspecified"
    CLOCK_UNSPECIFIED = "unspecified"
    FORM_FACTOR_DIMM = "DIMM"
    FORM_FACTOR_FB_DIMM = "FB-DIMM"
    FORM_FACTOR_OTHER = "Other"
    FORM_FACTOR_RIMM = "RIMM"
    FORM_FACTOR_SIMM = "SIMM"
    FORM_FACTOR_SODIMM = "SODIMM"
    FORM_FACTOR_SRIMM = "SRIMM"
    FORM_FACTOR_TSOP = "TSOP"
    FORM_FACTOR_UNKNOWN = "Unknown"
    FORM_FACTOR_UNDISCOVERED = "undiscovered"
    OPER_STATE_ACCESSIBILITY_PROBLEM = "accessibility-problem"
    OPER_STATE_AUTO_UPGRADE = "auto-upgrade"
    OPER_STATE_BIOS_POST_TIMEOUT = "bios-post-timeout"
    OPER_STATE_CHASSIS_LIMIT_EXCEEDED = "chassis-limit-exceeded"
    OPER_STATE_CONFIG = "config"
    OPER_STATE_DECOMISSIONING = "decomissioning"
    OPER_STATE_DEGRADED = "degraded"
    OPER_STATE_DISABLED = "disabled"
    OPER_STATE_DISCOVERY = "discovery"
    OPER_STATE_DISCOVERY_FAILED = "discovery-failed"
    OPER_STATE_EQUIPMENT_PROBLEM = "equipment-problem"
    OPER_STATE_FABRIC_CONN_PROBLEM = "fabric-conn-problem"
    OPER_STATE_FABRIC_UNSUPPORTED_CONN = "fabric-unsupported-conn"
    OPER_STATE_IDENTIFY = "identify"
    OPER_STATE_IDENTITY_UNESTABLISHABLE = "identity-unestablishable"
    OPER_STATE_INOPERABLE = "inoperable"
    OPER_STATE_MALFORMED_FRU = "malformed-fru"
    OPER_STATE_NOT_SUPPORTED = "not-supported"
    OPER_STATE_OPERABLE = "operable"
    OPER_STATE_PEER_COMM_PROBLEM = "peer-comm-problem"
    OPER_STATE_PERFORMANCE_PROBLEM = "performance-problem"
    OPER_STATE_POST_FAILURE = "post-failure"
    OPER_STATE_POWER_PROBLEM = "power-problem"
    OPER_STATE_POWERED_OFF = "powered-off"
    OPER_STATE_REMOVED = "removed"
    OPER_STATE_THERMAL_PROBLEM = "thermal-problem"
    OPER_STATE_UNKNOWN = "unknown"
    OPER_STATE_UPGRADE_PROBLEM = "upgrade-problem"
    OPER_STATE_VOLTAGE_PROBLEM = "voltage-problem"
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
    TYPE_3_DRAM = "3DRAM"
    TYPE_CDRAM = "CDRAM"
    TYPE_DDR = "DDR"
    TYPE_DDR2 = "DDR2"
    TYPE_DDR2_FB_DIMM = "DDR2 FB-DIMM"
    TYPE_DDR3 = "DDR3"
    TYPE_DDR4 = "DDR4"
    TYPE_DRAM = "DRAM"
    TYPE_EDRAM = "EDRAM"
    TYPE_EEPROM = "EEPROM"
    TYPE_EPROM = "EPROM"
    TYPE_FBD2 = "FBD2"
    TYPE_FEPROM = "FEPROM"
    TYPE_FLASH = "FLASH"
    TYPE_OTHER = "Other"
    TYPE_RAM = "RAM"
    TYPE_RDRAM = "RDRAM"
    TYPE_ROM = "ROM"
    TYPE_SDRAM = "SDRAM"
    TYPE_SGRAM = "SGRAM"
    TYPE_SRAM = "SRAM"
    TYPE_UNKNOWN = "Unknown"
    TYPE_VRAM = "VRAM"
    TYPE_UNDISCOVERED = "undiscovered"
    VISIBILITY_NO = "no"
    VISIBILITY_UNKNOWN = "unknown"
    VISIBILITY_YES = "yes"
    WIDTH_UNSPECIFIED = "unspecified"
end


class MemoryUnit < ManagedObject
    #This is MemoryUnit class.

    @@consts = MemoryUnitConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("MemoryUnit", "memoryUnit", "mem-[id]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("MemoryUnit", "memoryUnit", "mem-[id]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "array" => MoPropertyMeta.new("array", "array", "ushort", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "bank_locator" => MoPropertyMeta.new("bank_locator", "bankLocator", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "capacity" => MoPropertyMeta.new("capacity", "capacity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "clock" => MoPropertyMeta.new("clock", "clock", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "form_factor" => MoPropertyMeta.new("form_factor", "formFactor", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["DIMM", "FB-DIMM", "Other", "RIMM", "SIMM", "SODIMM", "SRIMM", "TSOP", "Unknown", "undiscovered"], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
        "location" => MoPropertyMeta.new("location", "location", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "memory_type_detail" => MoPropertyMeta.new("memory_type_detail", "memoryTypeDetail", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "oper_state" => MoPropertyMeta.new("oper_state", "operState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["accessibility-problem", "auto-upgrade", "bios-post-timeout", "chassis-limit-exceeded", "config", "decomissioning", "degraded", "disabled", "discovery", "discovery-failed", "equipment-problem", "fabric-conn-problem", "fabric-unsupported-conn", "identify", "identity-unestablishable", "inoperable", "malformed-fru", "not-supported", "operable", "peer-comm-problem", "performance-problem", "post-failure", "power-problem", "powered-off", "removed", "thermal-problem", "unknown", "upgrade-problem", "voltage-problem"], []), 
        "operability" => MoPropertyMeta.new("operability", "operability", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["accessibility-problem", "auto-upgrade", "bios-post-timeout", "chassis-limit-exceeded", "config", "decomissioning", "degraded", "disabled", "discovery", "discovery-failed", "equipment-problem", "fabric-conn-problem", "fabric-unsupported-conn", "identify", "identity-unestablishable", "inoperable", "malformed-fru", "not-supported", "operable", "peer-comm-problem", "performance-problem", "post-failure", "power-problem", "powered-off", "removed", "thermal-problem", "unknown", "upgrade-problem", "voltage-problem"], []), 
        "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "equipped-identity-unestablishable", "equipped-not-primary", "equipped-with-malformed-fru", "inaccessible", "mismatch", "mismatch-identity-unestablishable", "missing", "not-supported", "unauthorized", "unknown"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["3DRAM", "CDRAM", "DDR", "DDR2", "DDR2 FB-DIMM", "DDR3", "DDR4", "DRAM", "EDRAM", "EEPROM", "EPROM", "FBD2", "FEPROM", "FLASH", "Other", "RAM", "RDRAM", "ROM", "SDRAM", "SGRAM", "SRAM", "Unknown", "VRAM", "undiscovered"], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "visibility" => MoPropertyMeta.new("visibility", "visibility", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["no", "unknown", "yes"], []), 
        "width" => MoPropertyMeta.new("width", "width", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
        },

        "modular" => {
            "array" => MoPropertyMeta.new("array", "array", "ushort", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "bank_locator" => MoPropertyMeta.new("bank_locator", "bankLocator", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "capacity" => MoPropertyMeta.new("capacity", "capacity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "clock" => MoPropertyMeta.new("clock", "clock", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "form_factor" => MoPropertyMeta.new("form_factor", "formFactor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["DIMM", "FB-DIMM", "Other", "RIMM", "SIMM", "SODIMM", "SRIMM", "TSOP", "Unknown", "undiscovered"], []), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
            "location" => MoPropertyMeta.new("location", "location", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "memory_type_detail" => MoPropertyMeta.new("memory_type_detail", "memoryTypeDetail", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "oper_state" => MoPropertyMeta.new("oper_state", "operState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["accessibility-problem", "auto-upgrade", "bios-post-timeout", "chassis-limit-exceeded", "config", "decomissioning", "degraded", "disabled", "discovery", "discovery-failed", "equipment-problem", "fabric-conn-problem", "fabric-unsupported-conn", "identify", "identity-unestablishable", "inoperable", "malformed-fru", "not-supported", "operable", "peer-comm-problem", "performance-problem", "post-failure", "power-problem", "powered-off", "removed", "thermal-problem", "unknown", "upgrade-problem", "voltage-problem"], []), 
            "operability" => MoPropertyMeta.new("operability", "operability", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["accessibility-problem", "auto-upgrade", "bios-post-timeout", "chassis-limit-exceeded", "config", "decomissioning", "degraded", "disabled", "discovery", "discovery-failed", "equipment-problem", "fabric-conn-problem", "fabric-unsupported-conn", "identify", "identity-unestablishable", "inoperable", "malformed-fru", "not-supported", "operable", "peer-comm-problem", "performance-problem", "post-failure", "power-problem", "powered-off", "removed", "thermal-problem", "unknown", "upgrade-problem", "voltage-problem"], []), 
            "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "equipped-identity-unestablishable", "equipped-not-primary", "equipped-with-malformed-fru", "inaccessible", "mismatch", "mismatch-identity-unestablishable", "missing", "not-supported", "unauthorized", "unknown"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["3DRAM", "CDRAM", "DDR", "DDR2", "DDR2 FB-DIMM", "DDR3", "DDR4", "DRAM", "EDRAM", "EEPROM", "EPROM", "FBD2", "FEPROM", "FLASH", "Other", "RAM", "RDRAM", "ROM", "SDRAM", "SGRAM", "SRAM", "Unknown", "VRAM", "undiscovered"], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "visibility" => MoPropertyMeta.new("visibility", "visibility", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["no", "unknown", "yes"], []), 
            "width" => MoPropertyMeta.new("width", "width", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "array" => "array", 
        "bankLocator" => "bank_locator", 
        "capacity" => "capacity", 
        "childAction" => "child_action", 
        "clock" => "clock", 
        "dn" => "dn", 
        "formFactor" => "form_factor", 
        "id" => "id", 
        "location" => "location", 
        "memoryTypeDetail" => "memory_type_detail", 
        "model" => "model", 
        "operState" => "oper_state", 
        "operability" => "operability", 
        "presence" => "presence", 
        "rn" => "rn", 
        "serial" => "serial", 
        "status" => "status", 
        "type" => "type", 
        "vendor" => "vendor", 
        "visibility" => "visibility", 
        "width" => "width", 
        },

        "modular" => {
            "array" => "array", 
            "bankLocator" => "bank_locator", 
            "capacity" => "capacity", 
            "childAction" => "child_action", 
            "clock" => "clock", 
            "dn" => "dn", 
            "formFactor" => "form_factor", 
            "id" => "id", 
            "location" => "location", 
            "memoryTypeDetail" => "memory_type_detail", 
            "model" => "model", 
            "operState" => "oper_state", 
            "operability" => "operability", 
            "presence" => "presence", 
            "rn" => "rn", 
            "serial" => "serial", 
            "status" => "status", 
            "type" => "type", 
            "vendor" => "vendor", 
            "visibility" => "visibility", 
            "width" => "width", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_reader :array
    attr_reader :bank_locator
    attr_reader :capacity
    attr_reader :child_action
    attr_reader :clock
    attr_reader :form_factor
    attr_reader :location
    attr_reader :memory_type_detail
    attr_reader :model
    attr_reader :oper_state
    attr_reader :operability
    attr_reader :presence
    attr_reader :serial
    attr_reader :status
    attr_reader :type
    attr_reader :vendor
    attr_reader :visibility
    attr_reader :width


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @array = nil
        @bank_locator = nil
        @capacity = nil
        @child_action = nil
        @clock = nil
        @form_factor = nil
        @location = nil
        @memory_type_detail = nil
        @model = nil
        @oper_state = nil
        @operability = nil
        @presence = nil
        @serial = nil
        @status = nil
        @type = nil
        @vendor = nil
        @visibility = nil
        @width = nil

        super(class_id: "MemoryUnit", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
