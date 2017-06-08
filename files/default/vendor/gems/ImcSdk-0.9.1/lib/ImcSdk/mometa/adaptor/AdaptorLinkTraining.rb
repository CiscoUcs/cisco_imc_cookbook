#This module contains the general information for AdaptorLinkTraining ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorLinkTrainingConsts
    LINK_TRAINING_N_A = "n/a"
    LINK_TRAINING_OFF = "off"
    LINK_TRAINING_ON = "on"
end


class AdaptorLinkTraining < ManagedObject
    #This is AdaptorLinkTraining class.

    @@consts = AdaptorLinkTrainingConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorLinkTraining", "adaptorLinkTraining", "link-training", VersionMeta::VERSION204C, "InputOutput", 0x3f, [], ["admin", "user"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION204C, MoPropertyMeta::INTERNAL, 0x2, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "link_training" => MoPropertyMeta.new("link_training", "linkTraining", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["n/a", "off", "on"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "linkTraining" => "link_training", 
        "rn" => "rn", 
        "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :child_action
    attr_accessor :link_training
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @link_training = nil
        @status = nil

        super(class_id: "AdaptorLinkTraining", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
