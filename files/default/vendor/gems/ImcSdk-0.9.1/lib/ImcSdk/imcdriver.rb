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

require 'uri'
require 'net/http'
require 'openssl'

class SmartRedirectHandler 
    #This class is to handle redirection error.

    def http_error_301(req, fp, code, msg, headers)
        #This is to handle redirection error code 301
        resp_status = [code, headers.get('Location')]
        return resp_status
    end

    def http_error_302(req, fp, code, msg, headers)
        #This is to handle redirection error code 302
        resp_status = [code, headers.get('Location')]
        return resp_status
    end
end


class ImcDriver < Object
=begin
    This class is responsible to create http and https connection using urllib
    library.

    Args:
        proxy (str): The proxy object to be used to connect

    Example:
        driver = ImcDriver(proxy="192.168.1.1:80")
=end

    attr_accessor :redirect_uri
    attr_accessor :proxy
    attr_reader :headers
    def initialize(proxy=nil)
        @redirect_uri=nil
        @proxy=proxy
        @headers = {}
        @handlers = _get_handlers()       
    end

    def add_header(header_prop, header_value)
=begin
        Adds header to http/ https web request

        Args:
            header_prop (str): header name
            header_value (str): header value

        Returns:
            nil

        Example:
            driver=ImcDriver.new()\n
            driver.add_header('Cookie', 'xxxxxxxxxxxxxx')\n
=end        

        self.headers[header_prop] = header_value
    end

    def remove_header(header_prop)
=begin
        Removes header from http/ https web request

        Args:
            header_prop (str): header name

        Returns:
                nil

        Example:
            driver=ImcDriver.new()\n
            driver.remove_header('Cookie')\n
=end    
        self.headers.delete(header_prop)
    end
    def post(uri,data=nil, dump_xml=false, read=true, timeout=nil, redirected=false)
=begin
        sends the web request and receives the response from imc server

        Args:
            uri (str): URI of the  the IMC Server
            data (str): request data to send via post request
            dump_xml (bool): if True, displays request and response
            read (bool): if True, returns response.read() else returns object.
            timeout (int): if set, this will be used as timeout in secs for urllib2

        Returns:
            response xml string or response object

        Example:
            response = post("http://192.168.1.1:80", data=xml_str)

=end
        begin
            request = _create_request(uri=uri, data=data)
            uri = URI(uri)
            if @proxy
                http = Net::HTTP::Proxy(@proxy.host, @proxy.port, @proxy.user, @proxy.password).new(uri.host, uri.post)
            else
                http = Net::HTTP.new(uri.host, uri.port)
            end
            http.read_timeout = timeout.to_i

            if uri.scheme == 'https'
                http.use_ssl= true
                http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            end
            response = http.request(request)

            case response
                when Net::HTTPSuccess
                    #do nothing
                when Net::HTTPRedirection then
                    if(response.code == "301" or response.code == "302")
                        location = response['Location']
                        self.redirect_uri = uri = URI.parse(location)
                        response = post(uri, data, dump_xml, read, timeout, true)
                    end
                else
                    raise 'Unexpected response: ' + response.inspect
            end
            if read and !redirected
                response = response.body.force_encoding('utf-8')
            end
            return response
        rescue => exception 
            raise exception
        end
    end

    private
    
    def _create_request(uri, data=nil)
=begin
        Internal method to create http/https web request

        Args:
            uri (str): protocol://web_address:port
            data (str): data to send over web request

        Returns:
            web request object
=end
        uri = URI(uri)
        request = Net::HTTP::Post.new(uri.path)
        request["Content-Type"] = "text/xml"
        request.body = data
        @headers.each do |key, value|
            request[key] = value
        end
        return request
    end

    def _get_handlers(tls_proto=nil)
=begin
        Internal method to handle redirection and use TLS protocol.
=end

    # tls_handler implements a fallback mechanism for servers that
    # do not support TLS 1.1/1.2
        tls_handler = "" #tls_proto == "tlsv1"? TLS1Handler.new : TLSHandler.new
        #tls_handler = (TLSHandler, TLS1Handler)[tls_proto == "tlsv1"]
        handlers = [SmartRedirectHandler.new, tls_handler]
        if self.proxy
            proxy_handler = urllib2.ProxyHandler(
                {'http' => self.__proxy, 'https' => self.__proxy})
            handlers.append(proxy_handler)
        end
        return handlers
    end
end