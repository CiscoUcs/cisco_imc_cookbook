#This module contains the general information for StorageFlexFlashOperationalProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageFlexFlashOperationalProfileConsts
    ADMIN_ACTION_CLEAR_ERRORS = "clear-errors"
    RAID_PRIMARY_MEMBER_SLOT_1 = "slot-1"
    RAID_PRIMARY_MEMBER_SLOT_2 = "slot-2"
    RAID_SECONDARY_ROLE_ACTIVE = "active"
    RAID_SECONDARY_ROLE_INITIALIZING = "initializing"
end


class StorageFlexFlashOperationalProfile < ManagedObject
    #This is StorageFlexFlashOperationalProfile class.

    @@consts = StorageFlexFlashOperationalProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageFlexFlashOperationalProfile", "storageFlexFlashOperationalProfile", "oper-profile", VersionMeta::VERSION202C, "InputOutput", 0x3fff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("StorageFlexFlashOperationalProfile", "storageFlexFlashOperationalProfile", "oper-profile", VersionMeta::VERSION2013E, "InputOutput", 0x3fff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear-errors"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "controller" => MoPropertyMeta.new("controller", "controller", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "io_read_error_threshold" => MoPropertyMeta.new("io_read_error_threshold", "ioReadErrorThreshold", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
        "io_write_error_threshold" => MoPropertyMeta.new("io_write_error_threshold", "ioWriteErrorThreshold", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x10, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
        "operating_mode" => MoPropertyMeta.new("operating_mode", "operatingMode", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "raid_primary_member" => MoPropertyMeta.new("raid_primary_member", "raidPrimaryMember", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x20, 0, 510, nil, ["slot-1", "slot-2"], []), 
        "raid_secondary_role" => MoPropertyMeta.new("raid_secondary_role", "raidSecondaryRole", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x40, 0, 510, nil, ["active", "initializing"], []), 
        "rd_err_count_slot1_threshold" => MoPropertyMeta.new("rd_err_count_slot1_threshold", "rdErrCountSlot1Threshold", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x80, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
        "rd_err_count_slot2_threshold" => MoPropertyMeta.new("rd_err_count_slot2_threshold", "rdErrCountSlot2Threshold", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x100, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "virtual_drives_enabled" => MoPropertyMeta.new("virtual_drives_enabled", "virtualDrivesEnabled", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x800, 0, 30, nil, [], []), 
        "wr_err_count_slot1_threshold" => MoPropertyMeta.new("wr_err_count_slot1_threshold", "wrErrCountSlot1Threshold", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x1000, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
        "wr_err_count_slot2_threshold" => MoPropertyMeta.new("wr_err_count_slot2_threshold", "wrErrCountSlot2Threshold", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x2000, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear-errors"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "controller" => MoPropertyMeta.new("controller", "controller", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "io_read_error_threshold" => MoPropertyMeta.new("io_read_error_threshold", "ioReadErrorThreshold", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
            "io_write_error_threshold" => MoPropertyMeta.new("io_write_error_threshold", "ioWriteErrorThreshold", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
            "operating_mode" => MoPropertyMeta.new("operating_mode", "operatingMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "raid_primary_member" => MoPropertyMeta.new("raid_primary_member", "raidPrimaryMember", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 510, nil, ["slot-1", "slot-2"], []), 
            "raid_secondary_role" => MoPropertyMeta.new("raid_secondary_role", "raidSecondaryRole", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 510, nil, ["active", "initializing"], []), 
            "rd_err_count_slot1_threshold" => MoPropertyMeta.new("rd_err_count_slot1_threshold", "rdErrCountSlot1Threshold", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
            "rd_err_count_slot2_threshold" => MoPropertyMeta.new("rd_err_count_slot2_threshold", "rdErrCountSlot2Threshold", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "virtual_drives_enabled" => MoPropertyMeta.new("virtual_drives_enabled", "virtualDrivesEnabled", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, 0, 30, nil, [], []), 
            "wr_err_count_slot1_threshold" => MoPropertyMeta.new("wr_err_count_slot1_threshold", "wrErrCountSlot1Threshold", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
            "wr_err_count_slot2_threshold" => MoPropertyMeta.new("wr_err_count_slot2_threshold", "wrErrCountSlot2Threshold", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000, 0, 510, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "childAction" => "child_action", 
        "controller" => "controller", 
        "dn" => "dn", 
        "ioReadErrorThreshold" => "io_read_error_threshold", 
        "ioWriteErrorThreshold" => "io_write_error_threshold", 
        "operatingMode" => "operating_mode", 
        "raidPrimaryMember" => "raid_primary_member", 
        "raidSecondaryRole" => "raid_secondary_role", 
        "rdErrCountSlot1Threshold" => "rd_err_count_slot1_threshold", 
        "rdErrCountSlot2Threshold" => "rd_err_count_slot2_threshold", 
        "rn" => "rn", 
        "status" => "status", 
        "virtualDrivesEnabled" => "virtual_drives_enabled", 
        "wrErrCountSlot1Threshold" => "wr_err_count_slot1_threshold", 
        "wrErrCountSlot2Threshold" => "wr_err_count_slot2_threshold", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "controller" => "controller", 
            "dn" => "dn", 
            "ioReadErrorThreshold" => "io_read_error_threshold", 
            "ioWriteErrorThreshold" => "io_write_error_threshold", 
            "operatingMode" => "operating_mode", 
            "raidPrimaryMember" => "raid_primary_member", 
            "raidSecondaryRole" => "raid_secondary_role", 
            "rdErrCountSlot1Threshold" => "rd_err_count_slot1_threshold", 
            "rdErrCountSlot2Threshold" => "rd_err_count_slot2_threshold", 
            "rn" => "rn", 
            "status" => "status", 
            "virtualDrivesEnabled" => "virtual_drives_enabled", 
            "wrErrCountSlot1Threshold" => "wr_err_count_slot1_threshold", 
            "wrErrCountSlot2Threshold" => "wr_err_count_slot2_threshold", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_action
    attr_reader :child_action
    attr_reader :controller
    attr_accessor :io_read_error_threshold
    attr_accessor :io_write_error_threshold
    attr_reader :operating_mode
    attr_accessor :raid_primary_member
    attr_accessor :raid_secondary_role
    attr_accessor :rd_err_count_slot1_threshold
    attr_accessor :rd_err_count_slot2_threshold
    attr_accessor :status
    attr_accessor :virtual_drives_enabled
    attr_accessor :wr_err_count_slot1_threshold
    attr_accessor :wr_err_count_slot2_threshold


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_action = nil
        @child_action = nil
        @controller = nil
        @io_read_error_threshold = nil
        @io_write_error_threshold = nil
        @operating_mode = nil
        @raid_primary_member = nil
        @raid_secondary_role = nil
        @rd_err_count_slot1_threshold = nil
        @rd_err_count_slot2_threshold = nil
        @status = nil
        @virtual_drives_enabled = nil
        @wr_err_count_slot1_threshold = nil
        @wr_err_count_slot2_threshold = nil

        super(class_id: "StorageFlexFlashOperationalProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
