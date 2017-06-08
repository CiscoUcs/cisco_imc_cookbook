#This module contains the general information for BiosVfPackageCStateLimit ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfPackageCStateLimitConsts
    VP_PACKAGE_CSTATE_LIMIT_C0_C1 = "C0/C1"
    VP_PACKAGE_CSTATE_LIMIT_C2 = "C2"
    VP_PACKAGE_CSTATE_LIMIT_C6_RETENTION = "C6 Retention"
    VP_PACKAGE_CSTATE_LIMIT_C6_NON_RETENTION = "C6 non Retention"
    VP_PACKAGE_CSTATE_LIMIT_C0_STATE = "c0-state"
    VP_PACKAGE_CSTATE_LIMIT_C1_STATE = "c1-state"
    VP_PACKAGE_CSTATE_LIMIT_C3_STATE = "c3-state"
    VP_PACKAGE_CSTATE_LIMIT_C6_STATE = "c6-state"
    VP_PACKAGE_CSTATE_LIMIT_NO_LIMIT = "no-limit"
    VP_PACKAGE_CSTATE_LIMIT_PLATFORM_DEFAULT = "platform-default"
    __VP_PACKAGE_CSTATE_LIMIT_C6_NON_RETENTION = "c6-non-retention"
    __VP_PACKAGE_CSTATE_LIMIT_C6_RETENTION = "c6-retention"
end


class BiosVfPackageCStateLimit < ManagedObject
    #This is BiosVfPackageCStateLimit class.

    @@consts = BiosVfPackageCStateLimitConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfPackageCStateLimit", "biosVfPackageCStateLimit", "Package-CState-Limit", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfPackageCStateLimit", "biosVfPackageCStateLimit", "Package-CState-Limit", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
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
        "vp_package_c_state_limit" => MoPropertyMeta.new("vp_package_c_state_limit", "vpPackageCStateLimit", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["C0/C1", "C2", "C6 Retention", "C6 non Retention", "c0-state", "c1-state", "c3-state", "c6-state", "no-limit", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_package_c_state_limit" => MoPropertyMeta.new("vp_package_c_state_limit", "vpPackageCStateLimit", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["c0-state", "c0/c1", "c1-state", "c2", "c3-state", "c6-non-retention", "c6-retention", "c6-state", "no-limit", "platform-default"], []), 
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
        "vpPackageCStateLimit" => "vp_package_c_state_limit", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpPackageCStateLimit" => "vp_package_c_state_limit", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_package_c_state_limit


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_package_c_state_limit = nil

        super(class_id: "BiosVfPackageCStateLimit", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
