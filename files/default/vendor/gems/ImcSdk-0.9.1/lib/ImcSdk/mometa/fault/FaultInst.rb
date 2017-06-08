#This module contains the general information for FaultInst ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class FaultInstConsts
    ACK_FALSE = "false"
    ACK_NO = "no"
    ACK_TRUE = "true"
    ACK_YES = "yes"
    HIGHEST_SEVERITY_CLEARED = "cleared"
    HIGHEST_SEVERITY_CONDITION = "condition"
    HIGHEST_SEVERITY_CRITICAL = "critical"
    HIGHEST_SEVERITY_INFO = "info"
    HIGHEST_SEVERITY_MAJOR = "major"
    HIGHEST_SEVERITY_MINOR = "minor"
    HIGHEST_SEVERITY_WARNING = "warning"
    ORIG_SEVERITY_CLEARED = "cleared"
    ORIG_SEVERITY_CONDITION = "condition"
    ORIG_SEVERITY_CRITICAL = "critical"
    ORIG_SEVERITY_INFO = "info"
    ORIG_SEVERITY_MAJOR = "major"
    ORIG_SEVERITY_MINOR = "minor"
    ORIG_SEVERITY_WARNING = "warning"
    PREV_SEVERITY_CLEARED = "cleared"
    PREV_SEVERITY_CONDITION = "condition"
    PREV_SEVERITY_CRITICAL = "critical"
    PREV_SEVERITY_INFO = "info"
    PREV_SEVERITY_MAJOR = "major"
    PREV_SEVERITY_MINOR = "minor"
    PREV_SEVERITY_WARNING = "warning"
    SEVERITY_CLEARED = "cleared"
    SEVERITY_CONDITION = "condition"
    SEVERITY_CRITICAL = "critical"
    SEVERITY_INFO = "info"
    SEVERITY_MAJOR = "major"
    SEVERITY_MINOR = "minor"
    SEVERITY_WARNING = "warning"
    TYPE_CONFIGURATION = "configuration"
    TYPE_CONNECTIVITY = "connectivity"
    TYPE_ENVIRONMENTAL = "environmental"
    TYPE_EQUIPMENT = "equipment"
    TYPE_FSM = "fsm"
    TYPE_GENERIC = "generic"
    TYPE_MANAGEMENT = "management"
    TYPE_NETWORK = "network"
    TYPE_OPERATIONAL = "operational"
    TYPE_SERVER = "server"
    TYPE_SYSDEBUG = "sysdebug"
end


class FaultInst < ManagedObject
    #This is FaultInst class.

    @@consts = FaultInstConsts.new()
#    @@naming_props = set([u'code'])

    @@mo_meta = {
        "classic" => MoMeta.new("FaultInst", "faultInst", "fault-[code]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("FaultInst", "faultInst", "fault-[code]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "ack" => MoPropertyMeta.new("ack", "ack", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["false", "no", "true", "yes"], []), 
        "affected_dn" => MoPropertyMeta.new("affected_dn", "affectedDN", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 255, nil, [], []), 
        "cause" => MoPropertyMeta.new("cause", "cause", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "change_set" => MoPropertyMeta.new("change_set", "changeSet", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 512, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "code" => MoPropertyMeta.new("code", "code", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
        "created" => MoPropertyMeta.new("created", "created", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 384, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "highest_severity" => MoPropertyMeta.new("highest_severity", "highestSeverity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cleared", "condition", "critical", "info", "major", "minor", "warning"], []), 
        "id" => MoPropertyMeta.new("id", "id", "ulong", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "last_transition" => MoPropertyMeta.new("last_transition", "lastTransition", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "lc" => MoPropertyMeta.new("lc", "lc", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{((defaultValue|none|flapping|soaking-clear),){0,3}(defaultValue|none|flapping|soaking-clear){0,1}}, [], []), 
        "occur" => MoPropertyMeta.new("occur", "occur", "ushort", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "orig_severity" => MoPropertyMeta.new("orig_severity", "origSeverity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cleared", "condition", "critical", "info", "major", "minor", "warning"], []), 
        "prev_severity" => MoPropertyMeta.new("prev_severity", "prevSeverity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cleared", "condition", "critical", "info", "major", "minor", "warning"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "rule" => MoPropertyMeta.new("rule", "rule", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "severity" => MoPropertyMeta.new("severity", "severity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cleared", "condition", "critical", "info", "major", "minor", "warning"], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "tags" => MoPropertyMeta.new("tags", "tags", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{((defaultValue|generic|server|network|storage|pod|security|operations|fsmstagefail|fsmstageretry|fsmstageremoteinv),){0,10}(defaultValue|generic|server|network|storage|pod|security|operations|fsmstagefail|fsmstageretry|fsmstageremoteinv){0,1}}, [], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["configuration", "connectivity", "environmental", "equipment", "fsm", "generic", "management", "network", "operational", "server", "sysdebug"], []), 
        },

        "modular" => {
            "ack" => MoPropertyMeta.new("ack", "ack", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["false", "no", "true", "yes"], []), 
            "affected_dn" => MoPropertyMeta.new("affected_dn", "affectedDN", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 255, nil, [], []), 
            "cause" => MoPropertyMeta.new("cause", "cause", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "change_set" => MoPropertyMeta.new("change_set", "changeSet", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 512, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "code" => MoPropertyMeta.new("code", "code", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
            "created" => MoPropertyMeta.new("created", "created", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 384, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "highest_severity" => MoPropertyMeta.new("highest_severity", "highestSeverity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cleared", "condition", "critical", "info", "major", "minor", "warning"], []), 
            "id" => MoPropertyMeta.new("id", "id", "ulong", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "last_transition" => MoPropertyMeta.new("last_transition", "lastTransition", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "lc" => MoPropertyMeta.new("lc", "lc", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{((defaultValue|none|flapping|soaking-clear),){0,3}(defaultValue|none|flapping|soaking-clear){0,1}}, [], []), 
            "occur" => MoPropertyMeta.new("occur", "occur", "ushort", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "orig_severity" => MoPropertyMeta.new("orig_severity", "origSeverity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cleared", "condition", "critical", "info", "major", "minor", "warning"], []), 
            "prev_severity" => MoPropertyMeta.new("prev_severity", "prevSeverity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cleared", "condition", "critical", "info", "major", "minor", "warning"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "rule" => MoPropertyMeta.new("rule", "rule", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "severity" => MoPropertyMeta.new("severity", "severity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cleared", "condition", "critical", "info", "major", "minor", "warning"], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "tags" => MoPropertyMeta.new("tags", "tags", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{((defaultValue|generic|server|network|storage|pod|security|operations|fsmstagefail|fsmstageretry|fsmstageremoteinv),){0,10}(defaultValue|generic|server|network|storage|pod|security|operations|fsmstagefail|fsmstageretry|fsmstageremoteinv){0,1}}, [], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["configuration", "connectivity", "environmental", "equipment", "fsm", "generic", "management", "network", "operational", "server", "sysdebug"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "ack" => "ack", 
        "affectedDN" => "affected_dn", 
        "cause" => "cause", 
        "changeSet" => "change_set", 
        "childAction" => "child_action", 
        "code" => "code", 
        "created" => "created", 
        "descr" => "descr", 
        "dn" => "dn", 
        "highestSeverity" => "highest_severity", 
        "id" => "id", 
        "lastTransition" => "last_transition", 
        "lc" => "lc", 
        "occur" => "occur", 
        "origSeverity" => "orig_severity", 
        "prevSeverity" => "prev_severity", 
        "rn" => "rn", 
        "rule" => "rule", 
        "severity" => "severity", 
        "status" => "status", 
        "tags" => "tags", 
        "type" => "type", 
        },

        "modular" => {
            "ack" => "ack", 
            "affectedDN" => "affected_dn", 
            "cause" => "cause", 
            "changeSet" => "change_set", 
            "childAction" => "child_action", 
            "code" => "code", 
            "created" => "created", 
            "descr" => "descr", 
            "dn" => "dn", 
            "highestSeverity" => "highest_severity", 
            "id" => "id", 
            "lastTransition" => "last_transition", 
            "lc" => "lc", 
            "occur" => "occur", 
            "origSeverity" => "orig_severity", 
            "prevSeverity" => "prev_severity", 
            "rn" => "rn", 
            "rule" => "rule", 
            "severity" => "severity", 
            "status" => "status", 
            "tags" => "tags", 
            "type" => "type", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :code
    attr_reader :ack
    attr_reader :affected_dn
    attr_reader :cause
    attr_reader :change_set
    attr_reader :child_action
    attr_reader :created
    attr_reader :descr
    attr_reader :highest_severity
    attr_reader :id
    attr_reader :last_transition
    attr_reader :lc
    attr_reader :occur
    attr_reader :orig_severity
    attr_reader :prev_severity
    attr_reader :rule
    attr_reader :severity
    attr_reader :status
    attr_reader :tags
    attr_reader :type


    def initialize(parent_mo_or_dn: nil,code: nil,  **kwargs)
        @dirty_mask = 0
        @code = code
        @ack = nil
        @affected_dn = nil
        @cause = nil
        @change_set = nil
        @child_action = nil
        @created = nil
        @descr = nil
        @highest_severity = nil
        @id = nil
        @last_transition = nil
        @lc = nil
        @occur = nil
        @orig_severity = nil
        @prev_severity = nil
        @rule = nil
        @severity = nil
        @status = nil
        @tags = nil
        @type = nil

        super(class_id: "FaultInst", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
