#This module contains the general information for StorageControllerSettings ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageControllerSettingsConsts
    
end


class StorageControllerSettings < ManagedObject
    #This is StorageControllerSettings class.

    @@consts = StorageControllerSettingsConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageControllerSettings", "storageControllerSettings", "controller-settings", VersionMeta::VERSION201A, "InputOutput", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("StorageControllerSettings", "storageControllerSettings", "controller-settings", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "auto_enhanced_import" => MoPropertyMeta.new("auto_enhanced_import", "autoEnhancedImport", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "battery_warning" => MoPropertyMeta.new("battery_warning", "batteryWarning", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "cache_flush_interval" => MoPropertyMeta.new("cache_flush_interval", "cacheFlushInterval", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION201A, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "cluster_enable" => MoPropertyMeta.new("cluster_enable", "clusterEnable", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "consistency_check_rate" => MoPropertyMeta.new("consistency_check_rate", "consistencyCheckRate", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "ecc_bucket_leak_rate" => MoPropertyMeta.new("ecc_bucket_leak_rate", "eccBucketLeakRate", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "enable_copyback_on_smart" => MoPropertyMeta.new("enable_copyback_on_smart", "enableCopybackOnSmart", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "enable_copyback_to_ssd_on_smart_error" => MoPropertyMeta.new("enable_copyback_to_ssd_on_smart_error", "enableCopybackToSsdOnSmartError", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "enable_jbod" => MoPropertyMeta.new("enable_jbod", "enableJbod", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "enable_ssd_patrol_read" => MoPropertyMeta.new("enable_ssd_patrol_read", "enableSsdPatrolRead", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "expose_enclosure_devices" => MoPropertyMeta.new("expose_enclosure_devices", "exposeEnclosureDevices", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "maintain_pd_fail_history" => MoPropertyMeta.new("maintain_pd_fail_history", "maintainPdFailHistory", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "ncq_status" => MoPropertyMeta.new("ncq_status", "ncqStatus", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "patrol_read_rate" => MoPropertyMeta.new("patrol_read_rate", "patrolReadRate", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pci_slot" => MoPropertyMeta.new("pci_slot", "pciSlot", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "phys_drive_coercion_mode" => MoPropertyMeta.new("phys_drive_coercion_mode", "physDriveCoercionMode", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "predictive_fail_poll_interval" => MoPropertyMeta.new("predictive_fail_poll_interval", "predictiveFailPollInterval", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rebuild_rate" => MoPropertyMeta.new("rebuild_rate", "rebuildRate", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "reconstruction_rate" => MoPropertyMeta.new("reconstruction_rate", "reconstructionRate", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "spin_down_unconfigured" => MoPropertyMeta.new("spin_down_unconfigured", "spinDownUnconfigured", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "spinup_delay" => MoPropertyMeta.new("spinup_delay", "spinupDelay", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "spinup_drive_count" => MoPropertyMeta.new("spinup_drive_count", "spinupDriveCount", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

        "modular" => {
            "auto_enhanced_import" => MoPropertyMeta.new("auto_enhanced_import", "autoEnhancedImport", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "battery_warning" => MoPropertyMeta.new("battery_warning", "batteryWarning", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "cache_flush_interval" => MoPropertyMeta.new("cache_flush_interval", "cacheFlushInterval", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "cluster_enable" => MoPropertyMeta.new("cluster_enable", "clusterEnable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "consistency_check_rate" => MoPropertyMeta.new("consistency_check_rate", "consistencyCheckRate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "ecc_bucket_leak_rate" => MoPropertyMeta.new("ecc_bucket_leak_rate", "eccBucketLeakRate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "enable_copyback_on_smart" => MoPropertyMeta.new("enable_copyback_on_smart", "enableCopybackOnSmart", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "enable_copyback_to_ssd_on_smart_error" => MoPropertyMeta.new("enable_copyback_to_ssd_on_smart_error", "enableCopybackToSsdOnSmartError", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "enable_jbod" => MoPropertyMeta.new("enable_jbod", "enableJbod", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "enable_ssd_patrol_read" => MoPropertyMeta.new("enable_ssd_patrol_read", "enableSsdPatrolRead", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "expose_enclosure_devices" => MoPropertyMeta.new("expose_enclosure_devices", "exposeEnclosureDevices", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "maintain_pd_fail_history" => MoPropertyMeta.new("maintain_pd_fail_history", "maintainPdFailHistory", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "ncq_status" => MoPropertyMeta.new("ncq_status", "ncqStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "patrol_read_rate" => MoPropertyMeta.new("patrol_read_rate", "patrolReadRate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pci_slot" => MoPropertyMeta.new("pci_slot", "pciSlot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "phys_drive_coercion_mode" => MoPropertyMeta.new("phys_drive_coercion_mode", "physDriveCoercionMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "predictive_fail_poll_interval" => MoPropertyMeta.new("predictive_fail_poll_interval", "predictiveFailPollInterval", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rebuild_rate" => MoPropertyMeta.new("rebuild_rate", "rebuildRate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "reconstruction_rate" => MoPropertyMeta.new("reconstruction_rate", "reconstructionRate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "spin_down_unconfigured" => MoPropertyMeta.new("spin_down_unconfigured", "spinDownUnconfigured", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "spinup_delay" => MoPropertyMeta.new("spinup_delay", "spinupDelay", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "spinup_drive_count" => MoPropertyMeta.new("spinup_drive_count", "spinupDriveCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "autoEnhancedImport" => "auto_enhanced_import", 
        "batteryWarning" => "battery_warning", 
        "cacheFlushInterval" => "cache_flush_interval", 
        "childAction" => "child_action", 
        "clusterEnable" => "cluster_enable", 
        "consistencyCheckRate" => "consistency_check_rate", 
        "dn" => "dn", 
        "eccBucketLeakRate" => "ecc_bucket_leak_rate", 
        "enableCopybackOnSmart" => "enable_copyback_on_smart", 
        "enableCopybackToSsdOnSmartError" => "enable_copyback_to_ssd_on_smart_error", 
        "enableJbod" => "enable_jbod", 
        "enableSsdPatrolRead" => "enable_ssd_patrol_read", 
        "exposeEnclosureDevices" => "expose_enclosure_devices", 
        "maintainPdFailHistory" => "maintain_pd_fail_history", 
        "ncqStatus" => "ncq_status", 
        "patrolReadRate" => "patrol_read_rate", 
        "pciSlot" => "pci_slot", 
        "physDriveCoercionMode" => "phys_drive_coercion_mode", 
        "predictiveFailPollInterval" => "predictive_fail_poll_interval", 
        "rebuildRate" => "rebuild_rate", 
        "reconstructionRate" => "reconstruction_rate", 
        "rn" => "rn", 
        "spinDownUnconfigured" => "spin_down_unconfigured", 
        "spinupDelay" => "spinup_delay", 
        "spinupDriveCount" => "spinup_drive_count", 
        "status" => "status", 
        },

        "modular" => {
            "autoEnhancedImport" => "auto_enhanced_import", 
            "batteryWarning" => "battery_warning", 
            "cacheFlushInterval" => "cache_flush_interval", 
            "childAction" => "child_action", 
            "clusterEnable" => "cluster_enable", 
            "consistencyCheckRate" => "consistency_check_rate", 
            "dn" => "dn", 
            "eccBucketLeakRate" => "ecc_bucket_leak_rate", 
            "enableCopybackOnSmart" => "enable_copyback_on_smart", 
            "enableCopybackToSsdOnSmartError" => "enable_copyback_to_ssd_on_smart_error", 
            "enableJbod" => "enable_jbod", 
            "enableSsdPatrolRead" => "enable_ssd_patrol_read", 
            "exposeEnclosureDevices" => "expose_enclosure_devices", 
            "maintainPdFailHistory" => "maintain_pd_fail_history", 
            "ncqStatus" => "ncq_status", 
            "patrolReadRate" => "patrol_read_rate", 
            "pciSlot" => "pci_slot", 
            "physDriveCoercionMode" => "phys_drive_coercion_mode", 
            "predictiveFailPollInterval" => "predictive_fail_poll_interval", 
            "rebuildRate" => "rebuild_rate", 
            "reconstructionRate" => "reconstruction_rate", 
            "rn" => "rn", 
            "spinDownUnconfigured" => "spin_down_unconfigured", 
            "spinupDelay" => "spinup_delay", 
            "spinupDriveCount" => "spinup_drive_count", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :auto_enhanced_import
    attr_reader :battery_warning
    attr_reader :cache_flush_interval
    attr_reader :child_action
    attr_reader :cluster_enable
    attr_reader :consistency_check_rate
    attr_reader :ecc_bucket_leak_rate
    attr_reader :enable_copyback_on_smart
    attr_reader :enable_copyback_to_ssd_on_smart_error
    attr_reader :enable_jbod
    attr_reader :enable_ssd_patrol_read
    attr_reader :expose_enclosure_devices
    attr_reader :maintain_pd_fail_history
    attr_reader :ncq_status
    attr_reader :patrol_read_rate
    attr_reader :pci_slot
    attr_reader :phys_drive_coercion_mode
    attr_reader :predictive_fail_poll_interval
    attr_reader :rebuild_rate
    attr_reader :reconstruction_rate
    attr_reader :spin_down_unconfigured
    attr_reader :spinup_delay
    attr_reader :spinup_drive_count
    attr_reader :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @auto_enhanced_import = nil
        @battery_warning = nil
        @cache_flush_interval = nil
        @child_action = nil
        @cluster_enable = nil
        @consistency_check_rate = nil
        @ecc_bucket_leak_rate = nil
        @enable_copyback_on_smart = nil
        @enable_copyback_to_ssd_on_smart_error = nil
        @enable_jbod = nil
        @enable_ssd_patrol_read = nil
        @expose_enclosure_devices = nil
        @maintain_pd_fail_history = nil
        @ncq_status = nil
        @patrol_read_rate = nil
        @pci_slot = nil
        @phys_drive_coercion_mode = nil
        @predictive_fail_poll_interval = nil
        @rebuild_rate = nil
        @reconstruction_rate = nil
        @spin_down_unconfigured = nil
        @spinup_delay = nil
        @spinup_drive_count = nil
        @status = nil

        super(class_id: "StorageControllerSettings", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
