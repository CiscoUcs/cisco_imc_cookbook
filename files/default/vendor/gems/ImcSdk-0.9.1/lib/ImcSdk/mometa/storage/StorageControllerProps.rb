#This module contains the general information for StorageControllerProps ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class StorageControllerPropsConsts
    
end


class StorageControllerProps < ManagedObject
    #This is StorageControllerProps class.

    @@consts = StorageControllerPropsConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("StorageControllerProps", "storageControllerProps", "controller-props", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("StorageControllerProps", "storageControllerProps", "controller-props", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "backend_port_count" => MoPropertyMeta.new("backend_port_count", "backendPortCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "battery_status" => MoPropertyMeta.new("battery_status", "batteryStatus", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "bbu_present" => MoPropertyMeta.new("bbu_present", "bbuPresent", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "boot_block_version" => MoPropertyMeta.new("boot_block_version", "bootBlockVersion", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "boot_drive" => MoPropertyMeta.new("boot_drive", "bootDrive", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "boot_drive_is_physical_drive" => MoPropertyMeta.new("boot_drive_is_physical_drive", "bootDriveIsPhysicalDrive", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "boot_version" => MoPropertyMeta.new("boot_version", "bootVersion", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "cache_memory_size" => MoPropertyMeta.new("cache_memory_size", "cacheMemorySize", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "controller_status" => MoPropertyMeta.new("controller_status", "controllerStatus", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "critical_physical_drive_count" => MoPropertyMeta.new("critical_physical_drive_count", "criticalPhysicalDriveCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "date_of_manufacture" => MoPropertyMeta.new("date_of_manufacture", "dateOfManufacture", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "degraded_virtual_drive_count" => MoPropertyMeta.new("degraded_virtual_drive_count", "degradedVirtualDriveCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "failed_physical_drive_count" => MoPropertyMeta.new("failed_physical_drive_count", "failedPhysicalDriveCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "firmware_package_build" => MoPropertyMeta.new("firmware_package_build", "firmwarePackageBuild", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "flash_present" => MoPropertyMeta.new("flash_present", "flashPresent", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "memory_correctable_errors" => MoPropertyMeta.new("memory_correctable_errors", "memoryCorrectableErrors", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "memory_present" => MoPropertyMeta.new("memory_present", "memoryPresent", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "memory_size" => MoPropertyMeta.new("memory_size", "memorySize", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "memory_uncorrectable_errors" => MoPropertyMeta.new("memory_uncorrectable_errors", "memoryUncorrectableErrors", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "nvdata_version" => MoPropertyMeta.new("nvdata_version", "nvdataVersion", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "nvram_present" => MoPropertyMeta.new("nvram_present", "nvramPresent", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "offline_virtual_drive_count" => MoPropertyMeta.new("offline_virtual_drive_count", "offlineVirtualDriveCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "pci_slot" => MoPropertyMeta.new("pci_slot", "pciSlot", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "physical_drive_count" => MoPropertyMeta.new("physical_drive_count", "physicalDriveCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "preboot_cli_version" => MoPropertyMeta.new("preboot_cli_version", "prebootCliVersion", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "raid_chip_temp_centigrade" => MoPropertyMeta.new("raid_chip_temp_centigrade", "raidChipTempCentigrade", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "revision" => MoPropertyMeta.new("revision", "revision", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "sas_address0" => MoPropertyMeta.new("sas_address0", "sasAddress0", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "sas_address1" => MoPropertyMeta.new("sas_address1", "sasAddress1", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "sas_address2" => MoPropertyMeta.new("sas_address2", "sasAddress2", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "sas_address3" => MoPropertyMeta.new("sas_address3", "sasAddress3", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "sas_address4" => MoPropertyMeta.new("sas_address4", "sasAddress4", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "sas_address5" => MoPropertyMeta.new("sas_address5", "sasAddress5", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "sas_address6" => MoPropertyMeta.new("sas_address6", "sasAddress6", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "sas_address7" => MoPropertyMeta.new("sas_address7", "sasAddress7", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "serial_debugger_present" => MoPropertyMeta.new("serial_debugger_present", "serialDebuggerPresent", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "supports_raid0" => MoPropertyMeta.new("supports_raid0", "supportsRaid0", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raid00" => MoPropertyMeta.new("supports_raid00", "supportsRaid00", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raid1" => MoPropertyMeta.new("supports_raid1", "supportsRaid1", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raid10" => MoPropertyMeta.new("supports_raid10", "supportsRaid10", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raid1e" => MoPropertyMeta.new("supports_raid1e", "supportsRaid1e", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raid1e0rlq0" => MoPropertyMeta.new("supports_raid1e0rlq0", "supportsRaid1e0rlq0", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raid1erlq0" => MoPropertyMeta.new("supports_raid1erlq0", "supportsRaid1erlq0", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raid5" => MoPropertyMeta.new("supports_raid5", "supportsRaid5", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raid50" => MoPropertyMeta.new("supports_raid50", "supportsRaid50", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raid6" => MoPropertyMeta.new("supports_raid6", "supportsRaid6", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raid60" => MoPropertyMeta.new("supports_raid60", "supportsRaid60", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "supports_raidsrl03" => MoPropertyMeta.new("supports_raidsrl03", "supportsRaidsrl03", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "tty_log_status" => MoPropertyMeta.new("tty_log_status", "ttyLogStatus", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "virtual_drive_count" => MoPropertyMeta.new("virtual_drive_count", "virtualDriveCount", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "web_bios_version" => MoPropertyMeta.new("web_bios_version", "webBiosVersion", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "backend_port_count" => MoPropertyMeta.new("backend_port_count", "backendPortCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "battery_status" => MoPropertyMeta.new("battery_status", "batteryStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "bbu_present" => MoPropertyMeta.new("bbu_present", "bbuPresent", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "boot_block_version" => MoPropertyMeta.new("boot_block_version", "bootBlockVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "boot_drive" => MoPropertyMeta.new("boot_drive", "bootDrive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "boot_drive_is_physical_drive" => MoPropertyMeta.new("boot_drive_is_physical_drive", "bootDriveIsPhysicalDrive", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "boot_version" => MoPropertyMeta.new("boot_version", "bootVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "cache_memory_size" => MoPropertyMeta.new("cache_memory_size", "cacheMemorySize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "controller_status" => MoPropertyMeta.new("controller_status", "controllerStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "critical_physical_drive_count" => MoPropertyMeta.new("critical_physical_drive_count", "criticalPhysicalDriveCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "date_of_manufacture" => MoPropertyMeta.new("date_of_manufacture", "dateOfManufacture", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "degraded_virtual_drive_count" => MoPropertyMeta.new("degraded_virtual_drive_count", "degradedVirtualDriveCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "failed_physical_drive_count" => MoPropertyMeta.new("failed_physical_drive_count", "failedPhysicalDriveCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "firmware_package_build" => MoPropertyMeta.new("firmware_package_build", "firmwarePackageBuild", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "flash_present" => MoPropertyMeta.new("flash_present", "flashPresent", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "health" => MoPropertyMeta.new("health", "health", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "memory_correctable_errors" => MoPropertyMeta.new("memory_correctable_errors", "memoryCorrectableErrors", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "memory_present" => MoPropertyMeta.new("memory_present", "memoryPresent", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "memory_size" => MoPropertyMeta.new("memory_size", "memorySize", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "memory_uncorrectable_errors" => MoPropertyMeta.new("memory_uncorrectable_errors", "memoryUncorrectableErrors", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "nvdata_version" => MoPropertyMeta.new("nvdata_version", "nvdataVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "nvram_present" => MoPropertyMeta.new("nvram_present", "nvramPresent", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "offline_virtual_drive_count" => MoPropertyMeta.new("offline_virtual_drive_count", "offlineVirtualDriveCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "pci_slot" => MoPropertyMeta.new("pci_slot", "pciSlot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "physical_drive_count" => MoPropertyMeta.new("physical_drive_count", "physicalDriveCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "preboot_cli_version" => MoPropertyMeta.new("preboot_cli_version", "prebootCliVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "raid_chip_temp_centigrade" => MoPropertyMeta.new("raid_chip_temp_centigrade", "raidChipTempCentigrade", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "revision" => MoPropertyMeta.new("revision", "revision", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "sas_address0" => MoPropertyMeta.new("sas_address0", "sasAddress0", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sas_address1" => MoPropertyMeta.new("sas_address1", "sasAddress1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sas_address2" => MoPropertyMeta.new("sas_address2", "sasAddress2", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sas_address3" => MoPropertyMeta.new("sas_address3", "sasAddress3", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sas_address4" => MoPropertyMeta.new("sas_address4", "sasAddress4", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sas_address5" => MoPropertyMeta.new("sas_address5", "sasAddress5", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sas_address6" => MoPropertyMeta.new("sas_address6", "sasAddress6", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "sas_address7" => MoPropertyMeta.new("sas_address7", "sasAddress7", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "serial" => MoPropertyMeta.new("serial", "serial", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "serial_debugger_present" => MoPropertyMeta.new("serial_debugger_present", "serialDebuggerPresent", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "supports_raid0" => MoPropertyMeta.new("supports_raid0", "supportsRaid0", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raid00" => MoPropertyMeta.new("supports_raid00", "supportsRaid00", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raid1" => MoPropertyMeta.new("supports_raid1", "supportsRaid1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raid10" => MoPropertyMeta.new("supports_raid10", "supportsRaid10", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raid1e" => MoPropertyMeta.new("supports_raid1e", "supportsRaid1e", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raid1e0rlq0" => MoPropertyMeta.new("supports_raid1e0rlq0", "supportsRaid1e0rlq0", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raid1erlq0" => MoPropertyMeta.new("supports_raid1erlq0", "supportsRaid1erlq0", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raid5" => MoPropertyMeta.new("supports_raid5", "supportsRaid5", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raid50" => MoPropertyMeta.new("supports_raid50", "supportsRaid50", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raid6" => MoPropertyMeta.new("supports_raid6", "supportsRaid6", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raid60" => MoPropertyMeta.new("supports_raid60", "supportsRaid60", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "supports_raidsrl03" => MoPropertyMeta.new("supports_raidsrl03", "supportsRaidsrl03", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "tty_log_status" => MoPropertyMeta.new("tty_log_status", "ttyLogStatus", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "virtual_drive_count" => MoPropertyMeta.new("virtual_drive_count", "virtualDriveCount", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "web_bios_version" => MoPropertyMeta.new("web_bios_version", "webBiosVersion", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "backendPortCount" => "backend_port_count", 
        "batteryStatus" => "battery_status", 
        "bbuPresent" => "bbu_present", 
        "bootBlockVersion" => "boot_block_version", 
        "bootDrive" => "boot_drive", 
        "bootDriveIsPhysicalDrive" => "boot_drive_is_physical_drive", 
        "bootVersion" => "boot_version", 
        "cacheMemorySize" => "cache_memory_size", 
        "childAction" => "child_action", 
        "controllerStatus" => "controller_status", 
        "criticalPhysicalDriveCount" => "critical_physical_drive_count", 
        "dateOfManufacture" => "date_of_manufacture", 
        "degradedVirtualDriveCount" => "degraded_virtual_drive_count", 
        "dn" => "dn", 
        "failedPhysicalDriveCount" => "failed_physical_drive_count", 
        "firmwarePackageBuild" => "firmware_package_build", 
        "flashPresent" => "flash_present", 
        "health" => "health", 
        "memoryCorrectableErrors" => "memory_correctable_errors", 
        "memoryPresent" => "memory_present", 
        "memorySize" => "memory_size", 
        "memoryUncorrectableErrors" => "memory_uncorrectable_errors", 
        "nvdataVersion" => "nvdata_version", 
        "nvramPresent" => "nvram_present", 
        "offlineVirtualDriveCount" => "offline_virtual_drive_count", 
        "pciSlot" => "pci_slot", 
        "physicalDriveCount" => "physical_drive_count", 
        "prebootCliVersion" => "preboot_cli_version", 
        "raidChipTempCentigrade" => "raid_chip_temp_centigrade", 
        "revision" => "revision", 
        "rn" => "rn", 
        "sasAddress0" => "sas_address0", 
        "sasAddress1" => "sas_address1", 
        "sasAddress2" => "sas_address2", 
        "sasAddress3" => "sas_address3", 
        "sasAddress4" => "sas_address4", 
        "sasAddress5" => "sas_address5", 
        "sasAddress6" => "sas_address6", 
        "sasAddress7" => "sas_address7", 
        "serial" => "serial", 
        "serialDebuggerPresent" => "serial_debugger_present", 
        "status" => "status", 
        "supportsRaid0" => "supports_raid0", 
        "supportsRaid00" => "supports_raid00", 
        "supportsRaid1" => "supports_raid1", 
        "supportsRaid10" => "supports_raid10", 
        "supportsRaid1e" => "supports_raid1e", 
        "supportsRaid1e0rlq0" => "supports_raid1e0rlq0", 
        "supportsRaid1erlq0" => "supports_raid1erlq0", 
        "supportsRaid5" => "supports_raid5", 
        "supportsRaid50" => "supports_raid50", 
        "supportsRaid6" => "supports_raid6", 
        "supportsRaid60" => "supports_raid60", 
        "supportsRaidsrl03" => "supports_raidsrl03", 
        "ttyLogStatus" => "tty_log_status", 
        "virtualDriveCount" => "virtual_drive_count", 
        "webBiosVersion" => "web_bios_version", 
        },

        "modular" => {
            "backendPortCount" => "backend_port_count", 
            "batteryStatus" => "battery_status", 
            "bbuPresent" => "bbu_present", 
            "bootBlockVersion" => "boot_block_version", 
            "bootDrive" => "boot_drive", 
            "bootDriveIsPhysicalDrive" => "boot_drive_is_physical_drive", 
            "bootVersion" => "boot_version", 
            "cacheMemorySize" => "cache_memory_size", 
            "childAction" => "child_action", 
            "controllerStatus" => "controller_status", 
            "criticalPhysicalDriveCount" => "critical_physical_drive_count", 
            "dateOfManufacture" => "date_of_manufacture", 
            "degradedVirtualDriveCount" => "degraded_virtual_drive_count", 
            "dn" => "dn", 
            "failedPhysicalDriveCount" => "failed_physical_drive_count", 
            "firmwarePackageBuild" => "firmware_package_build", 
            "flashPresent" => "flash_present", 
            "health" => "health", 
            "memoryCorrectableErrors" => "memory_correctable_errors", 
            "memoryPresent" => "memory_present", 
            "memorySize" => "memory_size", 
            "memoryUncorrectableErrors" => "memory_uncorrectable_errors", 
            "nvdataVersion" => "nvdata_version", 
            "nvramPresent" => "nvram_present", 
            "offlineVirtualDriveCount" => "offline_virtual_drive_count", 
            "pciSlot" => "pci_slot", 
            "physicalDriveCount" => "physical_drive_count", 
            "prebootCliVersion" => "preboot_cli_version", 
            "raidChipTempCentigrade" => "raid_chip_temp_centigrade", 
            "revision" => "revision", 
            "rn" => "rn", 
            "sasAddress0" => "sas_address0", 
            "sasAddress1" => "sas_address1", 
            "sasAddress2" => "sas_address2", 
            "sasAddress3" => "sas_address3", 
            "sasAddress4" => "sas_address4", 
            "sasAddress5" => "sas_address5", 
            "sasAddress6" => "sas_address6", 
            "sasAddress7" => "sas_address7", 
            "serial" => "serial", 
            "serialDebuggerPresent" => "serial_debugger_present", 
            "status" => "status", 
            "supportsRaid0" => "supports_raid0", 
            "supportsRaid00" => "supports_raid00", 
            "supportsRaid1" => "supports_raid1", 
            "supportsRaid10" => "supports_raid10", 
            "supportsRaid1e" => "supports_raid1e", 
            "supportsRaid1e0rlq0" => "supports_raid1e0rlq0", 
            "supportsRaid1erlq0" => "supports_raid1erlq0", 
            "supportsRaid5" => "supports_raid5", 
            "supportsRaid50" => "supports_raid50", 
            "supportsRaid6" => "supports_raid6", 
            "supportsRaid60" => "supports_raid60", 
            "supportsRaidsrl03" => "supports_raidsrl03", 
            "ttyLogStatus" => "tty_log_status", 
            "virtualDriveCount" => "virtual_drive_count", 
            "webBiosVersion" => "web_bios_version", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :backend_port_count
    attr_reader :battery_status
    attr_reader :bbu_present
    attr_reader :boot_block_version
    attr_reader :boot_drive
    attr_reader :boot_drive_is_physical_drive
    attr_reader :boot_version
    attr_reader :cache_memory_size
    attr_reader :child_action
    attr_reader :controller_status
    attr_reader :critical_physical_drive_count
    attr_reader :date_of_manufacture
    attr_reader :degraded_virtual_drive_count
    attr_reader :failed_physical_drive_count
    attr_reader :firmware_package_build
    attr_reader :flash_present
    attr_reader :health
    attr_reader :memory_correctable_errors
    attr_reader :memory_present
    attr_reader :memory_size
    attr_reader :memory_uncorrectable_errors
    attr_reader :nvdata_version
    attr_reader :nvram_present
    attr_reader :offline_virtual_drive_count
    attr_reader :pci_slot
    attr_reader :physical_drive_count
    attr_reader :preboot_cli_version
    attr_reader :raid_chip_temp_centigrade
    attr_reader :revision
    attr_reader :sas_address0
    attr_reader :sas_address1
    attr_reader :sas_address2
    attr_reader :sas_address3
    attr_reader :sas_address4
    attr_reader :sas_address5
    attr_reader :sas_address6
    attr_reader :sas_address7
    attr_reader :serial
    attr_reader :serial_debugger_present
    attr_reader :status
    attr_reader :supports_raid0
    attr_reader :supports_raid00
    attr_reader :supports_raid1
    attr_reader :supports_raid10
    attr_reader :supports_raid1e
    attr_reader :supports_raid1e0rlq0
    attr_reader :supports_raid1erlq0
    attr_reader :supports_raid5
    attr_reader :supports_raid50
    attr_reader :supports_raid6
    attr_reader :supports_raid60
    attr_reader :supports_raidsrl03
    attr_reader :tty_log_status
    attr_reader :virtual_drive_count
    attr_reader :web_bios_version


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @backend_port_count = nil
        @battery_status = nil
        @bbu_present = nil
        @boot_block_version = nil
        @boot_drive = nil
        @boot_drive_is_physical_drive = nil
        @boot_version = nil
        @cache_memory_size = nil
        @child_action = nil
        @controller_status = nil
        @critical_physical_drive_count = nil
        @date_of_manufacture = nil
        @degraded_virtual_drive_count = nil
        @failed_physical_drive_count = nil
        @firmware_package_build = nil
        @flash_present = nil
        @health = nil
        @memory_correctable_errors = nil
        @memory_present = nil
        @memory_size = nil
        @memory_uncorrectable_errors = nil
        @nvdata_version = nil
        @nvram_present = nil
        @offline_virtual_drive_count = nil
        @pci_slot = nil
        @physical_drive_count = nil
        @preboot_cli_version = nil
        @raid_chip_temp_centigrade = nil
        @revision = nil
        @sas_address0 = nil
        @sas_address1 = nil
        @sas_address2 = nil
        @sas_address3 = nil
        @sas_address4 = nil
        @sas_address5 = nil
        @sas_address6 = nil
        @sas_address7 = nil
        @serial = nil
        @serial_debugger_present = nil
        @status = nil
        @supports_raid0 = nil
        @supports_raid00 = nil
        @supports_raid1 = nil
        @supports_raid10 = nil
        @supports_raid1e = nil
        @supports_raid1e0rlq0 = nil
        @supports_raid1erlq0 = nil
        @supports_raid5 = nil
        @supports_raid50 = nil
        @supports_raid6 = nil
        @supports_raid60 = nil
        @supports_raidsrl03 = nil
        @tty_log_status = nil
        @virtual_drive_count = nil
        @web_bios_version = nil

        super(class_id: "StorageControllerProps", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
