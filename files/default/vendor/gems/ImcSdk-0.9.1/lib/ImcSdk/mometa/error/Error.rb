#This module contains the general information for Error ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class ErrorConsts
    
end


class Error < ManagedObject
    #This is Error class.

    @@consts = ErrorConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("Error", "error", "", VersionMeta::VERSION151F, "OutputOnly", 0x1, [], [""], [nil]),
        "modular" => MoMeta.new("Error", "error", "", VersionMeta::VERSION2013E, "OutputOnly", 0x1, [], [""], [nil])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "cookie" => MoPropertyMeta.new("cookie", "cookie", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "error_code" => MoPropertyMeta.new("error_code", "errorCode", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "error_descr" => MoPropertyMeta.new("error_descr", "errorDescr", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "invocation_result" => MoPropertyMeta.new("invocation_result", "invocationResult", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "response" => MoPropertyMeta.new("response", "response", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "false", "no", "true", "yes"], []), 
        },

        "modular" => {
            "cookie" => MoPropertyMeta.new("cookie", "cookie", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "error_code" => MoPropertyMeta.new("error_code", "errorCode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "error_descr" => MoPropertyMeta.new("error_descr", "errorDescr", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "invocation_result" => MoPropertyMeta.new("invocation_result", "invocationResult", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "response" => MoPropertyMeta.new("response", "response", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["No", "Yes", "no", "yes"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "cookie" => "cookie", 
        "errorCode" => "error_code", 
        "errorDescr" => "error_descr", 
        "invocationResult" => "invocation_result", 
        "response" => "response", 
        },

        "modular" => {
            "cookie" => "cookie", 
            "errorCode" => "error_code", 
            "errorDescr" => "error_descr", 
            "invocationResult" => "invocation_result", 
            "response" => "response", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :cookie
    attr_reader :error_code
    attr_reader :error_descr
    attr_reader :invocation_result
    attr_reader :response


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @cookie = nil
        @error_code = nil
        @error_descr = nil
        @invocation_result = nil
        @response = nil

        super(class_id: "Error", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
