#This module contains the general information for StorageController ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageControllerConsts
    ADMIN_ACTION_CLEAR_BOOT_DRIVE = "clear-boot-drive"
    ADMIN_ACTION_CLEAR_CACHE = "clear-cache"
    ADMIN_ACTION_CLEAR_FOREIGN_CONFIG = "clear-foreign-config"
    ADMIN_ACTION_DELETE_ALL_VDS_RESET_PDS = "delete-all-vds-reset-pds"
    ADMIN_ACTION_DISABLE_JBOD = "disable-jbod"
    ADMIN_ACTION_ENABLE_JBOD = "enable-jbod"
    ADMIN_ACTION_GET_TTY_LOG = "get-tty-log"
    ADMIN_ACTION_IMPORT_FOREIGN_CONFIG = "import-foreign-config"
    PRESENCE_EMPTY = "empty"
    PRESENCE_EQUIPPED = "equipped"
    PRESENCE_EQUIPPED_IDENTITY_UNESTABLISHABLE = "equipped-identity-unestablishable"
    PRESENCE_EQUIPPED_NOT_PRIMARY = "equipped-not-primary"
    PRESENCE_EQUIPPED_WITH_MALFORMED_FRU = "equipped-with-malformed-fru"
    PRESENCE_INACCESSIBLE = "inaccessible"
    PRESENCE_MISMATCH = "mismatch"
    PRESENCE_MISMATCH_IDENTITY_UNESTABLISHABLE = "mismatch-identity-unestablishable"
    PRESENCE_MISSING = "missing"
    PRESENCE_NOT_SUPPORTED = "not-supported"
    PRESENCE_UNAUTHORIZED = "unauthorized"
    PRESENCE_UNKNOWN = "unknown"
end


class StorageController < ManagedObject
    #This is StorageController class.

    @@consts = StorageControllerConsts.new()
#    @@naming_props = set([u'type', u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageController", "storageController", "storage-[type]-[id]", VersionMeta::VERSION151F, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("StorageController", "storageController", "storage-[type]-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear-boot-drive", "clear-cache", "clear-foreign-config", "delete-all-vds-reset-pds", "disable-jbod", "enable-jbod", "get-tty-log", "import-foreign-config"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x8, nil, nil, %q{[a-zA-Z0-9_\-]{1,30}}, [], []), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pci_slot" => MoPropertyMeta.new("pci_slot", "pciSlot", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "equipped-identity-unestablishable", "equipped-not-primary", "equipped-with-malformed-fru", "inaccessible", "mismatch", "mismatch-identity-unestablishable", "missing", "not-supported", "unauthorized", "unknown"], []), 
        "raid_support" => MoPropertyMeta.new("raid_support", "raidSupport", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "self_encrypt_enabled" => MoPropertyMeta.new("self_encrypt_enabled", "selfEncryptEnabled", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear-boot-drive", "clear-cache", "clear-foreign-config", "delete-all-vds-reset-pds", "disable-jbod", "enable-jbod", "get-tty-log", "import-foreign-config"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x8, nil, nil, %q{[a-zA-Z0-9_\-]{1,30}}, [], []), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pci_slot" => MoPropertyMeta.new("pci_slot", "pciSlot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "equipped-identity-unestablishable", "equipped-not-primary", "equipped-with-malformed-fru", "inaccessible", "mismatch", "mismatch-identity-unestablishable", "missing", "not-supported", "unauthorized", "unknown"], []), 
            "raid_support" => MoPropertyMeta.new("raid_support", "raidSupport", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
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
        "dn" => "dn", 
        "id" => "id", 
        "model" => "model", 
        "pciSlot" => "pci_slot", 
        "presence" => "presence", 
        "raidSupport" => "raid_support", 
        "rn" => "rn", 
        "serial" => "serial", 
        "status" => "status", 
        "type" => "type", 
        "vendor" => "vendor", 
        "selfEncryptEnabled" => "self_encrypt_enabled", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "id" => "id", 
            "model" => "model", 
            "pciSlot" => "pci_slot", 
            "presence" => "presence", 
            "raidSupport" => "raid_support", 
            "rn" => "rn", 
            "serial" => "serial", 
            "status" => "status", 
            "type" => "type", 
            "vendor" => "vendor", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :type
    attr_reader :id
    attr_accessor :admin_action
    attr_reader :child_action
    attr_reader :model
    attr_reader :pci_slot
    attr_reader :presence
    attr_reader :raid_support
    attr_reader :serial
    attr_accessor :status
    attr_reader :vendor
    attr_reader :self_encrypt_enabled


    def initialize(parent_mo_or_dn: nil,type: nil, id: nil,  **kwargs)
        @dirty_mask = 0
        @type = type
        @id = id
        @admin_action = nil
        @child_action = nil
        @model = nil
        @pci_slot = nil
        @presence = nil
        @raid_support = nil
        @serial = nil
        @status = nil
        @vendor = nil
        @self_encrypt_enabled = nil

        super(class_id: "StorageController", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
