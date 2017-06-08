#This module contains the general information for AdaptorGenProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorGenProfileConsts
    
end


class AdaptorGenProfile < ManagedObject
    #This is AdaptorGenProfile class.

    @@consts = AdaptorGenProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorGenProfile", "adaptorGenProfile", "general", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorGenProfile", "adaptorGenProfile", "general", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "configuration_pending" => MoPropertyMeta.new("configuration_pending", "configurationPending", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "fip_mode" => MoPropertyMeta.new("fip_mode", "fipMode", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "iscsi_boot_supported" => MoPropertyMeta.new("iscsi_boot_supported", "iscsiBootSupported", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "lldp" => MoPropertyMeta.new("lldp", "lldp", "string", VersionMeta::VERSION208D, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pci_slot" => MoPropertyMeta.new("pci_slot", "pciSlot", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "product_name" => MoPropertyMeta.new("product_name", "productName", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "revision" => MoPropertyMeta.new("revision", "revision", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "usnic_supported" => MoPropertyMeta.new("usnic_supported", "usnicSupported", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "vendor_id" => MoPropertyMeta.new("vendor_id", "vendorId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "vntag_mode" => MoPropertyMeta.new("vntag_mode", "vntagMode", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "configuration_pending" => MoPropertyMeta.new("configuration_pending", "configurationPending", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "fip_mode" => MoPropertyMeta.new("fip_mode", "fipMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "iscsi_boot_supported" => MoPropertyMeta.new("iscsi_boot_supported", "iscsiBootSupported", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "lldp" => MoPropertyMeta.new("lldp", "lldp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pci_slot" => MoPropertyMeta.new("pci_slot", "pciSlot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "product_name" => MoPropertyMeta.new("product_name", "productName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "revision" => MoPropertyMeta.new("revision", "revision", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "usnic_supported" => MoPropertyMeta.new("usnic_supported", "usnicSupported", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "vendor_id" => MoPropertyMeta.new("vendor_id", "vendorId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "vntag_mode" => MoPropertyMeta.new("vntag_mode", "vntagMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "configurationPending" => "configuration_pending", 
        "dn" => "dn", 
        "fipMode" => "fip_mode", 
        "iscsiBootSupported" => "iscsi_boot_supported", 
        "lldp" => "lldp", 
        "model" => "model", 
        "pciSlot" => "pci_slot", 
        "productName" => "product_name", 
        "revision" => "revision", 
        "rn" => "rn", 
        "serial" => "serial", 
        "status" => "status", 
        "usnicSupported" => "usnic_supported", 
        "vendor" => "vendor", 
        "vendorId" => "vendor_id", 
        "vntagMode" => "vntag_mode", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "configurationPending" => "configuration_pending", 
            "dn" => "dn", 
            "fipMode" => "fip_mode", 
            "iscsiBootSupported" => "iscsi_boot_supported", 
            "lldp" => "lldp", 
            "model" => "model", 
            "pciSlot" => "pci_slot", 
            "productName" => "product_name", 
            "revision" => "revision", 
            "rn" => "rn", 
            "serial" => "serial", 
            "status" => "status", 
            "usnicSupported" => "usnic_supported", 
            "vendor" => "vendor", 
            "vendorId" => "vendor_id", 
            "vntagMode" => "vntag_mode", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :configuration_pending
    attr_accessor :fip_mode
    attr_reader :iscsi_boot_supported
    attr_accessor :lldp
    attr_reader :model
    attr_reader :pci_slot
    attr_reader :product_name
    attr_reader :revision
    attr_reader :serial
    attr_accessor :status
    attr_reader :usnic_supported
    attr_reader :vendor
    attr_reader :vendor_id
    attr_accessor :vntag_mode


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @configuration_pending = nil
        @fip_mode = nil
        @iscsi_boot_supported = nil
        @lldp = nil
        @model = nil
        @pci_slot = nil
        @product_name = nil
        @revision = nil
        @serial = nil
        @status = nil
        @usnic_supported = nil
        @vendor = nil
        @vendor_id = nil
        @vntag_mode = nil

        super(class_id: "AdaptorGenProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
