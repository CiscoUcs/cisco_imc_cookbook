#This module contains the general information for BiosVfIOHResource ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfIOHResourceConsts
    VP_IOHRESOURCE_IOH0_24K_IOH1_40K = "IOH0 24k IOH1 40k"
    VP_IOHRESOURCE_IOH0_32K_IOH1_32K = "IOH0 32k IOH1 32k"
    VP_IOHRESOURCE_IOH0_40K_IOH1_24K = "IOH0 40k IOH1 24k"
    VP_IOHRESOURCE_IOH0_48K_IOH1_16K = "IOH0 48k IOH1 16k"
    VP_IOHRESOURCE_IOH0_56K_IOH1_8K = "IOH0 56k IOH1 8k"
    VP_IOHRESOURCE_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfIOHResource < ManagedObject
    #This is BiosVfIOHResource class.

    @@consts = BiosVfIOHResourceConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfIOHResource", "biosVfIOHResource", "ioh-resource", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfIOHResource", "biosVfIOHResource", "ioh-resource", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
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
        "vp_ioh_resource" => MoPropertyMeta.new("vp_ioh_resource", "vpIOHResource", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["IOH0 24k IOH1 40k", "IOH0 32k IOH1 32k", "IOH0 40k IOH1 24k", "IOH0 48k IOH1 16k", "IOH0 56k IOH1 8k", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_ioh_resource" => MoPropertyMeta.new("vp_ioh_resource", "vpIOHResource", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["IOH0 24k IOH1 40k", "IOH0 32k IOH1 32k", "IOH0 40k IOH1 24k", "IOH0 48k IOH1 16k", "IOH0 56k IOH1 8k", "platform-default"], []), 
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
        "vpIOHResource" => "vp_ioh_resource", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpIOHResource" => "vp_ioh_resource", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_ioh_resource


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_ioh_resource = nil

        super(class_id: "BiosVfIOHResource", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
