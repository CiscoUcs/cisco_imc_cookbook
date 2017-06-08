#This module contains the general information for KmipManagement ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class KmipManagementConsts
    ADMIN_ACTION_DELETE_CLIENT_CERTIFICATE = "delete-client-certificate"
    ADMIN_ACTION_DELETE_CLIENT_PRIVATE_KEY = "delete-client-private-key"
    ADMIN_ACTION_DELETE_ROOT_CA_CERTIFICATE = "delete-root-ca-certificate"
end


class KmipManagement < ManagedObject
    #This is KmipManagement class.

    @@consts = KmipManagementConsts.new()
#    @@naming_props = set([])

    @@mo_meta = {
        "classic" => MoMeta.new("KmipManagement", "kmipManagement", "kmip-mgmt", VersionMeta::VERSION302B, "InputOutput", 0x3f, [], ["admin", "read-only", "user"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["delete-client-certificate", "delete-client-private-key", "delete-root-ca-certificate"], []), 
        "client_certificate" => MoPropertyMeta.new("client_certificate", "clientCertificate", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "client_private_key" => MoPropertyMeta.new("client_private_key", "clientPrivateKey", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "description" => MoPropertyMeta.new("description", "description", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x8, 0, 255, nil, [], []), 
        "secure_key_management" => MoPropertyMeta.new("secure_key_management", "secureKeyManagement", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x10, nil, nil, nil, ["Disabled", "Enabled", "disabled", "enabled"], []), 
        "server_root_ca_certificate" => MoPropertyMeta.new("server_root_ca_certificate", "serverRootCACertificate", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "clientCertificate" => "client_certificate", 
        "clientPrivateKey" => "client_private_key", 
        "description" => "description", 
        "dn" => "dn", 
        "rn" => "rn", 
        "secureKeyManagement" => "secure_key_management", 
        "serverRootCACertificate" => "server_root_ca_certificate", 
        "status" => "status", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_accessor :admin_action
    attr_reader :client_certificate
    attr_reader :client_private_key
    attr_reader :description
    attr_accessor :secure_key_management
    attr_reader :server_root_ca_certificate
    attr_accessor :status


    def initialize(parent_mo_or_dn: nil,  **kwargs)
        @dirty_mask = 0
        @admin_action = nil
        @client_certificate = nil
        @client_private_key = nil
        @description = nil
        @secure_key_management = nil
        @server_root_ca_certificate = nil
        @status = nil

        super(class_id: "KmipManagement", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
