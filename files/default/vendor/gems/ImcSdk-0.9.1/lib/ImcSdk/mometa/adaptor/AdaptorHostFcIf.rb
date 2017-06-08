#This module contains the general information for AdaptorHostFcIf ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorHostFcIfConsts
    ADMIN_PERSISTENT_BINDINGS_POLICY = "policy"
    ADMIN_PERSISTENT_BINDINGS_REBUILD = "rebuild"
    IF_TYPE_VIRTUAL = "virtual"
    UPLINK_PORT_0 = "0"
    UPLINK_PORT_1 = "1"
    WWNN_AUTO = "AUTO"
    WWPN_AUTO = "AUTO"
end


class AdaptorHostFcIf < ManagedObject
    #This is AdaptorHostFcIf class.

    @@consts = AdaptorHostFcIfConsts.new()
#    @@naming_props = set([u'name'])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorHostFcIf", "adaptorHostFcIf", "host-fc-[name]", VersionMeta::VERSION151F, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"]),
        "modular" => MoMeta.new("AdaptorHostFcIf", "adaptorHostFcIf", "host-fc-[name]", VersionMeta::VERSION2013E, "InputOutput", 0xfff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_persistent_bindings" => MoPropertyMeta.new("admin_persistent_bindings", "adminPersistentBindings", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["policy", "rebuild"], []), 
        "channel_number" => MoPropertyMeta.new("channel_number", "channelNumber", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["1-1000"]), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "if_type" => MoPropertyMeta.new("if_type", "ifType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["virtual"], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x10, nil, nil, %q{[a-zA-Z0-9\-\._:]{1,31}}, [], []), 
        "port_profile" => MoPropertyMeta.new("port_profile", "portProfile", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, %q{[a-zA-Z0-9_\-]{0,80}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "san_boot" => MoPropertyMeta.new("san_boot", "sanBoot", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "uplink_port" => MoPropertyMeta.new("uplink_port", "uplinkPort", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["0", "1"], []), 
        "wwnn" => MoPropertyMeta.new("wwnn", "wwnn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, 0, 256, %q{(([A-Fa-f0-9][A-Fa-f0-9]:){7}[A-Fa-f0-9][A-Fa-f0-9])|0}, ["AUTO"], []), 
        "wwpn" => MoPropertyMeta.new("wwpn", "wwpn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800, 0, 256, %q{(([A-Fa-f0-9][A-Fa-f0-9]:){7}[A-Fa-f0-9][A-Fa-f0-9])|0}, ["AUTO"], []), 
        },

        "modular" => {
            "admin_persistent_bindings" => MoPropertyMeta.new("admin_persistent_bindings", "adminPersistentBindings", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["policy", "rebuild"], []), 
            "channel_number" => MoPropertyMeta.new("channel_number", "channelNumber", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["1-1000"]), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "if_type" => MoPropertyMeta.new("if_type", "ifType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["virtual"], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x10, nil, nil, %q{[a-zA-Z0-9\-\._:]{1,31}}, [], []), 
            "port_profile" => MoPropertyMeta.new("port_profile", "portProfile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, %q{[a-zA-Z0-9_\-]{0,80}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
            "san_boot" => MoPropertyMeta.new("san_boot", "sanBoot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "uplink_port" => MoPropertyMeta.new("uplink_port", "uplinkPort", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["0", "1"], []), 
            "wwnn" => MoPropertyMeta.new("wwnn", "wwnn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, 0, 256, %q{(([A-Fa-f0-9][A-Fa-f0-9]:){7}[A-Fa-f0-9][A-Fa-f0-9])|0}, ["AUTO"], []), 
            "wwpn" => MoPropertyMeta.new("wwpn", "wwpn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, 0, 256, %q{(([A-Fa-f0-9][A-Fa-f0-9]:){7}[A-Fa-f0-9][A-Fa-f0-9])|0}, ["AUTO"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminPersistentBindings" => "admin_persistent_bindings", 
        "channelNumber" => "channel_number", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "ifType" => "if_type", 
        "name" => "name", 
        "portProfile" => "port_profile", 
        "rn" => "rn", 
        "sanBoot" => "san_boot", 
        "status" => "status", 
        "uplinkPort" => "uplink_port", 
        "wwnn" => "wwnn", 
        "wwpn" => "wwpn", 
        },

        "modular" => {
            "adminPersistentBindings" => "admin_persistent_bindings", 
            "channelNumber" => "channel_number", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "ifType" => "if_type", 
            "name" => "name", 
            "portProfile" => "port_profile", 
            "rn" => "rn", 
            "sanBoot" => "san_boot", 
            "status" => "status", 
            "uplinkPort" => "uplink_port", 
            "wwnn" => "wwnn", 
            "wwpn" => "wwpn", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :name
    attr_accessor :admin_persistent_bindings
    attr_accessor :channel_number
    attr_reader :child_action
    attr_reader :if_type
    attr_accessor :port_profile
    attr_accessor :san_boot
    attr_accessor :status
    attr_accessor :uplink_port
    attr_accessor :wwnn
    attr_accessor :wwpn


    def initialize(parent_mo_or_dn: nil,name: nil,  **kwargs)
        @dirty_mask = 0
        @name = name
        @admin_persistent_bindings = nil
        @channel_number = nil
        @child_action = nil
        @if_type = nil
        @port_profile = nil
        @san_boot = nil
        @status = nil
        @uplink_port = nil
        @wwnn = nil
        @wwpn = nil

        super(class_id: "AdaptorHostFcIf", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
