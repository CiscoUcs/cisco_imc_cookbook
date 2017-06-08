#This module contains the general information for BiosVfCmciEnable ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfCmciEnableConsts
    VP_CMCI_ENABLE_DISABLED = "Disabled"
    VP_CMCI_ENABLE_ENABLED = "Enabled"
    _VP_CMCI_ENABLE_DISABLED = "disabled"
    _VP_CMCI_ENABLE_ENABLED = "enabled"
    VP_CMCI_ENABLE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfCmciEnable < ManagedObject
    #This is BiosVfCmciEnable class.

    @@consts = BiosVfCmciEnableConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfCmciEnable", "biosVfCmciEnable", "Cmci-Enable", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfCmciEnable", "biosVfCmciEnable", "Cmci-Enable", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
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
        "vp_cmci_enable" => MoPropertyMeta.new("vp_cmci_enable", "vpCmciEnable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_cmci_enable" => MoPropertyMeta.new("vp_cmci_enable", "vpCmciEnable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpCmciEnable" => "vp_cmci_enable", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpCmciEnable" => "vp_cmci_enable", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_cmci_enable


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_cmci_enable = nil

        super(class_id: "BiosVfCmciEnable", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
