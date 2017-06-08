#This module contains the general information for CommKvm ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommKvmConsts
    
end


class CommKvm < ManagedObject
    #This is CommKvm class.

    @@consts = CommKvmConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("CommKvm", "commKvm", "kvm-svc", VersionMeta::VERSION151F, "InputOutput", 0x1ff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("CommKvm", "commKvm", "kvm-svc", VersionMeta::VERSION2013E, "InputOutput", 0x1ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "active_sessions" => MoPropertyMeta.new("active_sessions", "activeSessions", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "encryption_state" => MoPropertyMeta.new("encryption_state", "encryptionState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "local_video_state" => MoPropertyMeta.new("local_video_state", "localVideoState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "port" => MoPropertyMeta.new("port", "port", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["1-65535"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "total_sessions" => MoPropertyMeta.new("total_sessions", "totalSessions", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, [], ["1-4"]), 
        },

        "modular" => {
            "active_sessions" => MoPropertyMeta.new("active_sessions", "activeSessions", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "encryption_state" => MoPropertyMeta.new("encryption_state", "encryptionState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "local_video_state" => MoPropertyMeta.new("local_video_state", "localVideoState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "port" => MoPropertyMeta.new("port", "port", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["1-65535"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "total_sessions" => MoPropertyMeta.new("total_sessions", "totalSessions", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, [], ["1-4"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "activeSessions" => "active_sessions", 
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "encryptionState" => "encryption_state", 
        "localVideoState" => "local_video_state", 
        "port" => "port", 
        "rn" => "rn", 
        "status" => "status", 
        "totalSessions" => "total_sessions", 
        },

        "modular" => {
            "activeSessions" => "active_sessions", 
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "encryptionState" => "encryption_state", 
            "localVideoState" => "local_video_state", 
            "port" => "port", 
            "rn" => "rn", 
            "status" => "status", 
            "totalSessions" => "total_sessions", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :active_sessions
    attr_accessor :admin_state
    attr_reader :child_action
    attr_accessor :encryption_state
    attr_accessor :local_video_state
    attr_accessor :port
    attr_accessor :status
    attr_accessor :total_sessions


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @active_sessions = nil
        @admin_state = nil
        @child_action = nil
        @encryption_state = nil
        @local_video_state = nil
        @port = nil
        @status = nil
        @total_sessions = nil

        super(class_id: "CommKvm", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
