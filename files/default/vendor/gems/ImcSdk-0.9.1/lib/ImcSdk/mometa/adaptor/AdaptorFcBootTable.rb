#This module contains the general information for AdaptorFcBootTable ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorFcBootTableConsts
    
end


class AdaptorFcBootTable < ManagedObject
    #This is AdaptorFcBootTable class.

    @@consts = AdaptorFcBootTableConsts.new()
#    @@naming_props = set([u'index'])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorFcBootTable", "adaptorFcBootTable", "fcboot-[index]", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Add", "Get", "Set"]),
        "modular" => MoMeta.new("AdaptorFcBootTable", "adaptorFcBootTable", "fcboot-[index]", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Add", "Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "boot_lun" => MoPropertyMeta.new("boot_lun", "bootLun", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, [], ["0-255"]), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "index" => MoPropertyMeta.new("index", "index", "uint", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, 0x8, nil, nil, nil, [], ["0-3"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "target_wwpn" => MoPropertyMeta.new("target_wwpn", "targetWwpn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, 0, 256, %q{(([A-Fa-f0-9][A-Fa-f0-9]:){7}[A-Fa-f0-9][A-Fa-f0-9])|0}, [], []), 
        },

        "modular" => {
            "boot_lun" => MoPropertyMeta.new("boot_lun", "bootLun", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, [], ["0-255"]), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "index" => MoPropertyMeta.new("index", "index", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, 0x8, nil, nil, nil, [], ["0-3"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "target_wwpn" => MoPropertyMeta.new("target_wwpn", "targetWwpn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 256, %q{(([A-Fa-f0-9][A-Fa-f0-9]:){7}[A-Fa-f0-9][A-Fa-f0-9])|0}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "bootLun" => "boot_lun", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "index" => "index", 
        "rn" => "rn", 
        "status" => "status", 
        "targetWwpn" => "target_wwpn", 
        },

        "modular" => {
            "bootLun" => "boot_lun", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "index" => "index", 
            "rn" => "rn", 
            "status" => "status", 
            "targetWwpn" => "target_wwpn", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :index
    attr_accessor :boot_lun
    attr_reader :child_action
    attr_accessor :status
    attr_accessor :target_wwpn


    def initialize(parent_mo_or_dn: nil,index: nil,  **kwargs)
        @dirty_mask = 0
        @index = index
        @boot_lun = nil
        @child_action = nil
        @status = nil
        @target_wwpn = nil

        super(class_id: "AdaptorFcBootTable", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
