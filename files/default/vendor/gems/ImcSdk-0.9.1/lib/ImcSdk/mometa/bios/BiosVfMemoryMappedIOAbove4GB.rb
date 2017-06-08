#This module contains the general information for BiosVfMemoryMappedIOAbove4GB ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfMemoryMappedIOAbove4GBConsts
    VP_MEMORY_MAPPED_IOABOVE4_GB_DISABLED = "Disabled"
    VP_MEMORY_MAPPED_IOABOVE4_GB_ENABLED = "Enabled"
    _VP_MEMORY_MAPPED_IOABOVE4_GB_DISABLED = "disabled"
    _VP_MEMORY_MAPPED_IOABOVE4_GB_ENABLED = "enabled"
    VP_MEMORY_MAPPED_IOABOVE4_GB_PLATFORM_DEFAULT = "platform-default"
end


class BiosVfMemoryMappedIOAbove4GB < ManagedObject
    #This is BiosVfMemoryMappedIOAbove4GB class.

    @@consts = BiosVfMemoryMappedIOAbove4GBConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfMemoryMappedIOAbove4GB", "biosVfMemoryMappedIOAbove4GB", "Memory-mapped-IO-above-4GB", VersionMeta::VERSION151F, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfMemoryMappedIOAbove4GB", "biosVfMemoryMappedIOAbove4GB", "Memory-mapped-IO-above-4GB", VersionMeta::VERSION2013E, "InputOutput", 0x1f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "vp_memory_mapped_io_above4_gb" => MoPropertyMeta.new("vp_memory_mapped_io_above4_gb", "vpMemoryMappedIOAbove4GB", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_memory_mapped_io_above4_gb" => MoPropertyMeta.new("vp_memory_mapped_io_above4_gb", "vpMemoryMappedIOAbove4GB", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "rn" => "rn", 
        "status" => "status", 
        "vpMemoryMappedIOAbove4GB" => "vp_memory_mapped_io_above4_gb", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpMemoryMappedIOAbove4GB" => "vp_memory_mapped_io_above4_gb", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_memory_mapped_io_above4_gb


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_memory_mapped_io_above4_gb = nil

        super(class_id: "BiosVfMemoryMappedIOAbove4GB", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
