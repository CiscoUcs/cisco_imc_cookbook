#This module contains the general information for NetworkAdapterUnit ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class NetworkAdapterUnitConsts
    PRESENCE_EMPTY = "empty"
    PRESENCE_EQUIPPED = "equipped"
    PRESENCE_MISSING = "missing"
    PRESENCE_NOT_SUPPORTED = "not-supported"
    PRESENCE_UNKNOWN = "unknown"
end


class NetworkAdapterUnit < ManagedObject
    #This is NetworkAdapterUnit class.

    @@consts = NetworkAdapterUnitConsts.new()
#    @@naming_props = set([u'slot'])

    @@mo_meta = {
        "classic" => MoMeta.new("NetworkAdapterUnit", "networkAdapterUnit", "network-adapter-[slot]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("NetworkAdapterUnit", "networkAdapterUnit", "network-adapter-[slot]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "num_intf" => MoPropertyMeta.new("num_intf", "numIntf", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "missing", "not-supported", "unknown"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "num_intf" => MoPropertyMeta.new("num_intf", "numIntf", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "missing", "not-supported", "unknown"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "model" => "model", 
        "numIntf" => "num_intf", 
        "presence" => "presence", 
        "rn" => "rn", 
        "slot" => "slot", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "model" => "model", 
            "numIntf" => "num_intf", 
            "presence" => "presence", 
            "rn" => "rn", 
            "slot" => "slot", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :slot
    attr_reader :child_action
    attr_reader :model
    attr_reader :num_intf
    attr_reader :presence
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,slot: nil,  **kwargs)
        @dirty_mask = 0
        @slot = slot
        @child_action = nil
        @model = nil
        @num_intf = nil
        @presence = nil
        @status = nil

        super(class_id: "NetworkAdapterUnit", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
