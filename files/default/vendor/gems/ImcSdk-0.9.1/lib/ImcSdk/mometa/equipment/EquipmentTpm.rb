#This module contains the general information for EquipmentTpm ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class EquipmentTpmConsts
    ACTIVE_STATUS_ACTIVATED = "activated"
    ACTIVE_STATUS_DEACTIVATED = "deactivated"
    ACTIVE_STATUS_UNKNOWN = "unknown"
    ENABLED_STATUS_DISABLED = "disabled"
    ENABLED_STATUS_ENABLED = "enabled"
    ENABLED_STATUS_UNKNOWN = "unknown"
    OWNERSHIP_OWNED = "owned"
    OWNERSHIP_UNKNOWN = "unknown"
    OWNERSHIP_UNOWNED = "unowned"
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
    ACTIVE_STATUS_NA = "NA"
    OWNERSHIP_NA = "NA"
end


class EquipmentTpm < ManagedObject
    #This is EquipmentTpm class.

    @@consts = EquipmentTpmConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("EquipmentTpm", "equipmentTpm", "tpm", VersionMeta::VERSION201A, "OutputOnly", 0xf, [], ["read-only"], ["Get"]),
        "modular" => MoMeta.new("EquipmentTpm", "equipmentTpm", "tpm", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["read-only"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "active_status" => MoPropertyMeta.new("active_status", "activeStatus", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["activated", "deactivated", "unknown"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "enabled_status" => MoPropertyMeta.new("enabled_status", "enabledStatus", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["disabled", "enabled", "unknown"], []), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "ownership" => MoPropertyMeta.new("ownership", "ownership", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["owned", "unknown", "unowned"], []), 
        "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "equipped-identity-unestablishable", "equipped-not-primary", "equipped-with-malformed-fru", "inaccessible", "mismatch", "mismatch-identity-unestablishable", "missing", "not-supported", "unauthorized", "unknown"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "tpm_revision" => MoPropertyMeta.new("tpm_revision", "tpmRevision", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "version" => MoPropertyMeta.new("version", "version", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "active_status" => MoPropertyMeta.new("active_status", "activeStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["NA", "activated", "deactivated", "unknown"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "enabled_status" => MoPropertyMeta.new("enabled_status", "enabledStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["disabled", "enabled", "unknown"], []), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "ownership" => MoPropertyMeta.new("ownership", "ownership", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["NA", "owned", "unknown", "unowned"], []), 
            "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "equipped-identity-unestablishable", "equipped-not-primary", "equipped-with-malformed-fru", "inaccessible", "mismatch", "mismatch-identity-unestablishable", "missing", "not-supported", "unauthorized", "unknown"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "tpm_revision" => MoPropertyMeta.new("tpm_revision", "tpmRevision", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "version" => MoPropertyMeta.new("version", "version", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "activeStatus" => "active_status", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "enabledStatus" => "enabled_status", 
        "model" => "model", 
        "ownership" => "ownership", 
        "presence" => "presence", 
        "rn" => "rn", 
        "serial" => "serial", 
        "status" => "status", 
        "tpmRevision" => "tpm_revision", 
        "vendor" => "vendor", 
        "version" => "version", 
        },

        "modular" => {
            "activeStatus" => "active_status", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "enabledStatus" => "enabled_status", 
            "model" => "model", 
            "ownership" => "ownership", 
            "presence" => "presence", 
            "rn" => "rn", 
            "serial" => "serial", 
            "status" => "status", 
            "tpmRevision" => "tpm_revision", 
            "vendor" => "vendor", 
            "version" => "version", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :active_status
    attr_reader :child_action
    attr_reader :enabled_status
    attr_reader :model
    attr_reader :ownership
    attr_reader :presence
    attr_reader :serial
    attr_reader :status
    attr_reader :tpm_revision
    attr_reader :vendor
    attr_reader :version


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @active_status = nil
        @child_action = nil
        @enabled_status = nil
        @model = nil
        @ownership = nil
        @presence = nil
        @serial = nil
        @status = nil
        @tpm_revision = nil
        @vendor = nil
        @version = nil

        super(class_id: "EquipmentTpm", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
