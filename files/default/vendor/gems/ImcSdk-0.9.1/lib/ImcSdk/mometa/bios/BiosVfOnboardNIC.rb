#This module contains the general information for BiosVfOnboardNIC ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfOnboardNICConsts
    VP_ONBOARD10_GBIT_LOM_DISABLED = "Disabled"
    VP_ONBOARD10_GBIT_LOM_ENABLED = "Enabled"
    _VP_ONBOARD10_GBIT_LOM_DISABLED = "disabled"
    _VP_ONBOARD10_GBIT_LOM_ENABLED = "enabled"
    VP_ONBOARD10_GBIT_LOM_PLATFORM_DEFAULT = "platform-default"
    VP_ONBOARD_GBIT_LOM_DISABLED = "Disabled"
    VP_ONBOARD_GBIT_LOM_ENABLED = "Enabled"
    _VP_ONBOARD_GBIT_LOM_DISABLED = "disabled"
    _VP_ONBOARD_GBIT_LOM_ENABLED = "enabled"
    VP_ONBOARD_GBIT_LOM_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfOnboardNIC < ManagedObject
    #This is BiosVfOnboardNIC class.

    @@consts = BiosVfOnboardNICConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfOnboardNIC", "biosVfOnboardNIC", "Onboard-NIC", VersionMeta::VERSION151F, "InputOutput", 0x3f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfOnboardNIC", "biosVfOnboardNIC", "Onboard-NIC", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin"], ["Get", "Set"])
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
        "vp_onboard10_gbit_lom" => MoPropertyMeta.new("vp_onboard10_gbit_lom", "vpOnboard10GbitLOM", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        "vp_onboard_gbit_lom" => MoPropertyMeta.new("vp_onboard_gbit_lom", "vpOnboardGbitLOM", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_onboard10_gbit_lom" => MoPropertyMeta.new("vp_onboard10_gbit_lom", "vpOnboard10GbitLOM", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
            "vp_onboard_gbit_lom" => MoPropertyMeta.new("vp_onboard_gbit_lom", "vpOnboardGbitLOM", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpOnboard10GbitLOM" => "vp_onboard10_gbit_lom", 
        "vpOnboardGbitLOM" => "vp_onboard_gbit_lom", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpOnboard10GbitLOM" => "vp_onboard10_gbit_lom", 
            "vpOnboardGbitLOM" => "vp_onboard_gbit_lom", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_onboard10_gbit_lom
    attr_accessor :vp_onboard_gbit_lom


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_onboard10_gbit_lom = nil
        @vp_onboard_gbit_lom = nil

        super(class_id: "BiosVfOnboardNIC", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
