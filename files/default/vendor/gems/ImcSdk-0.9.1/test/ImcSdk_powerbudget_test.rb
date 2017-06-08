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
require_relative "../lib/ImcSdk/apis/server/power"

class ImcSdkPowerBudgetTest < Test::Unit::TestCase

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

    def test_powerbudget
        assert_nothing_raised do

            #Server Power Characterization Get

            mo = server_power_budget_get(handle: @handle)
            puts "Test Case: Power Characterization Get: PASS"

            sleep 5
            #Server Power Characterization Enable
            power_mo = server_power_characterization_enable(handle: @handle)
            assert_equal(power_mo.pow_char_enable.downcase, "enabled", "Test Case: Power Characterization Enable: FAIL")
            puts "Test Case: Power Characterization Enable: PASS"

            sleep 5
            #Server Power Capping Enable
            mo = server_power_capping_enable(handle: @handle)
            #assert_equal(mo.pow_char_enable.downcase, "enabled", "Test Case: Power Characterization Enable: FAIL")
            puts "Test Case: Power Capping Enable: PASS"
            
            sleep 5
            #Server Power Capping Disable
            mo = server_power_capping_disable(handle: @handle)
            puts "Test Case: Power Capping Disable: PASS"

            sleep 5
            power_mo = server_power_characterization_disable(handle: @handle)
            assert_equal(power_mo.pow_char_enable.downcase, "disabled", "Test Case: Power Characterization Disable: FAIL")
            puts "Test Case: Power Characterization Disable: PASS"
        end
    end
end