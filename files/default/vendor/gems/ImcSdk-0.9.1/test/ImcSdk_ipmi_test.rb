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
require_relative "../lib/ImcSdk/apis/admin/ipmi"

class ImcSdkIpmiTest < Test::Unit::TestCase

    def	setup
        #@handle = ImcHandle.new(ip: "10.105.219.15",username: "admin",password: "Nbv12345",port: "80",secure: false)
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

    def test_ipmi
        assert_nothing_raised do
            #get current values of IPMI
            ipmi_mo = CommIpmiLan.new(parent_mo_or_dn: _get_comm_mo_dn(@handle))
            existing_ipmi_mo = @handle.query_dn(dn: ipmi_mo.dn)

            sleep 2
            #Enable IPMI
            ipmi_mo = ipmi_enable(handle: @handle, priv: CommIpmiLanConsts::PRIV_USER, key: '1'*40)
            assert_equal("enabled", ipmi_mo.admin_state, "Test Case: Enable IPMI: FAIL")
            assert_equal(CommIpmiLanConsts::PRIV_USER, ipmi_mo.priv, "Test Case: Enable IPMI: FAIL")
            assert_equal('1'*40, ipmi_mo.key, "Test Case: Enable IPMI: FAIL")
            puts "Test Case: Enable IPMI: PASS"

            sleep 2
            #Check if IPMI Enabled
            enabled = is_ipmi_enabled(handle: @handle)
            assert_equal(true, enabled, "Test Case: Is IPMI Enabled: FAIL")
            puts "Test Case: Is IPMI Enabled: PASS"

            sleep 2
            #Disable IPMI
            ipmi_mo = ipmi_disable(handle: @handle)
            assert_equal("disabled", ipmi_mo.admin_state, "Test Case: Disable IPMI: FAIL")
            puts "Test Case: Disable IPMI: PASS"

            #set previous values
            ipmi_mo.set_prop_multiple(:admin_state => existing_ipmi_mo.admin_state, :key => existing_ipmi_mo.key, :priv => existing_ipmi_mo.priv)
            @handle.set_mo(mo: ipmi_mo)
        end
    end
end
