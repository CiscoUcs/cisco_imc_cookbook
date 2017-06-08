#This module contains the general information for AdaptorFcPortProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorFcPortProfileConsts
    
end


class AdaptorFcPortProfile < ManagedObject
    #This is AdaptorFcPortProfile class.

    @@consts = AdaptorFcPortProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorFcPortProfile", "adaptorFcPortProfile", "fc-port", VersionMeta::VERSION151F, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorFcPortProfile", "adaptorFcPortProfile", "fc-port", VersionMeta::VERSION2013E, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "io_throttle_count" => MoPropertyMeta.new("io_throttle_count", "ioThrottleCount", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["1-1024"]), 
        "lun_queue_depth" => MoPropertyMeta.new("lun_queue_depth", "lunQueueDepth", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["1-254"]), 
        "luns_per_target" => MoPropertyMeta.new("luns_per_target", "lunsPerTarget", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["1-1024"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "io_throttle_count" => MoPropertyMeta.new("io_throttle_count", "ioThrottleCount", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["1-1024"]), 
            "lun_queue_depth" => MoPropertyMeta.new("lun_queue_depth", "lunQueueDepth", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, [], ["1-254"]), 
            "luns_per_target" => MoPropertyMeta.new("luns_per_target", "lunsPerTarget", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["1-1024"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "ioThrottleCount" => "io_throttle_count", 
        "lunQueueDepth" => "lun_queue_depth", 
        "lunsPerTarget" => "luns_per_target", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "ioThrottleCount" => "io_throttle_count", 
            "lunQueueDepth" => "lun_queue_depth", 
            "lunsPerTarget" => "luns_per_target", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :io_throttle_count
    attr_accessor :lun_queue_depth
    attr_accessor :luns_per_target
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @io_throttle_count = nil
        @lun_queue_depth = nil
        @luns_per_target = nil
        @status = nil

        super(class_id: "AdaptorFcPortProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
