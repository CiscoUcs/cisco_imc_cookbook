#This module contains the general information for BiosBootDevGrp ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosBootDevGrpConsts
    TYPE_BEV_ORDER = "bev-order"
    TYPE_CD_ORDER = "cd-order"
    TYPE_FDD_ORDER = "fdd-order"
    TYPE_HDD_ORDER = "hdd-order"
    TYPE_INTERNAL_EFI_SHELL = "internal-efi-shell"
    TYPE_NETWORK_DEVICE_ORDER = "network-device-order"
    TYPE_SYSTEM_BOOT_ORDER = "system-boot-order"
end


class BiosBootDevGrp < ManagedObject
    #This is BiosBootDevGrp class.

    @@consts = BiosBootDevGrpConsts.new()
#    @@naming_props = set([u'order'])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosBootDevGrp", "biosBootDevGrp", "bdg-[order]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("BiosBootDevGrp", "biosBootDevGrp", "bdg-[order]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 256, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "order" => MoPropertyMeta.new("order", "order", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["bev-order", "cd-order", "fdd-order", "hdd-order", "internal-efi-shell", "network-device-order", "system-boot-order"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 256, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "order" => MoPropertyMeta.new("order", "order", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["bev-order", "cd-order", "fdd-order", "hdd-order", "internal-efi-shell", "network-device-order", "system-boot-order"], []), 
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
        "order" => "order", 
        "rn" => "rn", 
        "status" => "status", 
        "type" => "type", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "descr" => "descr", 
            "dn" => "dn", 
            "order" => "order", 
            "rn" => "rn", 
            "status" => "status", 
            "type" => "type", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :order
    attr_reader :child_action
    attr_reader :descr
    attr_reader :status
    attr_reader :type


    def initialize(parent_mo_or_dn: nil,order: nil,  **kwargs)
        @dirty_mask = 0
        @order = order
        @child_action = nil
        @descr = nil
        @status = nil
        @type = nil

        super(class_id: "BiosBootDevGrp", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
