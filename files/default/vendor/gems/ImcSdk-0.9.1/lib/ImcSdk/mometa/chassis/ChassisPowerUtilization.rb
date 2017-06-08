#This module contains the general information for ChassisPowerUtilization ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class ChassisPowerUtilizationConsts
    
end


class ChassisPowerUtilization < ManagedObject
    #This is ChassisPowerUtilization class.

    @@consts = ChassisPowerUtilizationConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("ChassisPowerUtilization", "chassisPowerUtilization", "utilization", VersionMeta::VERSION2013E, "OutputOnly", 0x7, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "chassis_utilization" => MoPropertyMeta.new("chassis_utilization", "chassisUtilization", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "server1_utilization" => MoPropertyMeta.new("server1_utilization", "server1Utilization", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "server2_utilization" => MoPropertyMeta.new("server2_utilization", "server2Utilization", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "chassisUtilization" => "chassis_utilization", 
            "dn" => "dn", 
            "rn" => "rn", 
            "server1Utilization" => "server1_utilization", 
            "server2Utilization" => "server2_utilization", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :chassis_utilization
    attr_reader :server1_utilization
    attr_reader :server2_utilization


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @chassis_utilization = nil
        @server1_utilization = nil
        @server2_utilization = nil

        super(class_id: "ChassisPowerUtilization", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
