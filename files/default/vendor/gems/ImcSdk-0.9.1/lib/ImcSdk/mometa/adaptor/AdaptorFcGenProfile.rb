#This module contains the general information for AdaptorFcGenProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorFcGenProfileConsts
    MAC_AUTO = "AUTO"
    ORDER_ANY = "ANY"
    RATE_LIMIT_OFF = "OFF"
    VLAN_NONE = "NONE"
end


class AdaptorFcGenProfile < ManagedObject
    #This is AdaptorFcGenProfile class.

    @@consts = AdaptorFcGenProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorFcGenProfile", "adaptorFcGenProfile", "general", VersionMeta::VERSION151F, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorFcGenProfile", "adaptorFcGenProfile", "general", VersionMeta::VERSION2013E, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "class_of_service" => MoPropertyMeta.new("class_of_service", "classOfService", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, %q{[0-6]}, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "mac" => MoPropertyMeta.new("mac", "mac", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{(([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F]))|0}, ["AUTO"], []), 
        "max_data_field_size" => MoPropertyMeta.new("max_data_field_size", "maxDataFieldSize", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["256-2112"]), 
        "order" => MoPropertyMeta.new("order", "order", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, %q{[0-9]|1[0-7]}, ["ANY"], []), 
        "persistent_lun_bind" => MoPropertyMeta.new("persistent_lun_bind", "persistentLunBind", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "rate_limit" => MoPropertyMeta.new("rate_limit", "rateLimit", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, %q{(([1-9]\d?\d?\d?|10000) Mbps)}, ["OFF"], ["1-40000"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vlan" => MoPropertyMeta.new("vlan", "vlan", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["NONE"], ["1-4094"]), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "class_of_service" => MoPropertyMeta.new("class_of_service", "classOfService", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, %q{[0-6]}, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "mac" => MoPropertyMeta.new("mac", "mac", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{(([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F]))|0}, ["AUTO"], []), 
            "max_data_field_size" => MoPropertyMeta.new("max_data_field_size", "maxDataFieldSize", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["256-2112"]), 
            "order" => MoPropertyMeta.new("order", "order", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, %q{[0-9]|1[0-7]}, ["ANY"], []), 
            "persistent_lun_bind" => MoPropertyMeta.new("persistent_lun_bind", "persistentLunBind", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "rate_limit" => MoPropertyMeta.new("rate_limit", "rateLimit", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, %q{(([1-9]\d?\d?\d?|10000) Mbps)}, ["OFF"], ["1-40000"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vlan" => MoPropertyMeta.new("vlan", "vlan", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["NONE"], ["1-4094"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "classOfService" => "class_of_service", 
        "dn" => "dn", 
        "mac" => "mac", 
        "maxDataFieldSize" => "max_data_field_size", 
        "order" => "order", 
        "persistentLunBind" => "persistent_lun_bind", 
        "rateLimit" => "rate_limit", 
        "rn" => "rn", 
        "status" => "status", 
        "vlan" => "vlan", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "classOfService" => "class_of_service", 
            "dn" => "dn", 
            "mac" => "mac", 
            "maxDataFieldSize" => "max_data_field_size", 
            "order" => "order", 
            "persistentLunBind" => "persistent_lun_bind", 
            "rateLimit" => "rate_limit", 
            "rn" => "rn", 
            "status" => "status", 
            "vlan" => "vlan", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :class_of_service
    attr_accessor :mac
    attr_accessor :max_data_field_size
    attr_accessor :order
    attr_accessor :persistent_lun_bind
    attr_accessor :rate_limit
    attr_accessor :status
    attr_accessor :vlan


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @class_of_service = nil
        @mac = nil
        @max_data_field_size = nil
        @order = nil
        @persistent_lun_bind = nil
        @rate_limit = nil
        @status = nil
        @vlan = nil

        super(class_id: "AdaptorFcGenProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
