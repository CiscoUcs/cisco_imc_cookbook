#This module contains the general information for LsbootVMedia ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class LsbootVMediaConsts
    ACCESS_ = ""
    ACCESS_READ_ONLY_LOCAL = "read-only-local"
    ACCESS_READ_ONLY_REMOTE = "read-only-remote"
    ACCESS_READ_WRITE_DRIVE = "read-write-drive"
    ACCESS_READ_WRITE_LOCAL = "read-write-local"
    ACCESS_READ_WRITE_REMOTE = "read-write-remote"
    STATE_DISABLED = "Disabled"
    STATE_ENABLED = "Enabled"
    SUBTYPE_ = ""
    SUBTYPE_CIMC_MAPPED_DVD = "cimc-mapped-dvd"
    SUBTYPE_CIMC_MAPPED_HDD = "cimc-mapped-hdd"
    SUBTYPE_KVM_MAPPED_DVD = "kvm-mapped-dvd"
    SUBTYPE_KVM_MAPPED_FDD = "kvm-mapped-fdd"
    SUBTYPE_KVM_MAPPED_HDD = "kvm-mapped-hdd"
    TYPE_VMEDIA = "VMEDIA"
end


class LsbootVMedia < ManagedObject
    #This is LsbootVMedia class.

    @@consts = LsbootVMediaConsts.new()
#    @@naming_props = set([u'name'])

    @@mo_meta = {
        "classic" => MoMeta.new("LsbootVMedia", "lsbootVMedia", "vm-[name]", VersionMeta::VERSION201A, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"]),
        "modular" => MoMeta.new("LsbootVMedia", "lsbootVMedia", "vm-[name]", VersionMeta::VERSION2013E, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "access" => MoPropertyMeta.new("access", "access", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["", "read-only-local", "read-only-remote", "read-write-drive", "read-write-local", "read-write-remote"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION201A, MoPropertyMeta::NAMING, 0x8, nil, nil, %q{(([a-zA-Z0-9]{1})|([a-zA-Z0-9]{1}[a-zA-Z0-9_\-]{0,28}[a-zA-Z0-9]{1})|([a-zA-Z0-9]{2}))}, [], []), 
        "order" => MoPropertyMeta.new("order", "order", "uint", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["1-255"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "state" => MoPropertyMeta.new("state", "state", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "subtype" => MoPropertyMeta.new("subtype", "subtype", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "cimc-mapped-dvd", "cimc-mapped-hdd", "kvm-mapped-dvd", "kvm-mapped-fdd", "kvm-mapped-hdd"], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["VMEDIA"], []), 
        },

        "modular" => {
            "access" => MoPropertyMeta.new("access", "access", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["", "read-only-local", "read-only-remote", "read-write-drive", "read-write-local", "read-write-remote"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x8, nil, nil, %q{(([a-zA-Z0-9]{1})|([a-zA-Z0-9]{1}[a-zA-Z0-9_\-]{0,28}[a-zA-Z0-9]{1})|([a-zA-Z0-9]{2}))}, [], []), 
            "order" => MoPropertyMeta.new("order", "order", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["1-255"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "state" => MoPropertyMeta.new("state", "state", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "subtype" => MoPropertyMeta.new("subtype", "subtype", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "cimc-mapped-dvd", "cimc-mapped-hdd", "kvm-mapped-dvd", "kvm-mapped-fdd", "kvm-mapped-hdd"], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["VMEDIA"], []), 
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
        "name" => "name", 
        "order" => "order", 
        "rn" => "rn", 
        "state" => "state", 
        "status" => "status", 
        "subtype" => "subtype", 
        "type" => "type", 
        },

        "modular" => {
            "access" => "access", 
            "childAction" => "child_action", 
            "dn" => "dn", 
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
    attr_accessor :access
    attr_reader :child_action
    attr_accessor :order
    attr_accessor :state
    attr_accessor :status
    attr_accessor :subtype
    attr_accessor :type


    def initialize(parent_mo_or_dn: nil,name: nil,  **kwargs)
        @dirty_mask = 0
        @name = name
        @access = nil
        @child_action = nil
        @order = nil
        @state = nil
        @status = nil
        @subtype = nil
        @type = nil

        super(class_id: "LsbootVMedia", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
