#This module contains the general information for BiosVfCoreMultiProcessing ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfCoreMultiProcessingConsts
    VP_CORE_MULTI_PROCESSING_1 = "1"
    VP_CORE_MULTI_PROCESSING_10 = "10"
    VP_CORE_MULTI_PROCESSING_11 = "11"
    VP_CORE_MULTI_PROCESSING_12 = "12"
    VP_CORE_MULTI_PROCESSING_13 = "13"
    VP_CORE_MULTI_PROCESSING_14 = "14"
    VP_CORE_MULTI_PROCESSING_15 = "15"
    VP_CORE_MULTI_PROCESSING_16 = "16"
    VP_CORE_MULTI_PROCESSING_17 = "17"
    VP_CORE_MULTI_PROCESSING_18 = "18"
    VP_CORE_MULTI_PROCESSING_19 = "19"
    VP_CORE_MULTI_PROCESSING_2 = "2"
    VP_CORE_MULTI_PROCESSING_20 = "20"
    VP_CORE_MULTI_PROCESSING_21 = "21"
    VP_CORE_MULTI_PROCESSING_22 = "22"
    VP_CORE_MULTI_PROCESSING_23 = "23"
    VP_CORE_MULTI_PROCESSING_3 = "3"
    VP_CORE_MULTI_PROCESSING_4 = "4"
    VP_CORE_MULTI_PROCESSING_5 = "5"
    VP_CORE_MULTI_PROCESSING_6 = "6"
    VP_CORE_MULTI_PROCESSING_7 = "7"
    VP_CORE_MULTI_PROCESSING_8 = "8"
    VP_CORE_MULTI_PROCESSING_9 = "9"
    VP_CORE_MULTI_PROCESSING_ALL = "all"
    VP_CORE_MULTI_PROCESSING_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfCoreMultiProcessing < ManagedObject
    #This is BiosVfCoreMultiProcessing class.

    @@consts = BiosVfCoreMultiProcessingConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfCoreMultiProcessing", "biosVfCoreMultiProcessing", "Core-MultiProcessing", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfCoreMultiProcessing", "biosVfCoreMultiProcessing", "Core-MultiProcessing", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_core_multi_processing" => MoPropertyMeta.new("vp_core_multi_processing", "vpCoreMultiProcessing", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["1", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "2", "20", "21", "22", "23", "3", "4", "5", "6", "7", "8", "9", "all", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_core_multi_processing" => MoPropertyMeta.new("vp_core_multi_processing", "vpCoreMultiProcessing", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["1", "10", "11", "12", "13", "14", "15", "16", "17", "18", "2", "3", "4", "5", "6", "7", "8", "9", "all", "platform-default"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "vpCoreMultiProcessing" => "vp_core_multi_processing", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpCoreMultiProcessing" => "vp_core_multi_processing", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_core_multi_processing


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_core_multi_processing = nil

        super(class_id: "BiosVfCoreMultiProcessing", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
