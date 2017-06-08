#This module contains the general information for PlatformEventFilters ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class PlatformEventFiltersConsts
    ACTION_NONE = "none"
    ACTION_POWER_CYCLE = "power-cycle"
    ACTION_POWER_OFF = "power-off"
    ACTION_REBOOT = "reboot"
end


class PlatformEventFilters < ManagedObject
    #This is PlatformEventFilters class.

    @@consts = PlatformEventFiltersConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("PlatformEventFilters", "platformEventFilters", "pef-[id]", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("PlatformEventFilters", "platformEventFilters", "pef-[id]", VersionMeta::VERSION301C, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "action" => MoPropertyMeta.new("action", "action", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["none", "power-cycle", "power-off", "reboot"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "event" => MoPropertyMeta.new("event", "event", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x8, 0, 510, nil, [], ["1-7"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "action" => MoPropertyMeta.new("action", "action", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["none", "power-cycle", "power-off", "reboot"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "event" => MoPropertyMeta.new("event", "event", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION301C, MoPropertyMeta::NAMING, 0x8, 0, 510, nil, [], ["1-7"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "action" => "action", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "event" => "event", 
        "id" => "id", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "action" => "action", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "event" => "event", 
            "id" => "id", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :action
    attr_reader :child_action
    attr_reader :event
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @action = nil
        @child_action = nil
        @event = nil
        @status = nil

        super(class_id: "PlatformEventFilters", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
