#This module contains the general information for BiosVfQPIConfig ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfQPIConfigConsts
    VP_QPILINK_FREQUENCY_6_4_GT_S = "6.4-gt/s"
    VP_QPILINK_FREQUENCY_7_2_GT_S = "7.2-gt/s"
    VP_QPILINK_FREQUENCY_8_0_GT_S = "8.0-gt/s"
    VP_QPILINK_FREQUENCY_AUTO = "auto"
    VP_QPILINK_FREQUENCY_PLATFORM_DEFAULT = "platform-default"
    VP_QPILINK_FREQUENCY_9_6_GT_S = "9.6-gt/s"
end


class BiosVfQPIConfig < ManagedObject
    #This is BiosVfQPIConfig class.

    @@consts = BiosVfQPIConfigConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfQPIConfig", "biosVfQPIConfig", "QPI-Config", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfQPIConfig", "biosVfQPIConfig", "QPI-Config", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
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
        "vp_qpi_link_frequency" => MoPropertyMeta.new("vp_qpi_link_frequency", "vpQPILinkFrequency", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["6.4-gt/s", "7.2-gt/s", "8.0-gt/s", "auto", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_qpi_link_frequency" => MoPropertyMeta.new("vp_qpi_link_frequency", "vpQPILinkFrequency", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["6.4-gt/s", "7.2-gt/s", "8.0-gt/s", "9.6-gt/s", "auto", "platform-default"], []), 
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
        "vpQPILinkFrequency" => "vp_qpi_link_frequency", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpQPILinkFrequency" => "vp_qpi_link_frequency", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_qpi_link_frequency


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_qpi_link_frequency = nil

        super(class_id: "BiosVfQPIConfig", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
