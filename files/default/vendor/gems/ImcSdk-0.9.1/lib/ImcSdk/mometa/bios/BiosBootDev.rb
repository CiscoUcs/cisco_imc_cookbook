#This module contains the general information for BiosBootDev ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosBootDevConsts
    ORDER_1 = "1"
    ORDER_10 = "10"
    ORDER_11 = "11"
    ORDER_12 = "12"
    ORDER_13 = "13"
    ORDER_14 = "14"
    ORDER_15 = "15"
    ORDER_2 = "2"
    ORDER_3 = "3"
    ORDER_4 = "4"
    ORDER_5 = "5"
    ORDER_6 = "6"
    ORDER_7 = "7"
    ORDER_8 = "8"
    ORDER_9 = "9"
end


class BiosBootDev < ManagedObject
    #This is BiosBootDev class.

    @@consts = BiosBootDevConsts.new()
#    @@naming_props = set([u'order'])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosBootDev", "biosBootDev", "bdv-[order]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("BiosBootDev", "biosBootDev", "bdv-[order]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 256, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "order" => MoPropertyMeta.new("order", "order", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, ["1", "10", "11", "12", "13", "14", "15", "2", "3", "4", "5", "6", "7", "8", "9"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "descr" => MoPropertyMeta.new("descr", "descr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 256, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "order" => MoPropertyMeta.new("order", "order", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, ["1", "10", "11", "12", "13", "14", "15", "2", "3", "4", "5", "6", "7", "8", "9"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "descr" => "descr", 
        "dn" => "dn", 
        "order" => "order", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "descr" => "descr", 
            "dn" => "dn", 
            "order" => "order", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :order
    attr_reader :child_action
    attr_reader :descr
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,order: nil,  **kwargs)
        @dirty_mask = 0
        @order = order
        @child_action = nil
        @descr = nil
        @status = nil

        super(class_id: "BiosBootDev", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
