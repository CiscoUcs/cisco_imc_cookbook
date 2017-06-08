#This module contains the meta information of ConfigResolveDn ExternalMethod.

require_relative '../imccoremeta'

ExternalMethod.class_variable_set(:@@method_meta, MethodMeta.new("ConfigResolveDn", "configResolveDn", "Version142b"))

ExternalMethod.class_variable_set(:@@method_prop_meta, {
    "cookie" => MethodPropertyMeta.new("Cookie", "cookie", "StringMin0Max47", "Version142b", "InputOutput", false),
    "dn" => MethodPropertyMeta.new("Dn", "dn", "ReferenceObject", "Version142b", "InputOutput", false),
    "in_hierarchical" => MethodPropertyMeta.new("InHierarchical", "inHierarchical", "Xs:string", "Version142b", "Input", false),
    "out_config" => MethodPropertyMeta.new("OutConfig", "outConfig", "ConfigConfig", "Version142b", "Output", true),
})

ExternalMethod.class_variable_set(:@@method_prop_map, {
    "cookie" => "cookie",
    "dn" => "dn",
    "inHierarchical" => "in_hierarchical",
    "outConfig" => "out_config",
})

