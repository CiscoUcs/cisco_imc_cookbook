#This module contains the general information for BiosBootDevPrecision ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosBootDevPrecisionConsts
    SUBTYPE_CIMC_MAPPED_DVD = "cimc-mapped-dvd"
    SUBTYPE_CIMC_MAPPED_HDD = "cimc-mapped-hdd"
    SUBTYPE_KVM_MAPPED_DVD = "kvm-mapped-dvd"
    SUBTYPE_KVM_MAPPED_FDD = "kvm-mapped-fdd"
    SUBTYPE_KVM_MAPPED_HDD = "kvm-mapped-hdd"
    SUBTYPE_USB_CD = "usb-cd"
    SUBTYPE_USB_FDD = "usb-fdd"
    SUBTYPE_USB_HDD = "usb-hdd"
    TYPE_EFI = "EFI"
    TYPE_HDD = "HDD"
    TYPE_ISCSI = "ISCSI"
    TYPE_PCHSTORAGE = "PCHSTORAGE"
    TYPE_PXE = "PXE"
    TYPE_SAN = "SAN"
    TYPE_SDCARD = "SDCARD"
    TYPE_USB = "USB"
    TYPE_VMEDIA = "VMEDIA"
end


class BiosBootDevPrecision < ManagedObject
    #This is BiosBootDevPrecision class.

    @@consts = BiosBootDevPrecisionConsts.new()
#    @@naming_props = set([u'order'])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosBootDevPrecision", "biosBootDevPrecision", "bdvp-[order]", VersionMeta::VERSION201A, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("BiosBootDevPrecision", "biosBootDevPrecision", "bdvp-[order]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 256, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "lun" => MoPropertyMeta.new("lun", "lun", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 256, nil, [], []), 
        "order" => MoPropertyMeta.new("order", "order", "uint", VersionMeta::VERSION201A, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], ["1-255"]), 
        "port" => MoPropertyMeta.new("port", "port", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "subtype" => MoPropertyMeta.new("subtype", "subtype", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cimc-mapped-dvd", "cimc-mapped-hdd", "kvm-mapped-dvd", "kvm-mapped-fdd", "kvm-mapped-hdd", "usb-cd", "usb-fdd", "usb-hdd"], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["EFI", "HDD", "ISCSI", "PCHSTORAGE", "PXE", "SAN", "SDCARD", "USB", "VMEDIA"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 256, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "lun" => MoPropertyMeta.new("lun", "lun", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 256, nil, [], []), 
            "order" => MoPropertyMeta.new("order", "order", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], ["1-255"]), 
            "port" => MoPropertyMeta.new("port", "port", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "subtype" => MoPropertyMeta.new("subtype", "subtype", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["cimc-mapped-dvd", "cimc-mapped-hdd", "kvm-mapped-dvd", "kvm-mapped-fdd", "kvm-mapped-hdd", "usb-cd", "usb-fdd", "usb-hdd"], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["EFI", "HDD", "ISCSI", "PCHSTORAGE", "PXE", "SAN", "SDCARD", "USB", "VMEDIA"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "descr" => "descr", 
        "dn" => "dn", 
        "lun" => "lun", 
        "name" => "name", 
        "order" => "order", 
        "port" => "port", 
        "rn" => "rn", 
        "slot" => "slot", 
        "status" => "status", 
        "subtype" => "subtype", 
        "type" => "type", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "descr" => "descr", 
            "dn" => "dn", 
            "lun" => "lun", 
            "name" => "name", 
            "order" => "order", 
            "port" => "port", 
            "rn" => "rn", 
            "slot" => "slot", 
            "status" => "status", 
            "subtype" => "subtype", 
            "type" => "type", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :order
    attr_reader :child_action
    attr_reader :descr
    attr_reader :lun
    attr_reader :name
    attr_reader :port
    attr_reader :slot
    attr_reader :status
    attr_reader :subtype
    attr_reader :type


    def initialize(parent_mo_or_dn: nil,order: nil,  **kwargs)
        @dirty_mask = 0
        @order = order
        @child_action = nil
        @descr = nil
        @lun = nil
        @name = nil
        @port = nil
        @slot = nil
        @status = nil
        @subtype = nil
        @type = nil

        super(class_id: "BiosBootDevPrecision", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
