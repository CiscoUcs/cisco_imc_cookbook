#This module contains the general information for OsiStatus ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class OsiStatusConsts
    
end


class OsiStatus < ManagedObject
    #This is OsiStatus class.

    @@consts = OsiStatusConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("OsiStatus", "osiStatus", "osiStatus", VersionMeta::VERSION301C, "OutputOnly", 0xf, [], ["read-only"], ["Get"]),
        "modular" => MoMeta.new("OsiStatus", "osiStatus", "osiStatus", VersionMeta::VERSION301C, "OutputOnly", 0xf, [], ["read-only"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "current_status" => MoPropertyMeta.new("current_status", "currentStatus", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "current_time" => MoPropertyMeta.new("current_time", "currentTime", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "osi_cancel_op" => MoPropertyMeta.new("osi_cancel_op", "osiCancelOp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "osi_image_version" => MoPropertyMeta.new("osi_image_version", "osiImageVersion", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "osi_report" => MoPropertyMeta.new("osi_report", "osiReport", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "remote_share_file" => MoPropertyMeta.new("remote_share_file", "remoteShareFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "remote_share_ip" => MoPropertyMeta.new("remote_share_ip", "remoteShareIp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "remote_share_path" => MoPropertyMeta.new("remote_share_path", "remoteSharePath", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "running_time" => MoPropertyMeta.new("running_time", "runningTime", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "start_time" => MoPropertyMeta.new("start_time", "startTime", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "current_status" => MoPropertyMeta.new("current_status", "currentStatus", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "current_time" => MoPropertyMeta.new("current_time", "currentTime", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "osi_cancel_op" => MoPropertyMeta.new("osi_cancel_op", "osiCancelOp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "osi_image_version" => MoPropertyMeta.new("osi_image_version", "osiImageVersion", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "osi_report" => MoPropertyMeta.new("osi_report", "osiReport", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "remote_share_file" => MoPropertyMeta.new("remote_share_file", "remoteShareFile", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "remote_share_ip" => MoPropertyMeta.new("remote_share_ip", "remoteShareIp", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "remote_share_path" => MoPropertyMeta.new("remote_share_path", "remoteSharePath", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "running_time" => MoPropertyMeta.new("running_time", "runningTime", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "start_time" => MoPropertyMeta.new("start_time", "startTime", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "currentStatus" => "current_status", 
        "currentTime" => "current_time", 
        "dn" => "dn", 
        "osiCancelOp" => "osi_cancel_op", 
        "osiImageVersion" => "osi_image_version", 
        "osiReport" => "osi_report", 
        "remoteShareFile" => "remote_share_file", 
        "remoteShareIp" => "remote_share_ip", 
        "remoteSharePath" => "remote_share_path", 
        "rn" => "rn", 
        "runningTime" => "running_time", 
        "startTime" => "start_time", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "currentStatus" => "current_status", 
            "currentTime" => "current_time", 
            "dn" => "dn", 
            "osiCancelOp" => "osi_cancel_op", 
            "osiImageVersion" => "osi_image_version", 
            "osiReport" => "osi_report", 
            "remoteShareFile" => "remote_share_file", 
            "remoteShareIp" => "remote_share_ip", 
            "remoteSharePath" => "remote_share_path", 
            "rn" => "rn", 
            "runningTime" => "running_time", 
            "startTime" => "start_time", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :current_status
    attr_reader :current_time
    attr_reader :osi_cancel_op
    attr_reader :osi_image_version
    attr_reader :osi_report
    attr_reader :remote_share_file
    attr_reader :remote_share_ip
    attr_reader :remote_share_path
    attr_reader :running_time
    attr_reader :start_time
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @current_status = nil
        @current_time = nil
        @osi_cancel_op = nil
        @osi_image_version = nil
        @osi_report = nil
        @remote_share_file = nil
        @remote_share_ip = nil
        @remote_share_path = nil
        @running_time = nil
        @start_time = nil
        @status = nil

        super(class_id: "OsiStatus", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
