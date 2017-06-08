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

#This module contains the ImcSdk Core Classes
#require 'imccoreutils'
require 'imcgenutils'
require 'rexml/document'
include REXML

class ImcBase < Object
    
    #This class acts as the base class for Managed object

    attr_reader :child
    attr_reader :dirty_mask

    def initialize(class_id)
        @class_id = class_id
        @child = Array.new
        @handle = nil
    end

    def get_class_id()
        return @class_id
    end

    def get_handle()
        return @handle
    end

    def child_add(obj)
        #Method adds the child managed object
        @child.push(Marshal.load(Marshal.dump(obj)))
    end

    def child_remove(obj)
        #Method removes the child managed object
        @child.delete(obj)
    end

    def child_count()
        #Method returns the child managed object count
        return @child.size()
    end
    
    def mark_clean()
        #Method cleans the dirty mask of the managed object
        @dirty_mask = 0
    end

    def is_dirty()
        #Method checks whether the object is dirty or not.
        return child_is_dirty()
    end

    def child_to_xml(xml_doc, option=nil, cookie=nil)
        #Method writes the xml representation for the object
        for child in @child do
            child.to_xml(xml_doc, option, elem_name=nil, cookie=cookie)
        end
    end

    def child_is_dirty()
        #Method checks whether the child object is dirty or not
        for child in @child do
            if child.is_dirty()
                return true
            end
        end
        return false
    end

    def child_mark_clean()
        #Method cleajs the disrty mask of child managed object.
        for child in @child do
            child.mark_clean()
        end
    end


    def write_object()
        #Method writes the string representation of the object.
        for child in @child do
            unless child.nil?
                child.write_object()
            end
        end
    end


    def clone()
        #Method returns the clone of the Managed object
        return Marshal.load(Marshal.dump(self))
    end

    private
    def deepcopy()
        #Overriden method to support deepcopy of Managed Object.

        clone = self.clone
        clone_child = Array.new
        for child in clone.childs do
            clone_child.push(Marshal.load(Marshal.dump(child)))
        end
        clone.childs = clone_child
        return clone
    end

    def attr_set(key,value)
       #This Method sets attribute value of the Managed Object.
       if instance_variable_defined?(key)
           instance_variable_set(key,value)
       end
    end
    public
    def attr_get(key)
       #This method gets attribute value of the Managed Object.
       if instance_variable_defined?(key)
           return instance_variable_get(key)
       end
       return nil
    end
    public
    def elem_create(class_tag, xml_doc=nil, override_tag=nil)
        if xml_doc.nil?
            xml_obj = Document.new
            xml_obj = Element.new class_tag
        else
            if override_tag
                xml_obj = xml_doc.add_element(override_tag)
            else
                xml_obj = xml_doc.add_element(class_tag)
            end
        end
        return xml_obj
    end
end


class AbstractFilter < ImcBase
    def initialize(class_id, tag_name=nil)
        @tag_name = tag_name
        ImcBase.Initialize(class_id)
    end

    def to_xml(xml_doc=nil, option=nil, elem_name=nil)
        #This method writes the xml representation of the Method Object.
        xml_obj = self.elem_create(@tag_name,
                                    xml_doc=xml_doc,
                                    elem_name)
        
        instance_variables.each_key do |key|
            if key.start_with?("@")
                next
            elsif key.equal?("class_") 
                xml_obj.set("class", self.attr_get(key))
            else
                xml_obj.add_attribute(key, self.attr_get(key))
            end
        end
    end
end

class BaseObject < ImcBase
    #class BaseObject
    def initialize(class_id, tag_name=nil)
        @tag_name = tag_name
        super(class_id)
    end

    def to_xml(xml_doc=nil, option=nil, elem_name=nil, cookie=nil)
        #This method writes the xml representation of the method object.
        xml_obj = self.elem_create(@tag_name,
                                    xml_doc=xml_doc,
                                    elem_name)
        instance_variables.each do |key, value|
            if key.to_s.start_with?("@")
                next
            else
                xml_obj.add_attribute(key, self.attr_get(key))
            end
        end
        self.child_to_xml(xml_obj, option,cookie=cookie)
        return xml_obj
    end

    def from_xml(elem, handle=nil)
        #This method created the object from the xml representation of the method object
        @handle = handle

        if elem.attributes
            elem.attributes.each do |attr_name, attr_value|
                instance_variable_set("@"+attr_name, attr_value)
            end 
        end
        if elem.children
            #for child_elem in elem.children
            elem.children.each do |child_elem|
                if !child_elem.instance_variable_defined?(:@name)
                    next
                end
                child_name = child_elem.name
                child_name = ImcGenUtils.word_u(child_name)
                child = ImcCoreUtils.get_imc_obj(child_name, child_elem)
                @child.push(child)
                child.from_xml(child_elem, handle)
            end
        end
    end
end
