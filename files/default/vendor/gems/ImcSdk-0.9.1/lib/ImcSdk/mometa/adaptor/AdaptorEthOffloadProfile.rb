#This module contains the general information for AdaptorEthOffloadProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorEthOffloadProfileConsts
    
end


class AdaptorEthOffloadProfile < ManagedObject
    #This is AdaptorEthOffloadProfile class.

    @@consts = AdaptorEthOffloadProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorEthOffloadProfile", "adaptorEthOffloadProfile", "eth-offload", VersionMeta::VERSION151F, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorEthOffloadProfile", "adaptorEthOffloadProfile", "eth-offload", VersionMeta::VERSION2013E, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "large_receive" => MoPropertyMeta.new("large_receive", "largeReceive", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "tcp_rx_checksum" => MoPropertyMeta.new("tcp_rx_checksum", "tcpRxChecksum", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "tcp_segment" => MoPropertyMeta.new("tcp_segment", "tcpSegment", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "tcp_tx_checksum" => MoPropertyMeta.new("tcp_tx_checksum", "tcpTxChecksum", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "large_receive" => MoPropertyMeta.new("large_receive", "largeReceive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "tcp_rx_checksum" => MoPropertyMeta.new("tcp_rx_checksum", "tcpRxChecksum", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "tcp_segment" => MoPropertyMeta.new("tcp_segment", "tcpSegment", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "tcp_tx_checksum" => MoPropertyMeta.new("tcp_tx_checksum", "tcpTxChecksum", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "largeReceive" => "large_receive", 
        "rn" => "rn", 
        "status" => "status", 
        "tcpRxChecksum" => "tcp_rx_checksum", 
        "tcpSegment" => "tcp_segment", 
        "tcpTxChecksum" => "tcp_tx_checksum", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "largeReceive" => "large_receive", 
            "rn" => "rn", 
            "status" => "status", 
            "tcpRxChecksum" => "tcp_rx_checksum", 
            "tcpSegment" => "tcp_segment", 
            "tcpTxChecksum" => "tcp_tx_checksum", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :large_receive
    attr_accessor :status
    attr_accessor :tcp_rx_checksum
    attr_accessor :tcp_segment
    attr_accessor :tcp_tx_checksum


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @large_receive = nil
        @status = nil
        @tcp_rx_checksum = nil
        @tcp_segment = nil
        @tcp_tx_checksum = nil

        super(class_id: "AdaptorEthOffloadProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
