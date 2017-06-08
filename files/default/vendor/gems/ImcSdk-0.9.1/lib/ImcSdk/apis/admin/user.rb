# Copyright 2017 Cisco Systems, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$:.unshift(*Dir[::File.expand_path('./../../', File.dirname(__FILE__))])
#This module implements apis to create/delete/modify local users

require "mometa/aaa/AaaUser"
require "mometa/aaa/AaaUserPolicy"
require "mometa/aaa/AaaUserPasswordExpiration"

#
# This method will enable/disable strong password policy for users.
#
# @param handle [ImcHandle] ImcHandle class object.
# @param enable [TrueClass, FalseClass] setting to true will enable strong password.
# @return [AaaUserPolicy] modified AaaUserPolicy object.
def set_strong_password(handle:, enable: false)
    mos = handle.query_classid(class_id: "AaaUserPolicy")
    user_policy = mos[0]
    enable ? user_policy.set_prop(:user_password_policy, "enabled") : user_policy.set_prop(:user_password_policy, "disabled")

    handle.set_mo(mo: user_policy)
    return handle.query_dn(dn: user_policy.dn)
end

#
# This method will check if strong password policy is enabled.
#
# @param handle [ImcHandle] ImcHandle class object.
# @return [TrueClass, FalseClass] true if strong password in enabled.
#
def is_strong_password_set(handle:)
    mos = handle.query_classid(class_id: "AaaUserPolicy")
    if mos.size == 0
        raise ImcOperationError.new("Check Password Strength", "MO does not exist")
    end
    return (mos[0].user_password_policy == "enabled")
end

#
# This method sets up the password expiration policy for local users
#
# @param handle [ImcHandle] ImcHandle class object.
# @param password_expiry_duration [Integer] The time period after which the set password expires.
# Setting this to zero will disable password expiry.
# @param password_history [Integer] Specifies in number of instances,
# the new password entered should not have been used in the past.
# @param password_notification_period [Integer] Specifies in number of days,
# the user will be notified before password expiry.
# @param password_grace_period [Integer] Specifies in number of days,
# the old password will still be valid after the password expiry
# @return [AaaUserPasswordExpiration] Modified AaaUserPasswordExpiration object.
def password_expiration_set(handle:,
                            password_expiry_duration:,
                            password_history: 0,
                            password_notification_period: 15,
                            password_grace_period: 0)

    mo = AaaUserPasswordExpiration.new(parent_mo_or_dn: "sys/user-ext")
    args = {
            :password_expiry_duration => password_expiry_duration.to_s,
            :password_history => password_history.to_s,
            :password_notification_period => password_notification_period.to_s,
            :password_grace_period => password_grace_period.to_s
            }
    mo.set_prop_multiple(**args)
    handle.set_mo(mo: mo)
    return handle.query_dn(dn: mo.dn)
end

#
# This method will check if the password expiration policy exists
#
# @param handle [ImcHandle] ImcHandle class object.
# @param kwargs [Hash] key-value paired arguments
# @return [TrueClass, AaaUserPasswordExpiration] if policy exists.
# @return [FalseClass, nil] if policy doesn't exist.
def password_expiration_exists(handle:, **kwargs)
    mo = AaaUserPasswordExpiration.new(parent_mo_or_dn: "sys/user-ext")
    mo = handle.query_dn(dn: mo.dn)
    if mo.nil?
        return false, nil
    end
    return mo.check_prop_match(**kwargs), mo
end

#
# This method will create a new local user and setup it's role.
#
# @param handle [ImcHandle] ImcHandle class object.
# @param name [String] username of the local user.
# @param pwd [String] password for the local user.
# @param priv [String] Priviledge of the local user. Values could be "admin", "read-only" or "user".
# @return [AaaUser] AaaUser object corresponding to the user created.
# @raise [Exception] if limit on the number of users has exceeded.
# @example 1
#   local_user_exists(handle, name, pwd, priv)
# @example 2
#   local_user_exists(handle, name)
# @note If the privileges have changed for an existing user, (1) will fail, but (2) will pass in that case.
#
def local_user_create(handle:, name:, pwd:, priv: "read-only")

    user = _get_local_user(handle, name)
    if !user.nil?
        return local_user_modify(handle: handle, name: name, :priv => priv, :account_status => AaaUserConsts::ACCOUNT_STATUS_ACTIVE)
    end

    available_user_id = _get_free_user_id(handle)

    new_user = AaaUser.new( parent_mo_or_dn: "sys/user-ext", id: available_user_id)
    args = {:name => name,
            :pwd => pwd,
            :priv => priv,
            :account_status => AaaUserConsts::ACCOUNT_STATUS_ACTIVE}
    new_user.set_prop_multiple(**args)

    handle.set_mo(mo: new_user)
    #return new_user
    return handle.query_dn(dn: new_user.dn)
end

#
# This method will modify the user with the username specified
#
# @param handle [ImcHandle] ImcHandle class object
# @param name [String] username of the local user to be modified.
# @param kwargs [Hash] key-value paired arguments
# @return [AaaUser] AaaUser object corresponding to the user modified.
# @raise [Exception] When the user not found.
#
def local_user_modify(handle:, name:, **kwargs)
    found_user = _get_local_user(handle, name)
    if found_user.nil?
        raise ImcOperationError.new("Modify Local User", "User doesn't exist")
    end

    found_user.set_prop_multiple(**kwargs)
    handle.set_mo(mo: found_user)
    return handle.query_dn(dn: found_user.dn)
end

#
# This method deactivates the user referred to by the username passed
#
# @param handle [ImcHandle] ImcHandle class object.
# @param name [String] username of the local user to be deleted.
# @return [nil]
# @raise [ImcOperationError] if the user is not found.
#
def local_user_delete(handle:, name:)
    found_user = _get_local_user(handle, name=name)
    if found_user.nil?
        raise ImcOperationError.new("Delete Local User", "User doesn't exist")
    end

    kwargs = {}
    kwargs[:admin_action] = AaaUserConsts::ADMIN_ACTION_CLEAR
    kwargs[:account_status] = AaaUserConsts::ACCOUNT_STATUS_INACTIVE
    kwargs[:priv] = AaaUserConsts::PRIV_READ_ONLY
    found_user.set_prop_multiple(**kwargs)

    handle.set_mo(mo: found_user)
    return handle.query_dn(dn: found_user.dn)
end

#
# This method checks if a user exists with attributes passed
#
# @param handle [ImcHandle] ImcHandle class object.
# @param kwargs [Hash] key-value paired arguments used for user attributes
# @return [TrueClass, AaaUser] if the user exists with the properties
# @return [FalseClass, nil] if the user doen't exist with the properties
# @example
#   local_user_exists(handle: handle, :user => "abc", :priv => "admin")
#
def local_user_exists(handle: nil, **kwargs)
    users = _get_local_users(handle)
    users.each do |user|
        if user.check_prop_match(**kwargs)
            return true, user
        end
    end
    return false, nil
end

private
def _get_free_user_id(handle)
    users = _get_local_users(handle)
    for user in users
        if user.account_status == AaaUserConsts::ACCOUNT_STATUS_INACTIVE && user.name.to_s.empty?
            return user.id
        end
    end

    raise ImcOperationError.new("Create Local User", "Max number of users already configured")
end
                         
def _get_local_users(handle)
    return handle.query_classid(class_id: "AaaUser")
end

def _get_local_user(handle, name)
    users = _get_local_users(handle)
    users.each do |user|
        if user.name == name
            return user
        end
    end
    return nil
end