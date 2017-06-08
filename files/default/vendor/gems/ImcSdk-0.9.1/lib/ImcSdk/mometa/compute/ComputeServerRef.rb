#This module contains the general information for ComputeServerRef ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class ComputeServerRefConsts
    
end


class ComputeServerRef < ManagedObject
    #This is ComputeServerRef class.

    @@consts = ComputeServerRefConsts.new()
#    @@naming_props = set([u'ownership'])

    @@mo_meta = {
        "modular" => MoMeta.new("ComputeServerRef", "computeServerRef", "server-ref-[ownership]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "diskstate" => MoPropertyMeta.new("diskstate", "diskstate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "ownership" => MoPropertyMeta.new("ownership", "ownership", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "slot" => MoPropertyMeta.new("slot", "slot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "diskstate" => "diskstate", 
            "dn" => "dn", 
            "ownership" => "ownership", 
            "rn" => "rn", 
            "slot" => "slot", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :ownership
    attr_reader :diskstate
    attr_reader :slot
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,ownership: nil,  **kwargs)
        @dirty_mask = 0
        @ownership = ownership
        @diskstate = nil
        @slot = nil
        @status = nil

        super(class_id: "ComputeServerRef", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
