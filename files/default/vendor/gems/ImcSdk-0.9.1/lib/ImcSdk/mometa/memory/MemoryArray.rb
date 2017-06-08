#This module contains the general information for MemoryArray ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class MemoryArrayConsts
    CURR_CAPACITY_UNSPECIFIED = "unspecified"
    DIMM_BLACK_LIST_DISABLED = "Disabled"
    DIMM_BLACK_LIST_ENABLED = "Enabled"
    DIMM_BLACK_LIST_DISABLE = "disable"
    _DIMM_BLACK_LIST_DISABLED = "disabled"
    DIMM_BLACK_LIST_ENABLE = "enable"
    _DIMM_BLACK_LIST_ENABLED = "enabled"
    FAILED_MEMORY_UNSPECIFIED = "unspecified"
    IGNORED_MEMORY_UNSPECIFIED = "unspecified"
    MAX_DEVICES_UNSPECIFIED = "unspecified"
    OVERALL_DIMMSTATUS_AMBER = "amber"
    OVERALL_DIMMSTATUS_BLUE = "blue"
    OVERALL_DIMMSTATUS_GREEN = "green"
    OVERALL_DIMMSTATUS_RED = "red"
    OVERALL_DIMMSTATUS_UNKNOWN = "unknown"
    POPULATED_UNSPECIFIED = "unspecified"
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
    REDUNDANT_MEMORY_UNSPECIFIED = "unspecified"
end


class MemoryArray < ManagedObject
    #This is MemoryArray class.

    @@consts = MemoryArrayConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("MemoryArray", "memoryArray", "memarray-[id]", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("MemoryArray", "memoryArray", "memarray-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "curr_capacity" => MoPropertyMeta.new("curr_capacity", "currCapacity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
        "dimm_black_list" => MoPropertyMeta.new("dimm_black_list", "dimmBlackList", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disable", "disabled", "enable", "enabled"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "failed_memory" => MoPropertyMeta.new("failed_memory", "failedMemory", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], ["1-8"]), 
        "ignored_memory" => MoPropertyMeta.new("ignored_memory", "ignoredMemory", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
        "max_devices" => MoPropertyMeta.new("max_devices", "maxDevices", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
        "memory_configuration" => MoPropertyMeta.new("memory_configuration", "memoryConfiguration", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "memory_ras_possible" => MoPropertyMeta.new("memory_ras_possible", "memoryRASPossible", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "num_of_failed_dimms" => MoPropertyMeta.new("num_of_failed_dimms", "numOfFailedDimms", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "num_of_ignored_dimms" => MoPropertyMeta.new("num_of_ignored_dimms", "numOfIgnoredDimms", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "overall_dimm_status" => MoPropertyMeta.new("overall_dimm_status", "overallDIMMStatus", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["amber", "blue", "green", "red", "unknown"], []), 
        "populated" => MoPropertyMeta.new("populated", "populated", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
        "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "equipped-identity-unestablishable", "equipped-not-primary", "equipped-with-malformed-fru", "inaccessible", "mismatch", "mismatch-identity-unestablishable", "missing", "not-supported", "unauthorized", "unknown"], []), 
        "redundant_memory" => MoPropertyMeta.new("redundant_memory", "redundantMemory", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "curr_capacity" => MoPropertyMeta.new("curr_capacity", "currCapacity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
            "dimm_black_list" => MoPropertyMeta.new("dimm_black_list", "dimmBlackList", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disable", "disabled", "enable", "enabled"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "failed_memory" => MoPropertyMeta.new("failed_memory", "failedMemory", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], ["1-8"]), 
            "ignored_memory" => MoPropertyMeta.new("ignored_memory", "ignoredMemory", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
            "max_devices" => MoPropertyMeta.new("max_devices", "maxDevices", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
            "memory_configuration" => MoPropertyMeta.new("memory_configuration", "memoryConfiguration", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "memory_ras_possible" => MoPropertyMeta.new("memory_ras_possible", "memoryRASPossible", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "num_of_failed_dimms" => MoPropertyMeta.new("num_of_failed_dimms", "numOfFailedDimms", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "num_of_ignored_dimms" => MoPropertyMeta.new("num_of_ignored_dimms", "numOfIgnoredDimms", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "overall_dimm_status" => MoPropertyMeta.new("overall_dimm_status", "overallDIMMStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["amber", "blue", "green", "red", "unknown"], []), 
            "populated" => MoPropertyMeta.new("populated", "populated", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
            "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "equipped-identity-unestablishable", "equipped-not-primary", "equipped-with-malformed-fru", "inaccessible", "mismatch", "mismatch-identity-unestablishable", "missing", "not-supported", "unauthorized", "unknown"], []), 
            "redundant_memory" => MoPropertyMeta.new("redundant_memory", "redundantMemory", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["unspecified"], ["0-4294967295"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "currCapacity" => "curr_capacity", 
        "dimmBlackList" => "dimm_black_list", 
        "dn" => "dn", 
        "failedMemory" => "failed_memory", 
        "id" => "id", 
        "ignoredMemory" => "ignored_memory", 
        "maxDevices" => "max_devices", 
        "memoryConfiguration" => "memory_configuration", 
        "memoryRASPossible" => "memory_ras_possible", 
        "numOfFailedDimms" => "num_of_failed_dimms", 
        "numOfIgnoredDimms" => "num_of_ignored_dimms", 
        "overallDIMMStatus" => "overall_dimm_status", 
        "populated" => "populated", 
        "presence" => "presence", 
        "redundantMemory" => "redundant_memory", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "currCapacity" => "curr_capacity", 
            "dimmBlackList" => "dimm_black_list", 
            "dn" => "dn", 
            "failedMemory" => "failed_memory", 
            "id" => "id", 
            "ignoredMemory" => "ignored_memory", 
            "maxDevices" => "max_devices", 
            "memoryConfiguration" => "memory_configuration", 
            "memoryRASPossible" => "memory_ras_possible", 
            "numOfFailedDimms" => "num_of_failed_dimms", 
            "numOfIgnoredDimms" => "num_of_ignored_dimms", 
            "overallDIMMStatus" => "overall_dimm_status", 
            "populated" => "populated", 
            "presence" => "presence", 
            "redundantMemory" => "redundant_memory", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_reader :child_action
    attr_reader :curr_capacity
    attr_accessor :dimm_black_list
    attr_reader :failed_memory
    attr_reader :ignored_memory
    attr_reader :max_devices
    attr_reader :memory_configuration
    attr_reader :memory_ras_possible
    attr_reader :num_of_failed_dimms
    attr_reader :num_of_ignored_dimms
    attr_reader :overall_dimm_status
    attr_reader :populated
    attr_reader :presence
    attr_reader :redundant_memory
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @child_action = nil
        @curr_capacity = nil
        @dimm_black_list = nil
        @failed_memory = nil
        @ignored_memory = nil
        @max_devices = nil
        @memory_configuration = nil
        @memory_ras_possible = nil
        @num_of_failed_dimms = nil
        @num_of_ignored_dimms = nil
        @overall_dimm_status = nil
        @populated = nil
        @presence = nil
        @redundant_memory = nil
        @status = nil

        super(class_id: "MemoryArray", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
