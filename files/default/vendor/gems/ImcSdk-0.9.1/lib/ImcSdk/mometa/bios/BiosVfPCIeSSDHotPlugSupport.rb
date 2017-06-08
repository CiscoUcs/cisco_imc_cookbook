#This module contains the general information for BiosVfPCIeSSDHotPlugSupport ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfPCIeSSDHotPlugSupportConsts
    VP_PCIE_SSDHOT_PLUG_SUPPORT_DISABLED = "Disabled"
    VP_PCIE_SSDHOT_PLUG_SUPPORT_ENABLED = "Enabled"
    _VP_PCIE_SSDHOT_PLUG_SUPPORT_DISABLED = "disabled"
    _VP_PCIE_SSDHOT_PLUG_SUPPORT_ENABLED = "enabled"
    VP_PCIE_SSDHOT_PLUG_SUPPORT_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfPCIeSSDHotPlugSupport < ManagedObject
    #This is BiosVfPCIeSSDHotPlugSupport class.

    @@consts = BiosVfPCIeSSDHotPlugSupportConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfPCIeSSDHotPlugSupport", "biosVfPCIeSSDHotPlugSupport", "PCIeSSDHotPlugSupport", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_pc_ie_ssd_hot_plug_support" => MoPropertyMeta.new("vp_pc_ie_ssd_hot_plug_support", "vpPCIeSSDHotPlugSupport", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpPCIeSSDHotPlugSupport" => "vp_pc_ie_ssd_hot_plug_support", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_pc_ie_ssd_hot_plug_support


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_pc_ie_ssd_hot_plug_support = nil

        super(class_id: "BiosVfPCIeSSDHotPlugSupport", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
