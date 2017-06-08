# Copyright 2017 Cisco Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "test_helper"
require_relative "../lib/ImcSdk/apis/admin/ldap"

class ImcSdkLdapTest < Test::Unit::TestCase

    def	setup
        @handle = ImcHandle.new(ip: $CIMC_IPADDRESS,username: $CIMC_USER,password: $CIMC_PASSWORD,port: $CIMC_PORT,secure: $CIMC_SECURE_FLAG)
        #assert_raise ImcException do
                @handle.login()
                puts "CIMC Login: PASS"
        #end
        assert_not_nil(@handle.cookie)
    end

    def teardown
        @handle.logout()
        puts "CIMC Logout: PASS"
    end

    def test_ldap
        assert_nothing_raised do
            #Check if LDAP Setting exists on CIMC
            exists,mo = ldap_settings_exist(handle: @handle)
            assert_equal(true, exists, "Test Case: Check LDAP setting exists: FAIL" )
            puts "Test Case: Check LDAP setting exists: PASS"

            sleep 2
            # Enable LDAP Settings
            ldap_mo = ldap_configure(handle: @handle, :enabled => true)
            assert_equal(ldap_mo.admin_state, "enabled", "Test Case: Enable LDAP Settings: FAIL")
            puts "Test Case: Enable LDAP Settings: PASS"

            props = {}
            props[:enabled] = true
            props[:basedn] = 'DC=customer,DC=cisco,DC=com'
            props[:domain] = 'customer.cisco.com'
            props[:encryption] = false
            props[:user_search_precedence] = 'ldap-user-db'
            props[:bind_method] = 'anonymous'
            props[:bind_dn] = 'DC=cisco,DC=com'
            props[:filter] = 'sAMAccountName'
            props[:attribute] = 'CiscoAvPair'
            props[:group_attribute] = 'memberOf'
            props[:group_nested_search] = 128
            props[:group_auth] = true
            props[:ldap_server2] = '10.106.233.253'
            props[:ldap_server_port2] = '389'
            props[:locate_directory_using_dns] = true
            sleep 2
            #Enable LDAP Settings with parameters
            ldap_mo = ldap_configure(handle: @handle, **props)
            exists, mo = ldap_settings_exist(handle: @handle, **props)
            assert(exists, "Test Case: Enable LDAP Settings With Parameters: FAIL")
            puts "Test Case: Enable LDAP Settings With Parameters: PASS"

            sleep 2
            # Disable LDAP Settings
            ldap_mo = ldap_configure(handle: @handle, :enabled => false)
            assert_equal(ldap_mo.admin_state, "disabled", "Test Case: Disable LDAP Settings: FAIL")
            puts "Test Case: Disable LDAP Settings: PASS"


        end
    end

end