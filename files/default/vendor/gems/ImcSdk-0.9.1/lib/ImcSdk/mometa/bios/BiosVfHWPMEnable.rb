#This module contains the general information for BiosVfHWPMEnable ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfHWPMEnableConsts
    VP_HWPMENABLE_DISABLED = "Disabled"
    VP_HWPMENABLE_NATIVE_MODE = "NATIVE MODE"
    VP_HWPMENABLE_OOB_MODE = "OOB MODE"
    VP_HWPMENABLE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfHWPMEnable < ManagedObject
    #This is BiosVfHWPMEnable class.

    @@consts = BiosVfHWPMEnableConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfHWPMEnable", "biosVfHWPMEnable", "HWPM-Enable", VersionMeta::VERSION2010B, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
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
        "vp_hwpm_enable" => MoPropertyMeta.new("vp_hwpm_enable", "vpHWPMEnable", "string", VersionMeta::VERSION2010B, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "NATIVE MODE", "OOB MODE", "platform-default"], []), 
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
        "vpHWPMEnable" => "vp_hwpm_enable", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_hwpm_enable


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_hwpm_enable = nil

        super(class_id: "BiosVfHWPMEnable", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
