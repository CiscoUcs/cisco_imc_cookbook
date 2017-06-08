#This module contains the meta information of AaaGetComputeAuthTokens ExternalMethod.

require_relative '../imccoremeta'

ExternalMethod.class_variable_set(:@@method_meta, MethodMeta.new("AaaGetComputeAuthTokens", "aaaGetComputeAuthTokens", "Version142b"))

ExternalMethod.class_variable_set(:@@method_prop_meta, {
    "cookie" => MethodPropertyMeta.new("Cookie", "cookie", "StringMin0Max47", "Version142b", "InputOutput", false),
    "out_tokens" => MethodPropertyMeta.new("OutTokens", "outTokens", "Xs:string", "Version142b", "Output", false),
})

ExternalMethod.class_variable_set(:@@method_prop_map, {
    "cookie" => "cookie",
    "outTokens" => "out_tokens",
})

