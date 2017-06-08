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
require_relative "../lib/ImcSdk/apis/admin/user"

class ImcSdkUserTest < Test::Unit::TestCase

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

    def test_user
        assert_nothing_raised do
            @name = "testuser"
            #Create Local User in CIMC
            user_mo = local_user_create(handle: @handle, name: @name, pwd: "Nbv12345", priv: "read-only")
            assert_equal(@name, user_mo.name, "Test Case: Create CIMC User: FAIL")
            assert_equal("read-only", user_mo.priv, "Test Case: Create CIMC User: FAIL")
            assert_equal(AaaUserConsts::ACCOUNT_STATUS_ACTIVE, user_mo.account_status, "Test Case: Create CIMC User: FAIL")
            puts "Test Case: Create CIMC Local User: PASS"

            sleep 2
            # Check if Local User exists in CIMC
            exists, user_mo = local_user_exists(handle: @handle, :name => @name, :priv => "read-only")
            assert_equal(true, exists, "Test Case: Check Local User exists: FAIL")
            puts "Test Case: Check Local User exists: PASS"

            sleep 2
            #Local User Modify in CIMC
            user_mo = local_user_modify(handle: @handle, name: @name, :priv => "admin", :pwd => "Cisco123")
            assert_equal(@name, user_mo.name, "Test Case: Modify CIMC Local User: FAIL")
            assert_equal("admin", user_mo.priv, "Test Case: Modify CIMC Local User: FAIL")
            assert_equal(AaaUserConsts::ACCOUNT_STATUS_ACTIVE, user_mo.account_status, "Test Case: Modify CIMC Local User: FAIL")
            puts "Test Case: Modify CIMC Local User: PASS"

            sleep 2
            #Local User Delete in CIMC
            user_mo = local_user_delete(handle: @handle, name: @name)
            #assert_equal(@name, user_mo.name, "Test Case: Delete CIMC Local User: FAIL")
            assert_equal(AaaUserConsts::ACCOUNT_STATUS_INACTIVE, user_mo.account_status, "Test Case: Delete CIMC Local User: FAIL")
            puts "Test Case: Delete CIMC Local User: PASS"

            sleep 2
            #Set Strong Password
            user_policy_mo = set_strong_password(handle: @handle, enable: true)
            assert_equal("enabled", user_policy_mo.user_password_policy, "Test Case: Set Strong Password: FAIL")
            puts "Test Case: Set Strong Password: PASS"


            sleep 2
            # Is Strong Password Set
            is_set = is_strong_password_set(handle: @handle)
            assert_equal(true, is_set, "Test Case: Is Strong Password Set: FAIL")
            puts "Test Case: Is Strong Password Set: PASS"

            sleep 2
            # Password Expiration Exists
            exists, pw_expiration_mo = password_expiration_exists(handle: @handle)
            assert_equal(true, exists, "Test Case: Password Expiration exists: FAIL")
            puts "Test Case: Password Expiration exists: PASS"

            sleep 2
            #Password Expiration Set
            pw_expiration_mo = password_expiration_set(handle: @handle, password_expiry_duration: 60, password_history: 4, password_notification_period: 10, password_grace_period: 3)
            assert_equal("60", pw_expiration_mo.password_expiry_duration, "Test Case: Password Expiration Set: FAIL")
            assert_equal("4", pw_expiration_mo.password_history, "Test Case: Password Expiration Set: FAIL")
            assert_equal("10", pw_expiration_mo.password_notification_period, "Test Case: Password Expiration Set: FAIL")
            assert_equal("3", pw_expiration_mo.password_grace_period, "Test Case: Password Expiration Set: FAIL")
            puts "Test Case: Password Expiration Set: PASS"

            #Password Expiration disable
            pw_expiration_mo = password_expiration_set(handle: @handle, password_expiry_duration: 0)
            assert_equal("0", pw_expiration_mo.password_expiry_duration, "Test Case: Password Expiration Disable: FAIL")
            puts "Test Case: Password Expiration Disable: PASS"
        end
    end
end
