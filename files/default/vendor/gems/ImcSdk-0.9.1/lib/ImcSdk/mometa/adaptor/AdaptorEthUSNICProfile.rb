#This module contains the general information for AdaptorEthUSNICProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorEthUSNICProfileConsts
    COALESCING_TYPE_IDLE = "IDLE"
    COALESCING_TYPE_MIN = "MIN"
end


class AdaptorEthUSNICProfile < ManagedObject
    #This is AdaptorEthUSNICProfile class.

    @@consts = AdaptorEthUSNICProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorEthUSNICProfile", "adaptorEthUSNICProfile", "ethusnic", VersionMeta::VERSION151X, "InputOutput", 0x3ffff, [], ["admin"], ["Get", "Remove", "Set"]),
        "modular" => MoMeta.new("AdaptorEthUSNICProfile", "adaptorEthUSNICProfile", "ethusnic", VersionMeta::VERSION2013E, "InputOutput", 0x3ffff, [], ["admin"], ["Get", "Remove", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "class_of_service" => MoPropertyMeta.new("class_of_service", "classOfService", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, %q{[0-6]}, [], []), 
        "coalescing_time" => MoPropertyMeta.new("coalescing_time", "coalescingTime", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["0-65535"]), 
        "coalescing_type" => MoPropertyMeta.new("coalescing_type", "coalescingType", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["IDLE", "MIN"], []), 
        "completion_queue_count" => MoPropertyMeta.new("completion_queue_count", "completionQueueCount", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["1-512"]), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "interrupt_count" => MoPropertyMeta.new("interrupt_count", "interruptCount", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["1-514"]), 
        "large_receive" => MoPropertyMeta.new("large_receive", "largeReceive", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "receive_queue_count" => MoPropertyMeta.new("receive_queue_count", "receiveQueueCount", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, [], ["1-256"]), 
        "receive_queue_ring_size" => MoPropertyMeta.new("receive_queue_ring_size", "receiveQueueRingSize", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, [], ["64-4096"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x400, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "tcp_rx_checksum" => MoPropertyMeta.new("tcp_rx_checksum", "tcpRxChecksum", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "tcp_segment" => MoPropertyMeta.new("tcp_segment", "tcpSegment", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "tcp_tx_checksum" => MoPropertyMeta.new("tcp_tx_checksum", "tcpTxChecksum", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x4000, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "transmit_queue_count" => MoPropertyMeta.new("transmit_queue_count", "transmitQueueCount", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x8000, nil, nil, nil, [], ["1-256"]), 
        "transmit_queue_ring_size" => MoPropertyMeta.new("transmit_queue_ring_size", "transmitQueueRingSize", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x10000, nil, nil, nil, [], ["64-4096"]), 
        "usnic_count" => MoPropertyMeta.new("usnic_count", "usnicCount", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x20000, nil, nil, nil, [], ["1-225"]), 
        },

        "modular" => {
            "class_of_service" => MoPropertyMeta.new("class_of_service", "classOfService", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, %q{[0-6]}, [], []), 
            "coalescing_time" => MoPropertyMeta.new("coalescing_time", "coalescingTime", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["0-65535"]), 
            "coalescing_type" => MoPropertyMeta.new("coalescing_type", "coalescingType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["IDLE", "MIN"], []), 
            "completion_queue_count" => MoPropertyMeta.new("completion_queue_count", "completionQueueCount", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["1-512"]), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "interrupt_count" => MoPropertyMeta.new("interrupt_count", "interruptCount", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["1-514"]), 
            "large_receive" => MoPropertyMeta.new("large_receive", "largeReceive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "receive_queue_count" => MoPropertyMeta.new("receive_queue_count", "receiveQueueCount", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, [], ["1-256"]), 
            "receive_queue_ring_size" => MoPropertyMeta.new("receive_queue_ring_size", "receiveQueueRingSize", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, [], ["64-4096"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "tcp_rx_checksum" => MoPropertyMeta.new("tcp_rx_checksum", "tcpRxChecksum", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "tcp_segment" => MoPropertyMeta.new("tcp_segment", "tcpSegment", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "tcp_tx_checksum" => MoPropertyMeta.new("tcp_tx_checksum", "tcpTxChecksum", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4000, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "transmit_queue_count" => MoPropertyMeta.new("transmit_queue_count", "transmitQueueCount", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8000, nil, nil, nil, [], ["1-256"]), 
            "transmit_queue_ring_size" => MoPropertyMeta.new("transmit_queue_ring_size", "transmitQueueRingSize", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10000, nil, nil, nil, [], ["64-4096"]), 
            "usnic_count" => MoPropertyMeta.new("usnic_count", "usnicCount", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20000, nil, nil, nil, [], ["1-225"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "classOfService" => "class_of_service", 
        "coalescingTime" => "coalescing_time", 
        "coalescingType" => "coalescing_type", 
        "completionQueueCount" => "completion_queue_count", 
        "dn" => "dn", 
        "interruptCount" => "interrupt_count", 
        "largeReceive" => "large_receive", 
        "receiveQueueCount" => "receive_queue_count", 
        "receiveQueueRingSize" => "receive_queue_ring_size", 
        "rn" => "rn", 
        "status" => "status", 
        "tcpRxChecksum" => "tcp_rx_checksum", 
        "tcpSegment" => "tcp_segment", 
        "tcpTxChecksum" => "tcp_tx_checksum", 
        "transmitQueueCount" => "transmit_queue_count", 
        "transmitQueueRingSize" => "transmit_queue_ring_size", 
        "usnicCount" => "usnic_count", 
        },

        "modular" => {
            "classOfService" => "class_of_service", 
            "coalescingTime" => "coalescing_time", 
            "coalescingType" => "coalescing_type", 
            "completionQueueCount" => "completion_queue_count", 
            "dn" => "dn", 
            "interruptCount" => "interrupt_count", 
            "largeReceive" => "large_receive", 
            "receiveQueueCount" => "receive_queue_count", 
            "receiveQueueRingSize" => "receive_queue_ring_size", 
            "rn" => "rn", 
            "status" => "status", 
            "tcpRxChecksum" => "tcp_rx_checksum", 
            "tcpSegment" => "tcp_segment", 
            "tcpTxChecksum" => "tcp_tx_checksum", 
            "transmitQueueCount" => "transmit_queue_count", 
            "transmitQueueRingSize" => "transmit_queue_ring_size", 
            "usnicCount" => "usnic_count", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :class_of_service
    attr_accessor :coalescing_time
    attr_accessor :coalescing_type
    attr_accessor :completion_queue_count
    attr_accessor :interrupt_count
    attr_accessor :large_receive
    attr_accessor :receive_queue_count
    attr_accessor :receive_queue_ring_size
    attr_accessor :status
    attr_accessor :tcp_rx_checksum
    attr_accessor :tcp_segment
    attr_accessor :tcp_tx_checksum
    attr_accessor :transmit_queue_count
    attr_accessor :transmit_queue_ring_size
    attr_accessor :usnic_count


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @class_of_service = nil
        @coalescing_time = nil
        @coalescing_type = nil
        @completion_queue_count = nil
        @interrupt_count = nil
        @large_receive = nil
        @receive_queue_count = nil
        @receive_queue_ring_size = nil
        @status = nil
        @tcp_rx_checksum = nil
        @tcp_segment = nil
        @tcp_tx_checksum = nil
        @transmit_queue_count = nil
        @transmit_queue_ring_size = nil
        @usnic_count = nil

        super(class_id: "AdaptorEthUSNICProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
