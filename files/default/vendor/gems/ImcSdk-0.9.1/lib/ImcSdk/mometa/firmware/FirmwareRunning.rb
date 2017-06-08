#This module contains the general information for FirmwareRunning ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class FirmwareRunningConsts
    DEPLOYMENT_BOOT_LOADER = "boot-loader"
    DEPLOYMENT_KERNEL = "kernel"
    DEPLOYMENT_SYSTEM = "system"
    DEPLOYMENT_UNSPECIFIED = "unspecified"
    TYPE_ADAPTOR = "adaptor"
    TYPE_BLADE_BIOS = "blade-bios"
    TYPE_BLADE_CONTROLLER = "blade-controller"
    TYPE_SAS_EXPANDER = "sas-expander"
    TYPE_SIOC = "sioc"
    TYPE_STORAGE_CONTROLLER = "storage-controller"
    TYPE_STORAGE_CONTROLLER_NVME = "storage-controller-NVMe"
    TYPE_SYSTEM = "system"
    TYPE_UNSPECIFIED = "unspecified"
end


class FirmwareRunning < ManagedObject
    #This is FirmwareRunning class.

    @@consts = FirmwareRunningConsts.new()
#    @@naming_props = set([u'deployment'])

    @@mo_meta = {
        "classic" => MoMeta.new("FirmwareRunning", "firmwareRunning", "fw-[deployment]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("FirmwareRunning", "firmwareRunning", "fw-[deployment]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "deployment" => MoPropertyMeta.new("deployment", "deployment", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, ["boot-loader", "kernel", "system", "unspecified"], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["adaptor", "blade-bios", "blade-controller", "sas-expander", "sioc", "storage-controller", "storage-controller-NVMe", "system", "unspecified"], []), 
        "version" => MoPropertyMeta.new("version", "version", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "deployment" => MoPropertyMeta.new("deployment", "deployment", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, ["boot-loader", "kernel", "system", "unspecified"], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "type" => MoPropertyMeta.new("type", "type", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["adaptor", "blade-bios", "blade-controller", "sas-expander", "sioc", "storage-controller", "storage-controller-NVMe", "system", "unspecified"], []), 
            "version" => MoPropertyMeta.new("version", "version", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "deployment" => "deployment", 
        "description" => "description", 
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "type" => "type", 
        "version" => "version", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "deployment" => "deployment", 
            "description" => "description", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "type" => "type", 
            "version" => "version", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :deployment
    attr_reader :child_action
    attr_reader :description
    attr_reader :status
    attr_reader :type
    attr_reader :version


    def initialize(parent_mo_or_dn: nil,deployment: nil,  **kwargs)
        @dirty_mask = 0
        @deployment = deployment
        @child_action = nil
        @description = nil
        @status = nil
        @type = nil
        @version = nil

        super(class_id: "FirmwareRunning", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
