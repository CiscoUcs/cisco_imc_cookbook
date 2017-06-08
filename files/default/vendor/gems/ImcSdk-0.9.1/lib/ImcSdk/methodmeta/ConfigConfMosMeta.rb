#This module contains the meta information of ConfigConfMos ExternalMethod.

require_relative '../imccoremeta'

ExternalMethod.class_variable_set(:@@method_meta, MethodMeta.new("ConfigConfMos", "configConfMos", "Version142b"))

ExternalMethod.class_variable_set(:@@method_prop_meta, {
    "cookie" => MethodPropertyMeta.new("Cookie", "cookie", "Xs:string", "Version142b", "InputOutput", false),
    "in_configs" => MethodPropertyMeta.new("InConfigs", "inConfigs", "ConfigMap", "Version142b", "Input", true),
    "in_hierarchical" => MethodPropertyMeta.new("InHierarchical", "inHierarchical", "Xs:string", "Version142b", "InputOutput", false),
    "out_configs" => MethodPropertyMeta.new("OutConfigs", "outConfigs", "ConfigMap", "Version142b", "Output", true),
})

ExternalMethod.class_variable_set(:@@method_prop_map, {
    "cookie" => "cookie",
    "inConfigs" => "in_configs",
    "inHierarchical" => "in_hierarchical",
    "outConfigs" => "out_configs",
})

