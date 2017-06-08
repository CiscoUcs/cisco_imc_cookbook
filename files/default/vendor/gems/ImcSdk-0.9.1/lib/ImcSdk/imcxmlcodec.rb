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

require 'imcgenutils'
require 'imccoreutils'
require 'imcexception'
require 'rexml/document'

module ImcXmlCodec

    def self.to_xml_str(elem)
=begin
    Converts xml element to xml string.

    Args:
        elem (xml element)

    Returns:
        xml string

    Example:
        xml_str = to_xml_str(elem=xml_element)
=end
        target_str = String.new
        format = REXML::Formatters::Default.new
        format.write(elem, target_str)
        return target_str
    end

    def self.extract_root_elem(xml_str)
=begin
    extracts root xml element from xml string.

    Args:
        xml_str (str): xml string

    Returns:
        xml element

    Example:
        xml_str='''
        <lsClone dn="org-root/ls-testsp" inHierarchical="false"
        inServerName="test" inTargetOrg="">
        </lsClone>
        '''
        root_element = extract_root_elem(xml_str)
=end
        xml_doc = Document.new(xml_str)
        return doc.root.name
    end

    def self.from_xml_str(xml_str, handle=nil)
=begin
    Generates response object from the given xml string.

    Args:
        xml_str (str): xml string
        handle : ImcHandle

    Returns:
        object (external method or managed object or generic managed object)

    Example:
        xml_str='''\n
        <lsServer dn="org-root/ls-testsp" dynamicConPolicyName="test"\n
        extIPPoolName="ext-mgmt" name="testsp" />\n
        '''\n
        root_element = extract_root_elem(xml_str)\n
=end
        xml_doc = Document.new(xml_str)
        root_elem = xml_doc.root
        if root_elem.name.equal?("error") or root_elem.attributes.has_key? "errorCode"
            error_code = root_elem.attributes["errorCode"]
            error_descr = root_elem.attributes["errorDescr"]
            raise ImcException.new(error_code, error_descr)
        end
        class_id = ImcGenUtils.word_u(root_elem.name)
        response = ImcCoreUtils.get_imc_obj(class_id, root_elem)
        response.from_xml(root_elem, handle)
        return response
    end
end
