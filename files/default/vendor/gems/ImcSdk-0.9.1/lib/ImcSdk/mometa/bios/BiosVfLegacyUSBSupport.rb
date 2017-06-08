#This module contains the general information for BiosVfLegacyUSBSupport ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfLegacyUSBSupportConsts
    VP_LEGACY_USBSUPPORT_AUTO = "Auto"
    VP_LEGACY_USBSUPPORT_DISABLED = "Disabled"
    VP_LEGACY_USBSUPPORT_ENABLED = "Enabled"
    _VP_LEGACY_USBSUPPORT_AUTO = "auto"
    _VP_LEGACY_USBSUPPORT_DISABLED = "disabled"
    _VP_LEGACY_USBSUPPORT_ENABLED = "enabled"
    VP_LEGACY_USBSUPPORT_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfLegacyUSBSupport < ManagedObject
    #This is BiosVfLegacyUSBSupport class.

    @@consts = BiosVfLegacyUSBSupportConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfLegacyUSBSupport", "biosVfLegacyUSBSupport", "LegacyUSB-Support", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfLegacyUSBSupport", "biosVfLegacyUSBSupport", "LegacyUSB-Support", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_legacy_usb_support" => MoPropertyMeta.new("vp_legacy_usb_support", "vpLegacyUSBSupport", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Auto", "Disabled", "Enabled", "auto", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_legacy_usb_support" => MoPropertyMeta.new("vp_legacy_usb_support", "vpLegacyUSBSupport", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "auto", "disabled", "enabled", "platform-default"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "vpLegacyUSBSupport" => "vp_legacy_usb_support", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpLegacyUSBSupport" => "vp_legacy_usb_support", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_legacy_usb_support


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_legacy_usb_support = nil

        super(class_id: "BiosVfLegacyUSBSupport", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
