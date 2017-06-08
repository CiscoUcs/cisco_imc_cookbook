#This module contains the meta information of EventSubscribe ExternalMethod.

require_relative '../imccoremeta'

ExternalMethod.class_variable_set(:@@method_meta, MethodMeta.new("EventSubscribe", "eventSubscribe", "Version142b"))

ExternalMethod.class_variable_set(:@@method_prop_meta, {
    "cookie" => MethodPropertyMeta.new("Cookie", "cookie", "StringMin0Max47", "Version142b", "InputOutput", false),
})

ExternalMethod.class_variable_set(:@@method_prop_map, {
    "cookie" => "cookie",
})

