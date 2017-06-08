#This module contains the general information for PidCatalogHdd ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class PidCatalogHddConsts
    
end


class PidCatalogHdd < ManagedObject
    #This is PidCatalogHdd class.

    @@consts = PidCatalogHddConsts.new()
#    @@naming_props = set([u'disk'])

    @@mo_meta = {
        "classic" => MoMeta.new("PidCatalogHdd", "pidCatalogHdd", "pid-hdd-[disk]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("PidCatalogHdd", "pidCatalogHdd", "pid-hdd-[disk]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "controller" => MoPropertyMeta.new("controller", "controller", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "disk" => MoPropertyMeta.new("disk", "disk", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pid" => MoPropertyMeta.new("pid", "pid", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "serialnumber" => MoPropertyMeta.new("serialnumber", "serialnumber", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "controller" => MoPropertyMeta.new("controller", "controller", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "disk" => MoPropertyMeta.new("disk", "disk", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pid" => MoPropertyMeta.new("pid", "pid", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "serialnumber" => MoPropertyMeta.new("serialnumber", "serialnumber", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "controller" => "controller", 
        "description" => "description", 
        "disk" => "disk", 
        "dn" => "dn", 
        "model" => "model", 
        "pid" => "pid", 
        "rn" => "rn", 
        "serialnumber" => "serialnumber", 
        "status" => "status", 
        "vendor" => "vendor", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "controller" => "controller", 
            "description" => "description", 
            "disk" => "disk", 
            "dn" => "dn", 
            "model" => "model", 
            "pid" => "pid", 
            "rn" => "rn", 
            "serialnumber" => "serialnumber", 
            "status" => "status", 
            "vendor" => "vendor", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :disk
    attr_reader :child_action
    attr_reader :controller
    attr_reader :description
    attr_reader :model
    attr_reader :pid
    attr_reader :serialnumber
    attr_reader :status
    attr_reader :vendor


    def initialize(parent_mo_or_dn: nil,disk: nil,  **kwargs)
        @dirty_mask = 0
        @disk = disk
        @child_action = nil
        @controller = nil
        @description = nil
        @model = nil
        @pid = nil
        @serialnumber = nil
        @status = nil
        @vendor = nil

        super(class_id: "PidCatalogHdd", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
