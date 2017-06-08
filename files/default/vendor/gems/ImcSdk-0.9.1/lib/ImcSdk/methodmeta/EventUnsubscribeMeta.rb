#This module contains the meta information of EventUnsubscribe ExternalMethod.

require_relative '../imccoremeta'

ExternalMethod.class_variable_set(:@@method_meta, MethodMeta.new("EventUnsubscribe", "eventUnsubscribe", "Version142b"))

ExternalMethod.class_variable_set(:@@method_prop_meta, {
    "cookie" => MethodPropertyMeta.new("Cookie", "cookie", "StringMin0Max47", "Version142b", "Input", false),
})

ExternalMethod.class_variable_set(:@@method_prop_map, {
    "cookie" => "cookie",
})

