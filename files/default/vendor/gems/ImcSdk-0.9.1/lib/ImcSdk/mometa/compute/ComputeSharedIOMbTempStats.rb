#This module contains the general information for ComputeSharedIOMbTempStats ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class ComputeSharedIOMbTempStatsConsts
    AMBIENT_TEMP_ = ""
    FRONT_TEMP_ = ""
    REAR_TEMP_ = ""
end


class ComputeSharedIOMbTempStats < ManagedObject
    #This is ComputeSharedIOMbTempStats class.

    @@consts = ComputeSharedIOMbTempStatsConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "modular" => MoMeta.new("ComputeSharedIOMbTempStats", "computeSharedIOMbTempStats", "temp-stats", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "modular" => {
            "ambient_temp" => MoPropertyMeta.new("ambient_temp", "ambientTemp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [""], ["0-4294967295"]), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "front_temp" => MoPropertyMeta.new("front_temp", "frontTemp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [""], ["0-4294967295"]), 
            "ioh1_temp" => MoPropertyMeta.new("ioh1_temp", "ioh1Temp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "ioh2_temp" => MoPropertyMeta.new("ioh2_temp", "ioh2Temp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rear_temp" => MoPropertyMeta.new("rear_temp", "rearTemp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [""], ["0-4294967295"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "time_collected" => MoPropertyMeta.new("time_collected", "timeCollected", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{([0-9]){4}-([0-9]){2}-([0-9]){2}T([0-9]){2}:([0-9]){2}:([0-9]){2}((\.([0-9]){3})){0,1}}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "modular" => {
            "ambientTemp" => "ambient_temp", 
            "childAction" => "child_action", 
            "dn" => "dn", 
            "frontTemp" => "front_temp", 
            "ioh1Temp" => "ioh1_temp", 
            "ioh2Temp" => "ioh2_temp", 
            "rearTemp" => "rear_temp", 
            "rn" => "rn", 
            "status" => "status", 
            "timeCollected" => "time_collected", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :ambient_temp
    attr_reader :child_action
    attr_reader :front_temp
    attr_reader :ioh1_temp
    attr_reader :ioh2_temp
    attr_reader :rear_temp
    attr_reader :status
    attr_reader :time_collected


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @ambient_temp = nil
        @child_action = nil
        @front_temp = nil
        @ioh1_temp = nil
        @ioh2_temp = nil
        @rear_temp = nil
        @status = nil
        @time_collected = nil

        super(class_id: "ComputeSharedIOMbTempStats", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
