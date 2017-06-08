#This module contains the general information for AdaptorFcInterruptProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorFcInterruptProfileConsts
    MODE_INTX = "INTx"
    MODE_MSI = "MSI"
    MODE_MSIX = "MSIx"
end


class AdaptorFcInterruptProfile < ManagedObject
    #This is AdaptorFcInterruptProfile class.

    @@consts = AdaptorFcInterruptProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorFcInterruptProfile", "adaptorFcInterruptProfile", "fc-int", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorFcInterruptProfile", "adaptorFcInterruptProfile", "fc-int", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "mode" => MoPropertyMeta.new("mode", "mode", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["INTx", "MSI", "MSIx"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "mode" => MoPropertyMeta.new("mode", "mode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["INTx", "MSI", "MSIx"], []), 
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
        "dn" => "dn", 
        "mode" => "mode", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
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
    attr_accessor :mode
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @mode = nil
        @status = nil

        super(class_id: "AdaptorFcInterruptProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
