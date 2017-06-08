#This module contains the meta information of ConfigResolveChildren ExternalMethod.

require_relative '../imccoremeta'

ExternalMethod.class_variable_set(:@@method_meta, MethodMeta.new("ConfigResolveChildren", "configResolveChildren", "Version142b"))

ExternalMethod.class_variable_set(:@@method_prop_meta, {
    "class_id" => MethodPropertyMeta.new("ClassId", "classId", "NamingClassId", "Version142b", "Input", false),
    "cookie" => MethodPropertyMeta.new("Cookie", "cookie", "StringMin0Max47", "Version142b", "InputOutput", false),
    "dn" => MethodPropertyMeta.new("Dn", "dn", "ReferenceObject", "Version142b", "Output", false),
    "in_dn" => MethodPropertyMeta.new("InDn", "inDn", "ReferenceObject", "Version142b", "Input", false),
    "in_hierarchical" => MethodPropertyMeta.new("InHierarchical", "inHierarchical", "Xs:string", "Version142b", "Input", false),
    "out_configs" => MethodPropertyMeta.new("OutConfigs", "outConfigs", "ConfigSet", "Version142b", "Output", true),
})

ExternalMethod.class_variable_set(:@@method_prop_map, {
    "classId" => "class_id",
    "cookie" => "cookie",
    "dn" => "dn",
    "inDn" => "in_dn",
    "inHierarchical" => "in_hierarchical",
    "outConfigs" => "out_configs",
})

