#This module contains the general information for BiosVfMemoryInterleave ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfMemoryInterleaveConsts
    VP_CHANNEL_INTER_LEAVE_1_WAY = "1-way"
    VP_CHANNEL_INTER_LEAVE_2_WAY = "2-way"
    VP_CHANNEL_INTER_LEAVE_3_WAY = "3-way"
    VP_CHANNEL_INTER_LEAVE_4_WAY = "4-way"
    VP_CHANNEL_INTER_LEAVE_AUTO = "auto"
    VP_CHANNEL_INTER_LEAVE_PLATFORM_DEFAULT = "platform-default"
    VP_MEMORY_INTER_LEAVE_1_WAY_NODE_INTERLEAVE = "1 Way Node Interleave"
    VP_MEMORY_INTER_LEAVE_2_WAY_NODE_INTERLEAVE = "2 Way Node Interleave"
    VP_MEMORY_INTER_LEAVE_4_WAY_NODE_INTERLEAVE = "4 Way Node Interleave"
    VP_MEMORY_INTER_LEAVE_8_WAY_NODE_INTERLEAVE = "8 Way Node Interleave"
    VP_MEMORY_INTER_LEAVE_DISABLED = "Disabled"
    VP_MEMORY_INTER_LEAVE_ENABLED = "Enabled"
    _VP_MEMORY_INTER_LEAVE_DISABLED = "disabled"
    _VP_MEMORY_INTER_LEAVE_ENABLED = "enabled"
    VP_MEMORY_INTER_LEAVE_PLATFORM_DEFAULT = "platform-default"
    VP_RANK_INTER_LEAVE_1_WAY = "1-way"
    VP_RANK_INTER_LEAVE_2_WAY = "2-way"
    VP_RANK_INTER_LEAVE_4_WAY = "4-way"
    VP_RANK_INTER_LEAVE_8_WAY = "8-way"
    VP_RANK_INTER_LEAVE_AUTO = "auto"
    VP_RANK_INTER_LEAVE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfMemoryInterleave < ManagedObject
    #This is BiosVfMemoryInterleave class.

    @@consts = BiosVfMemoryInterleaveConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfMemoryInterleave", "biosVfMemoryInterleave", "Memory-Interleave", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfMemoryInterleave", "biosVfMemoryInterleave", "Memory-Interleave", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin"], ["Get", "Set"])
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
        "vp_channel_inter_leave" => MoPropertyMeta.new("vp_channel_inter_leave", "vpChannelInterLeave", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["1-way", "2-way", "3-way", "4-way", "auto", "platform-default"], []), 
        "vp_memory_inter_leave" => MoPropertyMeta.new("vp_memory_inter_leave", "vpMemoryInterLeave", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["1 Way Node Interleave", "2 Way Node Interleave", "4 Way Node Interleave", "8 Way Node Interleave", "Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        "vp_rank_inter_leave" => MoPropertyMeta.new("vp_rank_inter_leave", "vpRankInterLeave", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["1-way", "2-way", "4-way", "8-way", "auto", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_channel_inter_leave" => MoPropertyMeta.new("vp_channel_inter_leave", "vpChannelInterLeave", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["1-way", "2-way", "3-way", "4-way", "auto", "platform-default"], []), 
            "vp_memory_inter_leave" => MoPropertyMeta.new("vp_memory_inter_leave", "vpMemoryInterLeave", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["1 Way Node Interleave", "2 Way Node Interleave", "4 Way Node Interleave", "8 Way Node Interleave", "Disabled", "Enabled", "platform-default"], []), 
            "vp_rank_inter_leave" => MoPropertyMeta.new("vp_rank_inter_leave", "vpRankInterLeave", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["1-way", "2-way", "4-way", "8-way", "auto", "platform-default"], []), 
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
        "vpChannelInterLeave" => "vp_channel_inter_leave", 
        "vpMemoryInterLeave" => "vp_memory_inter_leave", 
        "vpRankInterLeave" => "vp_rank_inter_leave", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpChannelInterLeave" => "vp_channel_inter_leave", 
            "vpMemoryInterLeave" => "vp_memory_inter_leave", 
            "vpRankInterLeave" => "vp_rank_inter_leave", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_channel_inter_leave
    attr_accessor :vp_memory_inter_leave
    attr_accessor :vp_rank_inter_leave


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_channel_inter_leave = nil
        @vp_memory_inter_leave = nil
        @vp_rank_inter_leave = nil

        super(class_id: "BiosVfMemoryInterleave", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
