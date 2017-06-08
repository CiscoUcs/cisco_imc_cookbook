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

# This module contains the ImcSdk Core Classes

require_relative 'imccore'
require_relative 'imccoreutils'


class ExternalMethod < ImcBase
    
    @@external_method_attrs = { "errorCode" => "error_code",
                                "errorDescr" => "error_descr",
                                "invocationResult" => "invocation_result",
                                "response" => "response"}

    attr_accessor :error_code
    attr_accessor :error_descr

    def initialize(method_id)
        super(method_id)
        meta = File.dirname(__FILE__) + "/methodmeta/" + method_id + "Meta.rb"
        load meta
        @error_code = 0
        @error_descr = nil
        @invocation_result = nil
        @response = nil
        self.mark_clean()
    end

    def set_property(prop,value)
        self.instance_variable_set("@" + prop, value)
    end

    def get_property(prop)
        if self.instance_variable_defined?("@" + prop)
            return self.instance_variable_get("@" + prop)
        else
            return nil
        end
    end

    def child_add(mo)
        #This method adds child external method object to a external method object.
        childs.push(mo)
    end

    def set_attr(key, value)
        #This method sets the attribute of external method object
        if @@method_prop_meta.include?(key)
            set_property(key, value)
        elsif key.equal?("error_code")
            @error_code = value
        elsif key.equal?("error_descr")
            @error_descr = value
        elsif key.equal?("invocation_result")
            @invocation_result = value
        elsif key.equal?("response")
            @response = value            
        else
            #no such property
            return nil
        end
    end

    def get_error_response(error_code, error_descr)
        # This methos sets error attributes of an external method object.

        @error_code = error_code
        @error_descr = error_descr
        @response = "yes"
    end


    def to_xml(xml_doc=nil, option=nil, elem_name=nil)
        # This method writes the xml representation of the external method object.
        cookie = nil
        if self.instance_variable_defined?("@cookie")
            cookie = self.get_property("cookie")
        end
        xml_obj = elem_create(@@method_meta.xml_attribute, xml_doc, elem_name)
        
        @@method_prop_meta.each do |prop, prop_meta|
            if xml_obj.name == "aaaLogout" and prop == "in_delay_secs" and get_property(prop).to_i > 300
                next
            end

            if prop_meta.inp_out == "Output"
                next
            end

            if prop_meta.is_complex_type
                if !get_property(prop).nil?
                    #x = get_property(prop)
                    get_property(prop).to_xml(xml_obj, option, prop_meta.xml_attribute, cookie=cookie)
                end
            elsif
                key = prop_meta.xml_attribute
                value = get_property(prop)
                xml_obj.add_attribute(key, value)
            end
        end
        child_to_xml(xml_obj, option, cookie=cookie)
        return xml_obj
    end

    def from_xml(elem, handle=nil)
        # This method updates/fills the object from xml representation of the External method object.

        if elem.attributes
            elem.attributes.each do |attr_name, attr_value|
                if @@method_prop_map.include? attr_name
                    attr1 = @@method_prop_map[attr_name]
                    method_prop_meta = @@method_prop_meta[attr1]
                    if method_prop_meta.inp_out.equal? "Input" or method_prop_meta.is_complex_type
                        pass
                    end
                    set_attr(attr1, attr_value)
                elsif @@external_method_attrs.include? attr_name
                    set_attr @@external_method_attrs[attr_name], attr_value
                end
            end
        end

        if elem.children
            for child_elem in elem.children do
                if !child_elem.instance_variable_defined?(:@name)
                    next
                end
                child_name = child_elem.name

                if @@method_prop_map.include? child_name
                    child_name = @@method_prop_map[child_name]
                    method_prop_meta = @@method_prop_meta[child_name]
                    if method_prop_meta.inp_out == "Output" and method_prop_meta.is_complex_type
                        child_obj = ImcCoreUtils.get_imc_obj(method_prop_meta.field_type, child_elem, nil)
                        if !child_obj.nil?
                            set_attr(child_name, child_obj)
                            child_obj.from_xml(child_elem, handle)
                        end
                    end
                end
            end
        end
    end
    def get_outconfig_child()
        if self.instance_variable_defined?(:@out_config)
            return self.instance_variable_get(:@out_config).instance_variable_get(:@child)
        elsif self.instance_variable_defined?(:@out_configs)
            return self.instance_variable_get(:@out_configs).instance_variable_get(:@child)
        else
            return Array.new
        end
    end

    def is_outconfig_available()
        if self.instance_variable_defined?(:@out_config) or self.instance_variable_defined?(:@out_configs)
            return true
        else
            false
        end
    end
=begin
    private
    def to_s()
        
        #TBD implementation
    end
=end


end