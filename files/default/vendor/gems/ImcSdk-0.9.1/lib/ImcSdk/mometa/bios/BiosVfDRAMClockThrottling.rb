#This module contains the general information for BiosVfDRAMClockThrottling ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfDRAMClockThrottlingConsts
    VP_DRAMCLOCK_THROTTLING_AUTO = "Auto"
    VP_DRAMCLOCK_THROTTLING_BALANCED = "Balanced"
    VP_DRAMCLOCK_THROTTLING_ENERGY_EFFICIENT = "Energy Efficient"
    VP_DRAMCLOCK_THROTTLING_PERFORMANCE = "Performance"
    VP_DRAMCLOCK_THROTTLING_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfDRAMClockThrottling < ManagedObject
    #This is BiosVfDRAMClockThrottling class.

    @@consts = BiosVfDRAMClockThrottlingConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfDRAMClockThrottling", "biosVfDRAMClockThrottling", "DRAM-Clock-Throttling", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfDRAMClockThrottling", "biosVfDRAMClockThrottling", "DRAM-Clock-Throttling", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
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
        "vp_dram_clock_throttling" => MoPropertyMeta.new("vp_dram_clock_throttling", "vpDRAMClockThrottling", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Auto", "Balanced", "Energy Efficient", "Performance", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_dram_clock_throttling" => MoPropertyMeta.new("vp_dram_clock_throttling", "vpDRAMClockThrottling", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Auto", "Balanced", "Energy Efficient", "Performance", "platform-default"], []), 
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
        "vpDRAMClockThrottling" => "vp_dram_clock_throttling", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpDRAMClockThrottling" => "vp_dram_clock_throttling", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_dram_clock_throttling


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_dram_clock_throttling = nil

        super(class_id: "BiosVfDRAMClockThrottling", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
