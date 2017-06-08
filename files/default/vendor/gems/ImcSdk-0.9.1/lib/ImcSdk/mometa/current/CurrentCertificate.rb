#This module contains the general information for CurrentCertificate ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class CurrentCertificateConsts
    
end


class CurrentCertificate < ManagedObject
    #This is CurrentCertificate class.

    @@consts = CurrentCertificateConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("CurrentCertificate", "currentCertificate", "curr-cert", VersionMeta::VERSION209C, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], [nil]),
        "modular" => MoMeta.new("CurrentCertificate", "currentCertificate", "curr-cert", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], [nil])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION209C, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "common_name" => MoPropertyMeta.new("common_name", "commonName", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
        "country_code" => MoPropertyMeta.new("country_code", "countryCode", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "issuer_common_name" => MoPropertyMeta.new("issuer_common_name", "issuerCommonName", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
        "issuer_country_code" => MoPropertyMeta.new("issuer_country_code", "issuerCountryCode", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
        "issuer_locality" => MoPropertyMeta.new("issuer_locality", "issuerLocality", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
        "issuer_organization" => MoPropertyMeta.new("issuer_organization", "issuerOrganization", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
        "issuer_organizational_unit" => MoPropertyMeta.new("issuer_organizational_unit", "issuerOrganizationalUnit", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
        "issuer_state" => MoPropertyMeta.new("issuer_state", "issuerState", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "locality" => MoPropertyMeta.new("locality", "locality", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
        "organization" => MoPropertyMeta.new("organization", "organization", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
        "organizational_unit" => MoPropertyMeta.new("organizational_unit", "organizationalUnit", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "serial_number" => MoPropertyMeta.new("serial_number", "serialNumber", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "state" => MoPropertyMeta.new("state", "state", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "valid_from" => MoPropertyMeta.new("valid_from", "validFrom", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "valid_to" => MoPropertyMeta.new("valid_to", "validTo", "string", VersionMeta::VERSION209C, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "common_name" => MoPropertyMeta.new("common_name", "commonName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
            "country_code" => MoPropertyMeta.new("country_code", "countryCode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "issuer_common_name" => MoPropertyMeta.new("issuer_common_name", "issuerCommonName", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
            "issuer_country_code" => MoPropertyMeta.new("issuer_country_code", "issuerCountryCode", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
            "issuer_locality" => MoPropertyMeta.new("issuer_locality", "issuerLocality", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
            "issuer_organization" => MoPropertyMeta.new("issuer_organization", "issuerOrganization", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
            "issuer_organizational_unit" => MoPropertyMeta.new("issuer_organizational_unit", "issuerOrganizationalUnit", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
            "issuer_state" => MoPropertyMeta.new("issuer_state", "issuerState", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "locality" => MoPropertyMeta.new("locality", "locality", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
            "organization" => MoPropertyMeta.new("organization", "organization", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
            "organizational_unit" => MoPropertyMeta.new("organizational_unit", "organizationalUnit", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "serial_number" => MoPropertyMeta.new("serial_number", "serialNumber", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "state" => MoPropertyMeta.new("state", "state", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 1, 243, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "valid_from" => MoPropertyMeta.new("valid_from", "validFrom", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
            "valid_to" => MoPropertyMeta.new("valid_to", "validTo", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "commonName" => "common_name", 
        "countryCode" => "country_code", 
        "dn" => "dn", 
        "issuerCommonName" => "issuer_common_name", 
        "issuerCountryCode" => "issuer_country_code", 
        "issuerLocality" => "issuer_locality", 
        "issuerOrganization" => "issuer_organization", 
        "issuerOrganizationalUnit" => "issuer_organizational_unit", 
        "issuerState" => "issuer_state", 
        "locality" => "locality", 
        "organization" => "organization", 
        "organizationalUnit" => "organizational_unit", 
        "rn" => "rn", 
        "serialNumber" => "serial_number", 
        "state" => "state", 
        "status" => "status", 
        "validFrom" => "valid_from", 
        "validTo" => "valid_to", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "commonName" => "common_name", 
            "countryCode" => "country_code", 
            "dn" => "dn", 
            "issuerCommonName" => "issuer_common_name", 
            "issuerCountryCode" => "issuer_country_code", 
            "issuerLocality" => "issuer_locality", 
            "issuerOrganization" => "issuer_organization", 
            "issuerOrganizationalUnit" => "issuer_organizational_unit", 
            "issuerState" => "issuer_state", 
            "locality" => "locality", 
            "organization" => "organization", 
            "organizationalUnit" => "organizational_unit", 
            "rn" => "rn", 
            "serialNumber" => "serial_number", 
            "state" => "state", 
            "status" => "status", 
            "validFrom" => "valid_from", 
            "validTo" => "valid_to", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :child_action
    attr_reader :common_name
    attr_reader :country_code
    attr_reader :issuer_common_name
    attr_reader :issuer_country_code
    attr_reader :issuer_locality
    attr_reader :issuer_organization
    attr_reader :issuer_organizational_unit
    attr_reader :issuer_state
    attr_reader :locality
    attr_reader :organization
    attr_reader :organizational_unit
    attr_reader :serial_number
    attr_reader :state
    attr_reader :status
    attr_reader :valid_from
    attr_reader :valid_to


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @child_action = nil
        @common_name = nil
        @country_code = nil
        @issuer_common_name = nil
        @issuer_country_code = nil
        @issuer_locality = nil
        @issuer_organization = nil
        @issuer_organizational_unit = nil
        @issuer_state = nil
        @locality = nil
        @organization = nil
        @organizational_unit = nil
        @serial_number = nil
        @state = nil
        @status = nil
        @valid_from = nil
        @valid_to = nil

        super(class_id: "CurrentCertificate", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
