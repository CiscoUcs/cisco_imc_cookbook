#This module contains the general information for ThermalPowerProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class ThermalPowerProfileConsts
    
end


class ThermalPowerProfile < ManagedObject
    #This is ThermalPowerProfile class.

    @@consts = ThermalPowerProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("ThermalPowerProfile", "thermalPowerProfile", "thermal-prof", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "power_limit" => MoPropertyMeta.new("power_limit", "powerLimit", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "profile_enabled" => MoPropertyMeta.new("profile_enabled", "profileEnabled", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "profile_type" => MoPropertyMeta.new("profile_type", "profileType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "temperature" => MoPropertyMeta.new("temperature", "temperature", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 510, nil, [], ["0-4294967295"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "powerLimit" => "power_limit", 
            "profileEnabled" => "profile_enabled", 
            "profileType" => "profile_type", 
            "rn" => "rn", 
            "status" => "status", 
            "temperature" => "temperature", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :power_limit
    attr_accessor :profile_enabled
    attr_reader :profile_type
    attr_accessor :status
    attr_accessor :temperature


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @power_limit = nil
        @profile_enabled = nil
        @profile_type = nil
        @status = nil
        @temperature = nil

        super(class_id: "ThermalPowerProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
