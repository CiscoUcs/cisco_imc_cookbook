#This module contains the general information for AdaptorExtEthIf ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorExtEthIfConsts
    ADMIN_SPEED_ = "-"
    ADMIN_SPEED_10_GBPS = "10Gbps"
    ADMIN_SPEED_1_GBPS = "1Gbps"
    ADMIN_SPEED_40_GBPS = "40Gbps"
    ADMIN_SPEED_4X10_GBPS = "4x10Gbps"
    ADMIN_SPEED_AUTO = "Auto"
    IF_TYPE_AGGREGATION = "aggregation"
    IF_TYPE_PHYSICAL = "physical"
    IF_TYPE_UNKNOWN = "unknown"
    IF_TYPE_VIRTUAL = "virtual"
    LINK_STATE_ADMIN_DOWN = "admin-down"
    LINK_STATE_DOWN = "down"
    LINK_STATE_ERROR = "error"
    LINK_STATE_UNALLOCATED = "unallocated"
    LINK_STATE_UNAVAILABLE = "unavailable"
    LINK_STATE_UNKNOWN = "unknown"
    LINK_STATE_UP = "up"
    OPER_SPEED_ = "-"
    OPER_SPEED_10_GBPS = "10Gbps"
    OPER_SPEED_1_GBPS = "1Gbps"
    OPER_SPEED_40_GBPS = "40Gbps"
    OPER_SPEED_4X10_GBPS = "4x10Gbps"
    OPER_SPEED_AUTO = "Auto"
    PORT_ID_0 = "0"
    PORT_ID_1 = "1"
end


class AdaptorExtEthIf < ManagedObject
    #This is AdaptorExtEthIf class.

    @@consts = AdaptorExtEthIfConsts.new()
#    @@naming_props = set([u'portId'])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorExtEthIf", "adaptorExtEthIf", "ext-eth-[port_id]", VersionMeta::VERSION151F, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorExtEthIf", "adaptorExtEthIf", "ext-eth-[port_id]", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_speed" => MoPropertyMeta.new("admin_speed", "adminSpeed", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["-", "10Gbps", "1Gbps", "40Gbps", "4x10Gbps", "Auto"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "if_type" => MoPropertyMeta.new("if_type", "ifType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["aggregation", "physical", "unknown", "virtual"], []), 
        "link_state" => MoPropertyMeta.new("link_state", "linkState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["admin-down", "down", "error", "unallocated", "unavailable", "unknown", "up"], []), 
        "mac" => MoPropertyMeta.new("mac", "mac", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{(([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F]))|0}, [], []), 
        "oper_speed" => MoPropertyMeta.new("oper_speed", "operSpeed", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["-", "10Gbps", "1Gbps", "40Gbps", "4x10Gbps", "Auto"], []), 
        "port_id" => MoPropertyMeta.new("port_id", "portId", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x8, nil, nil, nil, ["0", "1"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "transport" => MoPropertyMeta.new("transport", "transport", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        },

        "modular" => {
            "admin_speed" => MoPropertyMeta.new("admin_speed", "adminSpeed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["-", "40Gbps", "4x10Gbps", "Auto"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "if_type" => MoPropertyMeta.new("if_type", "ifType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["aggregation", "physical", "unknown", "virtual"], []), 
            "link_state" => MoPropertyMeta.new("link_state", "linkState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["admin-down", "down", "error", "unallocated", "unavailable", "unknown", "up"], []), 
            "mac" => MoPropertyMeta.new("mac", "mac", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{(([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F]))|0}, [], []), 
            "oper_speed" => MoPropertyMeta.new("oper_speed", "operSpeed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["-", "10Gbps", "1Gbps", "40Gbps", "4x10Gbps", "Auto"], []), 
            "port_id" => MoPropertyMeta.new("port_id", "portId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x8, nil, nil, nil, ["0", "1"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "transport" => MoPropertyMeta.new("transport", "transport", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminSpeed" => "admin_speed", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "ifType" => "if_type", 
        "linkState" => "link_state", 
        "mac" => "mac", 
        "operSpeed" => "oper_speed", 
        "portId" => "port_id", 
        "rn" => "rn", 
        "status" => "status", 
        "transport" => "transport", 
        },

        "modular" => {
            "adminSpeed" => "admin_speed", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "ifType" => "if_type", 
            "linkState" => "link_state", 
            "mac" => "mac", 
            "operSpeed" => "oper_speed", 
            "portId" => "port_id", 
            "rn" => "rn", 
            "status" => "status", 
            "transport" => "transport", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :port_id
    attr_accessor :admin_speed
    attr_reader :child_action
    attr_reader :if_type
    attr_reader :link_state
    attr_reader :mac
    attr_reader :oper_speed
    attr_accessor :status
    attr_reader :transport


    def initialize(parent_mo_or_dn: nil,port_id: nil,  **kwargs)
        @dirty_mask = 0
        @port_id = port_id
        @admin_speed = nil
        @child_action = nil
        @if_type = nil
        @link_state = nil
        @mac = nil
        @oper_speed = nil
        @status = nil
        @transport = nil

        super(class_id: "AdaptorExtEthIf", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
