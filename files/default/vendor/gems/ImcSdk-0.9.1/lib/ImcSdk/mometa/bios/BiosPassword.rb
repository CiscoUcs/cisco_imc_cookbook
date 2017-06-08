#This module contains the general information for BiosPassword ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosPasswordConsts
    
end


class BiosPassword < ManagedObject
    #This is BiosPassword class.

    @@consts = BiosPasswordConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosPassword", "biosPassword", "bios-pw", VersionMeta::VERSION302B, "InputOutput", 0x1f, [], ["admin"], [nil]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, %q{[\S+]{0,20}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "dn" => "dn", 
        "password" => "password", 
        "rn" => "rn", 
        "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :password
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @password = nil
        @status = nil

        super(class_id: "BiosPassword", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
