#This module contains the general information for StorageLocalDisk ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageLocalDiskConsts
    ADMIN_ACTION_DISABLE_SED_FOREIGN_DRIVES = "disable-sed-foreign-drives"
    ADMIN_ACTION_DISABLE_SELF_ENCRYPT = "disable-self-encrypt"
    ADMIN_ACTION_ENABLE_SELF_ENCRYPT = "enable-self-encrypt"
    ADMIN_ACTION_LOCATOR_LED_OFF = "locator-led-off"
    ADMIN_ACTION_LOCATOR_LED_ON = "locator-led-on"
    ADMIN_ACTION_MAKE_DEDICATED_HOT_SPARE = "make-dedicated-hot-spare"
    ADMIN_ACTION_MAKE_GLOBAL_HOT_SPARE = "make-global-hot-spare"
    ADMIN_ACTION_MAKE_JBOD = "make-jbod"
    ADMIN_ACTION_MAKE_UNCONFIGURED_GOOD = "make-unconfigured-good"
    ADMIN_ACTION_PREPARE_FOR_REMOVAL = "prepare-for-removal"
    ADMIN_ACTION_REMOVE_HOT_SPARE = "remove-hot-spare"
    ADMIN_ACTION_SET_BOOT_DRIVE = "set-boot-drive"
    ADMIN_ACTION_UNDO_PREPARE_FOR_REMOVAL = "undo-prepare-for-removal"
    DEDICATED_HOT_SPARE_FOR_VDID_ = ""
    LOCATOR_LEDSTATUS_OFF = "off"
    LOCATOR_LEDSTATUS_ON = "on"
end


class StorageLocalDisk < ManagedObject
    #This is StorageLocalDisk class.

    @@consts = StorageLocalDiskConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageLocalDisk", "storageLocalDisk", "pd-[id]", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("StorageLocalDisk", "storageLocalDisk", "pd-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["disable-sed-foreign-drives", "disable-self-encrypt", "enable-self-encrypt", "locator-led-off", "locator-led-on", "make-dedicated-hot-spare", "make-global-hot-spare", "make-jbod", "make-unconfigured-good", "prepare-for-removal", "remove-hot-spare", "set-boot-drive", "undo-prepare-for-removal"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "coerced_size" => MoPropertyMeta.new("coerced_size", "coercedSize", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dedicated_hot_spare_for_vd_id" => MoPropertyMeta.new("dedicated_hot_spare_for_vd_id", "dedicatedHotSpareForVDId", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [""], ["0-4294967295"]), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "drive_firmware" => MoPropertyMeta.new("drive_firmware", "driveFirmware", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "drive_serial_number" => MoPropertyMeta.new("drive_serial_number", "driveSerialNumber", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "drive_state" => MoPropertyMeta.new("drive_state", "driveState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "enclosure_association" => MoPropertyMeta.new("enclosure_association", "enclosureAssociation", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "enclosure_logical_id" => MoPropertyMeta.new("enclosure_logical_id", "enclosureLogicalId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "enclosure_sas_address0" => MoPropertyMeta.new("enclosure_sas_address0", "enclosureSASAddress0", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "enclosure_sas_address1" => MoPropertyMeta.new("enclosure_sas_address1", "enclosureSASAddress1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x10, 0, 510, nil, [], ["0-256"]), 
        "interface_type" => MoPropertyMeta.new("interface_type", "interfaceType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "link_speed" => MoPropertyMeta.new("link_speed", "linkSpeed", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "media_type" => MoPropertyMeta.new("media_type", "mediaType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "online" => MoPropertyMeta.new("online", "online", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pd_status" => MoPropertyMeta.new("pd_status", "pdStatus", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "predictive_failure_count" => MoPropertyMeta.new("predictive_failure_count", "predictiveFailureCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "product_id" => MoPropertyMeta.new("product_id", "productId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "fde_capable" => MoPropertyMeta.new("fde_capable", "fdeCapable", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "fde_enabled" => MoPropertyMeta.new("fde_enabled", "fdeEnabled", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "foreign_locked" => MoPropertyMeta.new("foreign_locked", "foreignLocked", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "locator_led_status" => MoPropertyMeta.new("locator_led_status", "locatorLEDStatus", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["off", "on"], []), 
        "locked" => MoPropertyMeta.new("locked", "locked", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "secured" => MoPropertyMeta.new("secured", "secured", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["locator-led-off", "locator-led-on", "make-dedicated-hot-spare", "make-global-hot-spare", "make-jbod", "make-unconfigured-good", "prepare-for-removal", "remove-hot-spare", "set-boot-drive", "undo-prepare-for-removal"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "coerced_size" => MoPropertyMeta.new("coerced_size", "coercedSize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dedicated_hot_spare_for_vd_id" => MoPropertyMeta.new("dedicated_hot_spare_for_vd_id", "dedicatedHotSpareForVDId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 510, nil, [], ["0-4294967295"]), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "drive_firmware" => MoPropertyMeta.new("drive_firmware", "driveFirmware", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "drive_serial_number" => MoPropertyMeta.new("drive_serial_number", "driveSerialNumber", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "drive_state" => MoPropertyMeta.new("drive_state", "driveState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "enclosure_association" => MoPropertyMeta.new("enclosure_association", "enclosureAssociation", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "enclosure_logical_id" => MoPropertyMeta.new("enclosure_logical_id", "enclosureLogicalId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "enclosure_sas_address0" => MoPropertyMeta.new("enclosure_sas_address0", "enclosureSASAddress0", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "enclosure_sas_address1" => MoPropertyMeta.new("enclosure_sas_address1", "enclosureSASAddress1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x10, 0, 510, nil, [], ["0-256"]), 
            "interface_type" => MoPropertyMeta.new("interface_type", "interfaceType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "link_speed" => MoPropertyMeta.new("link_speed", "linkSpeed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "media_type" => MoPropertyMeta.new("media_type", "mediaType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "online" => MoPropertyMeta.new("online", "online", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pd_status" => MoPropertyMeta.new("pd_status", "pdStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "predictive_failure_count" => MoPropertyMeta.new("predictive_failure_count", "predictiveFailureCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "product_id" => MoPropertyMeta.new("product_id", "productId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "childAction" => "child_action", 
        "coercedSize" => "coerced_size", 
        "dedicatedHotSpareForVDId" => "dedicated_hot_spare_for_vd_id", 
        "dn" => "dn", 
        "driveFirmware" => "drive_firmware", 
        "driveSerialNumber" => "drive_serial_number", 
        "driveState" => "drive_state", 
        "enclosureAssociation" => "enclosure_association", 
        "enclosureLogicalId" => "enclosure_logical_id", 
        "enclosureSASAddress0" => "enclosure_sas_address0", 
        "enclosureSASAddress1" => "enclosure_sas_address1", 
        "health" => "health", 
        "id" => "id", 
        "interfaceType" => "interface_type", 
        "linkSpeed" => "link_speed", 
        "mediaType" => "media_type", 
        "online" => "online", 
        "pdStatus" => "pd_status", 
        "predictiveFailureCount" => "predictive_failure_count", 
        "productId" => "product_id", 
        "rn" => "rn", 
        "status" => "status", 
        "vendor" => "vendor", 
        "fdeCapable" => "fde_capable", 
        "fdeEnabled" => "fde_enabled", 
        "foreignLocked" => "foreign_locked", 
        "locatorLEDStatus" => "locator_led_status", 
        "locked" => "locked", 
        "secured" => "secured", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "coercedSize" => "coerced_size", 
            "dedicatedHotSpareForVDId" => "dedicated_hot_spare_for_vd_id", 
            "dn" => "dn", 
            "driveFirmware" => "drive_firmware", 
            "driveSerialNumber" => "drive_serial_number", 
            "driveState" => "drive_state", 
            "enclosureAssociation" => "enclosure_association", 
            "enclosureLogicalId" => "enclosure_logical_id", 
            "enclosureSASAddress0" => "enclosure_sas_address0", 
            "enclosureSASAddress1" => "enclosure_sas_address1", 
            "health" => "health", 
            "id" => "id", 
            "interfaceType" => "interface_type", 
            "linkSpeed" => "link_speed", 
            "mediaType" => "media_type", 
            "online" => "online", 
            "pdStatus" => "pd_status", 
            "predictiveFailureCount" => "predictive_failure_count", 
            "productId" => "product_id", 
            "rn" => "rn", 
            "status" => "status", 
            "vendor" => "vendor", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :admin_action
    attr_reader :child_action
    attr_reader :coerced_size
    attr_accessor :dedicated_hot_spare_for_vd_id
    attr_reader :drive_firmware
    attr_reader :drive_serial_number
    attr_reader :drive_state
    attr_reader :enclosure_association
    attr_reader :enclosure_logical_id
    attr_reader :enclosure_sas_address0
    attr_reader :enclosure_sas_address1
    attr_reader :health
    attr_reader :interface_type
    attr_reader :link_speed
    attr_reader :media_type
    attr_reader :online
    attr_reader :pd_status
    attr_reader :predictive_failure_count
    attr_reader :product_id
    attr_accessor :status
    attr_reader :vendor
    attr_reader :fde_capable
    attr_reader :fde_enabled
    attr_reader :foreign_locked
    attr_reader :locator_led_status
    attr_reader :locked
    attr_reader :secured


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @admin_action = nil
        @child_action = nil
        @coerced_size = nil
        @dedicated_hot_spare_for_vd_id = nil
        @drive_firmware = nil
        @drive_serial_number = nil
        @drive_state = nil
        @enclosure_association = nil
        @enclosure_logical_id = nil
        @enclosure_sas_address0 = nil
        @enclosure_sas_address1 = nil
        @health = nil
        @interface_type = nil
        @link_speed = nil
        @media_type = nil
        @online = nil
        @pd_status = nil
        @predictive_failure_count = nil
        @product_id = nil
        @status = nil
        @vendor = nil
        @fde_capable = nil
        @fde_enabled = nil
        @foreign_locked = nil
        @locator_led_status = nil
        @locked = nil
        @secured = nil

        super(class_id: "StorageLocalDisk", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
