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
require_relative "../lib/ImcSdk/apis/server/storage"

class ImcSdkStorageTest < Test::Unit::TestCase

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

    def test_storage
        assert_nothing_raised do
            props = {}
            props[:controller_type] = 'SAS'
            props[:controller_slot] = 'SLOT-HBA'
            props[:drive_group] = [[1]]
            props[:virtual_drive_name] = 'test-vd'
            props[:server_id] = 1

            #Create Virtual Drive on CIMC
            vd_mo = virtual_drive_create(handle: @handle, **props)
            sleep 5
            props.delete(:drive_group)
            exists, mo = virtual_drive_exists(handle: @handle, **props)
            assert(exists, "Test Case: Virtual Drive Create: FAIL")
            puts "Test Case: Virtual Drive Create: PASS"

            sleep 5
            #Delete Virtual Drive on CIMC
            virtual_drive_delete(handle: @handle, **props)
            sleep 5
            exists, mo = virtual_drive_exists(handle: @handle, **props)
            assert_equal(exists, false, "Test Case: Virtual Drive Delete: FAIL")
            puts "Test Case: Virtual Drive Delete: PASS"
        end
    end

end