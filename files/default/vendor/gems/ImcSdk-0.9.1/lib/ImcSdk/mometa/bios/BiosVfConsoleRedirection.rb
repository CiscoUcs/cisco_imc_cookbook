#This module contains the general information for BiosVfConsoleRedirection ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class BiosVfConsoleRedirectionConsts
    VP_BAUD_RATE_115200 = "115200"
    VP_BAUD_RATE_19200 = "19200"
    VP_BAUD_RATE_38400 = "38400"
    VP_BAUD_RATE_57600 = "57600"
    VP_BAUD_RATE_9600 = "9600"
    VP_BAUD_RATE_PLATFORM_DEFAULT = "platform-default"
    VP_CONSOLE_REDIRECTION_COM_0 = "com-0"
    VP_CONSOLE_REDIRECTION_COM_1 = "com-1"
    VP_CONSOLE_REDIRECTION_DISABLED = "disabled"
    VP_CONSOLE_REDIRECTION_ENABLED = "enabled"
    VP_CONSOLE_REDIRECTION_PLATFORM_DEFAULT = "platform-default"
    VP_CONSOLE_REDIRECTION_SERIAL_PORT_A = "serial-port-a"
    VP_FLOW_CONTROL_NONE = "none"
    VP_FLOW_CONTROL_PLATFORM_DEFAULT = "platform-default"
    VP_FLOW_CONTROL_RTS_CTS = "rts-cts"
    VP_LEGACY_OSREDIRECTION_DISABLED = "Disabled"
    VP_LEGACY_OSREDIRECTION_ENABLED = "Enabled"
    _VP_LEGACY_OSREDIRECTION_DISABLED = "disabled"
    _VP_LEGACY_OSREDIRECTION_ENABLED = "enabled"
    VP_LEGACY_OSREDIRECTION_PLATFORM_DEFAULT = "platform-default"
    VP_PUTTY_KEY_PAD_ESCN = "ESCN"
    VP_PUTTY_KEY_PAD_LINUX = "LINUX"
    VP_PUTTY_KEY_PAD_SCO = "SCO"
    VP_PUTTY_KEY_PAD_VT100 = "VT100"
    VP_PUTTY_KEY_PAD_VT400 = "VT400"
    VP_PUTTY_KEY_PAD_XTERMR6 = "XTERMR6"
    VP_PUTTY_KEY_PAD_PLATFORM_DEFAULT = "platform-default"
    VP_REDIRECTION_AFTER_POST_ALWAYS_ENABLE = "Always Enable"
    VP_REDIRECTION_AFTER_POST_BOOTLOADER = "Bootloader"
    VP_REDIRECTION_AFTER_POST_PLATFORM_DEFAULT = "platform-default"
    VP_TERMINAL_TYPE_PC_ANSI = "pc-ansi"
    VP_TERMINAL_TYPE_PLATFORM_DEFAULT = "platform-default"
    VP_TERMINAL_TYPE_VT_UTF8 = "vt-utf8"
    VP_TERMINAL_TYPE_VT100 = "vt100"
    VP_TERMINAL_TYPE_VT100_PLUS = "vt100-plus"
end


class BiosVfConsoleRedirection < ManagedObject
    #This is BiosVfConsoleRedirection class.

    @@consts = BiosVfConsoleRedirectionConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("BiosVfConsoleRedirection", "biosVfConsoleRedirection", "Console-redirection", VersionMeta::VERSION151F, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("BiosVfConsoleRedirection", "biosVfConsoleRedirection", "Console-redirection", VersionMeta::VERSION2013E, "InputOutput", 0x3ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
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
        "vp_baud_rate" => MoPropertyMeta.new("vp_baud_rate", "vpBaudRate", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["115200", "19200", "38400", "57600", "9600", "platform-default"], []), 
        "vp_console_redirection" => MoPropertyMeta.new("vp_console_redirection", "vpConsoleRedirection", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["com-0", "com-1", "disabled", "enabled", "platform-default", "serial-port-a"], []), 
        "vp_flow_control" => MoPropertyMeta.new("vp_flow_control", "vpFlowControl", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["none", "platform-default", "rts-cts"], []), 
        "vp_putty_key_pad" => MoPropertyMeta.new("vp_putty_key_pad", "vpPuttyKeyPad", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["ESCN", "LINUX", "SCO", "VT100", "VT400", "XTERMR6", "platform-default"], []), 
        "vp_redirection_after_post" => MoPropertyMeta.new("vp_redirection_after_post", "vpRedirectionAfterPOST", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["Always Enable", "Bootloader", "platform-default"], []), 
        "vp_terminal_type" => MoPropertyMeta.new("vp_terminal_type", "vpTerminalType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["pc-ansi", "platform-default", "vt-utf8", "vt100", "vt100-plus"], []), 
        "vp_legacy_os_redirection" => MoPropertyMeta.new("vp_legacy_os_redirection", "vpLegacyOSRedirection", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled", "platform-default"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "vp_baud_rate" => MoPropertyMeta.new("vp_baud_rate", "vpBaudRate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["115200", "19200", "38400", "57600", "9600", "platform-default"], []), 
            "vp_console_redirection" => MoPropertyMeta.new("vp_console_redirection", "vpConsoleRedirection", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["com-0", "com-1", "disabled", "enabled", "platform-default", "serial-port-a"], []), 
            "vp_flow_control" => MoPropertyMeta.new("vp_flow_control", "vpFlowControl", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["none", "platform-default", "rts-cts"], []), 
            "vp_putty_key_pad" => MoPropertyMeta.new("vp_putty_key_pad", "vpPuttyKeyPad", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["ESCN", "LINUX", "SCO", "VT100", "VT400", "XTERMR6", "platform-default"], []), 
            "vp_redirection_after_post" => MoPropertyMeta.new("vp_redirection_after_post", "vpRedirectionAfterPOST", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, ["Always Enable", "Bootloader", "platform-default"], []), 
            "vp_terminal_type" => MoPropertyMeta.new("vp_terminal_type", "vpTerminalType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, nil, nil, nil, ["pc-ansi", "platform-default", "vt-utf8", "vt100", "vt100-plus"], []), 
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
        "vpBaudRate" => "vp_baud_rate", 
        "vpConsoleRedirection" => "vp_console_redirection", 
        "vpFlowControl" => "vp_flow_control", 
        "vpPuttyKeyPad" => "vp_putty_key_pad", 
        "vpRedirectionAfterPOST" => "vp_redirection_after_post", 
        "vpTerminalType" => "vp_terminal_type", 
        "vpLegacyOSRedirection" => "vp_legacy_os_redirection", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "rn" => "rn", 
            "status" => "status", 
            "vpBaudRate" => "vp_baud_rate", 
            "vpConsoleRedirection" => "vp_console_redirection", 
            "vpFlowControl" => "vp_flow_control", 
            "vpPuttyKeyPad" => "vp_putty_key_pad", 
            "vpRedirectionAfterPOST" => "vp_redirection_after_post", 
            "vpTerminalType" => "vp_terminal_type", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :status
    attr_accessor :vp_baud_rate
    attr_accessor :vp_console_redirection
    attr_accessor :vp_flow_control
    attr_accessor :vp_putty_key_pad
    attr_accessor :vp_redirection_after_post
    attr_accessor :vp_terminal_type
    attr_accessor :vp_legacy_os_redirection


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @status = nil
        @vp_baud_rate = nil
        @vp_console_redirection = nil
        @vp_flow_control = nil
        @vp_putty_key_pad = nil
        @vp_redirection_after_post = nil
        @vp_terminal_type = nil
        @vp_legacy_os_redirection = nil

        super(class_id: "BiosVfConsoleRedirection", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
