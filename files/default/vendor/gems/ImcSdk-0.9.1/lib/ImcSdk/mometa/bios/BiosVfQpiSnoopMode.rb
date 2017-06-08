#This module contains the general information for BiosVfQpiSnoopMode ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfQpiSnoopModeConsts
    VP_QPI_SNOOP_MODE_AUTO = "auto"
    VP_QPI_SNOOP_MODE_CLUSTER_ON_DIE = "cluster-on-die"
    VP_QPI_SNOOP_MODE_EARLY_SNOOP = "early-snoop"
    VP_QPI_SNOOP_MODE_HOME_DIRECTORY_SNOOP = "home-directory-snoop"
    VP_QPI_SNOOP_MODE_HOME_DIRECTORY_SNOOP_WITH_OSB = "home-directory-snoop-with-osb"
    VP_QPI_SNOOP_MODE_HOME_SNOOP = "home-snoop"
    VP_QPI_SNOOP_MODE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfQpiSnoopMode < ManagedObject
    #This is BiosVfQpiSnoopMode class.

    @@consts = BiosVfQpiSnoopModeConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfQpiSnoopMode", "biosVfQpiSnoopMode", "QPI-Snoop-Mode", VersionMeta::VERSION204C, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfQpiSnoopMode", "biosVfQpiSnoopMode", "QPI-Snoop-Mode", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_qpi_snoop_mode" => MoPropertyMeta.new("vp_qpi_snoop_mode", "vpQpiSnoopMode", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["auto", "cluster-on-die", "early-snoop", "home-directory-snoop", "home-directory-snoop-with-osb", "home-snoop", "platform-default"], []), 
        },

        "modular" => {
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_qpi_snoop_mode" => MoPropertyMeta.new("vp_qpi_snoop_mode", "vpQpiSnoopMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["auto", "cluster-on-die", "early-snoop", "home-directory-snoop", "home-directory-snoop-with-osb", "home-snoop", "platform-default"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "vpQpiSnoopMode" => "vp_qpi_snoop_mode", 
        },

        "modular" => {
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpQpiSnoopMode" => "vp_qpi_snoop_mode", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :status
    attr_accessor :vp_qpi_snoop_mode


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @status = nil
        @vp_qpi_snoop_mode = nil

        super(class_id: "BiosVfQpiSnoopMode", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
