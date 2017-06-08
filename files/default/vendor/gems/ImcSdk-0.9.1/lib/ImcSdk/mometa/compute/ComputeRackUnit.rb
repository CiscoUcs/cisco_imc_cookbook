#This module contains the general information for ComputeRackUnit ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class ComputeRackUnitConsts
    ADMIN_POWER_BMC_RESET_DEFAULT = "bmc-reset-default"
    ADMIN_POWER_BMC_RESET_IMMEDIATE = "bmc-reset-immediate"
    ADMIN_POWER_CMOS_RESET_IMMEDIATE = "cmos-reset-immediate"
    ADMIN_POWER_CYCLE_IMMEDIATE = "cycle-immediate"
    ADMIN_POWER_DIAGNOSTIC_INTERRUPT = "diagnostic-interrupt"
    ADMIN_POWER_DOWN = "down"
    ADMIN_POWER_HARD_RESET_IMMEDIATE = "hard-reset-immediate"
    ADMIN_POWER_POLICY = "policy"
    ADMIN_POWER_SOFT_SHUT_DOWN = "soft-shut-down"
    ADMIN_POWER_UP = "up"
    MEMORY_SPEED_ = ""
    MEMORY_SPEED_UNSPECIFIED = "unspecified"
    OPER_POWER_DEGRADED = "degraded"
    OPER_POWER_ERROR = "error"
    OPER_POWER_NOT_SUPPORTED = "not-supported"
    OPER_POWER_OFF = "off"
    OPER_POWER_OFFDUTY = "offduty"
    OPER_POWER_OFFLINE = "offline"
    OPER_POWER_ON = "on"
    OPER_POWER_ONLINE = "online"
    OPER_POWER_POWER_SAVE = "power-save"
    OPER_POWER_TEST = "test"
    OPER_POWER_UNKNOWN = "unknown"
    PRESENCE_EMPTY = "empty"
    PRESENCE_EQUIPPED = "equipped"
    PRESENCE_EQUIPPED_IDENTITY_UNESTABLISHABLE = "equipped-identity-unestablishable"
    PRESENCE_EQUIPPED_NOT_PRIMARY = "equipped-not-primary"
    PRESENCE_EQUIPPED_WITH_MALFORMED_FRU = "equipped-with-malformed-fru"
    PRESENCE_INACCESSIBLE = "inaccessible"
    PRESENCE_MISMATCH = "mismatch"
    PRESENCE_MISMATCH_IDENTITY_UNESTABLISHABLE = "mismatch-identity-unestablishable"
    PRESENCE_MISSING = "missing"
    PRESENCE_UNAUTHORIZED = "unauthorized"
    PRESENCE_UNKNOWN = "unknown"
end


class ComputeRackUnit < ManagedObject
    #This is ComputeRackUnit class.

    @@consts = ComputeRackUnitConsts.new()
#    @@naming_props = set([u'serverId'])

    @@mo_meta = {
        "classic" => MoMeta.new("ComputeRackUnit", "computeRackUnit", "rack-unit-[server_id]", VersionMeta::VERSION151F, "InputOutput", 0xff, [], ["admin", "user"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "adaptor_secure_update" => MoPropertyMeta.new("adaptor_secure_update", "adaptorSecureUpdate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "admin_power" => MoPropertyMeta.new("admin_power", "adminPower", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["bmc-reset-default", "bmc-reset-immediate", "cmos-reset-immediate", "cycle-immediate", "diagnostic-interrupt", "down", "hard-reset-immediate", "policy", "soft-shut-down", "up"], []), 
        "asset_tag" => MoPropertyMeta.new("asset_tag", "assetTag", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 32, %q{[^!|&]{0,32}}, [], []), 
        "available_memory" => MoPropertyMeta.new("available_memory", "availableMemory", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "chassis_serial" => MoPropertyMeta.new("chassis_serial", "chassisSerial", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "cimc_reset_reason" => MoPropertyMeta.new("cimc_reset_reason", "cimcResetReason", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "memory_speed" => MoPropertyMeta.new("memory_speed", "memorySpeed", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["", "unspecified"], ["0-4294967295"]), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "num_of_adaptors" => MoPropertyMeta.new("num_of_adaptors", "numOfAdaptors", "byte", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "num_of_cores" => MoPropertyMeta.new("num_of_cores", "numOfCores", "ulong", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "num_of_cores_enabled" => MoPropertyMeta.new("num_of_cores_enabled", "numOfCoresEnabled", "ulong", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "num_of_cpus" => MoPropertyMeta.new("num_of_cpus", "numOfCpus", "byte", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "num_of_eth_host_ifs" => MoPropertyMeta.new("num_of_eth_host_ifs", "numOfEthHostIfs", "ushort", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "num_of_fc_host_ifs" => MoPropertyMeta.new("num_of_fc_host_ifs", "numOfFcHostIfs", "ushort", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "num_of_threads" => MoPropertyMeta.new("num_of_threads", "numOfThreads", "ulong", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "oper_power" => MoPropertyMeta.new("oper_power", "operPower", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["degraded", "error", "not-supported", "off", "offduty", "offline", "on", "online", "power-save", "test", "unknown"], []), 
        "original_uuid" => MoPropertyMeta.new("original_uuid", "originalUuid", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{(([0-9a-fA-F]){8}\-([0-9a-fA-F]){4}\-([0-9a-fA-F]){4}\-([0-9a-fA-F]){4}\-([0-9a-fA-F]){12})|0}, [], []), 
        "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "equipped-identity-unestablishable", "equipped-not-primary", "equipped-with-malformed-fru", "inaccessible", "mismatch", "mismatch-identity-unestablishable", "missing", "unauthorized", "unknown"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "server_id" => MoPropertyMeta.new("server_id", "serverId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "total_memory" => MoPropertyMeta.new("total_memory", "totalMemory", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "usr_lbl" => MoPropertyMeta.new("usr_lbl", "usrLbl", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, 0, 64, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{0,64}}, [], []), 
        "uuid" => MoPropertyMeta.new("uuid", "uuid", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{(([0-9a-fA-F]){8}\-([0-9a-fA-F]){4}\-([0-9a-fA-F]){4}\-([0-9a-fA-F]){4}\-([0-9a-fA-F]){12})|0}, [], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adaptorSecureUpdate" => "adaptor_secure_update", 
        "adminPower" => "admin_power", 
        "assetTag" => "asset_tag", 
        "availableMemory" => "available_memory", 
        "chassisSerial" => "chassis_serial", 
        "childAction" => "child_action", 
        "cimcResetReason" => "cimc_reset_reason", 
        "dn" => "dn", 
        "memorySpeed" => "memory_speed", 
        "model" => "model", 
        "name" => "name", 
        "numOfAdaptors" => "num_of_adaptors", 
        "numOfCores" => "num_of_cores", 
        "numOfCoresEnabled" => "num_of_cores_enabled", 
        "numOfCpus" => "num_of_cpus", 
        "numOfEthHostIfs" => "num_of_eth_host_ifs", 
        "numOfFcHostIfs" => "num_of_fc_host_ifs", 
        "numOfThreads" => "num_of_threads", 
        "operPower" => "oper_power", 
        "originalUuid" => "original_uuid", 
        "presence" => "presence", 
        "rn" => "rn", 
        "serial" => "serial", 
        "serverId" => "server_id", 
        "status" => "status", 
        "totalMemory" => "total_memory", 
        "usrLbl" => "usr_lbl", 
        "uuid" => "uuid", 
        "vendor" => "vendor", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :server_id
    attr_accessor :adaptor_secure_update
    attr_accessor :admin_power
    attr_accessor :asset_tag
    attr_reader :available_memory
    attr_reader :chassis_serial
    attr_reader :child_action
    attr_reader :cimc_reset_reason
    attr_reader :memory_speed
    attr_reader :model
    attr_reader :name
    attr_reader :num_of_adaptors
    attr_reader :num_of_cores
    attr_reader :num_of_cores_enabled
    attr_reader :num_of_cpus
    attr_reader :num_of_eth_host_ifs
    attr_reader :num_of_fc_host_ifs
    attr_reader :num_of_threads
    attr_reader :oper_power
    attr_reader :original_uuid
    attr_reader :presence
    attr_reader :serial
    attr_accessor :status
    attr_reader :total_memory
    attr_accessor :usr_lbl
    attr_reader :uuid
    attr_reader :vendor


    def initialize(parent_mo_or_dn: nil,server_id: nil,  **kwargs)
        @dirty_mask = 0
        @server_id = server_id
        @adaptor_secure_update = nil
        @admin_power = nil
        @asset_tag = nil
        @available_memory = nil
        @chassis_serial = nil
        @child_action = nil
        @cimc_reset_reason = nil
        @memory_speed = nil
        @model = nil
        @name = nil
        @num_of_adaptors = nil
        @num_of_cores = nil
        @num_of_cores_enabled = nil
        @num_of_cpus = nil
        @num_of_eth_host_ifs = nil
        @num_of_fc_host_ifs = nil
        @num_of_threads = nil
        @oper_power = nil
        @original_uuid = nil
        @presence = nil
        @serial = nil
        @status = nil
        @total_memory = nil
        @usr_lbl = nil
        @uuid = nil
        @vendor = nil

        super(class_id: "ComputeRackUnit", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
