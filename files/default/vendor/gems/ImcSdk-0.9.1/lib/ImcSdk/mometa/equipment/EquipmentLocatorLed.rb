#This module contains the general information for EquipmentLocatorLed ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class EquipmentLocatorLedConsts
    ADMIN_STATE_INACTIVE = "inactive"
    ADMIN_STATE_OFF = "off"
    ADMIN_STATE_ON = "on"
    COLOR_AMBER = "amber"
    COLOR_BLUE = "blue"
    COLOR_GREEN = "green"
    COLOR_RED = "red"
    COLOR_UNKNOWN = "unknown"
    OPER_STATE_BLINKING = "blinking"
    OPER_STATE_ETH = "eth"
    OPER_STATE_FC = "fc"
    OPER_STATE_OFF = "off"
    OPER_STATE_ON = "on"
    OPER_STATE_UNKNOWN = "unknown"
end


class EquipmentLocatorLed < ManagedObject
    #This is EquipmentLocatorLed class.

    @@consts = EquipmentLocatorLedConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("EquipmentLocatorLed", "equipmentLocatorLed", "locator-led", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("EquipmentLocatorLed", "equipmentLocatorLed", "locator-led", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["inactive", "off", "on"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "color" => MoPropertyMeta.new("color", "color", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["amber", "blue", "green", "red", "unknown"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 512, nil, [], []), 
        "oper_state" => MoPropertyMeta.new("oper_state", "operState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["blinking", "eth", "fc", "off", "on", "unknown"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["inactive", "off", "on"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "color" => MoPropertyMeta.new("color", "color", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["amber", "blue", "green", "red", "unknown"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 512, nil, [], []), 
            "oper_state" => MoPropertyMeta.new("oper_state", "operState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["blinking", "eth", "fc", "off", "on", "unknown"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "color" => "color", 
        "dn" => "dn", 
        "id" => "id", 
        "name" => "name", 
        "operState" => "oper_state", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "color" => "color", 
            "dn" => "dn", 
            "id" => "id", 
            "name" => "name", 
            "operState" => "oper_state", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_reader :child_action
    attr_reader :color
    attr_reader :id
    attr_reader :name
    attr_reader :oper_state
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @child_action = nil
        @color = nil
        @id = nil
        @name = nil
        @oper_state = nil
        @status = nil

        super(class_id: "EquipmentLocatorLed", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
