#This module contains the general information for IpFiltering ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class IpFilteringConsts
    ADMIN_ACTION_CLEAR_ALL = "clearAll"
    ADMIN_ACTION_CLEAR_FILTER1 = "clearFilter1"
    ADMIN_ACTION_CLEAR_FILTER2 = "clearFilter2"
    ADMIN_ACTION_CLEAR_FILTER3 = "clearFilter3"
    ADMIN_ACTION_CLEAR_FILTER4 = "clearFilter4"
end


class IpFiltering < ManagedObject
    #This is IpFiltering class.

    @@consts = IpFilteringConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("IpFiltering", "ipFiltering", "ip-filter", VersionMeta::VERSION301C, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("IpFiltering", "ipFiltering", "ip-filter", VersionMeta::VERSION301C, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clearAll", "clearFilter1", "clearFilter2", "clearFilter3", "clearFilter4"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "enable" => MoPropertyMeta.new("enable", "enable", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "filter1" => MoPropertyMeta.new("filter1", "filter1", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], []), 
        "filter2" => MoPropertyMeta.new("filter2", "filter2", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], []), 
        "filter3" => MoPropertyMeta.new("filter3", "filter3", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], []), 
        "filter4" => MoPropertyMeta.new("filter4", "filter4", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clearAll", "clearFilter1", "clearFilter2", "clearFilter3", "clearFilter4"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "enable" => MoPropertyMeta.new("enable", "enable", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "filter1" => MoPropertyMeta.new("filter1", "filter1", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], []), 
            "filter2" => MoPropertyMeta.new("filter2", "filter2", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], []), 
            "filter3" => MoPropertyMeta.new("filter3", "filter3", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], []), 
            "filter4" => MoPropertyMeta.new("filter4", "filter4", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "enable" => "enable", 
        "filter1" => "filter1", 
        "filter2" => "filter2", 
        "filter3" => "filter3", 
        "filter4" => "filter4", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "enable" => "enable", 
            "filter1" => "filter1", 
            "filter2" => "filter2", 
            "filter3" => "filter3", 
            "filter4" => "filter4", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_action
    attr_reader :child_action
    attr_accessor :enable
    attr_accessor :filter1
    attr_accessor :filter2
    attr_accessor :filter3
    attr_accessor :filter4
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_action = nil
        @child_action = nil
        @enable = nil
        @filter1 = nil
        @filter2 = nil
        @filter3 = nil
        @filter4 = nil
        @status = nil

        super(class_id: "IpFiltering", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
