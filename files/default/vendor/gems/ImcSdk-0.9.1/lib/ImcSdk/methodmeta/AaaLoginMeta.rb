#This module contains the meta information of AaaLogin ExternalMethod.

require_relative '../imccoremeta'

ExternalMethod.class_variable_set(:@@method_meta, MethodMeta.new("AaaLogin", "aaaLogin", "Version142b"))

ExternalMethod.class_variable_set(:@@method_prop_meta, {
    "cookie" => MethodPropertyMeta.new("Cookie", "cookie", "StringMin0Max47", "Version142b", "InputOutput", false),
    "in_name" => MethodPropertyMeta.new("InName", "inName", "Xs:string", "Version142b", "Input", false),
    "in_password" => MethodPropertyMeta.new("InPassword", "inPassword", "Xs:string", "Version142b", "Input", false),
    "out_channel" => MethodPropertyMeta.new("OutChannel", "outChannel", "Xs:string", "Version142b", "Output", false),
    "out_cookie" => MethodPropertyMeta.new("OutCookie", "outCookie", "Xs:string", "Version142b", "Output", false),
    "out_domains" => MethodPropertyMeta.new("OutDomains", "outDomains", "Xs:string", "Version142b", "Output", false),
    "out_evt_channel" => MethodPropertyMeta.new("OutEvtChannel", "outEvtChannel", "Xs:string", "Version142b", "Output", false),
    "out_priv" => MethodPropertyMeta.new("OutPriv", "outPriv", "Xs:string", "Version142b", "Output", false),
    "out_refresh_period" => MethodPropertyMeta.new("OutRefreshPeriod", "outRefreshPeriod", "Xs:unsignedInt", "Version142b", "Output", false),
    "out_session_id" => MethodPropertyMeta.new("OutSessionId", "outSessionId", "Xs:string", "Version142b", "Output", false),
    "out_status" => MethodPropertyMeta.new("OutStatus", "outStatus", "Xs:string", "Version142b", "Output", false),
    "out_version" => MethodPropertyMeta.new("OutVersion", "outVersion", "Xs:string", "Version142b", "Output", false),
})

ExternalMethod.class_variable_set(:@@method_prop_map, {
    "cookie" => "cookie",
    "inName" => "in_name",
    "inPassword" => "in_password",
    "outChannel" => "out_channel",
    "outCookie" => "out_cookie",
    "outDomains" => "out_domains",
    "outEvtChannel" => "out_evt_channel",
    "outPriv" => "out_priv",
    "outRefreshPeriod" => "out_refresh_period",
    "outSessionId" => "out_session_id",
    "outStatus" => "out_status",
    "outVersion" => "out_version",
})

