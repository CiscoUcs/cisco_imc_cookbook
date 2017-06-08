#This module contains the general information for BiosVfResumeOnACPowerLoss ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfResumeOnACPowerLossConsts
    DELAY_TYPE_FIXED = "fixed"
    DELAY_TYPE_RANDOM = "random"
    VP_RESUME_ON_ACPOWER_LOSS_LAST_STATE = "last-state"
    VP_RESUME_ON_ACPOWER_LOSS_RESET = "reset"
    VP_RESUME_ON_ACPOWER_LOSS_STAY_OFF = "stay-off"
    VP_RESUME_ON_ACPOWER_LOSS_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfResumeOnACPowerLoss < ManagedObject
    #This is BiosVfResumeOnACPowerLoss class.

    @@consts = BiosVfResumeOnACPowerLossConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfResumeOnACPowerLoss", "biosVfResumeOnACPowerLoss", "Resume-on-AC-power-loss", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfResumeOnACPowerLoss", "biosVfResumeOnACPowerLoss", "Resume-on-AC-power-loss", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "delay" => MoPropertyMeta.new("delay", "delay", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, [], ["0-240"]), 
        "delay_type" => MoPropertyMeta.new("delay_type", "delayType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["fixed", "random"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_resume_on_ac_power_loss" => MoPropertyMeta.new("vp_resume_on_ac_power_loss", "vpResumeOnACPowerLoss", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["last-state", "reset", "stay-off"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "delay" => MoPropertyMeta.new("delay", "delay", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, [], ["0-240"]), 
            "delay_type" => MoPropertyMeta.new("delay_type", "delayType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["fixed", "random"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_resume_on_ac_power_loss" => MoPropertyMeta.new("vp_resume_on_ac_power_loss", "vpResumeOnACPowerLoss", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["last-state", "platform-default", "reset", "stay-off"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "delay" => "delay", 
        "delayType" => "delay_type", 
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "vpResumeOnACPowerLoss" => "vp_resume_on_ac_power_loss", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "delay" => "delay", 
            "delayType" => "delay_type", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpResumeOnACPowerLoss" => "vp_resume_on_ac_power_loss", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :delay
    attr_accessor :delay_type
    attr_accessor :status
    attr_accessor :vp_resume_on_ac_power_loss


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @delay = nil
        @delay_type = nil
        @status = nil
        @vp_resume_on_ac_power_loss = nil

        super(class_id: "BiosVfResumeOnACPowerLoss", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
