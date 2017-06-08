#This module contains the general information for AdaptorEthInterruptProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorEthInterruptProfileConsts
    COALESCING_TYPE_IDLE = "IDLE"
    COALESCING_TYPE_MIN = "MIN"
    MODE_INTX = "INTx"
    MODE_MSI = "MSI"
    MODE_MSIX = "MSIx"
end


class AdaptorEthInterruptProfile < ManagedObject
    #This is AdaptorEthInterruptProfile class.

    @@consts = AdaptorEthInterruptProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorEthInterruptProfile", "adaptorEthInterruptProfile", "eth-int", VersionMeta::VERSION151F, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorEthInterruptProfile", "adaptorEthInterruptProfile", "eth-int", VersionMeta::VERSION2013E, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "coalescing_time" => MoPropertyMeta.new("coalescing_time", "coalescingTime", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, [], ["0-65535"]), 
        "coalescing_type" => MoPropertyMeta.new("coalescing_type", "coalescingType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["IDLE", "MIN"], []), 
        "count" => MoPropertyMeta.new("count", "count", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["1-514"]), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "mode" => MoPropertyMeta.new("mode", "mode", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["INTx", "MSI", "MSIx"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "coalescing_time" => MoPropertyMeta.new("coalescing_time", "coalescingTime", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, [], ["0-65535"]), 
            "coalescing_type" => MoPropertyMeta.new("coalescing_type", "coalescingType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["IDLE", "MIN"], []), 
            "count" => MoPropertyMeta.new("count", "count", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["1-514"]), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "mode" => MoPropertyMeta.new("mode", "mode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["INTx", "MSI", "MSIx"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "coalescingTime" => "coalescing_time", 
        "coalescingType" => "coalescing_type", 
        "count" => "count", 
        "dn" => "dn", 
        "mode" => "mode", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "coalescingTime" => "coalescing_time", 
            "coalescingType" => "coalescing_type", 
            "count" => "count", 
            "dn" => "dn", 
            "mode" => "mode", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :coalescing_time
    attr_accessor :coalescing_type
    attr_accessor :count
    attr_accessor :mode
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @coalescing_time = nil
        @coalescing_type = nil
        @count = nil
        @mode = nil
        @status = nil

        super(class_id: "AdaptorEthInterruptProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
