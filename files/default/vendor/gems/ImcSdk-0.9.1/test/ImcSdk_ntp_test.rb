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
require_relative "../lib/ImcSdk/apis/admin/ntp"

class ImcSdkNtpTest < Test::Unit::TestCase

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

    def test_ntp
        assert_nothing_raised do
            #check if NTP Settings exists on CIMC
            exists, mo = ntp_settings_match(handle: @handle)
            assert_equal(true, exists, "Test Case: Check NTP setting exists: FAIL")
            puts "Test Case: Check NTP setting exists: PASS"

            sleep 2
            # Enable NTP Settings without servers
            @mo = ntp_enable(handle: @handle, ntp_servers: [{:id => 1, :ip => "10.105.219.95"}, {:id => 3, :ip => "10.105.219.106"}])
            assert_equal(@mo.ntp_enable, "yes", "Test Case: Enable NTP without server list: FAIL")
            puts "Test Case: Enable NTP without server list: PASS"

            sleep 2
            #Check if NTP is Enabled now
            assert_equal(true, is_ntp_enabled(handle: @handle), "Test Case: Check NTP is Enabled: FAIL")
            puts "Test Case: Check NTP is Enabled: PASS"

            sleep 2
            #Enable NTP Settings with Server list
            @mo = ntp_enable(handle: @handle, ntp_servers: [{:id => 1, :ip => "10.105.219.101"}, {:id => 2, :ip => "10.105.219.102"}, {:id => 3, :ip => "10.105.219.103"}, {:id => 4, :ip => "10.105.219.104"}])
            assert_equal(@mo.ntp_enable, "yes")
            assert_equal(@mo.ntp_server1, "10.105.219.101", "Test Case: Enable NTP with server list: FAIL")
            assert_equal(@mo.ntp_server2, "10.105.219.102", "Test Case: Enable NTP with server list: FAIL")
            assert_equal(@mo.ntp_server3, "10.105.219.103", "Test Case: Enable NTP with server list: FAIL")
            assert_equal(@mo.ntp_server4, "10.105.219.104", "Test Case: Enable NTP with server list: FAIL")
            puts "Test Case: Enable NTP with server list: PASS"

            sleep 2
            #Modify the NTP Server List
            @mo = ntp_servers_modify(handle: @handle, ntp_servers: [{:id => 1, :ip => "10.105.219.104"}, {:id => 2, :ip => "10.105.219.103"}, {:id => 3, :ip => "10.105.219.102"}, {:id => 4, :ip => "10.105.219.101"}])
            assert_equal(@mo.ntp_enable, "yes")
            assert_equal(@mo.ntp_server1, "10.105.219.104", "Test Case: Modify NTP server list: FAIL")
            assert_equal(@mo.ntp_server2, "10.105.219.103", "Test Case: Modify NTP server list: FAIL")
            assert_equal(@mo.ntp_server3, "10.105.219.102", "Test Case: Modify NTP server list: FAIL")
            assert_equal(@mo.ntp_server4, "10.105.219.101", "Test Case: Modify NTP server list: FAIL")
            puts "Test Case: Modify NTP server list: PASS"

            sleep 2
            #Disable NTP Now
            @mo = ntp_disable(handle: @handle)
            assert_equal(@mo.ntp_enable, "no", "Test Case: Disable NTP: FAIL")
            puts "Test Case: Disable NTP: PASS"

            sleep 2
            #Clear NTP Server List from CIMC
            @mo = ntp_servers_clear(handle: @handle)
            assert_equal(@mo.ntp_enable, "no", "Test Case: Clear NTP server list: FAIL")
            assert_equal(@mo.ntp_server1, "", "Test Case: Clear NTP server list: FAIL")
            assert_equal(@mo.ntp_server2, "", "Test Case: Clear NTP server list: FAIL")
            assert_equal(@mo.ntp_server3, "", "Test Case: Clear NTP server list: FAIL")
            assert_equal(@mo.ntp_server4, "", "Test Case: Clear NTP server list: FAIL")
            puts "Test Case: Clear NTP server list: PASS"
        end
    end
end
