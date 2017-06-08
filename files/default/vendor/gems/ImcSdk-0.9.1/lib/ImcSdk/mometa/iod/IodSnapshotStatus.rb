#This module contains the general information for IodSnapshotStatus ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class IodSnapshotStatusConsts
    
end


class IodSnapshotStatus < ManagedObject
    #This is IodSnapshotStatus class.

    @@consts = IodSnapshotStatusConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("IodSnapshotStatus", "iodSnapshotStatus", "snapshotStatus", VersionMeta::VERSION151X, "OutputOnly", 0xf, [], ["read-only"], ["Get"]),
        "modular" => MoMeta.new("IodSnapshotStatus", "iodSnapshotStatus", "snapshotStatus", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["read-only"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151X, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "current_status" => MoPropertyMeta.new("current_status", "currentStatus", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "current_time" => MoPropertyMeta.new("current_time", "currentTime", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "iod_image_version" => MoPropertyMeta.new("iod_image_version", "iodImageVersion", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "remote_share_file" => MoPropertyMeta.new("remote_share_file", "remoteShareFile", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "remote_share_ip" => MoPropertyMeta.new("remote_share_ip", "remoteShareIp", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "remote_share_path" => MoPropertyMeta.new("remote_share_path", "remoteSharePath", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "running_time" => MoPropertyMeta.new("running_time", "runningTime", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "snapshot_cancel_op" => MoPropertyMeta.new("snapshot_cancel_op", "snapshotCancelOp", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "snapshot_report" => MoPropertyMeta.new("snapshot_report", "snapshotReport", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "start_time" => MoPropertyMeta.new("start_time", "startTime", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "current_status" => MoPropertyMeta.new("current_status", "currentStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "current_time" => MoPropertyMeta.new("current_time", "currentTime", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "iod_image_version" => MoPropertyMeta.new("iod_image_version", "iodImageVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "remote_share_file" => MoPropertyMeta.new("remote_share_file", "remoteShareFile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "remote_share_ip" => MoPropertyMeta.new("remote_share_ip", "remoteShareIp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "remote_share_path" => MoPropertyMeta.new("remote_share_path", "remoteSharePath", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "running_time" => MoPropertyMeta.new("running_time", "runningTime", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "snapshot_cancel_op" => MoPropertyMeta.new("snapshot_cancel_op", "snapshotCancelOp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "snapshot_report" => MoPropertyMeta.new("snapshot_report", "snapshotReport", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "start_time" => MoPropertyMeta.new("start_time", "startTime", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
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
        "iodImageVersion" => "iod_image_version", 
        "remoteShareFile" => "remote_share_file", 
        "remoteShareIp" => "remote_share_ip", 
        "remoteSharePath" => "remote_share_path", 
        "rn" => "rn", 
        "runningTime" => "running_time", 
        "snapshotCancelOp" => "snapshot_cancel_op", 
        "snapshotReport" => "snapshot_report", 
        "startTime" => "start_time", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "currentStatus" => "current_status", 
            "currentTime" => "current_time", 
            "dn" => "dn", 
            "iodImageVersion" => "iod_image_version", 
            "remoteShareFile" => "remote_share_file", 
            "remoteShareIp" => "remote_share_ip", 
            "remoteSharePath" => "remote_share_path", 
            "rn" => "rn", 
            "runningTime" => "running_time", 
            "snapshotCancelOp" => "snapshot_cancel_op", 
            "snapshotReport" => "snapshot_report", 
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
    attr_reader :iod_image_version
    attr_reader :remote_share_file
    attr_reader :remote_share_ip
    attr_reader :remote_share_path
    attr_reader :running_time
    attr_reader :snapshot_cancel_op
    attr_reader :snapshot_report
    attr_reader :start_time
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @current_status = nil
        @current_time = nil
        @iod_image_version = nil
        @remote_share_file = nil
        @remote_share_ip = nil
        @remote_share_path = nil
        @running_time = nil
        @snapshot_cancel_op = nil
        @snapshot_report = nil
        @start_time = nil
        @status = nil

        super(class_id: "IodSnapshotStatus", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
