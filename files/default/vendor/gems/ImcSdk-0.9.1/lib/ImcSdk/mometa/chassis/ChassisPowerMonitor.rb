#This module contains the general information for ChassisPowerMonitor ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class ChassisPowerMonitorConsts
    
end


class ChassisPowerMonitor < ManagedObject
    #This is ChassisPowerMonitor class.

    @@consts = ChassisPowerMonitorConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("ChassisPowerMonitor", "chassisPowerMonitor", "pwrmonitor", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "average" => MoPropertyMeta.new("average", "average", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "current" => MoPropertyMeta.new("current", "current", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "maximum" => MoPropertyMeta.new("maximum", "maximum", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "minimum" => MoPropertyMeta.new("minimum", "minimum", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "period" => MoPropertyMeta.new("period", "period", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "average" => "average", 
            "childAction" => "child_action", 
            "current" => "current", 
            "dn" => "dn", 
            "maximum" => "maximum", 
            "minimum" => "minimum", 
            "period" => "period", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :average
    attr_reader :child_action
    attr_reader :current
    attr_reader :maximum
    attr_reader :minimum
    attr_reader :period
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @average = nil
        @child_action = nil
        @current = nil
        @maximum = nil
        @minimum = nil
        @period = nil
        @status = nil

        super(class_id: "ChassisPowerMonitor", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
