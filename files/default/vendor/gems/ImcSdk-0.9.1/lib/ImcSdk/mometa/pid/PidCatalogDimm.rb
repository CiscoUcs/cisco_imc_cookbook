#This module contains the general information for PidCatalogDimm ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class PidCatalogDimmConsts
    
end


class PidCatalogDimm < ManagedObject
    #This is PidCatalogDimm class.

    @@consts = PidCatalogDimmConsts.new()
#    @@naming_props = set([u'name'])

    @@mo_meta = {
        "classic" => MoMeta.new("PidCatalogDimm", "pidCatalogDimm", "pid-dimm-[name]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("PidCatalogDimm", "pidCatalogDimm", "pid-dimm-[name]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "capacity" => MoPropertyMeta.new("capacity", "capacity", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "datawidth" => MoPropertyMeta.new("datawidth", "datawidth", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "manufacturer" => MoPropertyMeta.new("manufacturer", "manufacturer", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "mfgid" => MoPropertyMeta.new("mfgid", "mfgid", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "operability" => MoPropertyMeta.new("operability", "operability", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pid" => MoPropertyMeta.new("pid", "pid", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "serialnumber" => MoPropertyMeta.new("serialnumber", "serialnumber", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "speed" => MoPropertyMeta.new("speed", "speed", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

        "modular" => {
            "capacity" => MoPropertyMeta.new("capacity", "capacity", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "datawidth" => MoPropertyMeta.new("datawidth", "datawidth", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "manufacturer" => MoPropertyMeta.new("manufacturer", "manufacturer", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "mfgid" => MoPropertyMeta.new("mfgid", "mfgid", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "operability" => MoPropertyMeta.new("operability", "operability", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pid" => MoPropertyMeta.new("pid", "pid", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "serialnumber" => MoPropertyMeta.new("serialnumber", "serialnumber", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "speed" => MoPropertyMeta.new("speed", "speed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "capacity" => "capacity", 
        "childAction" => "child_action", 
        "datawidth" => "datawidth", 
        "description" => "description", 
        "dn" => "dn", 
        "manufacturer" => "manufacturer", 
        "mfgid" => "mfgid", 
        "model" => "model", 
        "name" => "name", 
        "operability" => "operability", 
        "pid" => "pid", 
        "rn" => "rn", 
        "serialnumber" => "serialnumber", 
        "speed" => "speed", 
        "status" => "status", 
        },

        "modular" => {
            "capacity" => "capacity", 
            "childAction" => "child_action", 
            "datawidth" => "datawidth", 
            "description" => "description", 
            "dn" => "dn", 
            "manufacturer" => "manufacturer", 
            "mfgid" => "mfgid", 
            "model" => "model", 
            "name" => "name", 
            "operability" => "operability", 
            "pid" => "pid", 
            "rn" => "rn", 
            "serialnumber" => "serialnumber", 
            "speed" => "speed", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :name
    attr_reader :capacity
    attr_reader :child_action
    attr_reader :datawidth
    attr_reader :description
    attr_reader :manufacturer
    attr_reader :mfgid
    attr_reader :model
    attr_reader :operability
    attr_reader :pid
    attr_reader :serialnumber
    attr_reader :speed
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,name: nil,  **kwargs)
        @dirty_mask = 0
        @name = name
        @capacity = nil
        @child_action = nil
        @datawidth = nil
        @description = nil
        @manufacturer = nil
        @mfgid = nil
        @model = nil
        @operability = nil
        @pid = nil
        @serialnumber = nil
        @speed = nil
        @status = nil

        super(class_id: "PidCatalogDimm", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
