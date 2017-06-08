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
require_relative "../lib/ImcSdk/apis/server/serveractions"

class ImcSdkServerActionsTest < Test::Unit::TestCase

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

    def test_serveractions
        assert_nothing_raised do
            # Power On CIMC
            mo = server_power_up(handle: @handle)
            assert_equal(mo.oper_power, "on", "Test Case: Power On Server:FAIL")
            puts "Test Case: Power ON Server: PASS"

            sleep 5
            #Power Down CIMC
            mo = server_power_down(handle: @handle)
            assert_equal(mo.oper_power, "off", "Test Case: Power OFF Server:FAIL")
            puts "Test Case: Power OFF Server: PASS"

            sleep 5
            #Gracefully Power Down CIMC
            mo = server_power_down_gracefully(handle: @handle)
            assert_equal(mo.oper_power, "off", "Test Case: Power OFF Server (Gracefully):FAIL")
            puts "Test Case: Power OFF Server (Gracefully): PASS"

            sleep 5
            #Reset CIMC
            server_power_up(handle: @handle)
            sleep 5
            mo = server_power_cycle(handle: @handle)
            assert_equal(mo.oper_power, "on", "Test Case: Power CYCLE Server:FAIL")
            puts "Test Case: Power CYCLE Server: PASS"

            sleep 5
            locator_led_on(handle: @handle)
            puts "Test Case: Locator LED ON: PASS"

            sleep 5
            locator_led_off(handle: @handle)
            puts "Test Case: Locator LED OFF: PASS"
        end
    end
end