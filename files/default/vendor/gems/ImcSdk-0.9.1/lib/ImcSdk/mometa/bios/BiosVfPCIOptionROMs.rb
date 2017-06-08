#This module contains the general information for BiosVfPCIOptionROMs ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfPCIOptionROMsConsts
    VP_PCIOPTION_ROMS_DISABLED = "Disabled"
    VP_PCIOPTION_ROMS_ENABLED = "Enabled"
    VP_PCIOPTION_ROMS_LEGACY_ONLY = "Legacy Only"
    VP_PCIOPTION_ROMS_UEFI_ONLY = "UEFI Only"
    _VP_PCIOPTION_ROMS_DISABLED = "disabled"
    _VP_PCIOPTION_ROMS_ENABLED = "enabled"
    VP_PCIOPTION_ROMS_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfPCIOptionROMs < ManagedObject
    #This is BiosVfPCIOptionROMs class.

    @@consts = BiosVfPCIOptionROMsConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfPCIOptionROMs", "biosVfPCIOptionROMs", "PCI-OptionROMs", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfPCIOptionROMs", "biosVfPCIOptionROMs", "PCI-OptionROMs", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
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
        "vp_pci_option_ro_ms" => MoPropertyMeta.new("vp_pci_option_ro_ms", "vpPCIOptionROMs", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "Legacy Only", "UEFI Only", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_pci_option_ro_ms" => MoPropertyMeta.new("vp_pci_option_ro_ms", "vpPCIOptionROMs", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "Legacy Only", "UEFI Only", "disabled", "enabled", "platform-default"], []), 
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
        "vpPCIOptionROMs" => "vp_pci_option_ro_ms", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpPCIOptionROMs" => "vp_pci_option_ro_ms", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_pci_option_ro_ms


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_pci_option_ro_ms = nil

        super(class_id: "BiosVfPCIOptionROMs", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
