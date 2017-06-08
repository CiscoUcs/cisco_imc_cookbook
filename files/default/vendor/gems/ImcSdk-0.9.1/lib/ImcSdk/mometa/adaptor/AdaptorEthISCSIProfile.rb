#This module contains the general information for AdaptorEthISCSIProfile ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AdaptorEthISCSIProfileConsts
    INITIATOR_PRIORITY_PRIMARY = "primary"
    INITIATOR_PRIORITY_SECONDARY = "secondary"
end


class AdaptorEthISCSIProfile < ManagedObject
    #This is AdaptorEthISCSIProfile class.

    @@consts = AdaptorEthISCSIProfileConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AdaptorEthISCSIProfile", "adaptorEthISCSIProfile", "ethiscsi", VersionMeta::VERSION151F, "InputOutput", 0x3fffffff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"]),
        "modular" => MoMeta.new("AdaptorEthISCSIProfile", "adaptorEthISCSIProfile", "ethiscsi", VersionMeta::VERSION2013E, "InputOutput", 0x1fffffff, [], ["admin", "read-only", "user"], ["Add", "Get", "Remove", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dhcp_iscsi" => MoPropertyMeta.new("dhcp_iscsi", "dhcpISCSI", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "dhcp_id" => MoPropertyMeta.new("dhcp_id", "dhcpId", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 64, nil, [], []), 
        "dhcp_network_settings" => MoPropertyMeta.new("dhcp_network_settings", "dhcpNetworkSettings", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "dhcp_timeout" => MoPropertyMeta.new("dhcp_timeout", "dhcpTimeout", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["60-300"]), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
        "initiator_chap_name" => MoPropertyMeta.new("initiator_chap_name", "initiatorChapName", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, %q{[a-zA-Z0-9]{0,50}}, [], []), 
        "initiator_chap_secret" => MoPropertyMeta.new("initiator_chap_secret", "initiatorChapSecret", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, %q{[!""#%&'\(\)\*\+,\-\./:;<>@\[\\\]\^_`\{\|\}~a-zA-Z0-9]{0,50}}, [], []), 
        "initiator_gateway" => MoPropertyMeta.new("initiator_gateway", "initiatorGateway", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "initiator_ip_address" => MoPropertyMeta.new("initiator_ip_address", "initiatorIPAddress", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "initiator_name" => MoPropertyMeta.new("initiator_name", "initiatorName", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, %q{[0-9a-zA-Z\.:-]{0,223}}, [], []), 
        "initiator_primary_dns" => MoPropertyMeta.new("initiator_primary_dns", "initiatorPrimaryDns", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "initiator_secondary_dns" => MoPropertyMeta.new("initiator_secondary_dns", "initiatorSecondaryDns", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x1000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "initiator_subnet_mask" => MoPropertyMeta.new("initiator_subnet_mask", "initiatorSubnetMask", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "initiator_tcp_timeout" => MoPropertyMeta.new("initiator_tcp_timeout", "initiatorTCPTimeout", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4000, nil, nil, nil, [], ["0-255"]), 
        "ip_ver" => MoPropertyMeta.new("ip_ver", "ipVer", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "link_busy_retry_count" => MoPropertyMeta.new("link_busy_retry_count", "linkBusyRetryCount", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8000, nil, nil, nil, [], ["0-255"]), 
        "linkup_timeout" => MoPropertyMeta.new("linkup_timeout", "linkupTimeout", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10000, nil, nil, nil, [], ["0-255"]), 
        "primary_target_boot_lun" => MoPropertyMeta.new("primary_target_boot_lun", "primaryTargetBootLun", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20000, nil, nil, nil, [], ["0-65535"]), 
        "primary_target_chap_name" => MoPropertyMeta.new("primary_target_chap_name", "primaryTargetChapName", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40000, nil, nil, %q{[a-zA-Z0-9]{0,50}}, [], []), 
        "primary_target_chap_secret" => MoPropertyMeta.new("primary_target_chap_secret", "primaryTargetChapSecret", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80000, nil, nil, %q{[!""#%&'\(\)\*\+,\-\./:;<>@\[\\\]\^_`\{\|\}~a-zA-Z0-9]{0,50}}, [], []), 
        "primary_target_ip_address" => MoPropertyMeta.new("primary_target_ip_address", "primaryTargetIPAddress", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "primary_target_name" => MoPropertyMeta.new("primary_target_name", "primaryTargetName", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200000, nil, nil, %q{[0-9a-zA-Z\.:-]{0,223}}, [], []), 
        "primary_target_port" => MoPropertyMeta.new("primary_target_port", "primaryTargetPort", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400000, 0, 255, nil, [], []), 
        "secondary_target_boot_lun" => MoPropertyMeta.new("secondary_target_boot_lun", "secondaryTargetBootLun", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800000, nil, nil, nil, [], ["0-65535"]), 
        "secondary_target_chap_name" => MoPropertyMeta.new("secondary_target_chap_name", "secondaryTargetChapName", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x1000000, nil, nil, %q{[a-zA-Z0-9]{0,50}}, [], []), 
        "secondary_target_chap_secret" => MoPropertyMeta.new("secondary_target_chap_secret", "secondaryTargetChapSecret", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2000000, nil, nil, %q{[!""#%&'\(\)\*\+,\-\./:;<>@\[\\\]\^_`\{\|\}~a-zA-Z0-9]{0,50}}, [], []), 
        "secondary_target_ip_address" => MoPropertyMeta.new("secondary_target_ip_address", "secondaryTargetIPAddress", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4000000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "secondary_target_name" => MoPropertyMeta.new("secondary_target_name", "secondaryTargetName", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8000000, nil, nil, %q{[0-9a-zA-Z\.:-]{0,223}}, [], []), 
        "secondary_target_port" => MoPropertyMeta.new("secondary_target_port", "secondaryTargetPort", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10000000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "initiator_priority" => MoPropertyMeta.new("initiator_priority", "initiatorPriority", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x20000000, nil, nil, nil, ["primary", "secondary"], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dhcp_iscsi" => MoPropertyMeta.new("dhcp_iscsi", "dhcpISCSI", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "dhcp_id" => MoPropertyMeta.new("dhcp_id", "dhcpId", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 64, nil, [], []), 
            "dhcp_network_settings" => MoPropertyMeta.new("dhcp_network_settings", "dhcpNetworkSettings", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "dhcp_timeout" => MoPropertyMeta.new("dhcp_timeout", "dhcpTimeout", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, [], ["60-300"]), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, 0, 255, nil, [], []), 
            "initiator_chap_name" => MoPropertyMeta.new("initiator_chap_name", "initiatorChapName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, %q{[a-zA-Z0-9]{0,50}}, [], []), 
            "initiator_chap_secret" => MoPropertyMeta.new("initiator_chap_secret", "initiatorChapSecret", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, %q{[!""#%&'\(\)\*\+,\-\./:;<>@\[\\\]\^_`\{\|\}~a-zA-Z0-9]{0,50}}, [], []), 
            "initiator_gateway" => MoPropertyMeta.new("initiator_gateway", "initiatorGateway", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "initiator_ip_address" => MoPropertyMeta.new("initiator_ip_address", "initiatorIPAddress", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "initiator_name" => MoPropertyMeta.new("initiator_name", "initiatorName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, %q{[0-9a-zA-Z\.:-]{0,223}}, [], []), 
            "initiator_primary_dns" => MoPropertyMeta.new("initiator_primary_dns", "initiatorPrimaryDns", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "initiator_secondary_dns" => MoPropertyMeta.new("initiator_secondary_dns", "initiatorSecondaryDns", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "initiator_subnet_mask" => MoPropertyMeta.new("initiator_subnet_mask", "initiatorSubnetMask", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "initiator_tcp_timeout" => MoPropertyMeta.new("initiator_tcp_timeout", "initiatorTCPTimeout", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4000, nil, nil, nil, [], ["0-255"]), 
            "ip_ver" => MoPropertyMeta.new("ip_ver", "ipVer", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "link_busy_retry_count" => MoPropertyMeta.new("link_busy_retry_count", "linkBusyRetryCount", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8000, nil, nil, nil, [], ["0-255"]), 
            "linkup_timeout" => MoPropertyMeta.new("linkup_timeout", "linkupTimeout", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10000, nil, nil, nil, [], ["0-255"]), 
            "primary_target_boot_lun" => MoPropertyMeta.new("primary_target_boot_lun", "primaryTargetBootLun", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20000, nil, nil, nil, [], ["0-65535"]), 
            "primary_target_chap_name" => MoPropertyMeta.new("primary_target_chap_name", "primaryTargetChapName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40000, nil, nil, %q{[a-zA-Z0-9]{0,50}}, [], []), 
            "primary_target_chap_secret" => MoPropertyMeta.new("primary_target_chap_secret", "primaryTargetChapSecret", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80000, nil, nil, %q{[!""#%&'\(\)\*\+,\-\./:;<>@\[\\\]\^_`\{\|\}~a-zA-Z0-9]{0,50}}, [], []), 
            "primary_target_ip_address" => MoPropertyMeta.new("primary_target_ip_address", "primaryTargetIPAddress", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "primary_target_name" => MoPropertyMeta.new("primary_target_name", "primaryTargetName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200000, nil, nil, %q{[0-9a-zA-Z\.:-]{0,223}}, [], []), 
            "primary_target_port" => MoPropertyMeta.new("primary_target_port", "primaryTargetPort", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400000, 0, 255, nil, [], []), 
            "secondary_target_boot_lun" => MoPropertyMeta.new("secondary_target_boot_lun", "secondaryTargetBootLun", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800000, nil, nil, nil, [], ["0-65535"]), 
            "secondary_target_chap_name" => MoPropertyMeta.new("secondary_target_chap_name", "secondaryTargetChapName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000000, nil, nil, %q{[a-zA-Z0-9]{0,50}}, [], []), 
            "secondary_target_chap_secret" => MoPropertyMeta.new("secondary_target_chap_secret", "secondaryTargetChapSecret", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000000, nil, nil, %q{[!""#%&'\(\)\*\+,\-\./:;<>@\[\\\]\^_`\{\|\}~a-zA-Z0-9]{0,50}}, [], []), 
            "secondary_target_ip_address" => MoPropertyMeta.new("secondary_target_ip_address", "secondaryTargetIPAddress", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4000000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "secondary_target_name" => MoPropertyMeta.new("secondary_target_name", "secondaryTargetName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8000000, nil, nil, %q{[0-9a-zA-Z\.:-]{0,223}}, [], []), 
            "secondary_target_port" => MoPropertyMeta.new("secondary_target_port", "secondaryTargetPort", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10000000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dhcpISCSI" => "dhcp_iscsi", 
        "dhcpId" => "dhcp_id", 
        "dhcpNetworkSettings" => "dhcp_network_settings", 
        "dhcpTimeout" => "dhcp_timeout", 
        "dn" => "dn", 
        "initiatorChapName" => "initiator_chap_name", 
        "initiatorChapSecret" => "initiator_chap_secret", 
        "initiatorGateway" => "initiator_gateway", 
        "initiatorIPAddress" => "initiator_ip_address", 
        "initiatorName" => "initiator_name", 
        "initiatorPrimaryDns" => "initiator_primary_dns", 
        "initiatorSecondaryDns" => "initiator_secondary_dns", 
        "initiatorSubnetMask" => "initiator_subnet_mask", 
        "initiatorTCPTimeout" => "initiator_tcp_timeout", 
        "ipVer" => "ip_ver", 
        "linkBusyRetryCount" => "link_busy_retry_count", 
        "linkupTimeout" => "linkup_timeout", 
        "primaryTargetBootLun" => "primary_target_boot_lun", 
        "primaryTargetChapName" => "primary_target_chap_name", 
        "primaryTargetChapSecret" => "primary_target_chap_secret", 
        "primaryTargetIPAddress" => "primary_target_ip_address", 
        "primaryTargetName" => "primary_target_name", 
        "primaryTargetPort" => "primary_target_port", 
        "rn" => "rn", 
        "secondaryTargetBootLun" => "secondary_target_boot_lun", 
        "secondaryTargetChapName" => "secondary_target_chap_name", 
        "secondaryTargetChapSecret" => "secondary_target_chap_secret", 
        "secondaryTargetIPAddress" => "secondary_target_ip_address", 
        "secondaryTargetName" => "secondary_target_name", 
        "secondaryTargetPort" => "secondary_target_port", 
        "status" => "status", 
        "initiatorPriority" => "initiator_priority", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dhcpISCSI" => "dhcp_iscsi", 
            "dhcpId" => "dhcp_id", 
            "dhcpNetworkSettings" => "dhcp_network_settings", 
            "dhcpTimeout" => "dhcp_timeout", 
            "dn" => "dn", 
            "initiatorChapName" => "initiator_chap_name", 
            "initiatorChapSecret" => "initiator_chap_secret", 
            "initiatorGateway" => "initiator_gateway", 
            "initiatorIPAddress" => "initiator_ip_address", 
            "initiatorName" => "initiator_name", 
            "initiatorPrimaryDns" => "initiator_primary_dns", 
            "initiatorSecondaryDns" => "initiator_secondary_dns", 
            "initiatorSubnetMask" => "initiator_subnet_mask", 
            "initiatorTCPTimeout" => "initiator_tcp_timeout", 
            "ipVer" => "ip_ver", 
            "linkBusyRetryCount" => "link_busy_retry_count", 
            "linkupTimeout" => "linkup_timeout", 
            "primaryTargetBootLun" => "primary_target_boot_lun", 
            "primaryTargetChapName" => "primary_target_chap_name", 
            "primaryTargetChapSecret" => "primary_target_chap_secret", 
            "primaryTargetIPAddress" => "primary_target_ip_address", 
            "primaryTargetName" => "primary_target_name", 
            "primaryTargetPort" => "primary_target_port", 
            "rn" => "rn", 
            "secondaryTargetBootLun" => "secondary_target_boot_lun", 
            "secondaryTargetChapName" => "secondary_target_chap_name", 
            "secondaryTargetChapSecret" => "secondary_target_chap_secret", 
            "secondaryTargetIPAddress" => "secondary_target_ip_address", 
            "secondaryTargetName" => "secondary_target_name", 
            "secondaryTargetPort" => "secondary_target_port", 
            "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_accessor :dhcp_iscsi
    attr_accessor :dhcp_id
    attr_accessor :dhcp_network_settings
    attr_accessor :dhcp_timeout
    attr_accessor :initiator_chap_name
    attr_accessor :initiator_chap_secret
    attr_accessor :initiator_gateway
    attr_accessor :initiator_ip_address
    attr_accessor :initiator_name
    attr_accessor :initiator_primary_dns
    attr_accessor :initiator_secondary_dns
    attr_accessor :initiator_subnet_mask
    attr_accessor :initiator_tcp_timeout
    attr_reader :ip_ver
    attr_accessor :link_busy_retry_count
    attr_accessor :linkup_timeout
    attr_accessor :primary_target_boot_lun
    attr_accessor :primary_target_chap_name
    attr_accessor :primary_target_chap_secret
    attr_accessor :primary_target_ip_address
    attr_accessor :primary_target_name
    attr_reader :primary_target_port
    attr_accessor :secondary_target_boot_lun
    attr_accessor :secondary_target_chap_name
    attr_accessor :secondary_target_chap_secret
    attr_accessor :secondary_target_ip_address
    attr_accessor :secondary_target_name
    attr_reader :secondary_target_port
    attr_accessor :status
    attr_accessor :initiator_priority


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @dhcp_iscsi = nil
        @dhcp_id = nil
        @dhcp_network_settings = nil
        @dhcp_timeout = nil
        @initiator_chap_name = nil
        @initiator_chap_secret = nil
        @initiator_gateway = nil
        @initiator_ip_address = nil
        @initiator_name = nil
        @initiator_primary_dns = nil
        @initiator_secondary_dns = nil
        @initiator_subnet_mask = nil
        @initiator_tcp_timeout = nil
        @ip_ver = nil
        @link_busy_retry_count = nil
        @linkup_timeout = nil
        @primary_target_boot_lun = nil
        @primary_target_chap_name = nil
        @primary_target_chap_secret = nil
        @primary_target_ip_address = nil
        @primary_target_name = nil
        @primary_target_port = nil
        @secondary_target_boot_lun = nil
        @secondary_target_chap_name = nil
        @secondary_target_chap_secret = nil
        @secondary_target_ip_address = nil
        @secondary_target_name = nil
        @secondary_target_port = nil
        @status = nil
        @initiator_priority = nil

        super(class_id: "AdaptorEthISCSIProfile", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
