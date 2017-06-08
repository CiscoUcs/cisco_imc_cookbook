#This module contains the meta information of ConfigResolveClass ExternalMethod.

require_relative '../imccoremeta'

ExternalMethod.class_variable_set(:@@method_meta, MethodMeta.new("ConfigResolveClass", "configResolveClass", "Version142b"))

ExternalMethod.class_variable_set(:@@method_prop_meta, {
    "class_id" => MethodPropertyMeta.new("ClassId", "classId", "NamingClassId", "Version142b", "InputOutput", false),
    "cookie" => MethodPropertyMeta.new("Cookie", "cookie", "StringMin0Max47", "Version142b", "InputOutput", false),
    "in_hierarchical" => MethodPropertyMeta.new("InHierarchical", "inHierarchical", "Xs:string", "Version142b", "Input", false),
    "out_configs" => MethodPropertyMeta.new("OutConfigs", "outConfigs", "ConfigSet", "Version142b", "Output", true),
})

ExternalMethod.class_variable_set(:@@method_prop_map, {
    "classId" => "class_id",
    "cookie" => "cookie",
    "inHierarchical" => "in_hierarchical",
    "outConfigs" => "out_configs",
})

