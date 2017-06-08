#This module contains the general information for SolIf ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class SolIfConsts
    ADMIN_STATE_DISABLED = "Disabled"
    ADMIN_STATE_ENABLED = "Enabled"
    ADMIN_STATE_DISABLE = "disable"
    _ADMIN_STATE_DISABLED = "disabled"
    ADMIN_STATE_ENABLE = "enable"
    _ADMIN_STATE_ENABLED = "enabled"
    COMPORT_COM0 = "com0"
    COMPORT_COM1 = "com1"
    SPEED_115200 = "115200"
    SPEED_19200 = "19200"
    SPEED_38400 = "38400"
    SPEED_57600 = "57600"
    SPEED_9600 = "9600"
end


class SolIf < ManagedObject
    #This is SolIf class.

    @@consts = SolIfConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("SolIf", "solIf", "sol-if", VersionMeta::VERSION151F, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("SolIf", "solIf", "sol-if", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disable", "disabled", "enable", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "comport" => MoPropertyMeta.new("comport", "comport", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["com0", "com1"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,16}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "speed" => MoPropertyMeta.new("speed", "speed", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["115200", "19200", "38400", "57600", "9600"], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "ssh_port" => MoPropertyMeta.new("ssh_port", "sshPort", "uint", VersionMeta::VERSION208D, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], ["1024-65535"]), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disable", "disabled", "enable", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "comport" => MoPropertyMeta.new("comport", "comport", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["com0", "com1"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,16}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "speed" => MoPropertyMeta.new("speed", "speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["115200", "19200", "38400", "57600", "9600"], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "childAction" => "child_action", 
        "comport" => "comport", 
        "dn" => "dn", 
        "name" => "name", 
        "rn" => "rn", 
        "speed" => "speed", 
        "status" => "status", 
        "sshPort" => "ssh_port", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "childAction" => "child_action", 
            "comport" => "comport", 
            "dn" => "dn", 
            "name" => "name", 
            "rn" => "rn", 
            "speed" => "speed", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_reader :child_action
    attr_accessor :comport
    attr_reader :name
    attr_accessor :speed
    attr_accessor :status
    attr_accessor :ssh_port


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @child_action = nil
        @comport = nil
        @name = nil
        @speed = nil
        @status = nil
        @ssh_port = nil

        super(class_id: "SolIf", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
