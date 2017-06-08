#This module contains the general information for BiosVfAutonumousCstateEnable ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfAutonumousCstateEnableConsts
    VP_AUTONUMOUS_CSTATE_ENABLE_DISABLED = "Disabled"
    VP_AUTONUMOUS_CSTATE_ENABLE_ENABLED = "Enabled"
    _VP_AUTONUMOUS_CSTATE_ENABLE_DISABLED = "disabled"
    _VP_AUTONUMOUS_CSTATE_ENABLE_ENABLED = "enabled"
    VP_AUTONUMOUS_CSTATE_ENABLE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfAutonumousCstateEnable < ManagedObject
    #This is BiosVfAutonumousCstateEnable class.

    @@consts = BiosVfAutonumousCstateEnableConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfAutonumousCstateEnable", "biosVfAutonumousCstateEnable", "Autonumous-Cstate-Enable", VersionMeta::VERSION2010B, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2010B, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2010B, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2010B, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2010B, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_autonumous_cstate_enable" => MoPropertyMeta.new("vp_autonumous_cstate_enable", "vpAutonumousCstateEnable", "string", VersionMeta::VERSION2010B, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpAutonumousCstateEnable" => "vp_autonumous_cstate_enable", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_autonumous_cstate_enable


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_autonumous_cstate_enable = nil

        super(class_id: "BiosVfAutonumousCstateEnable", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
