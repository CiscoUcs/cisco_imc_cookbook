#This module contains the general information for AdaptorUnit ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorUnitConsts
    ADMIN_STATE_ADAPTOR_RESET = "adaptor-reset"
    ADMIN_STATE_ADAPTOR_RESET_DEFAULT = "adaptor-reset-default"
    ADMIN_STATE_POLICY = "policy"
    PRESENCE_EMPTY = "empty"
    PRESENCE_EQUIPPED = "equipped"
    PRESENCE_MISSING = "missing"
    PRESENCE_NOT_SUPPORTED = "not-supported"
    PRESENCE_UNKNOWN = "unknown"
end


class AdaptorUnit < ManagedObject
    #This is AdaptorUnit class.

    @@consts = AdaptorUnitConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorUnit", "adaptorUnit", "adaptor-[id]", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorUnit", "adaptorUnit", "adaptor-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["adaptor-reset", "adaptor-reset-default", "policy"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "cimc_management_enabled" => MoPropertyMeta.new("cimc_management_enabled", "cimcManagementEnabled", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 64, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x10, nil, nil, nil, [], ["0-20"]), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pci_addr" => MoPropertyMeta.new("pci_addr", "pciAddr", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pci_slot" => MoPropertyMeta.new("pci_slot", "pciSlot", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "missing", "not-supported", "unknown"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["adaptor-reset", "adaptor-reset-default", "policy"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "cimc_management_enabled" => MoPropertyMeta.new("cimc_management_enabled", "cimcManagementEnabled", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 64, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x10, nil, nil, nil, [], ["0-20"]), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pci_addr" => MoPropertyMeta.new("pci_addr", "pciAddr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pci_slot" => MoPropertyMeta.new("pci_slot", "pciSlot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "presence" => MoPropertyMeta.new("presence", "presence", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["empty", "equipped", "missing", "not-supported", "unknown"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "cimcManagementEnabled" => "cimc_management_enabled", 
        "description" => "description", 
        "dn" => "dn", 
        "id" => "id", 
        "model" => "model", 
        "pciAddr" => "pci_addr", 
        "pciSlot" => "pci_slot", 
        "presence" => "presence", 
        "rn" => "rn", 
        "serial" => "serial", 
        "status" => "status", 
        "vendor" => "vendor", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "cimcManagementEnabled" => "cimc_management_enabled", 
            "description" => "description", 
            "dn" => "dn", 
            "id" => "id", 
            "model" => "model", 
            "pciAddr" => "pci_addr", 
            "pciSlot" => "pci_slot", 
            "presence" => "presence", 
            "rn" => "rn", 
            "serial" => "serial", 
            "status" => "status", 
            "vendor" => "vendor", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :admin_state
    attr_reader :child_action
    attr_reader :cimc_management_enabled
    attr_accessor :description
    attr_reader :model
    attr_reader :pci_addr
    attr_reader :pci_slot
    attr_reader :presence
    attr_reader :serial
    attr_accessor :status
    attr_reader :vendor


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @admin_state = nil
        @child_action = nil
        @cimc_management_enabled = nil
        @description = nil
        @model = nil
        @pci_addr = nil
        @pci_slot = nil
        @presence = nil
        @serial = nil
        @status = nil
        @vendor = nil

        super(class_id: "AdaptorUnit", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
