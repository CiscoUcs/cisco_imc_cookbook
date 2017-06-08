$:.unshift(*Dir[::File.expand_path('./ImcSdk/', File.dirname(__FILE__))])

require 'version'
require 'imcsession'
require 'imcexception'
require 'imcmethodfactory'
require 'imcconstants'

# ImcHandle class is the user interface point for any Imc communication.
# @author Amit Mandal(amimanda@cisco.com)
# @!attribute [rw] to_commit

class ImcHandle < ImcSession

    attr_accessor :to_commit

    # Create an object of ImcHandle class
    #
    # @param ip [String] The IP or Hostname of the IMC Server
    # @param username [String] The username as configured on the Imc Server
    # @param password [String] The password as configured on the Imc Server
    # @param port [Integer, nil] The port number to be used during connection
    # @param secure [bool, nil] true for secure connection, otherwise false
    # @param proxy [String, nil] The proxy object to be used to connect
    # @example
    #   handle = ImcHandle.new (ip: "192.168.1.1",username: "admin",password: "password")
    # @example
    #   handle = ImcHandle.new (ip: "192.168.1.1",username: "admin",password: "password", secure: true)
    # @example
    #   handle = ImcHandle.new (ip: "192.168.1.1",username: "admin",password: "password", secure: false)
    # @example
    #   handle = ImcHandle.new (ip: "192.168.1.1",username: "admin",password: "password", port: 80)
    # @example
    #   handle = ImcHandle.new (ip: "192.168.1.1",username: "admin",password: "password", port: 443)
    # @example
    #   handle = ImcHandle.new (ip: "192.168.1.1",username: "admin",password: "password", port: 100, secure: true)
    # @example
    #   handle = ImcHandle.new(ip: "192.168.1.1",username: "admin",password: "password", port: 100, secure: false)

    def initialize(ip:, username:, password:, port: "80", secure: nil, proxy: nil)
        super(ip: ip, username: username, password: password, port: port, secure: secure, proxy: proxy)
        self.to_commit = {}
    end
    
    #def set_dump_xml()
    #    #Enables the logging of xml requests and responses
    #    super
    #end
    
    #def unset_dump_xml()
        #Disables the logging of xml request and responses
    #    super
    #end
    
    # Initiated a connection to the server referenced by the ImcHandle. A cookie is populated in the ImcHandle, if the login is successful.
    #
    # @param auto_refresh [TrueClass, FalseCalss] If set to true, it refresh the cookie continuously
    # @param force [TrueClass, FalseClass] If set to true it reconnects even if cookie exists and is valid for respective connection.
    # @param timeout [Integer] Timeout value in seconds
    # @return [TrueClass, FalseClass] true on successful connect
    # @example
    #   handle.login()
    # @example
    #   handle.login(auto_refresh: true)
    # @example
    #   handle.login(force: true)
    # @example
    #   handle.login(auto_refresh: true, force: true)
    # @note Where handle is an object of ImcHandle class.
    def login(auto_refresh: false, force: false, timeout: "60")
        return _login(auto_refresh: auto_refresh, force: force, timeout: timeout)
    end
    
    # Disconnects from the server referenced by the ImcHandle.
    #
    # @param timeout [Integer] timeout value in seconds.
    # @return [TrueClass, FalseClass] true on successful disconnect
    #
    # @example
    #   handle.logout()
    # @example
    #   handle.logout(timout: 60)
    # @note Where handle is an object of ImcHandle class.

    def logout(timeout: "60")
        return _logout(timeout: timeout)
    end
    
    #
    # process_xml_elem is a helper method which posts xml elements to the
    # server and returns parsed response. It's role is to operate on the
    # output of methods from Imcmethodfactory, which return xml element
    # node(s).
    #
    # @param elem [] XML Element Object
    # @return [External Method Object, MO List] MO List or External Method Object
    #
    # @example
    #   elem = imcmethodfactory.config_resolve_class(cookie: handle.cookie, class_id: "computeRackUnit")
    #   objs = handle.process_xml_elem(elem)
    #
    def process_xml_elem(elem, timeout: "60")
        response = self.post_elem(elem, timeout: timeout)
        if response.error_code != 0
            raise ImcException.new(response.error_code, response.error_descr)
        end
        if response.is_outconfig_available()
            return response.get_outconfig_child()
        else
            return response
        end
    end

    # Returns a token that is used for IMC authentication.
    #
    # @param timeout [Integer] timeout value(in seconds)
    # @return [String] Token used for IMC Authentication
    #
    # @example
    #   handle.get_auth_token()
    #
    def get_auth_token(timeout: "60")
      
        auth_token = nil
        mo = self.query_classid(class_id: NamingId::COMPUTE_BOARD)
        if mo.nil?
            mo = self.query_classid(class_id: NamingId::COMPUTE_RACK_UNIT)
        end

        if !mo.nil?
            elem = aaa_get_compute_auth_tokens(cookie: self.cookie)
            response = self.post_elem(elem, timeout: timeout)

            if response.error_code != 0
                raise ImcException.new(response.error_code, response.error_descr)
            end

            if response.instance_variable_defined?(:@out_tokens)
                auth_token = response.instance_variable_get(:@out_tokens).split(',').first
            end
        end
        return auth_token
    end

    #
    # Finds an object using it's distinguished name.
    #
    # @param dn [String] distinguished name of the object to be queried for.
    # @param hierarchy [TrueClass, FalseClass] Gets all objects in hierarchy if true
    # @param need_response [TrueClass, FalseClass] returns the response xml node, instead of parsed objects.
    # @param timeout [Integer] timeout value(in seconds)
    # @return [ManagedObject, Array<ManagedObject>, ExternalMethod] Return Managed Object by default, returns Array<ManagedObject> if hierarchy is set to true,
    # returns ExternalMethod if need_response is set to true.
    #
    # @example
    #   obj = handle.query_dn(dn: "sys/rack-unit-1")
    # @example
    #   obj = handle.query_dn(dn: "sys/rack-unit-1", hierarchy: true)
    # @example
    #   obj = handle.query_dn(dn: "sys/rack-unit-1", need_response: true
    # @example
    #   obj = handle.query_dn(dn: "sys/rack-unit-1", hierarchy: true, need_response: true)

    def query_dn(dn:, hierarchy: false, need_response: false, timeout: "60")
        
        if dn.nil?
            raise ValueError.new ("Provide dn.")
        end
        
        elem = config_resolve_dn(self.cookie, dn, hierarchy)
        
        response = self.post_elem(elem, timeout: timeout)
        
        if response.error_code != 0
            raise ImcException.new(response.error_code, response.error_descr)
        end
        
        if need_response
            return response
        end
        
        if hierarchy
            out_mo_list = ImcCoreUtils.extract_molist_from_method_response(response, hierarchy)
            return out_mo_list
        end
        
        mo = nil
        child = response.get_outconfig_child()
        if child.size > 0
            mo = child[0]
        end
        return mo
    end

    #
    # Finds an object using it's class id.
    #
    # @param class_id [String] class id of the object to be queried for.
    # @param hierarchy [TrueClass, FalseClass] if set to true will return all the child hierarchical objects.
    # @param need_response [TrueClass, FalseClass] if set to true will return only response object.
    # @param timeout [Integer] timeout value(in seconds)
    # @return [Array<ManagedObject>, Method_Response, nil] returns Method_Response if need_response is set to true
    #
    # @example
    #   obj = handle.query_classid(class_id: "computeRackUnit")
    # @example
    #   obj = handle.query_classid(class_id: "computeRackUnit", hierarchy: true)
    # @example
    #   obj = handle.query_classid(class_id: "computeRackUnit", need_response: true)
    #
    def query_classid(class_id:, hierarchy: false, need_response: false, timeout: "60" )

        if class_id.nil?
            raise ValueError("Provide Parameter class_id")
        end
        
        meta_class_id = ImcCoreUtils.find_class_id_in_mo_meta_ignore_case(class_id)
        
        if meta_class_id.nil?
            meta_class_id = class_id
        end
        
        elem = config_resolve_class(self.cookie, class_id = meta_class_id, hierarchy)
        
        response = self.post_elem(elem, timeout: timeout)
        
        if response.error_code != 0
            raise ImcException.new(response.error_code, response.error_descr)
        end
        
        if need_response
            return response
        end
        
        out_mo_list = ImcCoreUtils.extract_molist_from_method_response(response, hierarchy)
        return out_mo_list
        
    end
    
    #
    # Finds children of a given managed object or distinguished name.
    # Arguments can be specified to query only a specific type(class_id) of children.
    # Arguments can also be specified to query only direct children or the entire hierarchy of children.
    #
    # @param in_mo [ManagedObject] query children managed object under this object.
    # @param in_dn [String] query children managed object for a given managed object of the respective dn.
    # @param class_id [String] by default nil, if given finds only specific childred object for a given class_id.
    # @param hierarchy [TrueClass, FalseClass] if set to true will return all the child hierarchical objects.
    # @param timeout [Integer] timeout value in seconds
    # @return [Array<ManagedObject>, nil]
    #
    # @example
    #    mo_list = handle.query_children(in_mo: mo)
    # @example
    #   mo_list = handle.query_children(in_mo: mo, class_id: "classid")
    # @example
    #   mo_list = handle.query_children(in_dn: dn)
    # @example
    #   mo_list = handle.query_children(in_dn: dn, class_id: "classid")
    #
    def query_children(in_mo: nil, in_dn: nil, class_id: nil, hierarchy: false, timeout: "60")
        if in_mo.nil? and in_dn.nil?
            raise ValueError("[Error]: GetChild: Provide in_mo or in_dn")
        end
        
        if in_mo
            parent_dn = in_mo.dn
        elsif
            parent_dn = in_dn
        end
        
        if class_id
            meta_class_id = ImcCoreUtils.find_class_id_in_mo_meta_ignore_case(class_id)
            if meta_class_id.nil?
                meta_class_id = class_id
            end
        else
            meta_class_id = class_id
        end
        
        elem = config_resolve_children(self.cookie, class_id = meta_class_id, in_dn = parent_dn, hierarchy)
        
        response = post_elem(elem, timeout: timeout)
        
        if response.error_code != 0
            raise ImcException.new(response.error_code, response.error_descr)
        end
        
        out_mo_list = ImcCoreUtils.extract_molist_from_method_response(response, hierarchy)
        
        return out_mo_list
    end
    #
    # Add a Managed Object to the IMC Server
    #
    # @param mo [ManagedObject] Managed Object to the added to the IMC Server
    # @param modify_present [TrueClass, FalseClass] Over-write an existing object if true
    # @param timeout [Integer] timoeout value(in seconds)
    # @return [nil]
    # @example
    #   handle.add_mo(mo: mo)
    #
    def add_mo(mo:, modify_present: true, timeout: "60")
        if ImcGenUtils::AFFIRMATIVE_LIST.include? modify_present
            if self.query_dn(dn: mo.dn).nil?
                mo.set_prop("status","created")
                else
                mo.set_prop("status", "modified")
            end
        else
            mo.set_prop("status", "created")
        end
        
        self.to_commit[mo.dn] = mo
        _commit(timeout: timeout)
    end
    
    #
    # Modifies a managed object and adds it to the ImcHandle commit buffer (if not already in it)
    #
    # @param mo [ManagedObject] Managed Object with modified properties
    # @param timeout [Integer, nil] timeout value in seconds
    # @return [nil]
    #
    # @example
    #   handle.set_mo(mo: mo)
    #
    def set_mo(mo:, timeout: "60")      
        #mo.instance_variable_set(:@status, "modified")
        mo.set_prop("status", "modified")
        self.to_commit[mo.instance_variable_get(:@dn)] = mo
        _commit(timeout: timeout)
    end

    #
    # Remove a Managed Object from the IMC Server
    #
    # @param mo [ManagedObject] Managed Object to be removed.
    # @param timeout [Integer] timeout value(in seconds).
    # @return [nil] Nothing is returned.
    #
    # @example
    #   handle.remove_mo(mo: mo)
    #
    def remove_mo(mo:, timeout: "60")
        mo.set_prop("status", "deleted")
        if mo.instance_variable_defined?(:@parent_mo) and !mo.parent_mo.nil?
            mo.parent_mo.child_remove(mo)
        end
        
        self.to_commit[mo.dn] = mo
        _commit(timeout: timeout)
    end

#private methods    
private
    #
    # Commit the buffer to the server. Pushes all the configuration changes so far to the server.
    # Configuration could be added to the commit buffer using add_mo(), set_mo(), and remove_mo().
    #
    # @param timeout [Integer] timeout value in seconds.
    # @return [nil]
    # @example
    #   self._commit()
    #
    def _commit(timeout: "60")

        mo_dict = self.to_commit
        if mo_dict.nil? or mo_dict.empty?
            return nil
        end
        
        config_map = ConfigMap.new()
        
        mo_dict.each do |mo_dn, mo|
            config_map.child_add(mo)
            elem = config_conf_mo(self.cookie, mo_dn, config_map, false)
            
            response = post_elem(elem, timeout: timeout)
            
            if response.error_code != 0
                self.to_commit = {}
                raise ImcException.new(response.error_code, response.error_descr)
            end
            
            child = response.get_outconfig_child()
            for pair_ in child do             
                for out_mo in pair_.child do
                    out_mo.sync_mo(mo_dict[out_mo.dn])
                end
            end
            self.to_commit = {}
        end
    end
end 