#This module contains the general information for IodSnapshotCancel ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class IodSnapshotCancelConsts
    ADMIN_STATE_TRIGGER = "trigger"
    ADMIN_STATE_TRIGGERED = "triggered"
end


class IodSnapshotCancel < ManagedObject
    #This is IodSnapshotCancel class.

    @@consts = IodSnapshotCancelConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("IodSnapshotCancel", "iodSnapshotCancel", "snapshotCancel", VersionMeta::VERSION151X, "InputOutput", 0x3f, [], ["admin"], [nil]),
        "modular" => MoMeta.new("IodSnapshotCancel", "iodSnapshotCancel", "snapshotCancel", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin"], [nil])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151X, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "time_out" => MoPropertyMeta.new("time_out", "timeOut", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["30-240"]), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "time_out" => MoPropertyMeta.new("time_out", "timeOut", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["30-240"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "timeOut" => "time_out", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "timeOut" => "time_out", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_reader :child_action
    attr_accessor :status
    attr_accessor :time_out


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @child_action = nil
        @status = nil
        @time_out = nil

        super(class_id: "IodSnapshotCancel", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
