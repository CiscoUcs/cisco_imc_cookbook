#This module contains the general information for EquipmentChassis ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class EquipmentChassisConsts
    
end


class EquipmentChassis < ManagedObject
    #This is EquipmentChassis class.

    @@consts = EquipmentChassisConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("EquipmentChassis", "equipmentChassis", "chassis-1", VersionMeta::VERSION2013E, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "asset_tag" => MoPropertyMeta.new("asset_tag", "assetTag", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 32, %q{[^!|&]{0,32}}, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "model" => MoPropertyMeta.new("model", "model", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "usr_lbl" => MoPropertyMeta.new("usr_lbl", "usrLbl", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, 0, 64, %q{[ !#$%&\(\)\*\+,\-\./:;\?@\[\]_\{\|\}~a-zA-Z0-9]{0,64}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "assetTag" => "asset_tag", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "model" => "model", 
            "name" => "name", 
            "rn" => "rn", 
            "serial" => "serial", 
            "status" => "status", 
            "usrLbl" => "usr_lbl", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :asset_tag
    attr_reader :child_action
    attr_reader :model
    attr_reader :name
    attr_reader :serial
    attr_accessor :status
    attr_accessor :usr_lbl


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @asset_tag = nil
        @child_action = nil
        @model = nil
        @name = nil
        @serial = nil
        @status = nil
        @usr_lbl = nil

        super(class_id: "EquipmentChassis", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
