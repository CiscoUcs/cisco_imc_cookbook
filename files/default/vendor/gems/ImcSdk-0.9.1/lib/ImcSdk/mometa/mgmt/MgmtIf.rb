#This module contains the general information for MgmtIf ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class MgmtIfConsts
    ADMIN_DUPLEX_NA = "NA"
    ADMIN_DUPLEX_AUTO = "auto"
    ADMIN_DUPLEX_FULL = "full"
    ADMIN_DUPLEX_HALF = "half"
    ADMIN_NET_SPEED_100_MBPS = "100Mbps"
    ADMIN_NET_SPEED_10_MBPS = "10Mbps"
    ADMIN_NET_SPEED_1_GBPS = "1Gbps"
    ADMIN_NET_SPEED_NA = "NA"
    ADMIN_NET_SPEED_AUTO = "auto"
    IF_TYPE_PHYSICAL = "physical"
    NIC_MODE_CISCO_CARD = "cisco_card"
    NIC_MODE_DEDICATED = "dedicated"
    NIC_MODE_SHARED_LOM = "shared_lom"
    NIC_MODE_SHARED_LOM_10G = "shared_lom_10g"
    NIC_MODE_SHARED_LOM_EXT = "shared_lom_ext"
    NIC_MODE_SHIPPING = "shipping"
    NIC_REDUNDANCY_ACTIVE_ACTIVE = "active-active"
    NIC_REDUNDANCY_ACTIVE_STANDBY = "active-standby"
    NIC_REDUNDANCY_NONE = "none"
    OPER_DUPLEX_NA = "NA"
    OPER_DUPLEX_AUTO = "auto"
    OPER_DUPLEX_FULL = "full"
    OPER_DUPLEX_HALF = "half"
    OPER_NET_SPEED_100_MBPS = "100Mbps"
    OPER_NET_SPEED_10_MBPS = "10Mbps"
    OPER_NET_SPEED_1_GBPS = "1Gbps"
    OPER_NET_SPEED_NA = "NA"
    OPER_NET_SPEED_AUTO = "auto"
    VIC_SLOT_0 = "0"
    VIC_SLOT_1 = "1"
    VIC_SLOT_10 = "10"
    VIC_SLOT_2 = "2"
    VIC_SLOT_4 = "4"
    VIC_SLOT_5 = "5"
    VIC_SLOT_9 = "9"
    VIC_SLOT_FLEX_LOM = "flex-lom"
    VIC_SLOT_MLOM = "mlom"
    VIC_SLOT_RISER1 = "riser1"
    VIC_SLOT_RISER2 = "riser2"
    IF_TYPE_VIRTUAL = "virtual"
end


class MgmtIf < ManagedObject
    #This is MgmtIf class.

    @@consts = MgmtIfConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("MgmtIf", "mgmtIf", "if-1", VersionMeta::VERSION151F, "InputOutput", 0xffffffff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("MgmtIf", "mgmtIf", "if-1", VersionMeta::VERSION2013E, "InputOutput", 0x7ffffffffff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_duplex" => MoPropertyMeta.new("admin_duplex", "adminDuplex", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["NA", "auto", "full", "half"], []), 
        "admin_net_speed" => MoPropertyMeta.new("admin_net_speed", "adminNetSpeed", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["100Mbps", "10Mbps", "1Gbps", "NA", "auto"], []), 
        "auto_neg" => MoPropertyMeta.new("auto_neg", "autoNeg", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "ddns_domain" => MoPropertyMeta.new("ddns_domain", "ddnsDomain", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
        "ddns_enable" => MoPropertyMeta.new("ddns_enable", "ddnsEnable", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "dhcp_enable" => MoPropertyMeta.new("dhcp_enable", "dhcpEnable", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
        "dns_alternate" => MoPropertyMeta.new("dns_alternate", "dnsAlternate", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x100, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "dns_preferred" => MoPropertyMeta.new("dns_preferred", "dnsPreferred", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x200, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "dns_using_dhcp" => MoPropertyMeta.new("dns_using_dhcp", "dnsUsingDhcp", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "ext_enabled" => MoPropertyMeta.new("ext_enabled", "extEnabled", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "ext_gw" => MoPropertyMeta.new("ext_gw", "extGw", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "ext_ip" => MoPropertyMeta.new("ext_ip", "extIp", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x1000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "ext_mask" => MoPropertyMeta.new("ext_mask", "extMask", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
        "hostname" => MoPropertyMeta.new("hostname", "hostname", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4000, 0, 63, %q{(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])}, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "if_type" => MoPropertyMeta.new("if_type", "ifType", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["physical"], []), 
        "mac" => MoPropertyMeta.new("mac", "mac", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "nic_mode" => MoPropertyMeta.new("nic_mode", "nicMode", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8000, nil, nil, nil, ["cisco_card", "dedicated", "shared_lom", "shared_lom_10g", "shared_lom_ext", "shipping"], []), 
        "nic_redundancy" => MoPropertyMeta.new("nic_redundancy", "nicRedundancy", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x10000, nil, nil, nil, ["active-active", "active-standby", "none"], []), 
        "oper_duplex" => MoPropertyMeta.new("oper_duplex", "operDuplex", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["NA", "auto", "full", "half"], []), 
        "oper_net_speed" => MoPropertyMeta.new("oper_net_speed", "operNetSpeed", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["100Mbps", "10Mbps", "1Gbps", "NA", "auto"], []), 
        "port_profile" => MoPropertyMeta.new("port_profile", "portProfile", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20000, nil, nil, %q{[a-zA-Z0-9_\-]{0,80}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40000, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "subject" => MoPropertyMeta.new("subject", "subject", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "v6_slaac_ip" => MoPropertyMeta.new("v6_slaac_ip", "v6SlaacIp", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_ONLY, nil, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
        "v6dhcp_enable" => MoPropertyMeta.new("v6dhcp_enable", "v6dhcpEnable", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x100000, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "v6dns_alternate" => MoPropertyMeta.new("v6dns_alternate", "v6dnsAlternate", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x200000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
        "v6dns_preferred" => MoPropertyMeta.new("v6dns_preferred", "v6dnsPreferred", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x400000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
        "v6dns_using_dhcp" => MoPropertyMeta.new("v6dns_using_dhcp", "v6dnsUsingDhcp", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x800000, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "v6ext_enabled" => MoPropertyMeta.new("v6ext_enabled", "v6extEnabled", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x1000000, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "v6ext_gw" => MoPropertyMeta.new("v6ext_gw", "v6extGw", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x2000000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
        "v6ext_ip" => MoPropertyMeta.new("v6ext_ip", "v6extIp", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x4000000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
        "v6link_local" => MoPropertyMeta.new("v6link_local", "v6linkLocal", "string", VersionMeta::VERSION201A, MoPropertyMeta::READ_ONLY, nil, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
        "v6prefix" => MoPropertyMeta.new("v6prefix", "v6prefix", "uint", VersionMeta::VERSION201A, MoPropertyMeta::READ_WRITE, 0x8000000, nil, nil, nil, [], ["1-128"]), 
        "vic_slot" => MoPropertyMeta.new("vic_slot", "vicSlot", "string", VersionMeta::VERSION202C, MoPropertyMeta::READ_WRITE, 0x10000000, nil, nil, nil, ["0", "1", "10", "2", "4", "5", "9", "flex-lom", "mlom", "riser1", "riser2"], []), 
        "vlan_enable" => MoPropertyMeta.new("vlan_enable", "vlanEnable", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20000000, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "vlan_id" => MoPropertyMeta.new("vlan_id", "vlanId", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40000000, nil, nil, nil, [], ["1-4094"]), 
        "vlan_priority" => MoPropertyMeta.new("vlan_priority", "vlanPriority", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80000000, nil, nil, nil, [], ["0-7"]), 
        },

        "modular" => {
            "admin_duplex" => MoPropertyMeta.new("admin_duplex", "adminDuplex", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["NA", "auto", "full", "half"], []), 
            "admin_net_speed" => MoPropertyMeta.new("admin_net_speed", "adminNetSpeed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, nil, nil, nil, ["100Mbps", "10Mbps", "1Gbps", "NA", "auto"], []), 
            "auto_neg" => MoPropertyMeta.new("auto_neg", "autoNeg", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "ddns_domain" => MoPropertyMeta.new("ddns_domain", "ddnsDomain", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, nil, [], []), 
            "ddns_enable" => MoPropertyMeta.new("ddns_enable", "ddnsEnable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "dhcp_enable" => MoPropertyMeta.new("dhcp_enable", "dhcpEnable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, 0, 255, nil, [], []), 
            "dns_alternate" => MoPropertyMeta.new("dns_alternate", "dnsAlternate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "dns_preferred" => MoPropertyMeta.new("dns_preferred", "dnsPreferred", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "dns_using_dhcp" => MoPropertyMeta.new("dns_using_dhcp", "dnsUsingDhcp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "ext_enabled" => MoPropertyMeta.new("ext_enabled", "extEnabled", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "ext_gw" => MoPropertyMeta.new("ext_gw", "extGw", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "ext_ip" => MoPropertyMeta.new("ext_ip", "extIp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "ext_mask" => MoPropertyMeta.new("ext_mask", "extMask", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "hostname" => MoPropertyMeta.new("hostname", "hostname", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4000, 0, 63, %q{(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])}, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "if_type" => MoPropertyMeta.new("if_type", "ifType", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["physical", "virtual"], []), 
            "mac" => MoPropertyMeta.new("mac", "mac", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "nic_mode" => MoPropertyMeta.new("nic_mode", "nicMode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8000, nil, nil, nil, ["cisco_card", "dedicated", "shared_lom", "shared_lom_10g", "shared_lom_ext", "shipping"], []), 
            "nic_redundancy" => MoPropertyMeta.new("nic_redundancy", "nicRedundancy", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10000, nil, nil, nil, ["active-active", "active-standby", "none"], []), 
            "oper_duplex" => MoPropertyMeta.new("oper_duplex", "operDuplex", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["NA", "auto", "full", "half"], []), 
            "oper_net_speed" => MoPropertyMeta.new("oper_net_speed", "operNetSpeed", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["100Mbps", "10Mbps", "1Gbps", "NA", "auto"], []), 
            "port_profile" => MoPropertyMeta.new("port_profile", "portProfile", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20000, nil, nil, %q{[a-zA-Z0-9_\-]{0,80}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40000, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "subject" => MoPropertyMeta.new("subject", "subject", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "v6_slaac_ip" => MoPropertyMeta.new("v6_slaac_ip", "v6SlaacIp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v6dhcp_enable" => MoPropertyMeta.new("v6dhcp_enable", "v6dhcpEnable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100000, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "v6dns_alternate" => MoPropertyMeta.new("v6dns_alternate", "v6dnsAlternate", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v6dns_preferred" => MoPropertyMeta.new("v6dns_preferred", "v6dnsPreferred", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v6dns_using_dhcp" => MoPropertyMeta.new("v6dns_using_dhcp", "v6dnsUsingDhcp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800000, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "v6ext_enabled" => MoPropertyMeta.new("v6ext_enabled", "v6extEnabled", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000000, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "v6ext_gw" => MoPropertyMeta.new("v6ext_gw", "v6extGw", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v6ext_ip" => MoPropertyMeta.new("v6ext_ip", "v6extIp", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4000000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v6link_local" => MoPropertyMeta.new("v6link_local", "v6linkLocal", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v6prefix" => MoPropertyMeta.new("v6prefix", "v6prefix", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8000000, nil, nil, nil, [], ["1-128"]), 
            "vic_slot" => MoPropertyMeta.new("vic_slot", "vicSlot", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10000000, nil, nil, nil, ["0", "1", "10", "2", "4", "5", "9", "flex-lom", "riser1", "riser2"], []), 
            "vlan_enable" => MoPropertyMeta.new("vlan_enable", "vlanEnable", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20000000, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "vlan_id" => MoPropertyMeta.new("vlan_id", "vlanId", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40000000, nil, nil, nil, [], ["1-4094"]), 
            "vlan_priority" => MoPropertyMeta.new("vlan_priority", "vlanPriority", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80000000, nil, nil, nil, [], ["0-7"]), 
            "v4_ip_addr" => MoPropertyMeta.new("v4_ip_addr", "v4IPAddr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100000000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "v4_ip_addr_bmc1" => MoPropertyMeta.new("v4_ip_addr_bmc1", "v4IPAddrBmc1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200000000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "v4_ip_addr_bmc2" => MoPropertyMeta.new("v4_ip_addr_bmc2", "v4IPAddrBmc2", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400000000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "v4_ip_addr_cmc1" => MoPropertyMeta.new("v4_ip_addr_cmc1", "v4IPAddrCmc1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800000000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "v4_ip_addr_cmc2" => MoPropertyMeta.new("v4_ip_addr_cmc2", "v4IPAddrCmc2", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000000000, 0, 256, %q{(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)}, [], []), 
            "v6_ip_addr" => MoPropertyMeta.new("v6_ip_addr", "v6IPAddr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000000000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v6_ip_addr_bmc1" => MoPropertyMeta.new("v6_ip_addr_bmc1", "v6IPAddrBmc1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4000000000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v6_ip_addr_bmc2" => MoPropertyMeta.new("v6_ip_addr_bmc2", "v6IPAddrBmc2", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8000000000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v6_ip_addr_cmc1" => MoPropertyMeta.new("v6_ip_addr_cmc1", "v6IPAddrCmc1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10000000000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v6_ip_addr_cmc2" => MoPropertyMeta.new("v6_ip_addr_cmc2", "v6IPAddrCmc2", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20000000000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [], []), 
            "v_hostname" => MoPropertyMeta.new("v_hostname", "vHostname", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40000000000, 0, 63, %q{(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])}, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminDuplex" => "admin_duplex", 
        "adminNetSpeed" => "admin_net_speed", 
        "autoNeg" => "auto_neg", 
        "childAction" => "child_action", 
        "ddnsDomain" => "ddns_domain", 
        "ddnsEnable" => "ddns_enable", 
        "description" => "description", 
        "dhcpEnable" => "dhcp_enable", 
        "dn" => "dn", 
        "dnsAlternate" => "dns_alternate", 
        "dnsPreferred" => "dns_preferred", 
        "dnsUsingDhcp" => "dns_using_dhcp", 
        "extEnabled" => "ext_enabled", 
        "extGw" => "ext_gw", 
        "extIp" => "ext_ip", 
        "extMask" => "ext_mask", 
        "hostname" => "hostname", 
        "id" => "id", 
        "ifType" => "if_type", 
        "mac" => "mac", 
        "nicMode" => "nic_mode", 
        "nicRedundancy" => "nic_redundancy", 
        "operDuplex" => "oper_duplex", 
        "operNetSpeed" => "oper_net_speed", 
        "portProfile" => "port_profile", 
        "rn" => "rn", 
        "status" => "status", 
        "subject" => "subject", 
        "v6SlaacIp" => "v6_slaac_ip", 
        "v6dhcpEnable" => "v6dhcp_enable", 
        "v6dnsAlternate" => "v6dns_alternate", 
        "v6dnsPreferred" => "v6dns_preferred", 
        "v6dnsUsingDhcp" => "v6dns_using_dhcp", 
        "v6extEnabled" => "v6ext_enabled", 
        "v6extGw" => "v6ext_gw", 
        "v6extIp" => "v6ext_ip", 
        "v6linkLocal" => "v6link_local", 
        "v6prefix" => "v6prefix", 
        "vicSlot" => "vic_slot", 
        "vlanEnable" => "vlan_enable", 
        "vlanId" => "vlan_id", 
        "vlanPriority" => "vlan_priority", 
        },

        "modular" => {
            "adminDuplex" => "admin_duplex", 
            "adminNetSpeed" => "admin_net_speed", 
            "autoNeg" => "auto_neg", 
            "childAction" => "child_action", 
            "ddnsDomain" => "ddns_domain", 
            "ddnsEnable" => "ddns_enable", 
            "description" => "description", 
            "dhcpEnable" => "dhcp_enable", 
            "dn" => "dn", 
            "dnsAlternate" => "dns_alternate", 
            "dnsPreferred" => "dns_preferred", 
            "dnsUsingDhcp" => "dns_using_dhcp", 
            "extEnabled" => "ext_enabled", 
            "extGw" => "ext_gw", 
            "extIp" => "ext_ip", 
            "extMask" => "ext_mask", 
            "hostname" => "hostname", 
            "id" => "id", 
            "ifType" => "if_type", 
            "mac" => "mac", 
            "nicMode" => "nic_mode", 
            "nicRedundancy" => "nic_redundancy", 
            "operDuplex" => "oper_duplex", 
            "operNetSpeed" => "oper_net_speed", 
            "portProfile" => "port_profile", 
            "rn" => "rn", 
            "status" => "status", 
            "subject" => "subject", 
            "v6SlaacIp" => "v6_slaac_ip", 
            "v6dhcpEnable" => "v6dhcp_enable", 
            "v6dnsAlternate" => "v6dns_alternate", 
            "v6dnsPreferred" => "v6dns_preferred", 
            "v6dnsUsingDhcp" => "v6dns_using_dhcp", 
            "v6extEnabled" => "v6ext_enabled", 
            "v6extGw" => "v6ext_gw", 
            "v6extIp" => "v6ext_ip", 
            "v6linkLocal" => "v6link_local", 
            "v6prefix" => "v6prefix", 
            "vicSlot" => "vic_slot", 
            "vlanEnable" => "vlan_enable", 
            "vlanId" => "vlan_id", 
            "vlanPriority" => "vlan_priority", 
            "v4IPAddr" => "v4_ip_addr", 
            "v4IPAddrBmc1" => "v4_ip_addr_bmc1", 
            "v4IPAddrBmc2" => "v4_ip_addr_bmc2", 
            "v4IPAddrCmc1" => "v4_ip_addr_cmc1", 
            "v4IPAddrCmc2" => "v4_ip_addr_cmc2", 
            "v6IPAddr" => "v6_ip_addr", 
            "v6IPAddrBmc1" => "v6_ip_addr_bmc1", 
            "v6IPAddrBmc2" => "v6_ip_addr_bmc2", 
            "v6IPAddrCmc1" => "v6_ip_addr_cmc1", 
            "v6IPAddrCmc2" => "v6_ip_addr_cmc2", 
            "vHostname" => "v_hostname", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_duplex
    attr_accessor :admin_net_speed
    attr_accessor :auto_neg
    attr_reader :child_action
    attr_accessor :ddns_domain
    attr_accessor :ddns_enable
    attr_reader :description
    attr_accessor :dhcp_enable
    attr_accessor :dns_alternate
    attr_accessor :dns_preferred
    attr_accessor :dns_using_dhcp
    attr_reader :ext_enabled
    attr_accessor :ext_gw
    attr_accessor :ext_ip
    attr_accessor :ext_mask
    attr_accessor :hostname
    attr_reader :id
    attr_reader :if_type
    attr_reader :mac
    attr_accessor :nic_mode
    attr_accessor :nic_redundancy
    attr_reader :oper_duplex
    attr_reader :oper_net_speed
    attr_accessor :port_profile
    attr_accessor :status
    attr_reader :subject
    attr_reader :v6_slaac_ip
    attr_accessor :v6dhcp_enable
    attr_accessor :v6dns_alternate
    attr_accessor :v6dns_preferred
    attr_accessor :v6dns_using_dhcp
    attr_accessor :v6ext_enabled
    attr_accessor :v6ext_gw
    attr_accessor :v6ext_ip
    attr_reader :v6link_local
    attr_accessor :v6prefix
    attr_accessor :vic_slot
    attr_accessor :vlan_enable
    attr_accessor :vlan_id
    attr_accessor :vlan_priority


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_duplex = nil
        @admin_net_speed = nil
        @auto_neg = nil
        @child_action = nil
        @ddns_domain = nil
        @ddns_enable = nil
        @description = nil
        @dhcp_enable = nil
        @dns_alternate = nil
        @dns_preferred = nil
        @dns_using_dhcp = nil
        @ext_enabled = nil
        @ext_gw = nil
        @ext_ip = nil
        @ext_mask = nil
        @hostname = nil
        @id = nil
        @if_type = nil
        @mac = nil
        @nic_mode = nil
        @nic_redundancy = nil
        @oper_duplex = nil
        @oper_net_speed = nil
        @port_profile = nil
        @status = nil
        @subject = nil
        @v6_slaac_ip = nil
        @v6dhcp_enable = nil
        @v6dns_alternate = nil
        @v6dns_preferred = nil
        @v6dns_using_dhcp = nil
        @v6ext_enabled = nil
        @v6ext_gw = nil
        @v6ext_ip = nil
        @v6link_local = nil
        @v6prefix = nil
        @vic_slot = nil
        @vlan_enable = nil
        @vlan_id = nil
        @vlan_priority = nil
        @v4_ip_addr = nil
        @v4_ip_addr_bmc1 = nil
        @v4_ip_addr_bmc2 = nil
        @v4_ip_addr_cmc1 = nil
        @v4_ip_addr_cmc2 = nil
        @v6_ip_addr = nil
        @v6_ip_addr_bmc1 = nil
        @v6_ip_addr_bmc2 = nil
        @v6_ip_addr_cmc1 = nil
        @v6_ip_addr_cmc2 = nil
        @v_hostname = nil

        super(class_id: "MgmtIf", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
