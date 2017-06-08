#This module contains the general information for StorageEnclosureDisk ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageEnclosureDiskConsts
    DRIVE_POWER_POLICY_N_A = "N/A"
    DRIVE_POWER_POLICY_ACTIVE = "active"
    DRIVE_POWER_POLICY_POWER_SAVE = "power-save"
    DRIVE_POWER_POLICY_TRANSITIONING = "transitioning"
    DRIVE_POWER_POLICY_UNKNOWN = "unknown"
end


class StorageEnclosureDisk < ManagedObject
    #This is StorageEnclosureDisk class.

    @@consts = StorageEnclosureDiskConsts.new()
#    @@naming_props = set([u'slot'])

    @@mo_meta = {
        "modular" => MoMeta.new("StorageEnclosureDisk", "storageEnclosureDisk", "disk-[slot]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "blockcount" => MoPropertyMeta.new("blockcount", "blockcount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "blocksize" => MoPropertyMeta.new("blocksize", "blocksize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "diskstate" => MoPropertyMeta.new("diskstate", "diskstate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "drive_power_policy" => MoPropertyMeta.new("drive_power_policy", "drivePowerPolicy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["N/A", "active", "power-save", "transitioning", "unknown"], []), 
            "expander1linkspeed" => MoPropertyMeta.new("expander1linkspeed", "expander1linkspeed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "expander2linkspeed" => MoPropertyMeta.new("expander2linkspeed", "expander2linkspeed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "fw_update_oper_state" => MoPropertyMeta.new("fw_update_oper_state", "fwUpdateOperState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "fw_update_progress" => MoPropertyMeta.new("fw_update_progress", "fwUpdateProgress", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "ownership" => MoPropertyMeta.new("ownership", "ownership", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "product_id" => MoPropertyMeta.new("product_id", "productId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "revision" => MoPropertyMeta.new("revision", "revision", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "sasaddress1" => MoPropertyMeta.new("sasaddress1", "sasaddress1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sasaddress2" => MoPropertyMeta.new("sasaddress2", "sasaddress2", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "size" => MoPropertyMeta.new("size", "size", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "blockcount" => "blockcount", 
            "blocksize" => "blocksize", 
            "childAction" => "child_action", 
            "diskstate" => "diskstate", 
            "dn" => "dn", 
            "drivePowerPolicy" => "drive_power_policy", 
            "expander1linkspeed" => "expander1linkspeed", 
            "expander2linkspeed" => "expander2linkspeed", 
            "fwUpdateOperState" => "fw_update_oper_state", 
            "fwUpdateProgress" => "fw_update_progress", 
            "health" => "health", 
            "ownership" => "ownership", 
            "productId" => "product_id", 
            "revision" => "revision", 
            "rn" => "rn", 
            "sasaddress1" => "sasaddress1", 
            "sasaddress2" => "sasaddress2", 
            "serial" => "serial", 
            "size" => "size", 
            "slot" => "slot", 
            "status" => "status", 
            "vendor" => "vendor", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :slot
    attr_reader :blockcount
    attr_reader :blocksize
    attr_reader :child_action
    attr_reader :diskstate
    attr_reader :drive_power_policy
    attr_reader :expander1linkspeed
    attr_reader :expander2linkspeed
    attr_reader :fw_update_oper_state
    attr_reader :fw_update_progress
    attr_reader :health
    attr_reader :ownership
    attr_reader :product_id
    attr_reader :revision
    attr_reader :sasaddress1
    attr_reader :sasaddress2
    attr_reader :serial
    attr_reader :size
    attr_reader :status
    attr_reader :vendor


    def initialize(parent_mo_or_dn: nil,slot: nil,  **kwargs)
        @dirty_mask = 0
        @slot = slot
        @blockcount = nil
        @blocksize = nil
        @child_action = nil
        @diskstate = nil
        @drive_power_policy = nil
        @expander1linkspeed = nil
        @expander2linkspeed = nil
        @fw_update_oper_state = nil
        @fw_update_progress = nil
        @health = nil
        @ownership = nil
        @product_id = nil
        @revision = nil
        @sasaddress1 = nil
        @sasaddress2 = nil
        @serial = nil
        @size = nil
        @status = nil
        @vendor = nil

        super(class_id: "StorageEnclosureDisk", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
