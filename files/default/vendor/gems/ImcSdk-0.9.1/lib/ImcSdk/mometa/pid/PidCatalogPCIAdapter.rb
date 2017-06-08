#This module contains the general information for PidCatalogPCIAdapter ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class PidCatalogPCIAdapterConsts
    
end


class PidCatalogPCIAdapter < ManagedObject
    #This is PidCatalogPCIAdapter class.

    @@consts = PidCatalogPCIAdapterConsts.new()
#    @@naming_props = set([u'slot'])

    @@mo_meta = {
        "classic" => MoMeta.new("PidCatalogPCIAdapter", "pidCatalogPCIAdapter", "pid-pciadapter-[slot]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("PidCatalogPCIAdapter", "pidCatalogPCIAdapter", "pid-pciadapter-[slot]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "device" => MoPropertyMeta.new("device", "device", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "pid" => MoPropertyMeta.new("pid", "pid", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "subdevice" => MoPropertyMeta.new("subdevice", "subdevice", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "subvendor" => MoPropertyMeta.new("subvendor", "subvendor", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "device" => MoPropertyMeta.new("device", "device", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "pid" => MoPropertyMeta.new("pid", "pid", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "subdevice" => MoPropertyMeta.new("subdevice", "subdevice", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "subvendor" => MoPropertyMeta.new("subvendor", "subvendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "vendor" => MoPropertyMeta.new("vendor", "vendor", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "description" => "description", 
        "device" => "device", 
        "dn" => "dn", 
        "pid" => "pid", 
        "rn" => "rn", 
        "slot" => "slot", 
        "status" => "status", 
        "subdevice" => "subdevice", 
        "subvendor" => "subvendor", 
        "vendor" => "vendor", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "description" => "description", 
            "device" => "device", 
            "dn" => "dn", 
            "pid" => "pid", 
            "rn" => "rn", 
            "slot" => "slot", 
            "status" => "status", 
            "subdevice" => "subdevice", 
            "subvendor" => "subvendor", 
            "vendor" => "vendor", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :slot
    attr_reader :child_action
    attr_reader :description
    attr_reader :device
    attr_reader :pid
    attr_reader :status
    attr_reader :subdevice
    attr_reader :subvendor
    attr_reader :vendor


    def initialize(parent_mo_or_dn: nil,slot: nil,  **kwargs)
        @dirty_mask = 0
        @slot = slot
        @child_action = nil
        @description = nil
        @device = nil
        @pid = nil
        @status = nil
        @subdevice = nil
        @subvendor = nil
        @vendor = nil

        super(class_id: "PidCatalogPCIAdapter", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
