#This module contains the general information for BiosVfPciRomClp ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfPciRomClpConsts
    VP_PCI_ROM_CLP_DISABLED = "Disabled"
    VP_PCI_ROM_CLP_ENABLED = "Enabled"
    _VP_PCI_ROM_CLP_DISABLED = "disabled"
    _VP_PCI_ROM_CLP_ENABLED = "enabled"
    VP_PCI_ROM_CLP_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfPciRomClp < ManagedObject
    #This is BiosVfPciRomClp class.

    @@consts = BiosVfPciRomClpConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfPciRomClp", "biosVfPciRomClp", "pci-rom-clp", VersionMeta::VERSION204C, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfPciRomClp", "biosVfPciRomClp", "pci-rom-clp", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_pci_rom_clp" => MoPropertyMeta.new("vp_pci_rom_clp", "vpPciRomClp", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_pci_rom_clp" => MoPropertyMeta.new("vp_pci_rom_clp", "vpPciRomClp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
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
        "vpPciRomClp" => "vp_pci_rom_clp", 
        },

        "modular" => {
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpPciRomClp" => "vp_pci_rom_clp", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :status
    attr_accessor :vp_pci_rom_clp


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @status = nil
        @vp_pci_rom_clp = nil

        super(class_id: "BiosVfPciRomClp", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
