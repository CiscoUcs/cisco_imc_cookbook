#This module contains the general information for BiosVfCPUPowerManagement ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfCPUPowerManagementConsts
    VP_CPUPOWER_MANAGEMENT_CUSTOM = "custom"
    VP_CPUPOWER_MANAGEMENT_DISABLED = "disabled"
    VP_CPUPOWER_MANAGEMENT_ENERGY_EFFICIENT = "energy-efficient"
    VP_CPUPOWER_MANAGEMENT_PERFORMANCE = "performance"
    VP_CPUPOWER_MANAGEMENT_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfCPUPowerManagement < ManagedObject
    #This is BiosVfCPUPowerManagement class.

    @@consts = BiosVfCPUPowerManagementConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfCPUPowerManagement", "biosVfCPUPowerManagement", "CPU-PowerManagement", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfCPUPowerManagement", "biosVfCPUPowerManagement", "CPU-PowerManagement", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
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
        "vp_cpu_power_management" => MoPropertyMeta.new("vp_cpu_power_management", "vpCPUPowerManagement", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["custom", "disabled", "energy-efficient", "performance", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_cpu_power_management" => MoPropertyMeta.new("vp_cpu_power_management", "vpCPUPowerManagement", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["custom", "disabled", "energy-efficient", "performance", "platform-default"], []), 
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
        "vpCPUPowerManagement" => "vp_cpu_power_management", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpCPUPowerManagement" => "vp_cpu_power_management", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_cpu_power_management


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_cpu_power_management = nil

        super(class_id: "BiosVfCPUPowerManagement", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
