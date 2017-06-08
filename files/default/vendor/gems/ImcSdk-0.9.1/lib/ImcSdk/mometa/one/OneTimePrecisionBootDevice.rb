#This module contains the general information for OneTimePrecisionBootDevice ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class OneTimePrecisionBootDeviceConsts
    ADMIN_ACTION_CLEAR_ONE_TIME_BOOT_DEVICE = "clear-one-time-boot-device"
    REBOOT_ON_UPDATE_FALSE = "false"
    REBOOT_ON_UPDATE_NO = "no"
    REBOOT_ON_UPDATE_TRUE = "true"
    REBOOT_ON_UPDATE_YES = "yes"
end


class OneTimePrecisionBootDevice < ManagedObject
    #This is OneTimePrecisionBootDevice class.

    @@consts = OneTimePrecisionBootDeviceConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("OneTimePrecisionBootDevice", "oneTimePrecisionBootDevice", "one-time-precision-boot", VersionMeta::VERSION301C, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("OneTimePrecisionBootDevice", "oneTimePrecisionBootDevice", "one-time-precision-boot", VersionMeta::VERSION301C, "InputOutput", 0x7f, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear-one-time-boot-device"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "device" => MoPropertyMeta.new("device", "device", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 510, %q{(([a-zA-Z0-9]{1})|([a-zA-Z0-9]{1}[a-zA-Z0-9_\-]{0,28}[a-zA-Z0-9]{1})|([a-zA-Z0-9]{2}))}, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,16}}, [], []), 
        "reboot_on_update" => MoPropertyMeta.new("reboot_on_update", "rebootOnUpdate", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["clear-one-time-boot-device"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION301C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "device" => MoPropertyMeta.new("device", "device", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x4, 0, 510, %q{(([a-zA-Z0-9]{1})|([a-zA-Z0-9]{1}[a-zA-Z0-9_\-]{0,28}[a-zA-Z0-9]{1})|([a-zA-Z0-9]{2}))}, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
            "name" => MoPropertyMeta.new("name", "name", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_ONLY, nil, nil, nil, %q{[\-\.:_a-zA-Z0-9]{0,16}}, [], []), 
            "reboot_on_update" => MoPropertyMeta.new("reboot_on_update", "rebootOnUpdate", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "childAction" => "child_action", 
        "device" => "device", 
        "dn" => "dn", 
        "name" => "name", 
        "rebootOnUpdate" => "reboot_on_update", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "adminAction" => "admin_action", 
            "childAction" => "child_action", 
            "device" => "device", 
            "dn" => "dn", 
            "name" => "name", 
            "rebootOnUpdate" => "reboot_on_update", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_action
    attr_reader :child_action
    attr_accessor :device
    attr_reader :name
    attr_accessor :reboot_on_update
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_action = nil
        @child_action = nil
        @device = nil
        @name = nil
        @reboot_on_update = nil
        @status = nil

        super(class_id: "OneTimePrecisionBootDevice", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
