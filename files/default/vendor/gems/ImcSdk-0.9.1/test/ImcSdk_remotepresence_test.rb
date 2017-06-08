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
require_relative "../lib/ImcSdk/apis/server/remotepresence"

class ImcSdkRemotePresenceTest < Test::Unit::TestCase

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

    def test_remotepresence
        assert_nothing_raised do
            #Enable SOL on CIMC
            sol_mo = sol_setup(handle: @handle, speed: '9600', comport: 'com0')
            assert(is_sol_enabled(handle: @handle), "Test Case: Enable SOL: FAIL")
            puts "Test Case: Enable SOL: PASS"

            sleep 5
            #Disable SOL on CIMC
            sol_disable(handle: @handle)
            assert(!is_sol_enabled(handle: @handle), "Test Case: Disable SOL: FAIL")
            puts "Test Case: Disable SOL: PASS"

            sleep 5
            #Enable KVM on CIMC
            kvm_mo = kvm_setup(handle: @handle)
            assert(is_kvm_enabled(handle: @handle), "Test Case: Enable KVM: FAIL")
            puts "Test Case: Enable KVM: PASS"
            
            sleep 5
            #Disable KVM on CIMC
            kvm_disable(handle: @handle)
            assert(!is_kvm_enabled(handle: @handle), "Test Case: Disable KVM: FAIL")
            puts "Test Case: Disable KVM: PASS"

        end
    end
end