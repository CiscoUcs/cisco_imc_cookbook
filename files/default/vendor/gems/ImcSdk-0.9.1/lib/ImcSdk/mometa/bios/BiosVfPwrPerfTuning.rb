#This module contains the general information for BiosVfPwrPerfTuning ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfPwrPerfTuningConsts
    VP_PWR_PERF_TUNING_BIOS = "bios"
    VP_PWR_PERF_TUNING_OS = "os"
    VP_PWR_PERF_TUNING_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfPwrPerfTuning < ManagedObject
    #This is BiosVfPwrPerfTuning class.

    @@consts = BiosVfPwrPerfTuningConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfPwrPerfTuning", "biosVfPwrPerfTuning", "Pwr-Perf-Tuning", VersionMeta::VERSION204C, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfPwrPerfTuning", "biosVfPwrPerfTuning", "Pwr-Perf-Tuning", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_pwr_perf_tuning" => MoPropertyMeta.new("vp_pwr_perf_tuning", "vpPwrPerfTuning", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["bios", "os", "platform-default"], []), 
        },

        "modular" => {
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_pwr_perf_tuning" => MoPropertyMeta.new("vp_pwr_perf_tuning", "vpPwrPerfTuning", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["bios", "os", "platform-default"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "vpPwrPerfTuning" => "vp_pwr_perf_tuning", 
        },

        "modular" => {
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpPwrPerfTuning" => "vp_pwr_perf_tuning", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :status
    attr_accessor :vp_pwr_perf_tuning


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @status = nil
        @vp_pwr_perf_tuning = nil

        super(class_id: "BiosVfPwrPerfTuning", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
