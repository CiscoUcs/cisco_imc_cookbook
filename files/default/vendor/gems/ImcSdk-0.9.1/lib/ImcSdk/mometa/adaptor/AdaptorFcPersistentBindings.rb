#This module contains the general information for AdaptorFcPersistentBindings ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorFcPersistentBindingsConsts
    
end


class AdaptorFcPersistentBindings < ManagedObject
    #This is AdaptorFcPersistentBindings class.

    @@consts = AdaptorFcPersistentBindingsConsts.new()
#    @@naming_props = set([u'index'])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorFcPersistentBindings", "adaptorFcPersistentBindings", "perbi-[index]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("AdaptorFcPersistentBindings", "adaptorFcPersistentBindings", "perbi-[index]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "bus_id" => MoPropertyMeta.new("bus_id", "busId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "host_wwpn" => MoPropertyMeta.new("host_wwpn", "hostWwpn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 256, %q{(([A-Fa-f0-9][A-Fa-f0-9]:){7}[A-Fa-f0-9][A-Fa-f0-9])|0}, [], []), 
        "index" => MoPropertyMeta.new("index", "index", "uint", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "target_id" => MoPropertyMeta.new("target_id", "targetId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "target_wwpn" => MoPropertyMeta.new("target_wwpn", "targetWwpn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 256, %q{(([A-Fa-f0-9][A-Fa-f0-9]:){7}[A-Fa-f0-9][A-Fa-f0-9])|0}, [], []), 
        },

        "modular" => {
            "bus_id" => MoPropertyMeta.new("bus_id", "busId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "host_wwpn" => MoPropertyMeta.new("host_wwpn", "hostWwpn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 256, %q{(([A-Fa-f0-9][A-Fa-f0-9]:){7}[A-Fa-f0-9][A-Fa-f0-9])|0}, [], []), 
            "index" => MoPropertyMeta.new("index", "index", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "target_id" => MoPropertyMeta.new("target_id", "targetId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "target_wwpn" => MoPropertyMeta.new("target_wwpn", "targetWwpn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 256, %q{(([A-Fa-f0-9][A-Fa-f0-9]:){7}[A-Fa-f0-9][A-Fa-f0-9])|0}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "busId" => "bus_id", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "hostWwpn" => "host_wwpn", 
        "index" => "index", 
        "rn" => "rn", 
        "status" => "status", 
        "targetId" => "target_id", 
        "targetWwpn" => "target_wwpn", 
        },

        "modular" => {
            "busId" => "bus_id", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "hostWwpn" => "host_wwpn", 
            "index" => "index", 
            "rn" => "rn", 
            "status" => "status", 
            "targetId" => "target_id", 
            "targetWwpn" => "target_wwpn", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :index
    attr_reader :bus_id
    attr_reader :child_action
    attr_reader :host_wwpn
    attr_reader :status
    attr_reader :target_id
    attr_reader :target_wwpn


    def initialize(parent_mo_or_dn: nil,index: nil,  **kwargs)
        @dirty_mask = 0
        @index = index
        @bus_id = nil
        @child_action = nil
        @host_wwpn = nil
        @status = nil
        @target_id = nil
        @target_wwpn = nil

        super(class_id: "AdaptorFcPersistentBindings", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
