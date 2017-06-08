#This module contains the general information for BiosVfOnboardStorageSWStack ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfOnboardStorageSWStackConsts
    VP_ONBOARD_SCUSTORAGE_SWSTACK_INTEL_RSTE = "Intel RSTe"
    VP_ONBOARD_SCUSTORAGE_SWSTACK_LSI_SW_RAID = "LSI SW RAID"
    VP_ONBOARD_SCUSTORAGE_SWSTACK_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfOnboardStorageSWStack < ManagedObject
    #This is BiosVfOnboardStorageSWStack class.

    @@consts = BiosVfOnboardStorageSWStackConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfOnboardStorageSWStack", "biosVfOnboardStorageSWStack", "Onboard-SCU-Storage-SWStack", VersionMeta::VERSION151X, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfOnboardStorageSWStack", "biosVfOnboardStorageSWStack", "Onboard-SCU-Storage-SWStack", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_onboard_scu_storage_sw_stack" => MoPropertyMeta.new("vp_onboard_scu_storage_sw_stack", "vpOnboardSCUStorageSWStack", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Intel RSTe", "LSI SW RAID", "platform-default"], []), 
        },

        "modular" => {
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_onboard_scu_storage_sw_stack" => MoPropertyMeta.new("vp_onboard_scu_storage_sw_stack", "vpOnboardSCUStorageSWStack", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Intel RSTe", "LSI SW RAID", "platform-default"], []), 
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
        "vpOnboardSCUStorageSWStack" => "vp_onboard_scu_storage_sw_stack", 
        },

        "modular" => {
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpOnboardSCUStorageSWStack" => "vp_onboard_scu_storage_sw_stack", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :status
    attr_accessor :vp_onboard_scu_storage_sw_stack


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @status = nil
        @vp_onboard_scu_storage_sw_stack = nil

        super(class_id: "BiosVfOnboardStorageSWStack", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
