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
require_relative "../lib/ImcSdk/apis/server/bios"

class ImcSdkBiosTest < Test::Unit::TestCase

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


    def test_bios
        assert_nothing_raised do

            #Check if Bios Setting exists on CIMC

            exists, err, bios_mo = boot_order_precision_exists(handle: @handle)
            assert_equal(exists, true, "Test Case: Check Bios Setting Exists: FAIL")
            puts "Test Case: Check Bios setting exists: PASS"

            props = {}
            props[:reboot_on_update] = false
            props[:configured_boot_mode] = 'Legacy'
            props[:boot_devices] = [{:'order'=>'1', :'device-type'=>'usb', :'name'=>'usb'},{:'order'=>'2', :'device-type'=>'san', :'name'=>'san'}, {:'order'=>'3', :'device-type'=>'hdd', :'name'=>'hdd'}]
            props[:reapply] = false

            # Boot Order Precision Set

            bios_mo = boot_order_precision_set(handle: @handle, **props)
            exists, err, bios_mo = boot_order_precision_exists(handle: @handle, **props)
            assert(exists, "Test Case: Boot Order Precision Set: FAIL")
            puts "Test Case: Boot Order Precision Set: PASS"
        end
    end
end