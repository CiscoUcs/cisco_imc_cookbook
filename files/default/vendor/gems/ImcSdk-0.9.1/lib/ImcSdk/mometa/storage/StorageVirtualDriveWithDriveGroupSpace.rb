#This module contains the general information for StorageVirtualDriveWithDriveGroupSpace ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageVirtualDriveWithDriveGroupSpaceConsts
    
end


class StorageVirtualDriveWithDriveGroupSpace < ManagedObject
    #This is StorageVirtualDriveWithDriveGroupSpace class.

    @@consts = StorageVirtualDriveWithDriveGroupSpaceConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageVirtualDriveWithDriveGroupSpace", "storageVirtualDriveWithDriveGroupSpace", "vd-[id]", VersionMeta::VERSION201A, "InputOutput", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("StorageVirtualDriveWithDriveGroupSpace", "storageVirtualDriveWithDriveGroupSpace", "vd-[id]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION201A, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "max_available_space" => MoPropertyMeta.new("max_available_space", "maxAvailableSpace", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "raid_level" => MoPropertyMeta.new("raid_level", "raidLevel", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "used_physical_drive_ids" => MoPropertyMeta.new("used_physical_drive_ids", "usedPhysicalDriveIds", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "vd_status" => MoPropertyMeta.new("vd_status", "vdStatus", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "max_available_space" => MoPropertyMeta.new("max_available_space", "maxAvailableSpace", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "raid_level" => MoPropertyMeta.new("raid_level", "raidLevel", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "used_physical_drive_ids" => MoPropertyMeta.new("used_physical_drive_ids", "usedPhysicalDriveIds", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "vd_status" => MoPropertyMeta.new("vd_status", "vdStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "health" => "health", 
        "id" => "id", 
        "maxAvailableSpace" => "max_available_space", 
        "name" => "name", 
        "raidLevel" => "raid_level", 
        "rn" => "rn", 
        "status" => "status", 
        "usedPhysicalDriveIds" => "used_physical_drive_ids", 
        "vdStatus" => "vd_status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "health" => "health", 
            "id" => "id", 
            "maxAvailableSpace" => "max_available_space", 
            "name" => "name", 
            "raidLevel" => "raid_level", 
            "rn" => "rn", 
            "status" => "status", 
            "usedPhysicalDriveIds" => "used_physical_drive_ids", 
            "vdStatus" => "vd_status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_reader :child_action
    attr_reader :health
    attr_reader :max_available_space
    attr_reader :name
    attr_reader :raid_level
    attr_reader :status
    attr_reader :used_physical_drive_ids
    attr_reader :vd_status


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @child_action = nil
        @health = nil
        @max_available_space = nil
        @name = nil
        @raid_level = nil
        @status = nil
        @used_physical_drive_ids = nil
        @vd_status = nil

        super(class_id: "StorageVirtualDriveWithDriveGroupSpace", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
