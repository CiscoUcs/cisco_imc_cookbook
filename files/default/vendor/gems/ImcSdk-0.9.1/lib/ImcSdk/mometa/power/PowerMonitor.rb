#This module contains the general information for PowerMonitor ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class PowerMonitorConsts
    DOMAIN_CPU = "CPU"
    DOMAIN_MEMORY = "Memory"
    DOMAIN_PLATFORM = "Platform"
end


class PowerMonitor < ManagedObject
    #This is PowerMonitor class.

    @@consts = PowerMonitorConsts.new()
#    @@naming_props = set([u'domain'])

    @@mo_meta = {
        "classic" => MoMeta.new("PowerMonitor", "powerMonitor", "pwrmonitor-[domain]", VersionMeta::VERSION202C, "InputOutput", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("PowerMonitor", "powerMonitor", "pwrmonitor-[domain]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "average" => MoPropertyMeta.new("average", "average", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION202C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "current" => MoPropertyMeta.new("current", "current", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "domain" => MoPropertyMeta.new("domain", "domain", "string", VersionMeta::VERSION202C, MoPropertyMeta::NAMING, nil, nil, nil, nil, ["CPU", "Memory", "Platform"], []), 
        "maximum" => MoPropertyMeta.new("maximum", "maximum", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "minimum" => MoPropertyMeta.new("minimum", "minimum", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

        "modular" => {
            "average" => MoPropertyMeta.new("average", "average", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "current" => MoPropertyMeta.new("current", "current", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "domain" => MoPropertyMeta.new("domain", "domain", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, ["CPU", "Memory", "Platform"], []), 
            "maximum" => MoPropertyMeta.new("maximum", "maximum", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "minimum" => MoPropertyMeta.new("minimum", "minimum", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "period" => MoPropertyMeta.new("period", "period", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "average" => "average", 
        "childAction" => "child_action", 
        "current" => "current", 
        "dn" => "dn", 
        "domain" => "domain", 
        "maximum" => "maximum", 
        "minimum" => "minimum", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "average" => "average", 
            "childAction" => "child_action", 
            "current" => "current", 
            "dn" => "dn", 
            "domain" => "domain", 
            "maximum" => "maximum", 
            "minimum" => "minimum", 
            "rn" => "rn", 
            "status" => "status", 
            "period" => "period", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :domain
    attr_reader :average
    attr_reader :child_action
    attr_reader :current
    attr_reader :maximum
    attr_reader :minimum
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,domain: nil,  **kwargs)
        @dirty_mask = 0
        @domain = domain
        @average = nil
        @child_action = nil
        @current = nil
        @maximum = nil
        @minimum = nil
        @status = nil
        @period = nil

        super(class_id: "PowerMonitor", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
