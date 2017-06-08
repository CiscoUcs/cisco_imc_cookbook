#Copyright 2017 Cisco Systems, Inc.
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#    http://www.apache.org/licenses/LICENSE-2.0
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

$:.unshift *Dir[::File.expand_path('../../files/default/vendor/gems/**/lib', __FILE__)]

=begin
DOCUMENTATION
-------------------------
Resource Name: cisco_imc_ldap_config
short_description: Configure LDAP on a Cisco IMC server.
version_added: "0.9.1.0"
description:
  - Configure LDAP on a Cisco IMC server.
options:
    enabled:
        description: enable/disable the LDAP in Cisco IMC Server
        choices: [true, false]
        required: true
    basedn:
        description: Configure basedn for LDAP in Cisco IMC Server
        Choices: nil
        required: false
    domain:
        description: Configure domain for LDAP in Cisco IMC Server
        Choices: nil
        required: false
    encryption:
        description: Configure encyption setting for LDAP in Cisco IMC Server
        Choices: [true, false]
        required: false
        default: true
    timeout:
        description: Configure timeout setting for LDAP in Cisco IMC Server
        Choices:
        required: false
        default: 60
    user_search_precedence:
        description: Configure user_search_precedence for LDAP in Cisco IMC Server
        choices:["ldap-user-db", "local-user-db"]
        required: false
        default: "local-user-db"
    bind_method:
        description: Configure bind_method setting for LDAP in Cisco IMC Server
        Choices: ["anonymous", "configured-credentials", "login-credentials"]
        required: false
        default: "login-credentials"
    bind_dn:
        description: Configure bind_dn setting for LDAP in Cisco IMC Server
        Choices: 
        required: false
        default: 
    password:
        description: Configure password for LDAP in Cisco IMC Server
        Choices:
        required: false
        default:
    filter:
        description: Configure filter setting for LDAP in Cisco IMC Server
        Choices:
        required: false
        default: 'sAMAccountName'
    attribute:
        description: Configure attribute setting for LDAP in Cisco IMC Server
        Choices:
        required: false
        default: 'CiscoAvPair'
    group_attribute:
        description: Configure group_attribute setting for LDAP in Cisco IMC Server
        Choices:
        required: false
        default: 'memberOf'
    group_nested_search:
        description: Configure group_nested_search setting for LDAP in Cisco IMC Server
        Choices:
        required: false
        default: 128
    group_auth:
        description: Configure group_auth setting for LDAP in Cisco IMC Server
        Choices: [true, false]
        required: false
        default: false
    ldap_servers:
        description: Configure ldap_servers for LDAP in Cisco IMC Server
        Choices:
        required: false
        default:
    locate_directory_using_dns:
        description: Configure locate_directory_using_dns for LDAP in Cisco IMC Server
        Choices: [true, false]
        required: false
        default: false
    dns_domain_source:
        description: Configure dns_domain_source for LDAP in Cisco IMC Server
        Choices: ["configured-domain", "extracted-configured-domain", "extracted-domain"]
        required: false
        default: "extracted-domain"
    dns_search_domain:
        description: Configure dns_search_domain for LDAP in Cisco IMC Server
        Choices:
        required: false
        default:
    dns_search_forest:
        description: Configure dns_search_forest for LDAP in Cisco IMC Server
        Choices:
        required: false
        default:

    requirements: ['imcsdk']
    author: "Amit Mandal(amimanda@cisco.com)"
=end

=begin
EXAMPLE RECIPES
--------------------
cisco_imc_ldap_config 'configure ldap' do
    ipaddress '10.65.182.245'
    auth_data "imc_account"
    enabled true
    basedn 'DC=customer,DC=cisco,DC=com'
    domain 'customer.cisco.com'
    encryption true
    user_search_precedence 'ldap-user-db'
    bind_method 'anonymous'
    bind_dn 'DC=cisco,DC=com'
    password 'Nbv12345'
    filter 'sAMAccountName'
    attribute 'CiscoAvPair'
    group_attribute 'memberOf'
    group_nested_search 128
    group_auth true
    ldap_servers [{:id=>'2', :ip=>'10.106.233.253', :port=>'389'}]
    locate_directory_using_dns true
end

cisco_imc_ldap_config 'disable ldap' do
    ipaddress '10.65.182.245'
    auth_data "imc_account"
    enabled false
    action :disable
end
=end

require_relative './cisco_imc_utils'
require 'ImcSdk/apis/admin/ldap'

resource_name :cisco_imc_ldap_config

provides :cisco_imc_ldap_config

    property :ipaddress, String, required: true
    property :auth_data, String, required: true # data bag item name under cisco_imc_accounts data bag
    property :enabled, [TrueClass, FalseClass], required: true
    property :basedn, String, default: String.new
    property :domain, String, default: String.new
    property :encryption, [TrueClass, FalseClass], default: true
    property :timeout, Integer, default: 60
    property :user_search_precedence, String, equal_to: ["ldap-user-db", "local-user-db"]
    property :bind_method, String, equal_to: ["anonymous", "configured-credentials", "login-credentials"], default: 'login-credentials'
    property :bind_dn, String, default: String.new
    property :password, String, default: String.new
    property :filter, String, default: 'sAMAccountName'
    property :attribute, String, default: 'CiscoAvPair'
    property :group_attribute, String, default: 'memberOf'
    property :group_nested_search, Integer, default: 128
    property :group_auth, [TrueClass, FalseClass], default: false
    property :ldap_servers, Array, default: []
    property :locate_directory_using_dns, [TrueClass, FalseClass], default: false
    property :dns_domain_source, String, equal_to: ["configured-domain", "extracted-configured-domain", "extracted-domain"], default: 'extracted-domain'
    property :dns_search_domain, String
    property :dns_search_forest, String
    

    load_current_value do |property|

        account = data_bag_item(node[:databag][:name], property.auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(property.ipaddress, account)
        handle = imc_connection.login()

        begin

            exists, ldap_mo = ldap_settings_exist(handle: handle,
                                                :enabled => property.enabled,
                                                :basedn => property.basedn,
                                                :domain => property.domain,
                                                :encryption => property.encryption,
                                                :timeout => property.timeout,
                                                :user_search_precedence => property.user_search_precedence,
                                                :bind_method => property.bind_method,
                                                :bind_dn => property.bind_dn,
                                                :password => property.password,
                                                :filter => property.filter,
                                                :attribute => property.attribute,
                                                :group_attribute => property.group_attribute,
                                                :group_nested_search => property.group_nested_search,
                                                :group_auth => property.group_auth,
                                                :ldap_servers => property.ldap_servers,
                                                :locate_directory_using_dns => property.locate_directory_using_dns,
                                                :dns_domain_source => property.dns_domain_source,
                                                :dns_search_domain => property.dns_search_domain,
                                                :dns_search_forest => property.dns_search_forest)

            if !ldap_mo.nil?
		        enabled (ldap_mo.admin_state.downcase == "enabled" ? true : false)
                basedn ldap_mo.basedn
                domain ldap_mo.domain
                encryption (ldap_mo.encryption.downcase == "enabled" ? true : false)
                timeout ldap_mo.timeout.to_i
                user_search_precedence ldap_mo.user_search_precedence
                bind_method ldap_mo.bind_method
                bind_dn ldap_mo.bind_dn
                filter ldap_mo.filter
                attribute ldap_mo.attribute
                group_attribute ldap_mo.group_attribute
                group_nested_search ldap_mo.group_nested_search.to_i
                group_auth (ldap_mo.group_auth == "enabled" ? true : false)
                locate_directory_using_dns (ldap_mo.locate_directory_using_dns.downcase == "yes" or ldap_mo.locate_directory_using_dns.downcase == "true" ? true : false)
                dns_domain_source ldap_mo.dns_domain_source
                dns_search_domain ldap_mo.dns_search_domain
                dns_search_forest ldap_mo.dns_search_forest
	        else
		        enabled false
	        end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()  
        end
    end

    action :enable do

        account = data_bag_item(node[:databag][:name], auth_data)
        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        props = {}
        begin
            if handle.nil?
                raise "handle is nil"
            end
            if property_is_set?(:enabled)
                props[:enabled] = enabled
                converge_if_changed :enabled do
                    converge = true
                end
            end
            
            if property_is_set?(:basedn)
                props[:basedn] = basedn
                converge_if_changed :basedn do
                    converge = true
                end
            end
            if property_is_set?(:domain)
                props[:domain] = domain
                converge_if_changed :domain do
                    converge = true
                end
            end

            if property_is_set?(:encryption)
                props[:encryption] = encryption
                converge_if_changed :encryption do
                    converge = true
                end
            end

            if property_is_set?(:timeout)
                props[:timeout] = timeout
                converge_if_changed :timeout do
                    converge = true
                end
            end

            if property_is_set?(:user_search_precedence)
                props[:user_search_precedence] = user_search_precedence
                converge_if_changed :user_search_precedence do
                    converge = true    
                end      
            end
            
            if property_is_set?(:bind_method)
                props[:bind_method] = bind_method
                converge_if_changed :bind_method do
                    converge = true
                end
            end

            if property_is_set?(:bind_dn)
                props[:bind_dn] = bind_dn
                converge_if_changed :bind_dn do
                    converge = true
                end
            end

            if property_is_set?(:filter)
                props[:filter] = filter
                converge_if_changed :filter do
                    converge = true
                end
            end

            if property_is_set?(:attribute)
                props[:attribute] = attribute
                converge_if_changed :attribute do
                    converge = true
                end
            end

            if property_is_set?(:group_attribute)
                props[:group_attribute] = group_attribute
                converge_if_changed :group_attribute do
                    converge = true
                end
            end

            if property_is_set?(:group_nested_search)
                props[:group_nested_search] = group_nested_search
                converge_if_changed :group_nested_search do
                    converge = true
                end
            end

            if property_is_set?(:group_auth)
                props[:group_auth] = group_auth
                converge_if_changed :group_auth do
                    converge = true
                end
            end

            if property_is_set?(:locate_directory_using_dns)
                props[:locate_directory_using_dns] = locate_directory_using_dns
                converge_if_changed :locate_directory_using_dns do
                    converge = true
                end 
            end

            if property_is_set?(:dns_domain_source)
                props[:dns_domain_source] = dns_domain_source
                converge_if_changed :dns_domain_source do
                    converge = true
                end   
            end

            if property_is_set?(:dns_search_domain)
                props[:dns_search_domain] = dns_search_domain
                converge_if_changed :dns_search_domain do
                    converge = true
                end   
            end

            if property_is_set?(:dns_search_forest)
                props[:dns_search_forest] = dns_search_forest
                converge_if_changed :dns_search_forest do
                    converge = true
                end   
            end
            if property_is_set?(:ldap_servers)
                props[:ldap_servers] = ldap_servers
            end

            if property_is_set?(:password)
                props[:password] = password
            end

            if converge
                ldap_configure(handle: handle, **props)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()  
        end
    end

    action :disable do

        account = data_bag_item(node[:databag][:name], auth_data)

        #Login to Cisco IMC
        imc_connection = ImcConnection.new(ipaddress, account)
        handle = imc_connection.login()
        converge = false
        begin
            if handle.nil?
                raise "handle is nil"
            end
            converge_if_changed :enabled do
                converge = true 
            end

            if converge
                ldap_configure(handle: handle, enabled: false)
            end
        rescue => exception
            Chef::Log.error("Exception Occurred: #{exception.message}")
            Chef::Log.error("Exception Backtrace: #{exception.backtrace.join("\n\t")}")
        ensure
            imc_connection.logout()  
        end
    end

    action_class do
        def whyrun_supported?
            true
        end
    end