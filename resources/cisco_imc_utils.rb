#Copyright 2017 Cisco Systems, Inc.
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#    http://www.apache.org/licenses/LICENSE-2.0
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

$:.unshift *Dir[::File.expand_path('../../files/default/vendor/gems/**/lib', __FILE__)]

begin
    require 'ImcSdk'
    HAS_IMCSDK = true
rescue
    HAS_IMCSDK = false
end

class ImcConnection

    def self.is_login_param(param)
        return ["ip", "username", "password",
                         "port", "secure", "proxy", "server"].include? param
    end
    attr_accessor :ip
    attr_accessor :username
    attr_accessor :password
    attr_accessor :port
    attr_accessor :secure
    attr_accessor :proxy
    attr_accessor :handle
    def initialize(ipaddress, account)
        if HAS_IMCSDK == false
            Chef::Log.error("Cisco IMC SDK is not installed")
            return
        end
        #self.ip = account["ip"]
        self.ip = ipaddress
        #account = data_bag_item("cisco_imc_accounts", "chef-client")
        self.username = account["user"]
        self.password = account["password"]
        self.port = account["port"]
        self.secure = account["secure"]
        self.proxy = account["proxy"]
        self.handle = nil
    end

    def login()
        begin
            self.handle = ImcHandle.new(ip: self.ip,
                               username: self.username,
                               password: self.password,
                               port: self.port,
                               secure: self.secure,
                               proxy: self.proxy)
                               #proxy=ansible["proxy"])
            self.handle.login()
        rescue Exception => e
            Chef::Log.error(e.to_s)
            return nil
        end
        return self.handle
    end
    def logout()
        begin
            if !self.handle.nil? and self.handle
                self.handle.logout()
                return true
            end
        rescue Exception => e
            Chef::Log.error(e.to_s)
            return false
        end
        return false
    end
end