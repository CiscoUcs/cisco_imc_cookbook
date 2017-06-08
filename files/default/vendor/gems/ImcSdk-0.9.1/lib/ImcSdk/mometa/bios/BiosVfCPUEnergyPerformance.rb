#This module contains the general information for BiosVfCPUEnergyPerformance ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfCPUEnergyPerformanceConsts
    VP_CPUENERGY_PERFORMANCE_BALANCED_ENERGY = "balanced-energy"
    VP_CPUENERGY_PERFORMANCE_BALANCED_PERFORMANCE = "balanced-performance"
    VP_CPUENERGY_PERFORMANCE_ENERGY_EFFICIENT = "energy-efficient"
    VP_CPUENERGY_PERFORMANCE_PERFORMANCE = "performance"
    VP_CPUENERGY_PERFORMANCE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfCPUEnergyPerformance < ManagedObject
    #This is BiosVfCPUEnergyPerformance class.

    @@consts = BiosVfCPUEnergyPerformanceConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfCPUEnergyPerformance", "biosVfCPUEnergyPerformance", "CPU-EngPerfBias", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfCPUEnergyPerformance", "biosVfCPUEnergyPerformance", "CPU-EngPerfBias", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
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
        "vp_cpu_energy_performance" => MoPropertyMeta.new("vp_cpu_energy_performance", "vpCPUEnergyPerformance", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["balanced-energy", "balanced-performance", "energy-efficient", "performance", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_cpu_energy_performance" => MoPropertyMeta.new("vp_cpu_energy_performance", "vpCPUEnergyPerformance", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["balanced-energy", "balanced-performance", "energy-efficient", "performance", "platform-default"], []), 
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
        "vpCPUEnergyPerformance" => "vp_cpu_energy_performance", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpCPUEnergyPerformance" => "vp_cpu_energy_performance", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_cpu_energy_performance


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_cpu_energy_performance = nil

        super(class_id: "BiosVfCPUEnergyPerformance", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
