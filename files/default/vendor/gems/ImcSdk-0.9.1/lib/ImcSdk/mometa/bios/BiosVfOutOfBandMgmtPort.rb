#This module contains the general information for BiosVfOutOfBandMgmtPort ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfOutOfBandMgmtPortConsts
    VP_OUT_OF_BAND_MGMT_PORT_DISABLED = "Disabled"
    VP_OUT_OF_BAND_MGMT_PORT_ENABLED = "Enabled"
    _VP_OUT_OF_BAND_MGMT_PORT_DISABLED = "disabled"
    _VP_OUT_OF_BAND_MGMT_PORT_ENABLED = "enabled"
    VP_OUT_OF_BAND_MGMT_PORT_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfOutOfBandMgmtPort < ManagedObject
    #This is BiosVfOutOfBandMgmtPort class.

    @@consts = BiosVfOutOfBandMgmtPortConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfOutOfBandMgmtPort", "biosVfOutOfBandMgmtPort", "OoB-MgmtPort", VersionMeta::VERSION154, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfOutOfBandMgmtPort", "biosVfOutOfBandMgmtPort", "OoB-MgmtPort", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION154, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION154, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION154, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_out_of_band_mgmt_port" => MoPropertyMeta.new("vp_out_of_band_mgmt_port", "vpOutOfBandMgmtPort", "string", VersionMeta::VERSION154, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_out_of_band_mgmt_port" => MoPropertyMeta.new("vp_out_of_band_mgmt_port", "vpOutOfBandMgmtPort", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpOutOfBandMgmtPort" => "vp_out_of_band_mgmt_port", 
        },

        "modular" => {
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpOutOfBandMgmtPort" => "vp_out_of_band_mgmt_port", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :status
    attr_accessor :vp_out_of_band_mgmt_port


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @status = nil
        @vp_out_of_band_mgmt_port = nil

        super(class_id: "BiosVfOutOfBandMgmtPort", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
