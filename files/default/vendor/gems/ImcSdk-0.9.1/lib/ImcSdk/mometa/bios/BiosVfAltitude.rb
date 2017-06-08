#This module contains the general information for BiosVfAltitude ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfAltitudeConsts
    VP_ALTITUDE_1500_M = "1500-m"
    VP_ALTITUDE_300_M = "300-m"
    VP_ALTITUDE_3000_M = "3000-m"
    VP_ALTITUDE_900_M = "900-m"
    VP_ALTITUDE_AUTO = "auto"
    VP_ALTITUDE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfAltitude < ManagedObject
    #This is BiosVfAltitude class.

    @@consts = BiosVfAltitudeConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfAltitude", "biosVfAltitude", "Altitude-Param", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfAltitude", "biosVfAltitude", "Altitude-Param", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_altitude" => MoPropertyMeta.new("vp_altitude", "vpAltitude", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["1500-m", "300-m", "3000-m", "900-m", "auto", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_altitude" => MoPropertyMeta.new("vp_altitude", "vpAltitude", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["1500-m", "300-m", "3000-m", "900-m", "auto", "platform-default"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "vpAltitude" => "vp_altitude", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpAltitude" => "vp_altitude", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_altitude


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_altitude = nil

        super(class_id: "BiosVfAltitude", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
