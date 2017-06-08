#This module contains the general information for LsbootSd ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class LsbootSdConsts
    STATE_DISABLED = "Disabled"
    STATE_ENABLED = "Enabled"
    SUBTYPE_SDCARD = "SDCARD"
    TYPE_SDCARD = "SDCARD"
end


class LsbootSd < ManagedObject
    #This is LsbootSd class.

    @@consts = LsbootSdConsts.new()
#    @@naming_props = set([u'name'])

    @@mo_meta = {
        "classic" => MoMeta.new("LsbootSd", "lsbootSd", "sd-[name]", VersionMeta::VERSION201A, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"]),
        "modular" => MoMeta.new("LsbootSd", "lsbootSd", "sd-[name]", VersionMeta::VERSION2013E, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "lun" => MoPropertyMeta.new("lun", "lun", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION201A, MoPropertyMeta::NAMING, 0x8, nil, nil, %q{(([a-zA-Z0-9]{1})|([a-zA-Z0-9]{1}[a-zA-Z0-9_\-]{0,28}[a-zA-Z0-9]{1})|([a-zA-Z0-9]{2}))}, [], []), 
        "order" => MoPropertyMeta.new("order", "order", "uint", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["1-255"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "state" => MoPropertyMeta.new("state", "state", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "subtype" => MoPropertyMeta.new("subtype", "subtype", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["SDCARD"], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["SDCARD"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "lun" => MoPropertyMeta.new("lun", "lun", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, %q{([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]){0,1}}, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x8, nil, nil, %q{(([a-zA-Z0-9]{1})|([a-zA-Z0-9]{1}[a-zA-Z0-9_\-]{0,28}[a-zA-Z0-9]{1})|([a-zA-Z0-9]{2}))}, [], []), 
            "order" => MoPropertyMeta.new("order", "order", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["1-255"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "state" => MoPropertyMeta.new("state", "state", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "subtype" => MoPropertyMeta.new("subtype", "subtype", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["SDCARD"], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["SDCARD"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "lun" => "lun", 
        "name" => "name", 
        "order" => "order", 
        "rn" => "rn", 
        "state" => "state", 
        "status" => "status", 
        "subtype" => "subtype", 
        "type" => "type", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "lun" => "lun", 
            "name" => "name", 
            "order" => "order", 
            "rn" => "rn", 
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
    attr_accessor :lun
    attr_accessor :order
    attr_accessor :state
    attr_accessor :status
    attr_accessor :subtype
    attr_accessor :type


    def initialize(parent_mo_or_dn: nil,name: nil,  **kwargs)
        @dirty_mask = 0
        @name = name
        @child_action = nil
        @lun = nil
        @order = nil
        @state = nil
        @status = nil
        @subtype = nil
        @type = nil

        super(class_id: "LsbootSd", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
