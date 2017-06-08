#This module contains the general information for FirmwareBootDefinition ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class FirmwareBootDefinitionConsts
    TYPE_ADAPTOR = "adaptor"
    TYPE_BLADE_BIOS = "blade-bios"
    TYPE_BLADE_CONTROLLER = "blade-controller"
    TYPE_FEX = "fex"
    TYPE_SAS_EXPANDER = "sas-expander"
    TYPE_SIOC = "sioc"
    TYPE_STORAGE_CONTROLLER = "storage-controller"
    TYPE_SYSTEM = "system"
end


class FirmwareBootDefinition < ManagedObject
    #This is FirmwareBootDefinition class.

    @@consts = FirmwareBootDefinitionConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("FirmwareBootDefinition", "firmwareBootDefinition", "fw-boot-def", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("FirmwareBootDefinition", "firmwareBootDefinition", "fw-boot-def", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["adaptor", "blade-bios", "blade-controller", "fex", "sas-expander", "sioc", "storage-controller", "system"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["adaptor", "blade-bios", "blade-controller", "fex", "sas-expander", "sioc", "storage-controller", "system"], []), 
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
        "type" => "type", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "type" => "type", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :status
    attr_reader :type


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @type = nil

        super(class_id: "FirmwareBootDefinition", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
