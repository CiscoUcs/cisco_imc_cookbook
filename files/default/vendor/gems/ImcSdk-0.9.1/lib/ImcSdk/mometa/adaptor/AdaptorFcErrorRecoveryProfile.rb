#This module contains the general information for AdaptorFcErrorRecoveryProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorFcErrorRecoveryProfileConsts
    
end


class AdaptorFcErrorRecoveryProfile < ManagedObject
    #This is AdaptorFcErrorRecoveryProfile class.

    @@consts = AdaptorFcErrorRecoveryProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorFcErrorRecoveryProfile", "adaptorFcErrorRecoveryProfile", "fc-err-rec", VersionMeta::VERSION151F, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AdaptorFcErrorRecoveryProfile", "adaptorFcErrorRecoveryProfile", "fc-err-rec", VersionMeta::VERSION2013E, "InputOutput", 0x7ff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
        "error_detect_timeout" => MoPropertyMeta.new("error_detect_timeout", "errorDetectTimeout", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["1000-100000"]), 
        "fcp_error_recovery" => MoPropertyMeta.new("fcp_error_recovery", "fcpErrorRecovery", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "io_timeout_retry" => MoPropertyMeta.new("io_timeout_retry", "ioTimeoutRetry", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["1-59"]), 
        "link_down_timeout" => MoPropertyMeta.new("link_down_timeout", "linkDownTimeout", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["0-240000"]), 
        "port_down_io_retry_count" => MoPropertyMeta.new("port_down_io_retry_count", "portDownIoRetryCount", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["0-255"]), 
        "port_down_timeout" => MoPropertyMeta.new("port_down_timeout", "portDownTimeout", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], ["0-240000"]), 
        "resource_allocation_timeout" => MoPropertyMeta.new("resource_allocation_timeout", "resourceAllocationTimeout", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, [], ["5000-100000"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, 0, 255, nil, [], []), 
            "error_detect_timeout" => MoPropertyMeta.new("error_detect_timeout", "errorDetectTimeout", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, [], ["1000-100000"]), 
            "fcp_error_recovery" => MoPropertyMeta.new("fcp_error_recovery", "fcpErrorRecovery", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "io_timeout_retry" => MoPropertyMeta.new("io_timeout_retry", "ioTimeoutRetry", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["1-59"]), 
            "link_down_timeout" => MoPropertyMeta.new("link_down_timeout", "linkDownTimeout", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["0-240000"]), 
            "port_down_io_retry_count" => MoPropertyMeta.new("port_down_io_retry_count", "portDownIoRetryCount", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, [], ["0-255"]), 
            "port_down_timeout" => MoPropertyMeta.new("port_down_timeout", "portDownTimeout", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, [], ["0-240000"]), 
            "resource_allocation_timeout" => MoPropertyMeta.new("resource_allocation_timeout", "resourceAllocationTimeout", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, [], ["5000-100000"]), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "errorDetectTimeout" => "error_detect_timeout", 
        "fcpErrorRecovery" => "fcp_error_recovery", 
        "ioTimeoutRetry" => "io_timeout_retry", 
        "linkDownTimeout" => "link_down_timeout", 
        "portDownIoRetryCount" => "port_down_io_retry_count", 
        "portDownTimeout" => "port_down_timeout", 
        "resourceAllocationTimeout" => "resource_allocation_timeout", 
        "rn" => "rn", 
        "status" => "status", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "errorDetectTimeout" => "error_detect_timeout", 
            "fcpErrorRecovery" => "fcp_error_recovery", 
            "ioTimeoutRetry" => "io_timeout_retry", 
            "linkDownTimeout" => "link_down_timeout", 
            "portDownIoRetryCount" => "port_down_io_retry_count", 
            "portDownTimeout" => "port_down_timeout", 
            "resourceAllocationTimeout" => "resource_allocation_timeout", 
            "rn" => "rn", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :error_detect_timeout
    attr_accessor :fcp_error_recovery
    attr_accessor :io_timeout_retry
    attr_accessor :link_down_timeout
    attr_accessor :port_down_io_retry_count
    attr_accessor :port_down_timeout
    attr_accessor :resource_allocation_timeout
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @error_detect_timeout = nil
        @fcp_error_recovery = nil
        @io_timeout_retry = nil
        @link_down_timeout = nil
        @port_down_io_retry_count = nil
        @port_down_timeout = nil
        @resource_allocation_timeout = nil
        @status = nil

        super(class_id: "AdaptorFcErrorRecoveryProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
