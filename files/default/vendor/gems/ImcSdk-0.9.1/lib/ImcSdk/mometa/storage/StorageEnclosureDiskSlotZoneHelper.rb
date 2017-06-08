#This module contains the general information for StorageEnclosureDiskSlotZoneHelper ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageEnclosureDiskSlotZoneHelperConsts
    ADMIN_STATE_TRIGGER = "trigger"
    ADMIN_STATE_TRIGGERED = "triggered"
    OWNERSHIP_ = ""
    OWNERSHIP_LSI_2 = "LSI-2"
    OWNERSHIP_HOTSPARE = "hotspare"
    OWNERSHIP_NONE = "none"
    OWNERSHIP_SERVER1 = "server1"
    OWNERSHIP_SERVER2 = "server2"
    OWNERSHIP_SHARED = "shared"
end


class StorageEnclosureDiskSlotZoneHelper < ManagedObject
    #This is StorageEnclosureDiskSlotZoneHelper class.

    @@consts = StorageEnclosureDiskSlotZoneHelperConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("StorageEnclosureDiskSlotZoneHelper", "storageEnclosureDiskSlotZoneHelper", "zone-drive", VersionMeta::VERSION2013E, "InputOutput", 0xff, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["trigger", "triggered"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "oper_status" => MoPropertyMeta.new("oper_status", "operStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "ownership" => MoPropertyMeta.new("ownership", "ownership", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "LSI-2", "hotspare", "none", "server1", "server2", "shared"], []), 
            "ownership_controller" => MoPropertyMeta.new("ownership_controller", "ownershipController", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "slot_list" => MoPropertyMeta.new("slot_list", "slotList", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 1, 512, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "adminState" => "admin_state", 
            "dn" => "dn", 
            "operStatus" => "oper_status", 
            "ownership" => "ownership", 
            "ownershipController" => "ownership_controller", 
            "rn" => "rn", 
            "slotList" => "slot_list", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_reader :oper_status
    attr_accessor :ownership
    attr_accessor :ownership_controller
    attr_accessor :slot_list
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @oper_status = nil
        @ownership = nil
        @ownership_controller = nil
        @slot_list = nil
        @status = nil

        super(class_id: "StorageEnclosureDiskSlotZoneHelper", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
