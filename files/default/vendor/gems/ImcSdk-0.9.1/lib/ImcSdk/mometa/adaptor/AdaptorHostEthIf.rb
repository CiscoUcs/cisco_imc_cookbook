#This module contains the general information for AdaptorHostEthIf ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorHostEthIfConsts
    IF_TYPE_VIRTUAL = "virtual"
    MAC_AUTO = "AUTO"
    UPLINK_PORT_0 = "0"
    UPLINK_PORT_1 = "1"
end


class AdaptorHostEthIf < ManagedObject
    #This is AdaptorHostEthIf class.

    @@consts = AdaptorHostEthIfConsts.new()
#    @@naming_props = set([u'name'])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorHostEthIf", "adaptorHostEthIf", "host-eth-[name]", VersionMeta::VERSION151F, "InputOutput", 0x1fff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"]),
        "modular" => MoMeta.new("AdaptorHostEthIf", "adaptorHostEthIf", "host-eth-[name]", VersionMeta::VERSION2013E, "InputOutput", 0x1fff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "cdn" => MoPropertyMeta.new("cdn", "cdn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, %q{[a-zA-Z0-9\-\._:]{0,32}}, [], []), 
        "channel_number" => MoPropertyMeta.new("channel_number", "channelNumber", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["1-1000"]), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "class_of_service" => MoPropertyMeta.new("class_of_service", "classOfService", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{[0-6]}, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "if_type" => MoPropertyMeta.new("if_type", "ifType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["virtual"], []), 
        "iscsi_boot" => MoPropertyMeta.new("iscsi_boot", "iscsiBoot", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "mac" => MoPropertyMeta.new("mac", "mac", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, %q{(([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F]))|0}, ["AUTO"], []), 
        "mtu" => MoPropertyMeta.new("mtu", "mtu", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["1500-9000"]), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x80, nil, nil, %q{[a-zA-Z0-9\-\._:]{1,31}}, [], []), 
        "port_profile" => MoPropertyMeta.new("port_profile", "portProfile", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, %q{[a-zA-Z0-9_\-]{0,80}}, [], []), 
        "pxe_boot" => MoPropertyMeta.new("pxe_boot", "pxeBoot", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "uplink_port" => MoPropertyMeta.new("uplink_port", "uplinkPort", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, ["0", "1"], []), 
        "usnic_count" => MoPropertyMeta.new("usnic_count", "usnicCount", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], ["0-225"]), 
        },

        "modular" => {
            "cdn" => MoPropertyMeta.new("cdn", "cdn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, %q{[a-zA-Z0-9\-\._:]{0,32}}, [], []), 
            "channel_number" => MoPropertyMeta.new("channel_number", "channelNumber", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["1-1000"]), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "class_of_service" => MoPropertyMeta.new("class_of_service", "classOfService", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, %q{[0-6]}, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "if_type" => MoPropertyMeta.new("if_type", "ifType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["virtual"], []), 
            "iscsi_boot" => MoPropertyMeta.new("iscsi_boot", "iscsiBoot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "mac" => MoPropertyMeta.new("mac", "mac", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, %q{(([0-9a-fA-F][0-9a-fA-F]:){5}([0-9a-fA-F][0-9a-fA-F]))|0}, ["AUTO"], []), 
            "mtu" => MoPropertyMeta.new("mtu", "mtu", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["1500-9000"]), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x80, nil, nil, %q{[a-zA-Z0-9\-\._:]{1,31}}, [], []), 
            "port_profile" => MoPropertyMeta.new("port_profile", "portProfile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, %q{[a-zA-Z0-9_\-]{0,80}}, [], []), 
            "pxe_boot" => MoPropertyMeta.new("pxe_boot", "pxeBoot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "uplink_port" => MoPropertyMeta.new("uplink_port", "uplinkPort", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, ["0", "1"], []), 
            "usnic_count" => MoPropertyMeta.new("usnic_count", "usnicCount", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], ["0-225"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "cdn" => "cdn", 
        "channelNumber" => "channel_number", 
        "childAction" => "child_action", 
        "classOfService" => "class_of_service", 
        "dn" => "dn", 
        "ifType" => "if_type", 
        "iscsiBoot" => "iscsi_boot", 
        "mac" => "mac", 
        "mtu" => "mtu", 
        "name" => "name", 
        "portProfile" => "port_profile", 
        "pxeBoot" => "pxe_boot", 
        "rn" => "rn", 
        "status" => "status", 
        "uplinkPort" => "uplink_port", 
        "usnicCount" => "usnic_count", 
        },

        "modular" => {
            "cdn" => "cdn", 
            "channelNumber" => "channel_number", 
            "childAction" => "child_action", 
            "classOfService" => "class_of_service", 
            "dn" => "dn", 
            "ifType" => "if_type", 
            "iscsiBoot" => "iscsi_boot", 
            "mac" => "mac", 
            "mtu" => "mtu", 
            "name" => "name", 
            "portProfile" => "port_profile", 
            "pxeBoot" => "pxe_boot", 
            "rn" => "rn", 
            "status" => "status", 
            "uplinkPort" => "uplink_port", 
            "usnicCount" => "usnic_count", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :name
    attr_accessor :cdn
    attr_accessor :channel_number
    attr_reader :child_action
    attr_accessor :class_of_service
    attr_reader :if_type
    attr_reader :iscsi_boot
    attr_accessor :mac
    attr_accessor :mtu
    attr_accessor :port_profile
    attr_accessor :pxe_boot
    attr_accessor :status
    attr_accessor :uplink_port
    attr_reader :usnic_count


    def initialize(parent_mo_or_dn: nil,name: nil,  **kwargs)
        @dirty_mask = 0
        @name = name
        @cdn = nil
        @channel_number = nil
        @child_action = nil
        @class_of_service = nil
        @if_type = nil
        @iscsi_boot = nil
        @mac = nil
        @mtu = nil
        @port_profile = nil
        @pxe_boot = nil
        @status = nil
        @uplink_port = nil
        @usnic_count = nil

        super(class_id: "AdaptorHostEthIf", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
