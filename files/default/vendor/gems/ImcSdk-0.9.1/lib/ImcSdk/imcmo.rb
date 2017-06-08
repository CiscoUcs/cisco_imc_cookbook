#!/usr/bin/ruby
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

# This module contains the Managed Object and Generic Managed Object class

require_relative 'imcgenutils'
require_relative 'imccoreutils'
require_relative 'imccoremeta'
require_relative 'imcxmlcodec'

private
class GenericProp

    attr_accessor :name
    attr_accessor :value
    attr_accessor :is_dirty
    
    #Internal class to handle the unknown property
    def initialize(name, value, is_dirty)
        @name = name
        @value = value
        @is_dirty = is_dirty
    end
end

class ManagedObject < ImcBase

    # This class structures/represents all the managed objects.

    attr_reader :parent_mo
    attr_reader :parent_dn
    attr_reader :dn
    attr_reader :mo_class
    DUMMY_DIRTY = "0x1L"

    @@internal_prop = ["dirty_mask", "class_id", "child", "handle",'']
    @@internal_prop.freeze
    def initialize(class_id: nil, parent_mo_or_dn: nil, from_xml_response: false, **kwargs)

        @parent_mo = nil
        @status = nil
        @parent_dn = nil
        @xtra_props = {}
        @xtra_props_dirty_mask = 0x1
        @mo_class = Object.const_get(self.class.name)

        if parent_mo_or_dn
            if parent_mo_or_dn.is_a? ManagedObject
                @parent_mo = parent_mo_or_dn
                @parent_dn = @parent_mo.dn
            elsif parent_mo_or_dn.is_a? String
                @parent_dn = parent_mo_or_dn
            else
                raise ValueError.new('parent mo or dn must be specified')
            end
        end

        if !from_xml_response
            rn_set()
            dn_set()
        end

        mo_meta = ImcCoreUtils.get_mo_meta(@mo_class)
        xml_attribute = mo_meta.xml_attribute

        super(ImcGenUtils.word_u(xml_attribute))

        if @parent_mo
            @parent_mo.child_add(self)
        end

        if kwargs
            kwargs.each do |prop_name, prop_value|
                if ImcCoreUtils.prop_exists(@mo_class, prop_name.to_s)
                    set_prop(prop_name, prop_value)
                end
            end
        end
    end

    def mark_dirty()
    #Method to mark the managed object dirty
        if self.class.name.equal? "ManagedObject" and !self.is_dirty()
            self.dirty_mask = ManagedObject.DUMMY_DIRTY
        elsif instance_variable_defined?("mo_meta")
            self.dirty_mask = self.mo_meta.mask
        end
    end


    def is_dirty()
    #This method checks if managed object is dirty
        condition1 = @dirty_mask.to_i.equal? 0
        condition2 = child_is_dirty()
        return !condition1 || condition2
    end


    def make_rn()
        #This method returns the Rb for a managed Object
   
        mo_meta = ImcCoreUtils.get_mo_meta(self.mo_class)
        rn_pattern = mo_meta.rn
        rn_pattern.scan(/\[([^\]]*)\]/) do |prop|
            prop_name = prop[0]

            if ImcCoreUtils.prop_exists(@mo_class, prop_name)
                prop_value = self.instance_variable_get("@" + prop_name)

                if prop_value
                    rn_pattern = rn_pattern.gsub(/\[#{prop_name}\]/, prop_value)
                else
                    raise ImcValidationException("Property #{prop} was None in make_rn")
                end

            else
                #log.debug('Property "%s" was not found in make_rn arguments' % prop)
                raise ImcValidationException("Property #{prop} was not found in make_rn arguments")
            end
        end
        return rn_pattern
    end

    def to_xml(xml_doc=nil, option=nil, elem_name=nil, cookie=nil)
    #Method writes the xml representation of the Managed Object

        #unknown_properties = []

        if option == WriteXmlOption::DIRTY and !is_dirty()
            return
        end

        platform = nil
        handle = nil

        if cookie
            handle = ImcCoreUtils.get_handle_from_cookie(cookie)

            if handle
                platform = handle.platform
            end

        end

        mo_meta = ImcCoreUtils.get_mo_meta(self.mo_class)
        xml_attribute = mo_meta.xml_attribute
        xml_obj = elem_create(xml_attribute, xml_doc=xml_doc, elem_name)

        self.instance_variables.each do |key|
            key_str = key.to_s
            key_str[0] = ''
            #hash = self.class.prop_meta
            if key_str != "rn" and ImcCoreUtils.prop_exists(
                                self.mo_class,
                                key_str,
                                platform=platform)
                mo_prop_meta = ImcCoreUtils.get_prop_meta(self.mo_class, key_str, platform=platform)

                if option != WriteXmlOption::DIRTY or (!mo_prop_meta.mask.nil? and  (self.dirty_mask & mo_prop_meta.mask !=0))
                    value = instance_variable_get(key)
                    if !value.nil?
                        if handle
                            if(mo_prop_meta.version.le(handle.version))
                                xml_obj.add_attribute(mo_prop_meta.xml_attribute, value)
                            end
                        else
                            xml_obj.add_attribute(mo_prop_meta.xml_attribute, value)
                        end
                    end
                end

            else

                if !@xtra_props.has_key? key
                    #This is an internal property
                    #This should not be a part of the xml
                    next
                end

                if option != WriteXmlOption.DIRTY or xtra_props[key].is_dirty
                    value = xtra_props[key].value
                    if !value.nil?
                        xml_obj.add_attribute(key, value)
                    end
                end
                
            end
        end

        if !xml_obj.attributes.include?("dn")
            xml_obj.add_attribute('dn', self.instance_variable_get(:@dn))
        end

        child_to_xml(xml_obj, option)
        return xml_obj
    end

    def check_prop_match(**kwargs)
        kwargs.each do |prop_name, prop_value|
            #prop_name_s = prop_name.to_s
            if prop_value.nil?
                next
            end
            if !ImcCoreUtils.prop_exists(self.mo_class, prop_name.to_s)
                raise ValueError.new("Invalid Property Name Exception - Prop #{prop_name}")
            end
            if prop_value != self.instance_variable_get("@" + prop_name.to_s)
                return false
            end
        end
        return true
    end

    def set_prop_multiple(**kwargs)
        kwargs.each do |prop_name, prop_value|
            if ImcCoreUtils.prop_exists(self.mo_class, prop_name)
                set_prop(prop_name.to_s, prop_value)
            else
                ImcWarning("Invalid Property Name for Class [#{self.class.to_s}]: Prop <#{prop_name.to_s}>, setting it forcefully")
                set_prop(prop_name.to_s, prop_value, forced: true)
            end
        end
    end

    def from_xml(elem, handle=nil)
    # Method updates the object from the xml representation of the managed object.

        @handle = handle
        if elem.attributes
            if !self.class.name.equal? "ManagedObject"
                elem.attributes.each do |attr_name, attr_value|
                    if ImcCoreUtils.property_exists_in_prop_map(self.mo_class, attr_name)
                        attr_name = ImcCoreUtils.get_property_from_prop_map(self.mo_class, attr_name)
                    else
                        @xtra_props[attr_name.to_sym] = GenericProp.new(attr_name, attr_value, false)
                    end
                    self.instance_variable_set("@" + attr_name, attr_value)
                end
            else
                elem.attributes.each do |attr_name, attr_value|
                    self.instance_variable_set("@" + attr_name, attr_value)                    
                end
            end
        end

        
        if elem.children
            elem.children.each do |child_elem|
                if !child_elem.is_a? Element
                    next
                end
                if !self.class.name.equal? "ManagedObject" and  ImcCoreUtils.get_mo_meta(self.mo_class).field_names.include? child_elem.name
                    next
                end

                class_id = ImcGenUtils.word_u(child_elem.name)
                child_obj = ImcCoreUtils.get_imc_obj(class_id, child_elem, nil)
              
                child_obj.from_xml(child_elem, handle)
                self.child_add(child_obj)
            end
        end
    end

    def get_version(platform)
=begin
        Method to get the IMC version from which this MO is supported
=end
       mo_meta = ImcCoreUtils.get_mo_meta(self, platform)
        return mo_meta.version
    end

    def sync_mo(mo)
    #Method to return string representation of a managed object.
    #TBD
    end

    def show_tree(level=0)
    #Method to return string representation of a managed object.
    end

    def show_hierarchy(level=0, depth=nil, show_level=[])
    #Method to print hierarchy
    end

    def set_prop(name, value, mark_dirty: true, forced: false)
=begin
        Internal method to set the properties after validation

        Args:
            name (str): property name
            value (str): property value
            mark_dirty (bool): if True, property will be part of xml request
            forced (bool): if True, set the value without validation

        Returns:
            None
=end

        if value.nil?
            return
        end
        if !forced
            #prop_meta = @mo_class.prop_meta[name.to_s]
            prop_meta = ImcCoreUtils.get_prop_meta(self.mo_class, name.to_s)
            if prop_meta.access != MoPropertyMeta::READ_WRITE
                if self.instance_variable_defined?("@" + name) and  prop_meta.access != MoPropertyMeta::CREATE_ONLY
                    raise ValueError.new("#{name} is not a read-write property.")
                end
            end

            if !prop_meta.validate_property_value(value)
                raise ValueError.new("Invalid Value Exception - #{self.class.name}: Prop <#{name}>, Value <#{value}> ")
            end

            if prop_meta.mask and mark_dirty
                @dirty_mask |= prop_meta.mask
            end
        end
        self.instance_variable_set("@" + name.to_s, value)
    end


    private

    def setattr(name, value)
        
        if self.instance_variable_defined? "prop_meta" and \
            ImcCoreUtils.prop_exists(self, name)

            if ImcCoreUtils.prop_exists(self.mo_class, name)
                if self.instance_variable_defined?("@" + name)
                    set_prop(name, value)
                end
            else
                if value
                    #if not self.prop_meta[name].validate_property_value(value):
                    #    raise ValueError.new("Invalid Value Exception - [#{self.class.name}]: Prop <#{name}>, Value<#{value}>. ")
                    #end
                    self.instance_variable_set("@" + name, value)
                    prop = ImcCoreUtils.get_prop_meta(self, name)
                    if !prop.mask.nil?
                        self.dirty_mask |= prop.mask
                    end
                end
            end
        elsif name.start_with("_")
            self.instance_variable_set("@"+name, value)
        else
            # These are properties which the current version of imc sdk
            # does not know of.
            # The code will come here lot often, when using older version of
            # imcsdk with newer releases on the IMC.
            # This needs to be handled so that the same sdk can work across
            # multiple imc releases
            self.xtra_props[name.to_sym] = GenericProp.new(name, value, true)
            self.dirty_mask |= self.xtra_props_dirty_mask
            self.instance_variable_set("@"+name, value)
        end
    end

    def rn_set()

        #Internal method to set rn

        if ImcCoreUtils.prop_exists(self.mo_class, "rn")
            @rn = make_rn()
        else
            @rn = ""
        end
    end

    def dn_set()

        #Internal method to set dn
        if ImcCoreUtils.prop_exists(self.mo_class, "dn")
            if !self.parent_dn.nil?
                @dn = @parent_dn + '/' + @rn
            else
                @dn = @rn
            end
        else
            @dn = ""
        end
    end

end

def generic_mo_from_xml(xml_str)
#create GenericMo Object from xml String
=begin
    create GenericMo object from xml string
=end
    root_elem = ET.fromstring(xml_str)
    class_id = root_elem.name
    gmo = GenericMo.new(class_id)
    gmo.from_xml(root_elem)
    return gmo
end

def generic_mo_from_xml_elem(elem)
#create GenericMo object from xml element
=begin
    create GenericMo object from xml element
=end

    #from . import imcxmlcodec as xc
    xml_str = ImcXmlCodec.to_xml_str(elem)
    gmo = generic_mo_from_xml(xml_str)
    return gmo
end


class GenericMo < ImcBase

=begin
    This class implements a Generic Managed Object.
    Args:
        class_id (str): class id of managed object
        parent_mo_or_dn (ManagedObject or str): parent managed object or dn
=end

    # Every variable that should not be a part of the final xml
    # should start with a underscore in this class


    def initialize(class_id, parent_mo_or_dn=nil, **kwargs)
        @properties = {}

        if parent_mo_or_dn.is_a? GenericMo
            @parent_mo = parent_mo_or_dn
            @parent_dn = parent_mo_or_dn.dn
        elsif parent_mo_or_dn.is_a? String
            @parent_dn = parent_mo_or_dn
            @parent_mo = nil
        elsif parent_mo_or_dn.nil?
            @parent_dn=""
            @parent_mo=nil            
        else
            raise ValueError.new("parent_mo_or_dn should be an instance of str or Generic Mo")
        end

        super(class_id)

        if kwargs
            kwargs.each do |key, value|
                instance_variable_set(:key, value.to_s)
                properties[:key] = value.to_s
            end
        end
        if self.instance_variable_defined?("@rn") and self.instance_variable_defined?("@dn")

        elsif self.instance_variable_defined?("@rn") and !self.instance_variable_defined?("@dn")
            if self.parent_dn and self.parent_dn != ""
                self.dn = self.parent_dn + '/' + self.rn
                self.properties[:dn] = self.dn
            else
                self.dn = self.rn
                self.properties[:dn] = self.dn
            end
        elsif !self.instance_variable_defined?("@rn") and self.instance_variable_defined?("@dn")
            self.rn = File.basename(self.dn)
            self.properties[:rn] = self.rn
        else
            self.rn = ""
            self.dn = ""
        end
        if self.parent_mo
            self.parent_mo.child_add(self)
        end
    end

    def to_xml(xml_doc=nil, option=nil, cookie=nil)
=begin
        This method returns the xml element node for the current object
        with it's hierarchy.
        Args:
            xml_doc: document to which the Mo attributes are added.
                    Can be None.
            option: not required for Generic Mo class object
        Example:
            from imcmsdk.imcmo import GenericMo\n
            args = {"a": 1, "b": 2, "c":3}\n
            obj = GenericMo("testLsA", "org-root", **args)\n
            obj1 = GenericMo("testLsB", "org-root", **args)\n
            obj.add_child(obj1)\n
            elem = obj.write_xml()\n
            import imcmsdk.imcxmlcodec as xc\n
            xc.to_xml_str(elem)\n
        Output:
            '<testLsA a="1" b="2" c="3" dn="org-root/" rn="">\n
                <testLsB a="1" b="2" c="3" dn="org-root/" rn="" />\n
            </testLsA>'
=end

        if xml_doc.nil?
            xml_obj = Element.new (ImcGenUtils.word_l(self._class_id))
        else
            xml_obj = xml_obj.add_element(ImcGenUtils.word_l(self._class_id))
        end
        self.instance_variables.each do |key|
            if !key.start_with?("_")
                #xml_obj.set(key, getattr(self, key))
                value = instance_variable_get(key)
                if !value.nil?
                    xml_obj.add_attribute(key, value)
                end
            end
        end
        self.child_to_xml(xml_obj)
        return xml_obj
    end

    def from_xml(elem, handle=nil)
=begin
        This method is form objects out of xml element.
        This is called internally from imcxmlcode.from_xml_str
        method.
        Example:
            xml = '<testLsA a="1" b="2" c="3" dn="org-root/" rn="">
            <testLsB a="1" b="2" c="3" dn="org-root/" rn="" /></testLsA>'\n
            obj = xc.from_xml_str(xml)\n
            print type(obj)\n
        Outputs:
            <class 'imcsdk.imcmo.GenericMo'>
=end

        if elem.nil?
            return nil
        end
        self.handle = handle
        self.class_id = elem.name
        if elem.attributes
            elem.attributes.each do |attr_name, attr_value|
                self.instance_variable_set("@" + attr_name, attr_value) 
                self.properties[attr_name.to_sym] = attr_value.to_s
            end
        end
        if self.rn and self.dn

        elsif self.rn and !self.dn
            if self.parent_dn and self.parent_dn != ""
                self.dn = self.parent_dn + '/' + self.rn
                self.properties[:dn] = self.dn
            else
                self.dn = self.rn
                self.properties[:dn] = self.dn
            end
        elsif !self.rn and self.dn
            self.rn = File.basename(self.dn)
            self.properties[:rn] = self.rn
        end

        #children = elem.getchildren()
        if elem.children
            elem.children.each do |child_elem|
                if !child_elem.is_a? Element
                    next
                end
                class_id = ImcGenUtils.word_u(child.name)
                pdn = nil
                if self.instance_variable_defined?("@dn")
                    pdn = self.dn
                end
                child_obj = GenericMo.new(class_id, pdn)
                self.child_add(child_obj)
                child_obj.from_xml(child, handle)
            end
        end
    end


    def to_mo()
=begin
        Converts GenericMo to ManagedObject
=end

        #from . import imcmeta

        class_id = ImcGenUtils.word_u(self.class_id)
        if !($MO_CLASS_ID.include? class_id)
            return nil
        end
        mo = _get_mo_obj(class_id)
        if !mo  # or not isinstance(mo, ManagedObject):
            return nil
        end

        for prop in self.properties
            if ImcCoreUtils.property_exists_in_prop_map(mo, prop)
                prop = ImcCoreUtils.get_property_from_prop_map(mo, prop)
                value = self.properties[prop]
                mo.instance_variable_set(prop.to_sym, value)
                #mo.__dict__[ImcCoreUtils.get_property_from_prop_map(mo, prop)] = \
                #    self.properties[prop]
            else
                ImcWarning("Property #{ImcGenUtils.word_u(prop)} Not Exist in MO #{child_id}")
            end
        end
        if self.child.size
            for ch_ in self.child
                mo_ch = ch_.to_mo()
                mo.child_add(mo_ch)
            end
        end

        return mo
    end

    private


    def _get_mo_obj(class_id)
=begin
        Internal methods to create managed object from class_id
=end

        #import inspect
        mo_class = ImcCoreUtils.load_class(class_id)
        mo_class_params = mo_class.instance_method(:initialize).parameters.map(&:last).map(&:to_s)

        mo_class_param_dict = {}
        for param in mo_class_params
            prop = ImcCoreUtils.get_prop_meta(mo_class, param)
            mo_param = prop.xml_attribute
            if !(self.properties.include? mo_param)
                if self.properties.inlcude?("rn")
                    rn_str = self.properties['rn']
                elsif self.properties.include?("dn")
                    rn_str = File.basename(self.properties['dn'])
                end

                mo_meta = ImcCoreUtils.get_mo_meta(mo_class)
                rn_pattern = mo_meta.rn
                np_dict = ImcCoreUtils.get_naming_props(rn_str, rn_pattern)
                if !(np_dict.inlcude?(param))
                    mo_class_param_dict[param] = ""
                else
                    mo_class_param_dict[param] = np_dict[param]
                end
            else
                mo_class_param_dict[param] = self.properties[mo_param]
            end
        end

        p_dn = ""

        mo_meta = ImcCoreUtils.get_mo_meta(mo_class)
        class_parents = mo_meta.parents
        if class_parents.include?("topRoot")
            mo_obj = mo_class(**mo_class_param_dict)
        else
            mo_obj = mo_class(p_dn, **mo_class_param_dict)
        end
        return mo_obj
    end
end