#This module contains the general information for EquipmentSystemIOController ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class EquipmentSystemIOControllerConsts
    ADMIN_POWER_CMC_REBOOT = "cmc-reboot"
    ADMIN_POWER_CMC_RESET_DEFAULT = "cmc-reset-default"
    ADMIN_POWER_POLICY = "policy"
end


class EquipmentSystemIOController < ManagedObject
    #This is EquipmentSystemIOController class.

    @@consts = EquipmentSystemIOControllerConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "modular" => MoMeta.new("EquipmentSystemIOController", "equipmentSystemIOController", "slot-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "admin_power" => MoPropertyMeta.new("admin_power", "adminPower", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["cmc-reboot", "cmc-reset-default", "policy"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], ["1-2"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "adminPower" => "admin_power", 
            "childAction" => "child_action", 
            "description" => "description", 
            "dn" => "dn", 
            "id" => "id", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :admin_power
    attr_reader :child_action
    attr_reader :description
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @admin_power = nil
        @child_action = nil
        @description = nil
        @status = nil

        super(class_id: "EquipmentSystemIOController", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
