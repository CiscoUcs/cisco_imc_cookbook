#This module contains the general information for BiosVfLOMPortOptionROM ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfLOMPortOptionROMConsts
    VP_LOMPORT0_STATE_DISABLED = "Disabled"
    VP_LOMPORT0_STATE_ENABLED = "Enabled"
    VP_LOMPORT0_STATE_LEGACY_ONLY = "Legacy Only"
    VP_LOMPORT0_STATE_UEFI_ONLY = "UEFI Only"
    _VP_LOMPORT0_STATE_DISABLED = "disabled"
    _VP_LOMPORT0_STATE_ENABLED = "enabled"
    VP_LOMPORT0_STATE_PLATFORM_DEFAULT = "platform-default"
    VP_LOMPORT1_STATE_DISABLED = "Disabled"
    VP_LOMPORT1_STATE_ENABLED = "Enabled"
    VP_LOMPORT1_STATE_LEGACY_ONLY = "Legacy Only"
    VP_LOMPORT1_STATE_UEFI_ONLY = "UEFI Only"
    _VP_LOMPORT1_STATE_DISABLED = "disabled"
    _VP_LOMPORT1_STATE_ENABLED = "enabled"
    VP_LOMPORT1_STATE_PLATFORM_DEFAULT = "platform-default"
    VP_LOMPORT2_STATE_DISABLED = "Disabled"
    VP_LOMPORT2_STATE_ENABLED = "Enabled"
    VP_LOMPORT2_STATE_LEGACY_ONLY = "Legacy Only"
    VP_LOMPORT2_STATE_UEFI_ONLY = "UEFI Only"
    _VP_LOMPORT2_STATE_DISABLED = "disabled"
    _VP_LOMPORT2_STATE_ENABLED = "enabled"
    VP_LOMPORT2_STATE_PLATFORM_DEFAULT = "platform-default"
    VP_LOMPORT3_STATE_DISABLED = "Disabled"
    VP_LOMPORT3_STATE_ENABLED = "Enabled"
    VP_LOMPORT3_STATE_LEGACY_ONLY = "Legacy Only"
    VP_LOMPORT3_STATE_UEFI_ONLY = "UEFI Only"
    _VP_LOMPORT3_STATE_DISABLED = "disabled"
    _VP_LOMPORT3_STATE_ENABLED = "enabled"
    VP_LOMPORT3_STATE_PLATFORM_DEFAULT = "platform-default"
    VP_LOMPORTS_ALL_STATE_DISABLED = "Disabled"
    VP_LOMPORTS_ALL_STATE_ENABLED = "Enabled"
    _VP_LOMPORTS_ALL_STATE_DISABLED = "disabled"
    _VP_LOMPORTS_ALL_STATE_ENABLED = "enabled"
    VP_LOMPORTS_ALL_STATE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfLOMPortOptionROM < ManagedObject
    #This is BiosVfLOMPortOptionROM class.

    @@consts = BiosVfLOMPortOptionROMConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfLOMPortOptionROM", "biosVfLOMPortOptionROM", "LOMPort-OptionROM", VersionMeta::VERSION151F, "InputOutput", 0x1ff, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfLOMPortOptionROM", "biosVfLOMPortOptionROM", "LOMPort-OptionROM", VersionMeta::VERSION2013E, "InputOutput", 0x1ff, [], ["admin"], ["Get", "Set"])
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
        "vp_lom_port0_state" => MoPropertyMeta.new("vp_lom_port0_state", "vpLOMPort0State", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "Legacy Only", "UEFI Only", "disabled", "enabled", "platform-default"], []), 
        "vp_lom_port1_state" => MoPropertyMeta.new("vp_lom_port1_state", "vpLOMPort1State", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "Legacy Only", "UEFI Only", "disabled", "enabled", "platform-default"], []), 
        "vp_lom_port2_state" => MoPropertyMeta.new("vp_lom_port2_state", "vpLOMPort2State", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "Legacy Only", "UEFI Only", "disabled", "enabled", "platform-default"], []), 
        "vp_lom_port3_state" => MoPropertyMeta.new("vp_lom_port3_state", "vpLOMPort3State", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "Legacy Only", "UEFI Only", "disabled", "enabled", "platform-default"], []), 
        "vp_lom_ports_all_state" => MoPropertyMeta.new("vp_lom_ports_all_state", "vpLOMPortsAllState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_lom_port0_state" => MoPropertyMeta.new("vp_lom_port0_state", "vpLOMPort0State", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "Legacy Only", "UEFI Only", "disabled", "enabled", "platform-default"], []), 
            "vp_lom_port1_state" => MoPropertyMeta.new("vp_lom_port1_state", "vpLOMPort1State", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "Legacy Only", "UEFI Only", "disabled", "enabled", "platform-default"], []), 
            "vp_lom_port2_state" => MoPropertyMeta.new("vp_lom_port2_state", "vpLOMPort2State", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "Legacy Only", "UEFI Only", "disabled", "enabled", "platform-default"], []), 
            "vp_lom_port3_state" => MoPropertyMeta.new("vp_lom_port3_state", "vpLOMPort3State", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "Legacy Only", "UEFI Only", "disabled", "enabled", "platform-default"], []), 
            "vp_lom_ports_all_state" => MoPropertyMeta.new("vp_lom_ports_all_state", "vpLOMPortsAllState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpLOMPort0State" => "vp_lom_port0_state", 
        "vpLOMPort1State" => "vp_lom_port1_state", 
        "vpLOMPort2State" => "vp_lom_port2_state", 
        "vpLOMPort3State" => "vp_lom_port3_state", 
        "vpLOMPortsAllState" => "vp_lom_ports_all_state", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpLOMPort0State" => "vp_lom_port0_state", 
            "vpLOMPort1State" => "vp_lom_port1_state", 
            "vpLOMPort2State" => "vp_lom_port2_state", 
            "vpLOMPort3State" => "vp_lom_port3_state", 
            "vpLOMPortsAllState" => "vp_lom_ports_all_state", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_lom_port0_state
    attr_accessor :vp_lom_port1_state
    attr_accessor :vp_lom_port2_state
    attr_accessor :vp_lom_port3_state
    attr_accessor :vp_lom_ports_all_state


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_lom_port0_state = nil
        @vp_lom_port1_state = nil
        @vp_lom_port2_state = nil
        @vp_lom_port3_state = nil
        @vp_lom_ports_all_state = nil

        super(class_id: "BiosVfLOMPortOptionROM", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
