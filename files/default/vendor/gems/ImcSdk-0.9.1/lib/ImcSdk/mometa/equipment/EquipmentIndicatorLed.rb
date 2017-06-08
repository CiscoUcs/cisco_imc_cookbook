#This module contains the general information for EquipmentIndicatorLed ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class EquipmentIndicatorLedConsts
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


class EquipmentIndicatorLed < ManagedObject
    #This is EquipmentIndicatorLed class.

    @@consts = EquipmentIndicatorLedConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("EquipmentIndicatorLed", "equipmentIndicatorLed", "indicator-led-[id]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("EquipmentIndicatorLed", "equipmentIndicatorLed", "indicator-led-[id]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "color" => MoPropertyMeta.new("color", "color", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["amber", "blue", "green", "red", "unknown"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,25}}, [], []), 
        "oper_state" => MoPropertyMeta.new("oper_state", "operState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["blinking", "eth", "fc", "off", "on", "unknown"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "color" => MoPropertyMeta.new("color", "color", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["amber", "blue", "green", "red", "unknown"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,25}}, [], []), 
            "oper_state" => MoPropertyMeta.new("oper_state", "operState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["blinking", "eth", "fc", "off", "on", "unknown"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
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

    attr_reader :id
    attr_reader :child_action
    attr_reader :color
    attr_reader :name
    attr_reader :oper_state
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @child_action = nil
        @color = nil
        @name = nil
        @oper_state = nil
        @status = nil

        super(class_id: "EquipmentIndicatorLed", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
