#This module contains the meta information of AaaLogout ExternalMethod.

require_relative '../imccoremeta'

ExternalMethod.class_variable_set(:@@method_meta, MethodMeta.new("AaaLogout", "aaaLogout", "Version142b"))

ExternalMethod.class_variable_set(:@@method_prop_meta, {
    "cookie" => MethodPropertyMeta.new("Cookie", "cookie", "StringMin0Max47", "Version142b", "InputOutput", false),
    "in_cookie" => MethodPropertyMeta.new("InCookie", "inCookie", "StringMin0Max47", "Version142b", "Input", false),
    "out_status" => MethodPropertyMeta.new("OutStatus", "outStatus", "Xs:string", "Version142b", "Output", false),
})

ExternalMethod.class_variable_set(:@@method_prop_map, {
    "cookie" => "cookie",
    "inCookie" => "in_cookie",
    "outStatus" => "out_status",
})

