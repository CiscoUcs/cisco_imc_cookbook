#This module contains the general information for BiosProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosProfileConsts
    ADMIN_ACTION_ACTIVATE = "activate"
    ADMIN_ACTION_DELETE = "delete"
    BACKUP_ON_ACTIVATE_FALSE = "false"
    BACKUP_ON_ACTIVATE_NO = "no"
    BACKUP_ON_ACTIVATE_TRUE = "true"
    BACKUP_ON_ACTIVATE_YES = "yes"
    REBOOT_ON_ACTIVATE_FALSE = "false"
    REBOOT_ON_ACTIVATE_NO = "no"
    REBOOT_ON_ACTIVATE_TRUE = "true"
    REBOOT_ON_ACTIVATE_YES = "yes"
end


class BiosProfile < ManagedObject
    #This is BiosProfile class.

    @@consts = BiosProfileConsts.new()
#    @@naming_props = set([u'name'])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosProfile", "biosProfile", "bios-profile-[name]", VersionMeta::VERSION301C, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosProfile", "biosProfile", "bios-profile-[name]", VersionMeta::VERSION301C, "InputOutput", 0xff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["activate", "delete"], []), 
        "backup_on_activate" => MoPropertyMeta.new("backup_on_activate", "backupOnActivate", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "enabled" => MoPropertyMeta.new("enabled", "enabled", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION301C, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
        "reboot_on_activate" => MoPropertyMeta.new("reboot_on_activate", "rebootOnActivate", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["activate", "delete"], []), 
            "backup_on_activate" => MoPropertyMeta.new("backup_on_activate", "backupOnActivate", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "enabled" => MoPropertyMeta.new("enabled", "enabled", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION301C, MoPropertyMeta::NAMING, nil, 0, 510, nil, [], []), 
            "reboot_on_activate" => MoPropertyMeta.new("reboot_on_activate", "rebootOnActivate", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "backupOnActivate" => "backup_on_activate", 
        "childAction" => "child_action", 
        "description" => "description", 
        "dn" => "dn", 
        "enabled" => "enabled", 
        "id" => "id", 
        "name" => "name", 
        "rebootOnActivate" => "reboot_on_activate", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "backupOnActivate" => "backup_on_activate", 
            "childAction" => "child_action", 
            "description" => "description", 
            "dn" => "dn", 
            "enabled" => "enabled", 
            "id" => "id", 
            "name" => "name", 
            "rebootOnActivate" => "reboot_on_activate", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :name
    attr_accessor :admin_action
    attr_accessor :backup_on_activate
    attr_reader :child_action
    attr_reader :description
    attr_accessor :enabled
    attr_reader :id
    attr_accessor :reboot_on_activate
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,name: nil,  **kwargs)
        @dirty_mask = 0
        @name = name
        @admin_action = nil
        @backup_on_activate = nil
        @child_action = nil
        @description = nil
        @enabled = nil
        @id = nil
        @reboot_on_activate = nil
        @status = nil

        super(class_id: "BiosProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
