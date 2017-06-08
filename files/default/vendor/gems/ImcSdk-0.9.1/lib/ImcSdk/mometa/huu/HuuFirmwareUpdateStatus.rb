#This module contains the general information for HuuFirmwareUpdateStatus ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class HuuFirmwareUpdateStatusConsts
    
end


class HuuFirmwareUpdateStatus < ManagedObject
    #This is HuuFirmwareUpdateStatus class.

    @@consts = HuuFirmwareUpdateStatusConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("HuuFirmwareUpdateStatus", "huuFirmwareUpdateStatus", "updateStatus", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("HuuFirmwareUpdateStatus", "huuFirmwareUpdateStatus", "updateStatus", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "current_time" => MoPropertyMeta.new("current_time", "currentTime", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "huu_image_version" => MoPropertyMeta.new("huu_image_version", "huuImageVersion", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "overall_status" => MoPropertyMeta.new("overall_status", "overallStatus", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "update_end_time" => MoPropertyMeta.new("update_end_time", "updateEndTime", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "update_start_time" => MoPropertyMeta.new("update_start_time", "updateStartTime", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "current_time" => MoPropertyMeta.new("current_time", "currentTime", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "huu_image_version" => MoPropertyMeta.new("huu_image_version", "huuImageVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "overall_status" => MoPropertyMeta.new("overall_status", "overallStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "update_end_time" => MoPropertyMeta.new("update_end_time", "updateEndTime", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "update_start_time" => MoPropertyMeta.new("update_start_time", "updateStartTime", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "currentTime" => "current_time", 
        "dn" => "dn", 
        "huuImageVersion" => "huu_image_version", 
        "overallStatus" => "overall_status", 
        "rn" => "rn", 
        "status" => "status", 
        "updateEndTime" => "update_end_time", 
        "updateStartTime" => "update_start_time", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "currentTime" => "current_time", 
            "dn" => "dn", 
            "huuImageVersion" => "huu_image_version", 
            "overallStatus" => "overall_status", 
            "rn" => "rn", 
            "status" => "status", 
            "updateEndTime" => "update_end_time", 
            "updateStartTime" => "update_start_time", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :current_time
    attr_reader :huu_image_version
    attr_reader :overall_status
    attr_reader :status
    attr_reader :update_end_time
    attr_reader :update_start_time


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @current_time = nil
        @huu_image_version = nil
        @overall_status = nil
        @status = nil
        @update_end_time = nil
        @update_start_time = nil

        super(class_id: "HuuFirmwareUpdateStatus", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
