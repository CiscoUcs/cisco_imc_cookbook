#This module contains the general information for EquipmentPsuColdRedundancy ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class EquipmentPsuColdRedundancyConsts
    
end


class EquipmentPsuColdRedundancy < ManagedObject
    #This is EquipmentPsuColdRedundancy class.

    @@consts = EquipmentPsuColdRedundancyConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("EquipmentPsuColdRedundancy", "equipmentPsuColdRedundancy", "psu-cold-redundancy", VersionMeta::VERSION204C, "InputOutput", 0x1f, [], ["admin"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "enabled" => MoPropertyMeta.new("enabled", "enabled", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "overall_status" => MoPropertyMeta.new("overall_status", "overallStatus", "string", VersionMeta::VERSION208D, MoPropertyMeta::READ_ONLY, nil, 0, 710, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "dn" => "dn", 
        "enabled" => "enabled", 
        "overallStatus" => "overall_status", 
        "rn" => "rn", 
        "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :enabled
    attr_reader :overall_status
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @enabled = nil
        @overall_status = nil
        @status = nil

        super(class_id: "EquipmentPsuColdRedundancy", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
