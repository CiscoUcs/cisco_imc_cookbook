#This module contains the general information for CommSvcRack ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CommSvcRackConsts
    
end


class CommSvcRack < ManagedObject
    #This is CommSvcRack class.

    @@consts = CommSvcRackConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("CommSvcRack", "commSvcRack", "svc-ext", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil

        super(class_id: "CommSvcRack", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
