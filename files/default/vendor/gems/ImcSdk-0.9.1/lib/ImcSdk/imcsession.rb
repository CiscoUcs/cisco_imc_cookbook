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

$:.unshift(*Dir[::File.expand_path('.',File.dirname(__FILE__))])

require 'imcexception'
require 'imcxmlcodec'
require 'imcdriver'
require 'imcmethodfactory'
require 'imccoremeta'
require 'imccoreutils'
require "mometa/top/TopSystem"

class ImcSession < Object

=begin
    ImcSession class is session interface for any Imc related communication.
    Parent class of ImcHandle, used internally by ImcHandle class.
=end
    attr_accessor :ip
    attr_accessor :username
    attr_accessor :password
    attr_accessor :proxy
    attr_accessor :uri
    attr_accessor :platform
    attr_accessor :model
    attr_accessor :imc
    attr_accessor :name
    attr_accessor :cookie
    attr_accessor :version
    attr_accessor :refresh_period
    attr_accessor :priv
    attr_accessor :domains
    attr_accessor :channel
    attr_accessor :evt_channel
    attr_accessor :last_update_time
    attr_accessor :force
    attr_accessor :session_id
    attr_accessor :driver
    attr_accessor :refresh_timer
    def initialize(ip:, username:, password:, port: "80", secure: nil, proxy: nil)
        @ip = ip
        @username = username
        @password = password
        @proxy = proxy
        @uri = _create_uri(port, secure)
        @platform = nil
        @model = nil
        @imc = ip
        @name = nil
        @cookie = nil
        @session_id = nil
        @version = nil
        @refresh_period = nil
        @priv = nil
        @domains = nil
        @channel = nil
        @evt_channel = nil
        @last_update_time = nil

        @refresh_timer = nil
        @force = false
        @dump_xml = false
        @redirect = false

        @driver = ImcDriver.new(proxy=@proxy)

    end

    def post(uri, data: nil, read: true, timeout: "60")
=begin
        sends the request and receives the response from imcm server

        Args:
            uri (str): URI of the  the imc Server
            data (str): request data to send via post request

        Returns:
            response xml string

        Example:
            response = post("http://192.168.1.1:80", data: xml_str)
=end
        response = self.driver.post(uri=uri, data=data, false, read=read, timeout=timeout)
        return response
    end

    def post_xml(xml_str, read: true, timeout: "60")
=begin
        sends the xml request and receives the response from imc server

        Args:
            xml_str (str): xml string
            read (bool): if True, returns response.read() else returns object.
            timeout (int): if set, this will be used as timeout in secs for urllib2

        Returns:
            response xml string

        Example:
            response = post_xml('<aaaLogin inName="user" inPassword="pass">')

=end

        imc_uri = self.uri + "/nuova"
        response_str = post(imc_uri, data: xml_str, read: read, timeout: timeout)

        return response_str
    end

    def dump_xml_request(elem)
        #TBD
    end

    def dump_xml_response(resp)
        
        #TBD implementation
    end

    def post_elem(elem, timeout: "60")
=begin
        sends the request and receives the response from imc server using xml
        element

        Args:
            elem (xml element)
            timeout (int): if set, it is used as timeout in secs for urllib2

        Returns:
            response xml string

        Example:
            response = post_elem(elem=xml_element)
=end
        if _is_stale_cookie(elem)
            elem.attributes["cookie"] = self.cookie
        end
        xml_str = ImcXmlCodec.to_xml_str(elem)
        response_str = post_xml(xml_str, timeout: timeout)

        if response_str and !response_str.empty?
            response = ImcXmlCodec.from_xml_str(response_str)        
            if elem.name.equal? "aaaRefresh"
                _update_cookie(response)
            end
            return response
        end
        return nil
    end

    def file_download(url_suffix, file_dir, file_name, progress=Progress())
        
        #TBD implementation
    end

    def  file_upload(url_suffix, file_dir, file_name, progress=Progress())
        
        #TBD implementation
    end

private
    
def _login(auto_refresh: false, force: false, timeout: "60")
=begin
    Internal method responsible to do a login on imc server.

    Args:
        auto_refresh (bool): if set to True, it refresh the cookie
                                    continuously
        force (bool): if set to True it reconnects even if cookie exists
                                    and is valid for respective connection.

    Returns:
        true on successful connect
=end
    self.force = force

    if _validate_connection()
        return true
    end

    elem = aaa_login(self.username, self.password)
    response = post_elem(elem, timeout: timeout)
    if response.error_code != 0
        _clear()
        raise ImcException.new(response.error_code, response.error_descr)
    else
        _update(response)
    end

    # Verify to connect to IMC only
    if !_validate_imc()
        raise ImcLoginError.new("Not a supported server.")
    end

    _update_version(response)
    _update_domain_name_and_ip()

    if auto_refresh
        _start_refresh_timer()
    end

    ImcCoreUtils.add_handle_to_list(self)
    return true
end


def _logout(timeout: nil)
=begin
        Internal method to disconnect from imc server.

        Args:
            nil

        Returns:
            true on successful disconnect
=end
    if self.cookie.nil?
        return true
    end

    if self.refresh_timer
        self.refresh_timer.cancel()
    end

    elem = aaa_logout(self.cookie)
    response = post_elem(elem, timeout: timeout)

    if response.error_code == 555
        return true
    end

    if  response.error_code != 0
        raise ImcException.new(response.error_code, response.error_descr)
    end
    _clear()
    return true
end

def _refresh(auto_relogin: false)
    #Sends the aaaRefresh query to the imc to refresh the connection (to prevent session expiration).
    _stop_refresh_timer()

    elem = aaa_refresh(self.cookie, self.username, self.password)
    response = self.post_elem(elem)
    if response.error_code != 0
        self.cookie = nil
        if auto_relogin
            return login()
        end
        return false
    end
    self.cookie = response.out_cookie
    self.refresh_period = response.out_refresh_period.to_i
    self.priv = response.out_priv.split(',')
    self.domains = response.out_domains
    self.last_update_time = Time.now.asctime

    # re-enable the timer
    _start_refresh_timer()
    return true
end

def _update_cookie(response)
    if response.error_code != 0
        return
    end
    self.cookie = response.get_property("cookie")
end
 
def _is_stale_cookie(elem)
    return ((elem.attributes.include? "cookie") and (elem.attributes["cookie"] != "") and !(elem.attributes["cookie"].equal? self.cookie))
end

def _validate_connection()
=begin        
    Internal method to validate if needs to reconnect or if exist use the existing connection
=end

    if !self.cookie.nil? and self.cookie != ""
        #if self.force == false
            top_system = TopSystem.new()
            elem = config_resolve_dn(self.cookie, String.new, false)
            response = post_elem(elem)
            if response.error_code != 0
                return false
            end
            return true
        #else
        #    logout()
        #end
    end
    return false
end

def _validate_model(model)
    valid_model_prefixes = ["UCSC", "UCS-E", "UCSS", "HX"]
    valid_models = ["R460-4640810", "C260-BASE-2646"]

    if valid_models.include?(model)
        return true
    end

    valid_model_prefixes.each do |prefix|
        if model.start_with?(prefix)
            return true
        end
    end

    return false
end

def _validate_imc()
    #Validate IMC method validates if a given host is a valid IMC Server

    model_validated = false
    rack_elem = config_resolve_class(self.cookie, "biosUnit", false)

    rack_elem_response = post_elem(rack_elem)

    if rack_elem_response.nil? or rack_elem_response.error_code != 0 or rack_elem_response.get_outconfig_child().size == 0
        _logout()
        return false
    end

    if rack_elem_response.error_code == 0
        model_name = String.new
        #rack_elem_response.instance_variable_get(:@out_configs).instance_variable_get(:@child).each do |rack|
        rack_elem_response.get_outconfig_child().each do |rack|
            model_name = rack.model

            if !_validate_model(model_name)
                _logout()
                return false
            end

            _set_platform(model_name, nil)
            _set_model(model_name)
        end
    end

    if _is_fabric_interconnect()
        _logout()
        return false
    end

    return true
end


def _set_model(model)
=begin
        Internal method to set the server model
        Not to be exposed at the handle
=end
    class_ids = {
        IMC_PLATFORM::TYPE_MODULAR => "ComputeServerNode",
        IMC_PLATFORM::TYPE_CLASSIC => "ComputeRackUnit"
        }

    # Check for the right platform
    if class_ids.include? self.platform
        mo_list = self.query_classid(class_id: class_ids[self.platform])
        if mo_list
            self.model = mo_list[0].model
            return
        end
    end

    # Unknown platform, should not end up here
    # Blindly assign the model passed
    self.model = model
end

def _is_fabric_interconnect()
    nw_elem = config_resolve_class(self.cookie, "networkElement", false)
    begin
        nw_elem_response = post_elem(nw_elem)
        if nw_elem_response.error_code == 0
            return true
        else
            return false
        end
    #rescue => exception
    rescue Exception => exception
        return false
    end
end

def _set_platform(model=nil, platform=nil)
=begin
        Internal method to set the platform type
        Not to be exposed at the handle
=end
    modular_platform_prefixes = ["UCSC-C3X", "UCSS-S32"]
    if !platform.nil?
        self.platform = platform
    elsif model
        self.platform = IMC_PLATFORM::TYPE_CLASSIC
        for prefix in modular_platform_prefixes
            if model.start_with? prefix
                self.platform = IMC_PLATFORM::TYPE_MODULAR
            end
        end
    end
end


def _update_version(response=nil)
        
    require "mometa/firmware/FirmwareRunning"
    # If the aaaLogin response has the version populated, we do not
    # need to query for it
    # There are cases where version is missing from aaaLogin response
    # In such cases the later part of this method populates it
    if !response.get_property("out_version").nil? and response.get_property("out_version") != ""
        return
    end

    top_system = TopSystem.new()
    firmware = FirmwareRunning.new(parent_mo_or_dn: top_system, \
                               deployment: FirmwareRunningConsts::DEPLOYMENT_SYSTEM)
    elem = config_resolve_dn(self.cookie, firmware.dn, false)
    response = self.post_elem(elem)
    if response.error_code != 0
        raise ImcException(response.error_code, \
                               response.error_descr)
    end
    firmware = response.get_outconfig_child()[0]
    self.version = ImcVersion.new(firmware.version)
end

def _update_domain_name_and_ip()
    elem = config_resolve_class(self.cookie, "topSystem", false)
    response = self.post_elem(elem)
    if response.error_code != 0
        raise ImcException.new(response.error_code, response.error_descr)
    end
    top_system = response.get_outconfig_child[0]
    self.imc = top_system.name
    #self.virtual_ipv4_address = top_system.address
end

def _create_uri(port, secure)
=begin
        Generates IMC URI used for connection

        Args:
            port (int or None): The port number to be used during connection
            secure (bool or None): True for secure connection otherwise False

        Returns:
            uri (str)

        Example:
            uri = __create_uri(port=443, secure=True)
=end

    port = _get_port(port, secure)
    protocol = _get_proto(port, secure)

    uri = "#{protocol}://#{self.ip}:#{port}"
    return uri        
end

def _update(response)
    #Internal method to update the session variables
    self.cookie = response.get_property("out_cookie")
    self.session_id = response.get_property("out_session_id")
    self.version = ImcVersion.new(response.get_property("out_version"))
    self.refresh_period = response.get_property("out_refresh_period")
    self.priv = response.get_property("out_priv")
    self.domains = response.get_property("out_domains")
    self.channel = response.get_property("out_channel")
    self.evt_channel = response.get_property("out_evt_channel")
    self.last_update_time = Time.now.asctime
end

def _start_refresh_timer()
    #Internal method to support auto-refresh functionality.

    if self.refresh_period > 60
        interval = self.refresh_period.to_i - 60
    else
        interval = 60
    end
    #@refresh_timer = Timer.new (interval, Refresh())
    #@refresh_timer.setDaemon(true)
    #@refresh_timer.start
end

def _stop_refresh_timer()
#Internal method to support auto-refresh functionality.

    if !self.refresh_timer.nil?
        self.refresh_timer.cancel()
    end
    self.refresh_timer = nil
end

def _clear()
        #Internal method to clear the session variables

        self.name = nil
        self.cookie = nil
        self.session_id = nil
        self.version = nil
        self.refresh_period = nil
        self.priv = nil
        self.domains = nil
        self.channel = nil
        self.evt_channel = nil
        #TBD
        self.last_update_time = Time.now.asctime 
    #end   
end

def _get_port(port, secure)
    if !port.nil?
        return port.to_i
    end
    if secure == false
        return 80
    end
    return 443
end


def _get_proto(port, secure)
    if secure.nil?
        if port.to_s == "80"
            return "http"
        end
    elsif secure == false
        return "http"
    end
    return "https"
end
end