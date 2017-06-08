#This module contains the general information for AaaLdap ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AaaLdapConsts
    BIND_METHOD_ANONYMOUS = "anonymous"
    BIND_METHOD_CONFIGURED_CREDENTIALS = "configured-credentials"
    BIND_METHOD_LOGIN_CREDENTIALS = "login-credentials"
    DNS_DOMAIN_SOURCE_CONFIGURED_DOMAIN = "configured-domain"
    DNS_DOMAIN_SOURCE_EXTRACTED_CONFIGURED_DOMAIN = "extracted-configured-domain"
    DNS_DOMAIN_SOURCE_EXTRACTED_DOMAIN = "extracted-domain"
    LOCATE_DIRECTORY_USING_DNS_NO = "no"
    LOCATE_DIRECTORY_USING_DNS_YES = "yes"
    USER_SEARCH_PRECEDENCE_LDAP_USER_DB = "ldap-user-db"
    USER_SEARCH_PRECEDENCE_LOCAL_USER_DB = "local-user-db"
end


class AaaLdap < ManagedObject
    #This is AaaLdap class.

    @@consts = AaaLdapConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("AaaLdap", "aaaLdap", "ldap-ext", VersionMeta::VERSION151F, "InputOutput", 0x3ffffffff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
        "modular" => MoMeta.new("AaaLdap", "aaaLdap", "ldap-ext", VersionMeta::VERSION2013E, "InputOutput", 0x1ffffffff, [], ["admin", "read-only", "user"], ["Get", "Set"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "attribute" => MoPropertyMeta.new("attribute", "attribute", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4, 0, 64, %q{[a-zA-Z0-9][a-zA-Z0-9\-\.]*[a-zA-Z0-9\-]}, [], []), 
        "basedn" => MoPropertyMeta.new("basedn", "basedn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x8, 0, 254, nil, [], []), 
        "bind_dn" => MoPropertyMeta.new("bind_dn", "bindDn", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x10, 0, 254, nil, [], []), 
        "bind_method" => MoPropertyMeta.new("bind_method", "bindMethod", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["anonymous", "configured-credentials", "login-credentials"], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "dns_domain_source" => MoPropertyMeta.new("dns_domain_source", "dnsDomainSource", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["configured-domain", "extracted-configured-domain", "extracted-domain"], []), 
        "dns_search_domain" => MoPropertyMeta.new("dns_search_domain", "dnsSearchDomain", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x100, 0, 64, %q{[a-zA-Z][a-zA-Z0-9\.\-]*[a-zA-Z0-9]}, [], []), 
        "dns_search_forest" => MoPropertyMeta.new("dns_search_forest", "dnsSearchForest", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x200, 0, 64, %q{[a-zA-Z][a-zA-Z0-9\.\-]*[a-zA-Z0-9]}, [], []), 
        "domain" => MoPropertyMeta.new("domain", "domain", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x400, 1, 255, nil, [], []), 
        "encryption" => MoPropertyMeta.new("encryption", "encryption", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "filter" => MoPropertyMeta.new("filter", "filter", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x1000, 0, 20, %q{([a-zA-Z0-9][a-zA-Z0-9_#@$%&\-\^]*[a-zA-Z0-9\-]){0,20}}, [], []), 
        "group_attribute" => MoPropertyMeta.new("group_attribute", "groupAttribute", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x2000, 0, 254, %q{[a-zA-Z0-9][a-zA-Z0-9_#@$%&\-\^]*[a-zA-Z0-9\-]}, [], []), 
        "group_auth" => MoPropertyMeta.new("group_auth", "groupAuth", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x4000, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "ldap_server1" => MoPropertyMeta.new("ldap_server1", "ldapServer1", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x8000, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [""], []), 
        "ldap_server2" => MoPropertyMeta.new("ldap_server2", "ldapServer2", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x10000, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [""], []), 
        "ldap_server3" => MoPropertyMeta.new("ldap_server3", "ldapServer3", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x20000, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [""], []), 
        "ldap_server4" => MoPropertyMeta.new("ldap_server4", "ldapServer4", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x40000, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [""], []), 
        "ldap_server5" => MoPropertyMeta.new("ldap_server5", "ldapServer5", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x80000, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [""], []), 
        "ldap_server6" => MoPropertyMeta.new("ldap_server6", "ldapServer6", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x100000, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [""], []), 
        "ldap_server_port1" => MoPropertyMeta.new("ldap_server_port1", "ldapServerPort1", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x200000, nil, nil, nil, [], ["1-65535"]), 
        "ldap_server_port2" => MoPropertyMeta.new("ldap_server_port2", "ldapServerPort2", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x400000, nil, nil, nil, [], ["1-65535"]), 
        "ldap_server_port3" => MoPropertyMeta.new("ldap_server_port3", "ldapServerPort3", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x800000, nil, nil, nil, [], ["1-65535"]), 
        "ldap_server_port4" => MoPropertyMeta.new("ldap_server_port4", "ldapServerPort4", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x1000000, nil, nil, nil, [], ["1-65535"]), 
        "ldap_server_port5" => MoPropertyMeta.new("ldap_server_port5", "ldapServerPort5", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x2000000, nil, nil, nil, [], ["1-65535"]), 
        "ldap_server_port6" => MoPropertyMeta.new("ldap_server_port6", "ldapServerPort6", "uint", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x4000000, nil, nil, nil, [], ["1-65535"]), 
        "locate_directory_using_dns" => MoPropertyMeta.new("locate_directory_using_dns", "locateDirectoryUsingDNS", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x8000000, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION151X, MoPropertyMeta::READ_WRITE, 0x10000000, nil, nil, %q{[\S+]{0,254}}, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x20000000, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x40000000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "timeout" => MoPropertyMeta.new("timeout", "timeout", "uint", VersionMeta::VERSION151F, MoPropertyMeta::READ_WRITE, 0x80000000, nil, nil, nil, [], ["0-180", "0-1800"]), 
        "user_search_precedence" => MoPropertyMeta.new("user_search_precedence", "userSearchPrecedence", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100000000, nil, nil, nil, ["ldap-user-db", "local-user-db"], []), 
        "group_nested_search" => MoPropertyMeta.new("group_nested_search", "groupNestedSearch", "uint", VersionMeta::VERSION204C, MoPropertyMeta::READ_WRITE, 0x200000000, nil, nil, nil, [], ["1-128"]), 
        },

        "modular" => {
            "admin_state" => MoPropertyMeta.new("admin_state", "adminState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "attribute" => MoPropertyMeta.new("attribute", "attribute", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4, 0, 64, %q{[a-zA-Z0-9][a-zA-Z0-9\-\.]*[a-zA-Z0-9\-]}, [], []), 
            "basedn" => MoPropertyMeta.new("basedn", "basedn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8, 0, 254, nil, [], []), 
            "bind_dn" => MoPropertyMeta.new("bind_dn", "bindDn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10, 0, 254, nil, [], []), 
            "bind_method" => MoPropertyMeta.new("bind_method", "bindMethod", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["anonymous", "configured-credentials", "login-credentials"], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
            "dns_domain_source" => MoPropertyMeta.new("dns_domain_source", "dnsDomainSource", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["configured-domain", "extracted-configured-domain", "extracted-domain"], []), 
            "dns_search_domain" => MoPropertyMeta.new("dns_search_domain", "dnsSearchDomain", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100, 0, 63, %q{([a-zA-Z][a-zA-Z0-9\.\-]*[a-zA-Z0-9]){0,63}}, [], []), 
            "dns_search_forest" => MoPropertyMeta.new("dns_search_forest", "dnsSearchForest", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200, 0, 63, %q{([a-zA-Z][a-zA-Z0-9\.\-]*[a-zA-Z0-9]){0,63}}, [], []), 
            "domain" => MoPropertyMeta.new("domain", "domain", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400, 1, 255, nil, [], []), 
            "encryption" => MoPropertyMeta.new("encryption", "encryption", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "filter" => MoPropertyMeta.new("filter", "filter", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000, 0, 20, %q{([a-zA-Z0-9][a-zA-Z0-9_#@$%&\-\^]*[a-zA-Z0-9\-]){0,20}}, [], []), 
            "group_attribute" => MoPropertyMeta.new("group_attribute", "groupAttribute", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000, 0, 254, %q{[a-zA-Z0-9][a-zA-Z0-9_#@$%&\-\^]*[a-zA-Z0-9\-]}, [], []), 
            "group_auth" => MoPropertyMeta.new("group_auth", "groupAuth", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4000, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
            "ldap_server1" => MoPropertyMeta.new("ldap_server1", "ldapServer1", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [""], []), 
            "ldap_server2" => MoPropertyMeta.new("ldap_server2", "ldapServer2", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [""], []), 
            "ldap_server3" => MoPropertyMeta.new("ldap_server3", "ldapServer3", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [""], []), 
            "ldap_server4" => MoPropertyMeta.new("ldap_server4", "ldapServer4", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [""], []), 
            "ldap_server5" => MoPropertyMeta.new("ldap_server5", "ldapServer5", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [""], []), 
            "ldap_server6" => MoPropertyMeta.new("ldap_server6", "ldapServer6", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x100000, 0, 255, %q{([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:}, [""], []), 
            "ldap_server_port1" => MoPropertyMeta.new("ldap_server_port1", "ldapServerPort1", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x200000, nil, nil, nil, [], ["1-65535"]), 
            "ldap_server_port2" => MoPropertyMeta.new("ldap_server_port2", "ldapServerPort2", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x400000, nil, nil, nil, [], ["1-65535"]), 
            "ldap_server_port3" => MoPropertyMeta.new("ldap_server_port3", "ldapServerPort3", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x800000, nil, nil, nil, [], ["1-65535"]), 
            "ldap_server_port4" => MoPropertyMeta.new("ldap_server_port4", "ldapServerPort4", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x1000000, nil, nil, nil, [], ["1-65535"]), 
            "ldap_server_port5" => MoPropertyMeta.new("ldap_server_port5", "ldapServerPort5", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x2000000, nil, nil, nil, [], ["1-65535"]), 
            "ldap_server_port6" => MoPropertyMeta.new("ldap_server_port6", "ldapServerPort6", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x4000000, nil, nil, nil, [], ["1-65535"]), 
            "locate_directory_using_dns" => MoPropertyMeta.new("locate_directory_using_dns", "locateDirectoryUsingDNS", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x8000000, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
            "password" => MoPropertyMeta.new("password", "password", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x10000000, nil, nil, %q{[\S+]{0,254}}, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x20000000, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x40000000, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
            "timeout" => MoPropertyMeta.new("timeout", "timeout", "uint", VersionMeta::VERSION2013E, MoPropertyMeta::READ_WRITE, 0x80000000, nil, nil, nil, [], ["0-180", "0-1800"]), 
            "user_search_precedence" => MoPropertyMeta.new("user_search_precedence", "userSearchPrecedence", "string", VersionMeta::VERSION301C, MoPropertyMeta::READ_WRITE, 0x100000000, nil, nil, nil, ["ldap-user-db", "local-user-db"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminState" => "admin_state", 
        "attribute" => "attribute", 
        "basedn" => "basedn", 
        "bindDn" => "bind_dn", 
        "bindMethod" => "bind_method", 
        "dn" => "dn", 
        "dnsDomainSource" => "dns_domain_source", 
        "dnsSearchDomain" => "dns_search_domain", 
        "dnsSearchForest" => "dns_search_forest", 
        "domain" => "domain", 
        "encryption" => "encryption", 
        "filter" => "filter", 
        "groupAttribute" => "group_attribute", 
        "groupAuth" => "group_auth", 
        "ldapServer1" => "ldap_server1", 
        "ldapServer2" => "ldap_server2", 
        "ldapServer3" => "ldap_server3", 
        "ldapServer4" => "ldap_server4", 
        "ldapServer5" => "ldap_server5", 
        "ldapServer6" => "ldap_server6", 
        "ldapServerPort1" => "ldap_server_port1", 
        "ldapServerPort2" => "ldap_server_port2", 
        "ldapServerPort3" => "ldap_server_port3", 
        "ldapServerPort4" => "ldap_server_port4", 
        "ldapServerPort5" => "ldap_server_port5", 
        "ldapServerPort6" => "ldap_server_port6", 
        "locateDirectoryUsingDNS" => "locate_directory_using_dns", 
        "password" => "password", 
        "rn" => "rn", 
        "status" => "status", 
        "timeout" => "timeout", 
        "userSearchPrecedence" => "user_search_precedence", 
        "groupNestedSearch" => "group_nested_search", 
        },

        "modular" => {
            "adminState" => "admin_state", 
            "attribute" => "attribute", 
            "basedn" => "basedn", 
            "bindDn" => "bind_dn", 
            "bindMethod" => "bind_method", 
            "dn" => "dn", 
            "dnsDomainSource" => "dns_domain_source", 
            "dnsSearchDomain" => "dns_search_domain", 
            "dnsSearchForest" => "dns_search_forest", 
            "domain" => "domain", 
            "encryption" => "encryption", 
            "filter" => "filter", 
            "groupAttribute" => "group_attribute", 
            "groupAuth" => "group_auth", 
            "ldapServer1" => "ldap_server1", 
            "ldapServer2" => "ldap_server2", 
            "ldapServer3" => "ldap_server3", 
            "ldapServer4" => "ldap_server4", 
            "ldapServer5" => "ldap_server5", 
            "ldapServer6" => "ldap_server6", 
            "ldapServerPort1" => "ldap_server_port1", 
            "ldapServerPort2" => "ldap_server_port2", 
            "ldapServerPort3" => "ldap_server_port3", 
            "ldapServerPort4" => "ldap_server_port4", 
            "ldapServerPort5" => "ldap_server_port5", 
            "ldapServerPort6" => "ldap_server_port6", 
            "locateDirectoryUsingDNS" => "locate_directory_using_dns", 
            "password" => "password", 
            "rn" => "rn", 
            "status" => "status", 
            "timeout" => "timeout", 
            "userSearchPrecedence" => "user_search_precedence", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_state
    attr_accessor :attribute
    attr_accessor :basedn
    attr_accessor :bind_dn
    attr_accessor :bind_method
    attr_accessor :dns_domain_source
    attr_accessor :dns_search_domain
    attr_accessor :dns_search_forest
    attr_accessor :domain
    attr_accessor :encryption
    attr_accessor :filter
    attr_accessor :group_attribute
    attr_accessor :group_auth
    attr_accessor :ldap_server1
    attr_accessor :ldap_server2
    attr_accessor :ldap_server3
    attr_accessor :ldap_server4
    attr_accessor :ldap_server5
    attr_accessor :ldap_server6
    attr_accessor :ldap_server_port1
    attr_accessor :ldap_server_port2
    attr_accessor :ldap_server_port3
    attr_accessor :ldap_server_port4
    attr_accessor :ldap_server_port5
    attr_accessor :ldap_server_port6
    attr_accessor :locate_directory_using_dns
    attr_accessor :password
    attr_accessor :status
    attr_accessor :timeout
    attr_accessor :user_search_precedence
    attr_accessor :group_nested_search


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_state = nil
        @attribute = nil
        @basedn = nil
        @bind_dn = nil
        @bind_method = nil
        @dns_domain_source = nil
        @dns_search_domain = nil
        @dns_search_forest = nil
        @domain = nil
        @encryption = nil
        @filter = nil
        @group_attribute = nil
        @group_auth = nil
        @ldap_server1 = nil
        @ldap_server2 = nil
        @ldap_server3 = nil
        @ldap_server4 = nil
        @ldap_server5 = nil
        @ldap_server6 = nil
        @ldap_server_port1 = nil
        @ldap_server_port2 = nil
        @ldap_server_port3 = nil
        @ldap_server_port4 = nil
        @ldap_server_port5 = nil
        @ldap_server_port6 = nil
        @locate_directory_using_dns = nil
        @password = nil
        @status = nil
        @timeout = nil
        @user_search_precedence = nil
        @group_nested_search = nil

        super(class_id: "AaaLdap", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
