#This module contains the general information for LsbootVirtualMedia ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class LsbootVirtualMediaConsts
    ACCESS_READ_ONLY = "read-only"
    ACCESS_READ_WRITE = "read-write"
    TYPE_VIRTUAL_MEDIA = "virtual-media"
end


class LsbootVirtualMedia < ManagedObject
    #This is LsbootVirtualMedia class.

    @@consts = LsbootVirtualMediaConsts.new()
#    @@naming_props = set([u'access'])

    @@mo_meta = {
        "classic" => MoMeta.new("LsbootVirtualMedia", "lsbootVirtualMedia", "vm-[access]", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Add", "Get"]),
        "modular" => MoMeta.new("LsbootVirtualMedia", "lsbootVirtualMedia", "vm-[access]", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Add", "Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "access" => MoPropertyMeta.new("access", "access", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x2, nil, nil, nil, ["read-only", "read-write"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "order" => MoPropertyMeta.new("order", "order", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["1", "2", "3", "4", "5"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["virtual-media"], []), 
        },

        "modular" => {
            "access" => MoPropertyMeta.new("access", "access", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x2, nil, nil, nil, ["read-only", "read-write"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "order" => MoPropertyMeta.new("order", "order", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["1", "2", "3", "4", "5"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["virtual-media"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "access" => "access", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "order" => "order", 
        "rn" => "rn", 
        "status" => "status", 
        "type" => "type", 
        },

        "modular" => {
            "access" => "access", 
            "childAction" => "child_action", 
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

    attr_reader :access
    attr_reader :child_action
    attr_accessor :order
    attr_accessor :status
    attr_accessor :type


    def initialize(parent_mo_or_dn: nil,access: nil,  **kwargs)
        @dirty_mask = 0
        @access = access
        @child_action = nil
        @order = nil
        @status = nil
        @type = nil

        super(class_id: "LsbootVirtualMedia", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
