#This module contains the general information for BiosVfOnboardStorage ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfOnboardStorageConsts
    VP_ONBOARD_SCUSTORAGE_SUPPORT_DISABLED = "Disabled"
    VP_ONBOARD_SCUSTORAGE_SUPPORT_ENABLED = "Enabled"
    _VP_ONBOARD_SCUSTORAGE_SUPPORT_DISABLED = "disabled"
    _VP_ONBOARD_SCUSTORAGE_SUPPORT_ENABLED = "enabled"
    VP_ONBOARD_SCUSTORAGE_SUPPORT_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfOnboardStorage < ManagedObject
    #This is BiosVfOnboardStorage class.

    @@consts = BiosVfOnboardStorageConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfOnboardStorage", "biosVfOnboardStorage", "Onboard-Storage", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfOnboardStorage", "biosVfOnboardStorage", "Onboard-Storage", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
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
        "vp_onboard_scu_storage_support" => MoPropertyMeta.new("vp_onboard_scu_storage_support", "vpOnboardSCUStorageSupport", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_onboard_scu_storage_support" => MoPropertyMeta.new("vp_onboard_scu_storage_support", "vpOnboardSCUStorageSupport", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpOnboardSCUStorageSupport" => "vp_onboard_scu_storage_support", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpOnboardSCUStorageSupport" => "vp_onboard_scu_storage_support", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_onboard_scu_storage_support


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_onboard_scu_storage_support = nil

        super(class_id: "BiosVfOnboardStorage", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
