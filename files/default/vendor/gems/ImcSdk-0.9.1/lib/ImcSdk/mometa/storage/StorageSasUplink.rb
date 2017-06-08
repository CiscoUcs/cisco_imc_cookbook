#This module contains the general information for StorageSasUplink ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageSasUplinkConsts
    
end


class StorageSasUplink < ManagedObject
    #This is StorageSasUplink class.

    @@consts = StorageSasUplinkConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("StorageSasUplink", "storageSasUplink", "uplink", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["read-only"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "server1_uplink1_speed" => MoPropertyMeta.new("server1_uplink1_speed", "server1Uplink1Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server1_uplink2_speed" => MoPropertyMeta.new("server1_uplink2_speed", "server1Uplink2Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server1_uplink3_speed" => MoPropertyMeta.new("server1_uplink3_speed", "server1Uplink3Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server1_uplink4_speed" => MoPropertyMeta.new("server1_uplink4_speed", "server1Uplink4Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server1_uplink5_speed" => MoPropertyMeta.new("server1_uplink5_speed", "server1Uplink5Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server1_uplink6_speed" => MoPropertyMeta.new("server1_uplink6_speed", "server1Uplink6Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server2_uplink1_speed" => MoPropertyMeta.new("server2_uplink1_speed", "server2Uplink1Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server2_uplink2_speed" => MoPropertyMeta.new("server2_uplink2_speed", "server2Uplink2Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server2_uplink3_speed" => MoPropertyMeta.new("server2_uplink3_speed", "server2Uplink3Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server2_uplink4_speed" => MoPropertyMeta.new("server2_uplink4_speed", "server2Uplink4Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server2_uplink5_speed" => MoPropertyMeta.new("server2_uplink5_speed", "server2Uplink5Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server2_uplink6_speed" => MoPropertyMeta.new("server2_uplink6_speed", "server2Uplink6Speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "server1Uplink1Speed" => "server1_uplink1_speed", 
            "server1Uplink2Speed" => "server1_uplink2_speed", 
            "server1Uplink3Speed" => "server1_uplink3_speed", 
            "server1Uplink4Speed" => "server1_uplink4_speed", 
            "server1Uplink5Speed" => "server1_uplink5_speed", 
            "server1Uplink6Speed" => "server1_uplink6_speed", 
            "server2Uplink1Speed" => "server2_uplink1_speed", 
            "server2Uplink2Speed" => "server2_uplink2_speed", 
            "server2Uplink3Speed" => "server2_uplink3_speed", 
            "server2Uplink4Speed" => "server2_uplink4_speed", 
            "server2Uplink5Speed" => "server2_uplink5_speed", 
            "server2Uplink6Speed" => "server2_uplink6_speed", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :server1_uplink1_speed
    attr_reader :server1_uplink2_speed
    attr_reader :server1_uplink3_speed
    attr_reader :server1_uplink4_speed
    attr_reader :server1_uplink5_speed
    attr_reader :server1_uplink6_speed
    attr_reader :server2_uplink1_speed
    attr_reader :server2_uplink2_speed
    attr_reader :server2_uplink3_speed
    attr_reader :server2_uplink4_speed
    attr_reader :server2_uplink5_speed
    attr_reader :server2_uplink6_speed
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @server1_uplink1_speed = nil
        @server1_uplink2_speed = nil
        @server1_uplink3_speed = nil
        @server1_uplink4_speed = nil
        @server1_uplink5_speed = nil
        @server1_uplink6_speed = nil
        @server2_uplink1_speed = nil
        @server2_uplink2_speed = nil
        @server2_uplink3_speed = nil
        @server2_uplink4_speed = nil
        @server2_uplink5_speed = nil
        @server2_uplink6_speed = nil
        @status = nil

        super(class_id: "StorageSasUplink", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
