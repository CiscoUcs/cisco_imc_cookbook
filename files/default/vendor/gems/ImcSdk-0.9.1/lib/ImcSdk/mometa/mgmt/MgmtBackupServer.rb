#This module contains the general information for MgmtBackupServer ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class MgmtBackupServerConsts
    ADMIN_STATE_DISABLED = "disabled"
    ADMIN_STATE_ENABLED = "enabled"
    FSM_RMT_INV_ERR_CODE_ = ""
    FSM_RMT_INV_ERR_CODE_ABORTED = "Aborted"
    FSM_RMT_INV_ERR_CODE_ERROR_COLLECTING_CONFIGURATION_DATA = "Error collecting configuration data"
    FSM_RMT_INV_ERR_CODE_ERROR_IMPORTING_CONFIGURATION = "Error importing configuration"
    FSM_RMT_INV_ERR_CODE_PARTIALLY_IMPORTED = "Partially Imported"
    FSM_RMT_INV_ERR_CODE_TFTP_ERROR = "TFTP Error"
    FSM_RMT_INV_ERR_CODE_UNKNOWN_ERROR = "Unknown error"
    FSM_RMT_INV_ERR_CODE_NONE = "none"
    PROTO_FTP = "ftp"
    PROTO_HTTP = "http"
    PROTO_NONE = "none"
    PROTO_SCP = "scp"
    PROTO_SFTP = "sftp"
    PROTO_TFTP = "tftp"
end


class MgmtBackupServer < ManagedObject
    #This is MgmtBackupServer class.

    @@consts = MgmtBackupServerConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("MgmtBackupServer", "mgmtBackupServer", "exporter-config", VersionMeta::VERSION2013E, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "entity" => MoPropertyMeta.new("entity", "entity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 256, nil, [], []), 
            "fsm_descr" => MoPropertyMeta.new("fsm_descr", "fsmDescr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "fsm_rmt_inv_err_code" => MoPropertyMeta.new("fsm_rmt_inv_err_code", "fsmRmtInvErrCode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, ["", "Aborted", "Error collecting configuration data", "Error importing configuration", "Partially Imported", "TFTP Error", "Unknown error", "none"], ["0-4294967295"]), 
            "fsm_rmt_inv_err_descr" => MoPropertyMeta.new("fsm_rmt_inv_err_descr", "fsmRmtInvErrDescr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, 0, 510, nil, [], []), 
            "fsm_stage_descr" => MoPropertyMeta.new("fsm_stage_descr", "fsmStageDescr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "hostname" => MoPropertyMeta.new("hostname", "hostname", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "proto" => MoPropertyMeta.new("proto", "proto", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["ftp", "http", "none", "scp", "sftp", "tftp"], []), 
            "pwd" => MoPropertyMeta.new("pwd", "pwd", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 256, nil, [], []), 
            "remote_file" => MoPropertyMeta.new("remote_file", "remoteFile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, 0, 128, %q{[^\(\)~`'\?\\"";<>\|&\*\^$%]{1,128}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, 0, 256, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "entity" => "entity", 
            "fsmDescr" => "fsm_descr", 
            "fsmRmtInvErrCode" => "fsm_rmt_inv_err_code", 
            "fsmRmtInvErrDescr" => "fsm_rmt_inv_err_descr", 
            "fsmStageDescr" => "fsm_stage_descr", 
            "hostname" => "hostname", 
            "proto" => "proto", 
            "pwd" => "pwd", 
            "remoteFile" => "remote_file", 
            "rn" => "rn", 
            "status" => "status", 
            "user" => "user", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_reader :child_action
    attr_accessor :entity
    attr_reader :fsm_descr
    attr_reader :fsm_rmt_inv_err_code
    attr_reader :fsm_rmt_inv_err_descr
    attr_reader :fsm_stage_descr
    attr_accessor :hostname
    attr_accessor :proto
    attr_accessor :pwd
    attr_accessor :remote_file
    attr_accessor :status
    attr_accessor :user


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @child_action = nil
        @entity = nil
        @fsm_descr = nil
        @fsm_rmt_inv_err_code = nil
        @fsm_rmt_inv_err_descr = nil
        @fsm_stage_descr = nil
        @hostname = nil
        @proto = nil
        @pwd = nil
        @remote_file = nil
        @status = nil
        @user = nil

        super(class_id: "MgmtBackupServer", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
