#This module contains the general information for CommRedfish ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommRedfishConsts
    ADMIN_STATE_DISABLED = "disabled"
    ADMIN_STATE_ENABLED = "enabled"
end


class CommRedfish < ManagedObject
    #This is CommRedfish class.

    @@consts = CommRedfishConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("CommRedfish", "commRedfish", "redfish-svc", VersionMeta::VERSION301C, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "active_sessions" => MoPropertyMeta.new("active_sessions", "activeSessions", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "maximum_sessions" => MoPropertyMeta.new("maximum_sessions", "maximumSessions", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
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
        "maximumSessions" => "maximum_sessions", 
        "rn" => "rn", 
        "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :active_sessions
    attr_accessor :admin_state
    attr_reader :child_action
    attr_reader :maximum_sessions
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @active_sessions = nil
        @admin_state = nil
        @child_action = nil
        @maximum_sessions = nil
        @status = nil

        super(class_id: "CommRedfish", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
