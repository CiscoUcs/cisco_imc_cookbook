#This module contains the general information for LsbootPxe ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class LsbootPxeConsts
    STATE_DISABLED = "Disabled"
    STATE_ENABLED = "Enabled"
    SUBTYPE_PXE = "PXE"
    TYPE_PXE = "PXE"
end


class LsbootPxe < ManagedObject
    #This is LsbootPxe class.

    @@consts = LsbootPxeConsts.new()
#    @@naming_props = set([u'name'])

    @@mo_meta = {
        "classic" => MoMeta.new("LsbootPxe", "lsbootPxe", "pxe-[name]", VersionMeta::VERSION201A, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"]),
        "modular" => MoMeta.new("LsbootPxe", "lsbootPxe", "pxe-[name]", VersionMeta::VERSION2013E, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION201A, MoPropertyMeta::NAMING, 0x4, nil, nil, %q{(([a-zA-Z0-9]{1})|([a-zA-Z0-9]{1}[a-zA-Z0-9_\-]{0,28}[a-zA-Z0-9]{1})|([a-zA-Z0-9]{2}))}, [], []), 
        "order" => MoPropertyMeta.new("order", "order", "uint", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["1-255"]), 
        "port" => MoPropertyMeta.new("port", "port", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, %q{([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]|L|MLOM|L1|L2){0,1}}, [], []), 
        "state" => MoPropertyMeta.new("state", "state", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "subtype" => MoPropertyMeta.new("subtype", "subtype", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["PXE"], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["PXE"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x4, nil, nil, %q{(([a-zA-Z0-9]{1})|([a-zA-Z0-9]{1}[a-zA-Z0-9_\-]{0,28}[a-zA-Z0-9]{1})|([a-zA-Z0-9]{2}))}, [], []), 
            "order" => MoPropertyMeta.new("order", "order", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["1-255"]), 
            "port" => MoPropertyMeta.new("port", "port", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, %q{([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]|L|MLOM|SIOC1|SIOC2|IOESlot1|IOESlot2){0,1}}, [], []), 
            "state" => MoPropertyMeta.new("state", "state", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "subtype" => MoPropertyMeta.new("subtype", "subtype", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["PXE"], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["PXE"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "name" => "name", 
        "order" => "order", 
        "port" => "port", 
        "rn" => "rn", 
        "slot" => "slot", 
        "state" => "state", 
        "status" => "status", 
        "subtype" => "subtype", 
        "type" => "type", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "name" => "name", 
            "order" => "order", 
            "port" => "port", 
            "rn" => "rn", 
            "slot" => "slot", 
            "state" => "state", 
            "status" => "status", 
            "subtype" => "subtype", 
            "type" => "type", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :name
    attr_reader :child_action
    attr_accessor :order
    attr_accessor :port
    attr_accessor :slot
    attr_accessor :state
    attr_accessor :status
    attr_accessor :subtype
    attr_accessor :type


    def initialize(parent_mo_or_dn: nil,name: nil,  **kwargs)
        @dirty_mask = 0
        @name = name
        @child_action = nil
        @order = nil
        @port = nil
        @slot = nil
        @state = nil
        @status = nil
        @subtype = nil
        @type = nil

        super(class_id: "LsbootPxe", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
