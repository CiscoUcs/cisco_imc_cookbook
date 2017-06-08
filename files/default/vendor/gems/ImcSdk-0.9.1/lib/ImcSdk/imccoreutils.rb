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

#This Module contains the ImcSdk Core Utilities

require 'imcmeta'
require 'imcbasetype'




    class IMC_PLATFORM
        TYPE_MODULAR = "modular"
        TYPE_CLASSIC = "classic"
    end
    IMC_PLATFORM_LIST = [IMC_PLATFORM::TYPE_MODULAR,
                         IMC_PLATFORM::TYPE_CLASSIC]

module ImcCoreUtils

GLOBAL_HANDLES = []

def self.get_imc_obj(class_id, elem, mo_obj=nil)
    
=begin
    This creates object of type ExternalMethod or ManagedObject or GenericMo
    depending on element tag

    Args:
        class_id (str): class id
        elem (xml element): xml element
        mo_obj : parent managed object

    Returns:
        object of type ExternalMethod or ManagedObject or GenericMo
=end

    if $METHOD_CLASS_ID.include? class_id
        obj =  ExternalMethod.new(class_id)
        return obj
    elsif $MO_CLASS_ID.include? class_id
        mo_class_param_hash = {}
        mo_class = ImcCoreUtils.load_class(class_id)
        mo_class.prop_map.each do |key, value|
            mo_class_param_hash[:value] = nil
        end
        p_dn = ""
        if elem.attributes.include? "dn"
            p_dn = File.dirname(elem.attributes["dn"])
        elsif elem.attributes.include? "rn" and mo_obj
            p_dn = mo_obj.dn
        end

        #if ComputeRackUnit.mo_meta.parents.include? "topRoot"
            #mo_obj = mo_class.new( nil, from_xml_response=true, mo_class_param_hash)
        #else
            mo_obj = mo_class.new(parent_mo_or_dn: p_dn, from_xml_response: true, **mo_class_param_hash)
        #end
        return mo_obj

    elsif $OTHER_TYPE_CLASS_ID.include? class_id
        obj = Object.const_get(class_id).new
        return obj
    end

end


def self.load_class(class_id)
    class_id_array =  class_id.split /(?=[A-Z])/
    folder_name = class_id_array[0].downcase
    require_relative "./mometa/" + folder_name + "/" + class_id
    return Object.const_get(class_id)
end


def self.load_module(module_name)
    
=begin
    This loads the module into the current name space

    Args:
        module_name (str): module_name

    Returns:
        module_import
=end



end

def self.get_mo_property_meta(class_id:, key:, platform: nil)

=begin
    Methods returns the mo property meta of the provided key for the given
    class_id.
    Args:
        class_id (str): class_id of mo
        key (str): prop of class_id
    Returns:
        Object of type MoPropertyMeta
    Example:
        prop_meta = get_mo_property_meta(class_id="aaaUser", key="usr_lbl")
=end

    #class_obj = load_class(class_id)
    class_obj = Object.const_get(class_id)

    if platform.nil?
        platform = IMC_PLATFORM::TYPE_CLASSIC
    end

    if key == "mo_meta"
        return class_obj.mo_meta[platform]
    end

    prop_meta = class_obj.prop_meta[platform]
    prop_map = class_obj.prop_map[platform]
    if prop_map.include? key
        return prop_meta[prop_map[key]]
    elsif prop_meta.include? key
        return prop_meta[key]
    end
    return nil
end


def self.find_class_id_in_method_meta_ignore_case(class_id)

       #Methods whether class_id is valid or not . Given class is case insensitive.


    #if class_id in METHOD_CLASS_ID
    if $METHOD_CLASS_ID.include?(class_id)
        return class_id
    end
    
    l_class_id = class_id.downcase
    for key in METHOD_CLASS_ID
        if key.downcase == l_class_id
            return key
        end
    end
    return nil
end

   
def self.extract_molist_from_method_response(method_response, in_hierarchical=false)
    
=begin
    Methods extracts mo list from response received from imc server i.e.
    external method object

    Args:
        method_response (ExternalMethod Object): response
        in_hierarchical (bool): if True, return all the hierarchical child of
                                    managed objects

    Returns:
        List of ManagedObjects

    Example:
        response = handle.query_dn("sys/rack-unit-1", need_response=True)\n
        molist = extract_molist_from_method_response(method_response=response,
                in_hierarchical=True)
=end

    mo_list=[]
    if method_response.instance_variable_defined?(:@out_config) and method_response.instance_variable_defined?(:@out_config).instance_variable_defined?(:@child)
        if method_response.instance_variable_get(:@out_config).instance_variable_get(:@child).size.equal? 0
            return mo_list
        end
    elsif method_response.instance_variable_defined?(:@out_configs) and method_response.instance_variable_defined?(:@out_config).instance_variable_defined?(:@child)
        if method_response.instance_variable_get(:@out_configs).instance_variable_get(:@child).size.equal? 0
            return mo_list
        end
    end

    if in_hierarchical
        if method_response.instance_variable_defined?(:@out_config)
            current_mo_list = method_response.instance_variable_get(:@out_config).instance_variable_get(:@child)
        else
            current_mo_list = method_response.instance_variable_get(:@out_configs).instance_variable_get(:@child)
        end

        while current_mo_list.size > 0
            child_mo_list = []
            for mo in current_mo_list do
                mo_list.push(mo)
                while mo.child_count() > 0
                    for child in mo.child do
                        mo.child_remove(child)
                        child.mark_clean()
                        child_mo_list.push(child)
                        break
                    end
                end
            end
            current_mo_list = child_mo_list
        end
    else
        mo_list = method_response.instance_variable_get(:@out_configs).instance_variable_get(:@child)
    end
    return mo_list
end

def self.find_class_id_in_mo_meta_ignore_case(class_id)

    #Methods whether class_id is valid or not . Given class is case insensitive.

    if class_id.nil?
        return nil
    end
    #if class_id in MO_CLASS_ID
    if $MO_CLASS_ID.include?(class_id)
        return class_id
    end

    # print class_id
    l_class_id = class_id.downcase
    for key in $MO_CLASS_ID
        if key.downcase == l_class_id
            return key
        end
    end
    return nil
end
=begin
def prop_exists(mo, prop_name, platform=nil)

    if !platform.nil?
        return(platform in mo.prop_meta.keys() and prop_name in mo.prop_meta[platform].keys())
    end

    for platform in IMC_PLATFORM_LIST
        if platform in mo.prop_meta.keys() and prop_name in mo.prop_meta[platform].keys()
            return true
        end
    end

    return false
end
=end


def self.prop_exists(mo, prop_name, platform=nil)

    if !platform.nil?
        return(mo.prop_meta.has_key? platform and  mo.prop_meta[platform].has_key? prop_name)
    end

    for platform in IMC_PLATFORM_LIST
        if mo.prop_meta.has_key? platform and \
                mo.prop_meta[platform].has_key? prop_name.to_s
            return true
        end
    end
    return false
end

def self.set_server_dn(handle, kwargs)
    server_id = kwargs.fetch(:server_id, "1")
    return get_server_dn(handle, server_id.to_s)
end

def self.get_server_dn(handle, server_id="1")
=begin
    This method gives the dn for a particular rack server based on
    the type of platform
    For classic: "sys/rack-unit-1"
    For modular: "sys/chassis-1/server-<server_id>"
=end

    if handle.platform == IMC_PLATFORM::TYPE_CLASSIC
        return "sys/rack-unit-1"
    elsif handle.platform == IMC_PLATFORM::TYPE_MODULAR
        return "sys/chassis-1/server-" + server_id.to_s
    else
        raise ImcOperationError.new("Unknown platform type:#{handle.platform} detected")
    end
end



def self.get_prop_meta(mo, prop, platform=nil)
=begin
    Internal Method that returns the property meta object
=end

    if !platform.nil?
        return _get_property_from_prop_meta_for_platform(mo, prop, platform)
    end

    for platform in IMC_PLATFORM_LIST
        prop_ = _get_property_from_prop_meta_for_platform(
                mo,
                prop,
                platform)
        if prop_
            return prop_
        end
    end
    return nil
end

def self.get_handle_from_cookie(cookie)
    for handle in GLOBAL_HANDLES
        if handle.cookie == cookie
            return handle
        end
    end
    return nil
end

def self.add_handle_to_list(handle)
    if !handle.nil? and !(GLOBAL_HANDLES.include? handle)
        GLOBAL_HANDLES.push(handle)
    end
end

def self.remove_handle_from_list(handle)
    if !handle.nil? and GLOBAL_HANDLES.include? handle
        GLOBAL_HANDLES.remove(handle)
    end
end

def self.property_exists_in_prop_map(mo, prop_name)

    for platform in IMC_PLATFORM_LIST
        if mo.prop_map.has_key? platform and \
                mo.prop_map[platform].has_key? prop_name
            return true
        end
    end
    return false
end        

def self.is_writable_prop(mo, prop, platform=nil)

    for platform in IMC_PLATFORM_LIST
        prop_ = _get_property_from_prop_meta_for_platform(
                mo,
                prop,
                platform)
        if prop_ and prop_.access == MoPropertyMeta.READ_WRITE
            return true
        end
    end
    return false
end

def self.get_property_from_prop_map(mo, prop, platform=nil)

    if !platform.nil?
        return _get_property_from_prop_map_for_platform(mo, prop, platform)
    end

    for platform in IMC_PLATFORM_LIST
        prop_ = _get_property_from_prop_map_for_platform(
                mo,
                prop,
                platform)
        if prop_
            return prop_
        end
    end

    return nil
end

def self.get_mo_meta(mo, platform=nil)

    if !platform.nil?
        begin
            return mo.mo_meta[platform]
        rescue KeyError
            raise ImcValidationException("The Managed Object:#{mo.class.name} does not exist for this platform"
            )
        end
    end
    for platform in IMC_PLATFORM_LIST
        if mo.mo_meta.has_key? platform
            return mo.mo_meta[platform]
        end
    end
    return nil
end


def self.validate_mo_version(handle, mo)
=begin
    This is called from add_mo/set_mo to verify if the mo is supported on
    the particular server
=end

    begin
        mo_version = mo.get_version(handle.platform)
    rescue ImcValidationException
        raise ImcValidationException("This functionality is not supported on the current platform")
    end

    if mo_version > handle.version
        raise ImcOperationError(
                "Validate Version",
                "Platform(version:#{handle.version}) does not support Managed Object:#{mo.class.name}(supported since version:#{mo_version})")
    end
end

private

def self._get_property_from_prop_meta_for_platform(mo, prop, platform)

    if mo.prop_meta.has_key? platform and \
            mo.prop_meta[platform].has_key? prop
        return mo.prop_meta[platform][prop]
    end
    return nil
end

def self._get_property_from_prop_map_for_platform(mo, prop, platform)

    if mo.prop_map.has_key? platform and \
            mo.prop_map[platform].has_key? prop
        return mo.prop_map[platform][prop]
    end
    return nil
end


end
