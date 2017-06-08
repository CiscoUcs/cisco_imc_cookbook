#This module contains the general information for BiosVfUSBPortsConfig ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfUSBPortsConfigConsts
    VP_ALL_USB_DEVICES_DISABLED = "Disabled"
    VP_ALL_USB_DEVICES_ENABLED = "Enabled"
    _VP_ALL_USB_DEVICES_DISABLED = "disabled"
    _VP_ALL_USB_DEVICES_ENABLED = "enabled"
    VP_ALL_USB_DEVICES_PLATFORM_DEFAULT = "platform-default"
    VP_USB_PORT_FRONT_DISABLED = "Disabled"
    VP_USB_PORT_FRONT_ENABLED = "Enabled"
    _VP_USB_PORT_FRONT_DISABLED = "disabled"
    _VP_USB_PORT_FRONT_ENABLED = "enabled"
    VP_USB_PORT_FRONT_PLATFORM_DEFAULT = "platform-default"
    VP_USB_PORT_INTERNAL_DISABLED = "Disabled"
    VP_USB_PORT_INTERNAL_ENABLED = "Enabled"
    _VP_USB_PORT_INTERNAL_DISABLED = "disabled"
    _VP_USB_PORT_INTERNAL_ENABLED = "enabled"
    VP_USB_PORT_INTERNAL_PLATFORM_DEFAULT = "platform-default"
    VP_USB_PORT_KVM_DISABLED = "Disabled"
    VP_USB_PORT_KVM_ENABLED = "Enabled"
    _VP_USB_PORT_KVM_DISABLED = "disabled"
    _VP_USB_PORT_KVM_ENABLED = "enabled"
    VP_USB_PORT_KVM_PLATFORM_DEFAULT = "platform-default"
    VP_USB_PORT_REAR_DISABLED = "Disabled"
    VP_USB_PORT_REAR_ENABLED = "Enabled"
    _VP_USB_PORT_REAR_DISABLED = "disabled"
    _VP_USB_PORT_REAR_ENABLED = "enabled"
    VP_USB_PORT_REAR_PLATFORM_DEFAULT = "platform-default"
    VP_USB_PORT_SDCARD_DISABLED = "Disabled"
    VP_USB_PORT_SDCARD_ENABLED = "Enabled"
    _VP_USB_PORT_SDCARD_DISABLED = "disabled"
    _VP_USB_PORT_SDCARD_ENABLED = "enabled"
    VP_USB_PORT_SDCARD_PLATFORM_DEFAULT = "platform-default"
    VP_USB_PORT_VMEDIA_DISABLED = "Disabled"
    VP_USB_PORT_VMEDIA_ENABLED = "Enabled"
    _VP_USB_PORT_VMEDIA_DISABLED = "disabled"
    _VP_USB_PORT_VMEDIA_ENABLED = "enabled"
    VP_USB_PORT_VMEDIA_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfUSBPortsConfig < ManagedObject
    #This is BiosVfUSBPortsConfig class.

    @@consts = BiosVfUSBPortsConfigConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfUSBPortsConfig", "biosVfUSBPortsConfig", "USB-Ports-Config", VersionMeta::VERSION151F, "InputOutput", 0x7ff, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfUSBPortsConfig", "biosVfUSBPortsConfig", "USB-Ports-Config", VersionMeta::VERSION2013E, "InputOutput", 0x7ff, [], ["admin"], ["Get", "Set"])
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
        "vp_all_usb_devices" => MoPropertyMeta.new("vp_all_usb_devices", "vpAllUsbDevices", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        "vp_usb_port_front" => MoPropertyMeta.new("vp_usb_port_front", "vpUsbPortFront", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        "vp_usb_port_internal" => MoPropertyMeta.new("vp_usb_port_internal", "vpUsbPortInternal", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        "vp_usb_port_kvm" => MoPropertyMeta.new("vp_usb_port_kvm", "vpUsbPortKVM", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        "vp_usb_port_rear" => MoPropertyMeta.new("vp_usb_port_rear", "vpUsbPortRear", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        "vp_usb_port_sd_card" => MoPropertyMeta.new("vp_usb_port_sd_card", "vpUsbPortSDCard", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        "vp_usb_port_v_media" => MoPropertyMeta.new("vp_usb_port_v_media", "vpUsbPortVMedia", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_all_usb_devices" => MoPropertyMeta.new("vp_all_usb_devices", "vpAllUsbDevices", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
            "vp_usb_port_front" => MoPropertyMeta.new("vp_usb_port_front", "vpUsbPortFront", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x20, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
            "vp_usb_port_internal" => MoPropertyMeta.new("vp_usb_port_internal", "vpUsbPortInternal", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
            "vp_usb_port_kvm" => MoPropertyMeta.new("vp_usb_port_kvm", "vpUsbPortKVM", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
            "vp_usb_port_rear" => MoPropertyMeta.new("vp_usb_port_rear", "vpUsbPortRear", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
            "vp_usb_port_sd_card" => MoPropertyMeta.new("vp_usb_port_sd_card", "vpUsbPortSDCard", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x200, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
            "vp_usb_port_v_media" => MoPropertyMeta.new("vp_usb_port_v_media", "vpUsbPortVMedia", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpAllUsbDevices" => "vp_all_usb_devices", 
        "vpUsbPortFront" => "vp_usb_port_front", 
        "vpUsbPortInternal" => "vp_usb_port_internal", 
        "vpUsbPortKVM" => "vp_usb_port_kvm", 
        "vpUsbPortRear" => "vp_usb_port_rear", 
        "vpUsbPortSDCard" => "vp_usb_port_sd_card", 
        "vpUsbPortVMedia" => "vp_usb_port_v_media", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpAllUsbDevices" => "vp_all_usb_devices", 
            "vpUsbPortFront" => "vp_usb_port_front", 
            "vpUsbPortInternal" => "vp_usb_port_internal", 
            "vpUsbPortKVM" => "vp_usb_port_kvm", 
            "vpUsbPortRear" => "vp_usb_port_rear", 
            "vpUsbPortSDCard" => "vp_usb_port_sd_card", 
            "vpUsbPortVMedia" => "vp_usb_port_v_media", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_all_usb_devices
    attr_accessor :vp_usb_port_front
    attr_accessor :vp_usb_port_internal
    attr_accessor :vp_usb_port_kvm
    attr_accessor :vp_usb_port_rear
    attr_accessor :vp_usb_port_sd_card
    attr_accessor :vp_usb_port_v_media


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_all_usb_devices = nil
        @vp_usb_port_front = nil
        @vp_usb_port_internal = nil
        @vp_usb_port_kvm = nil
        @vp_usb_port_rear = nil
        @vp_usb_port_sd_card = nil
        @vp_usb_port_v_media = nil

        super(class_id: "BiosVfUSBPortsConfig", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
