# Copyright 2017 Cisco Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


$:.unshift(*Dir[::File.expand_path('./../../', File.dirname(__FILE__))])
require_relative "../utils.rb"


LDAP_SERVERS = ['ldap_server1', 'ldap_server2', 'ldap_server3',
                 'ldap_server4', 'ldap_server5', 'ldap_server6']
LDAP_SERVER_PORTS = ['ldap_server_port1', 'ldap_server_port2',
                      'ldap_server_port3', 'ldap_server_port4',
                      'ldap_server_port5', 'ldap_server_port6']
LDAP_DN = "sys/ldap-ext"

#
# Checks if the specified LDAP settings are already applied
#
# @param handle [ImcHandle] ImcHandle class object
# @param kwargs [Hash] Key-Value paired arguments
# @return [TrueClass, AaaLdap] if settings match
# @return [FalseClass, nil] if settings doen't match
# @example
#   match, mo = ldap_settings_exist(
#                        handle: handle, :enabled => true,
#                        :basedn => 'DC=LAB,DC=cisco,DC=com',
#                        :domain => 'LAB.cisco.com',
#                        :timeout => 20, :group_auth => true,
#                        :bind_dn => 'CN=administrator,CN=Users,DC=LAB,DC=cisco,DC=com',
#                        :password => 'abcdefg', :ldap_servers=>ldap_servers)
#
def ldap_settings_exist(handle:, **kwargs)

    mo = _get_mo(handle: handle, dn: LDAP_DN)

    params = _get_ldap_params(kwargs)
    if !mo.check_prop_match(**params)
        return false, mo
    end

    if _is_valid_arg('ldap_servers', kwargs)
        if ! _check_ldap_server_match(mo, kwargs.delete(:ldap_servers))
            return false, mo
        end
    end

    if !mo.check_prop_match(**kwargs)
        return false, mo
    end
    return true, mo
end

#
# Checks if LDAP is enabled
#
# @param handle [ImcHandle] ImcHandle class object
# @return [TrueClass, FalseClass]
# @example
#   is_ldap_enabled(handle: handle)
#
def is_ldap_enabled(handle:)
    mo = _get_mo(handle: handle, dn: LDAP_DN)
    return mo.admin_state.downcase == "enabled"
end

#
# Gets the ldap role group based on domain and name
#
# @param handle [ImcHandle] ImcHandle class object
# @param domain [String] The LDAP server domain the group resides in.
# @param name [String] The name of the group in the LDAP server database.
# @param kwargs [Hash] Key-Value paired arguments for future use
# @return [AaaLdapRoleGroup]
# @example
#   ldap_role_group_get(handle: handle, domain: 'abcd.pqrs.com', name: 'abcd')
#
def ldap_role_group_get(handle:, domain:, name:, **kwargs)
    mos = handle.query_classid('AaaLdapRoleGroup')
    for mo in mos
        if mo.domain == domain and mo.name == name
            return mo
        end
    end

    return nil
end

#
# Configures LDAP
#
# @param handle [ImcHandle] ImcHandle class object
# @param enabled [TrueClass, FalseClass] true to enable LDAP
# @param basedn [String] Represents the Base Distinguished Name. Describes where to load users and groups from.
#   It must be in the 'dc=domain,dc=com' format for Active Directory servers.
# @param domain [String] The domain that all users must be in.
# @param encryption [TrueClass, FalseClass] true to enable encryption
# @param timeout [Integer] The number of seconds the Cisco IMC waits until the LDAP search operation times out. Value must be between [0-180]
# @param user_search_precedence [String] Preference to search in local user db versus ldap user db, valid values ['local-user-db', 'ldap-user-db']
# @param bind_method [String] valid values ['login-credentials', 'configured-credentials', 'anonymous']
# @param bind_dn [String] Represents the distinguished name (DN) of the user.
#   This field is applicable only for bind_method='configured-credentials'
# @param password [String] The password of the user. This field is applicable only for bind_method='configured-credentials'
# @param filter [String] Represents the filter attribute in the schema on the LDAP server.
# @param attribute [String] Represents the role and locale information. Should match the attribute specified on the LDAP server.
# @param group_attribute [String] Represents the group attribute in the schema on the LDAP server.
# @param group_nested_search [Integer] Represents the depth of a nested group search
# @param group_auth [TrueClass, FalseClass] Enables authentication at the group level for LDAP users that are not found in the local user database.
# @param ldap_servers [Array] Represents the list of preconfigured LDAP server.
#   List of Hash in the format:-
#                             [{:id => 1, :ip => "192.168.1.1", :port => 300},
#                              {:id => 2, :ip => "192.168.1.2", :port => 400}]
# @param locate_directory_using_dns [TrueClass, FalseClass]
# @param dns_domain_source [String] Represents the method to obtain domain name
#   ['extracted-domain', 'configured-domain', 'extracted-configured-domain']
# @param dns_search_domain [String] Domain name to be used for DNS query. Disabled when domain_name_source='extracted-domain'
# @param dns_search_forest [String] Forest name to used for DNS query. Disabled when domain_name_source='extracted-domain'
# @param kwargs [Hash] Key-Value paired arguments. Reserved for future use
# @return [AaaLdap]
# @raise [ImcOperationError] when AaaLdap object doesn't exist
# @example
#   ldap_configure(handle: handle, enabled: true,
#                       basedn: 'DC=LAB,DC=cisco,DC=com',
#                       domain: 'LAB.cisco.com',
#                       timeout: 20, group_auth: true,
#                       bind_dn: 'CN=administrator,CN=Users,DC=LAB,DC=cisco,DC=com',
#                       password: 'abcdefg', ldap_servers: ldap_servers)
#
def ldap_configure(handle:, enabled: false, basedn: nil, domain: nil,
                   encryption: true, timeout: 60, user_search_precedence: 'local-user-db',
                   bind_method: 'login-credentials', bind_dn: nil,
                   password: nil, filter: 'sAMAccountName',
                   attribute: 'CiscoAvPair', group_attribute: 'memberOf',
                   group_nested_search: 128, group_auth: false,
                   ldap_servers: [], locate_directory_using_dns: false,
                   dns_domain_source: 'extracted-domain',
                   dns_search_domain: nil, dns_search_forest: nil, **kwargs)

    mo = _get_mo(handle: handle, dn: LDAP_DN)

    params = {
        
        :admin_state =>  enabled == true ? 'enabled' : 'disabled',
        :basedn => basedn,
        :domain => domain,
        :encryption => encryption == true ? 'enabled' : 'disabled',
        :timeout => timeout.to_s,
        :user_search_precedence => user_search_precedence,
        :bind_method => bind_method,
        :bind_dn => bind_dn,
        :password => password,
        :filter => filter,
        :attribute => attribute,
        :group_attribute => group_attribute,
        :group_nested_search => group_nested_search.to_s,
        :group_auth => group_auth == true ? 'enabled' : 'disabled',
        :locate_directory_using_dns => locate_directory_using_dns == true ? 'yes' : 'no',
        :dns_domain_source => dns_domain_source,
        :dns_search_domain => dns_search_domain,
        :dns_search_forest => dns_search_forest
        }

    mo.set_prop_multiple(**params)

    if ldap_servers
        _set_ldap_servers(mo, ldap_servers)
    end

    mo.set_prop_multiple(**kwargs)
    handle.set_mo(mo: mo)
    return handle.query_dn(dn: mo.dn)
end
#
# Enables ldap certificate management
#
# @param handle [ImcHandle] ImcHandle class object
# @return [LdapCACertificateManagement]
#
def ldap_certificate_management_enable(handle:)
    mo = _get_mo(handle: handle, dn: "sys/ldap-ext/ldap-ca-cert-mgmt")
    mo.set_prop(:binding_certificate, "enabled")
    handle.set_mo(mo: mo)
    return handle.query_dn(dn: mo.dn)
end
#
# Disables ldap certificate management
#
# @param handle [ImcHandle] ImcHandle class object
# @return [LdapCACertificateManagement]
#
def ldap_certificate_management_disable(handle:)
    mo = _get_mo(handle: handle, dn: "sys/ldap-ext/ldap-ca-cert-mgmt")
    mo.set_prop(:binding_certificate, "disabled")
    handle.set_mo(mo: mo)
    return handle.query_dn(dn: mo.dn)
end

private

def _set_ldap_servers(mo, ldap_servers)
    if ldap_servers.size > LDAP_SERVERS.size
        raise ImcOperationError.new("Configure LDAP", "Cannot configure more than #{_LDAP_SERVERS.size} servers")
    end
    servers = {}
    ports = {}
    for server in ldap_servers
        servers[("ldap_server" + server[:id].to_s).to_sym] = server[:ip]
        ports[("ldap_server_port" + server[:id].to_s).to_sym] = server[:port].to_s
    end
    mo.set_prop_multiple(**servers)
    mo.set_prop_multiple(**ports)
end


def _get_ldap_params(kwargs)
    params = {}

    if _is_valid_arg('enabled', kwargs)
        params[:admin_state] = kwargs.delete(:enabled)? 'enabled': 'disabled'
    end

    if _is_valid_arg('encryption', kwargs)
        params[:encryption] = kwargs.delete(:encryption)? 'enabled': 'disabled'
    end

    if _is_valid_arg('group_auth', kwargs)
        params[:group_auth] = kwargs.delete(:group_auth)? 'enabled': 'disabled'
    end

    if _is_valid_arg('locate_directory_using_dns', kwargs)
        params[:locate_directory_using_dns] = kwargs.delete(:locate_directory_using_dns)? 'yes': 'no'
    end

    if _is_valid_arg('timeout', kwargs)
        params[:timeout] = kwargs.delete(:timeout).to_s
    end

    if _is_valid_arg('group_nested_search', kwargs)
        params[:group_nested_search] = kwargs.delete(:group_nested_search).to_s
    end

    # pop the password property if it exists
    if _is_valid_arg('password', kwargs)
        kwargs.delete(:password)
    end

    return params

end

def _check_ldap_server_match(ldap_mo, ldap_servers)
    mo = AaaLdap.new(parent_mo_or_dn: "sys")
    _set_ldap_servers(mo, ldap_servers)
    for server, port in LDAP_SERVERS.zip(LDAP_SERVER_PORTS)
        conf_server = ldap_mo.instance_variable_get("@" + server)
        in_server = mo.instance_variable_get("@" +  server)

        match = _check_match(conf_server, in_server)
        # IMC assigns a default value of port even when a valid server ip is
        # not assigned. The following logic will skip checking for ports where
        # the server ip itself is not specified, but default port is set.
        if match.nil?
            next
        end

        if !match
            return false
        end

        conf_port = ldap_mo.instance_variable_get("@" + port)
        in_port = mo.instance_variable_get("@" + port)

        if _check_match(conf_port, in_port) == false
            return false
        end
    end
    return true
end

def _check_match(prop1, prop2)
    if _is_invalid_value(prop1) and _is_invalid_value(prop2)
        return nil
    end
    return prop1 == prop2
end

def _get_free_ldap_role_group_id(handle)
    mos = handle.query_classid('AaaLdapRoleGroup')
    for mo in mos
        if !mo.name and !mo.domain
            return mo.id
        end
    end
    raise ImcOperationError.new("LDAP role group create", "No free role group available")
end