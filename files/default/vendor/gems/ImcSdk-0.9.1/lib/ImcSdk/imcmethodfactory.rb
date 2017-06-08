# Copyright 2015 Cisco Systems, Inc.
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


#This is an auto-generated module.
#It contains supporting classes for External Method.


require_relative 'imcmethod'
require_relative 'imccoremeta'
require_relative 'imcconstants'


def aaa_get_compute_auth_tokens(cookie)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("AaaGetComputeAuthTokens")

    method.set_property("cookie",cookie)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def aaa_keep_alive(cookie)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("AaaKeepAlive")

    method.set_property("cookie",cookie)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def aaa_login(in_name, in_password)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("AaaLogin")

    method.set_property("in_name",in_name)
    method.set_property("in_password",in_password)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def aaa_logout(in_cookie)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("AaaLogout")

    method.set_property("in_cookie",in_cookie)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def aaa_refresh(in_cookie, in_name, in_password)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("AaaRefresh")

    method.set_property("in_cookie",in_cookie)
    method.set_property("in_name",in_name)
    method.set_property("in_password",in_password)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def config_conf_mo(cookie, dn, in_config, in_hierarchical=YesOrNo.FALSE)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("ConfigConfMo")

    method.set_property("cookie",cookie)
    method.set_property("dn",dn)
    method.set_property("in_config",in_config)
    method.set_property("in_hierarchical", (ImcGenUtils::AFFIRMATIVE_LIST.include? in_hierarchical) ? true : false)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def config_conf_mos(cookie, in_configs, in_hierarchical=YesOrNo.FALSE)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("ConfigConfMos")

    method.set_property("cookie",cookie)
    method.set_property("in_configs",in_configs)
    method.set_property("in_hierarchical", (ImcGenUtils::AFFIRMATIVE_LIST.include? in_hierarchical) ? true : false)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def config_resolve_children(cookie, class_id, in_dn, in_hierarchical=YesOrNo.FALSE)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("ConfigResolveChildren")

    meta_class_id = ImcCoreUtils.find_class_id_in_mo_meta_ignore_case(class_id)
    if !meta_class_id.nil?
        class_id = ImcGenUtils.word_l(meta_class_id)
    end
    method.set_property("class_id",class_id)
    method.set_property("cookie",cookie)
    method.set_property("in_dn",in_dn)
    method.set_property("in_hierarchical", (ImcGenUtils::AFFIRMATIVE_LIST.include? in_hierarchical) ? true : false)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def config_resolve_class(cookie, class_id, in_hierarchical=YesOrNo.FALSE)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("ConfigResolveClass")

    meta_class_id = ImcCoreUtils.find_class_id_in_mo_meta_ignore_case(class_id)
    if !meta_class_id.nil?
        class_id = ImcGenUtils.word_l(meta_class_id)
    end
    method.set_property("class_id",class_id)
    method.set_property("cookie",cookie)
    method.set_property("in_hierarchical", (ImcGenUtils::AFFIRMATIVE_LIST.include? in_hierarchical) ? true : false)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def config_resolve_dn(cookie, dn, in_hierarchical=YesOrNo.FALSE)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("ConfigResolveDn")

    method.set_property("cookie",cookie)
    method.set_property("dn",dn)
    method.set_property("in_hierarchical", (ImcGenUtils::AFFIRMATIVE_LIST.include? in_hierarchical) ? true : false)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def config_resolve_parent(cookie, dn, in_hierarchical=YesOrNo.FALSE)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("ConfigResolveParent")

    method.set_property("cookie",cookie)
    method.set_property("dn",dn)
    method.set_property("in_hierarchical", (ImcGenUtils::AFFIRMATIVE_LIST.include? in_hierarchical) ? true : false)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def event_subscribe(cookie)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("EventSubscribe")

    method.set_property("cookie",cookie)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end

def event_unsubscribe(cookie)
    # Auto-generated IMC XML API Method. 
    method = ExternalMethod.new("EventUnsubscribe")

    method.set_property("cookie",cookie)

    xml_request = method.to_xml(nil, WriteXmlOption::DIRTY, nil)
    return xml_request

end
