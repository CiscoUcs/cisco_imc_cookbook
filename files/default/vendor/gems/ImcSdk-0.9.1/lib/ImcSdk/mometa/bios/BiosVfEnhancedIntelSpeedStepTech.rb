#This module contains the general information for BiosVfEnhancedIntelSpeedStepTech ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfEnhancedIntelSpeedStepTechConsts
    VP_ENHANCED_INTEL_SPEED_STEP_TECH_DISABLED = "Disabled"
    VP_ENHANCED_INTEL_SPEED_STEP_TECH_ENABLED = "Enabled"
    _VP_ENHANCED_INTEL_SPEED_STEP_TECH_DISABLED = "disabled"
    _VP_ENHANCED_INTEL_SPEED_STEP_TECH_ENABLED = "enabled"
    VP_ENHANCED_INTEL_SPEED_STEP_TECH_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfEnhancedIntelSpeedStepTech < ManagedObject
    #This is BiosVfEnhancedIntelSpeedStepTech class.

    @@consts = BiosVfEnhancedIntelSpeedStepTechConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfEnhancedIntelSpeedStepTech", "biosVfEnhancedIntelSpeedStepTech", "Enhanced-Intel-SpeedStep-Tech", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfEnhancedIntelSpeedStepTech", "biosVfEnhancedIntelSpeedStepTech", "Enhanced-Intel-SpeedStep-Tech", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
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
        "vp_enhanced_intel_speed_step_tech" => MoPropertyMeta.new("vp_enhanced_intel_speed_step_tech", "vpEnhancedIntelSpeedStepTech", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_enhanced_intel_speed_step_tech" => MoPropertyMeta.new("vp_enhanced_intel_speed_step_tech", "vpEnhancedIntelSpeedStepTech", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpEnhancedIntelSpeedStepTech" => "vp_enhanced_intel_speed_step_tech", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpEnhancedIntelSpeedStepTech" => "vp_enhanced_intel_speed_step_tech", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_enhanced_intel_speed_step_tech


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_enhanced_intel_speed_step_tech = nil

        super(class_id: "BiosVfEnhancedIntelSpeedStepTech", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
