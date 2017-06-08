#This module contains the general information for KmipServer ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class KmipServerConsts
    ADMIN_ACTION_DELETE = "delete"
    ADMIN_ACTION_TEST_CONNECTION = "test-connection"
end


class KmipServer < ManagedObject
    #This is KmipServer class.

    @@consts = KmipServerConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("KmipServer", "kmipServer", "kmip-server-[id]", VersionMeta::VERSION302B, "InputOutput", 0x1ff, [], ["admin", "read-only", "user"], ["Get", "Set"]),
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "admin_action" => MoPropertyMeta.new("admin_action", "adminAction", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x2, 0, 510, nil, ["delete", "test-connection"], []), 
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION302B, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x4, 0, 255, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x8, 0, 510, nil, [], ["1-2"]), 
        "ip_address" => MoPropertyMeta.new("ip_address", "ipAddress", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x10, 0, 255, %q{(([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:([0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{0,4}|:[0-9A-Fa-f]{1,4})?|(:[0-9A-Fa-f]{1,4}){0,2})|(:[0-9A-Fa-f]{1,4}){0,3})|(:[0-9A-Fa-f]{1,4}){0,4})|:(:[0-9A-Fa-f]{1,4}){0,5})((:[0-9A-Fa-f]{1,4}){2}|:(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])(\.(25[0-5]|(2[0-4]|1[0-9]|[1-9])?[0-9])){3})|(([0-9A-Fa-f]{1,4}:){1,6}|:):[0-9A-Fa-f]{0,4}|([0-9A-Fa-f]{1,4}:){7}:) |((([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})|(([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?)+)|([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]))}, [], []), 
        "port" => MoPropertyMeta.new("port", "port", "uint", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x20, nil, nil, nil, [], ["1-65535"]), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x40, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x80, nil, nil, nil, ["", "created", "deleted", "modified", "removed"], []), 
        "test_connction_status" => MoPropertyMeta.new("test_connction_status", "testConnctionStatus", "string", VersionMeta::VERSION302B, MoPropertyMeta::READ_ONLY, nil, 0, 510, nil, [], []), 
        "timeout" => MoPropertyMeta.new("timeout", "timeout", "uint", VersionMeta::VERSION302B, MoPropertyMeta::READ_WRITE, 0x100, nil, nil, nil, [], ["0-250"]), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "adminAction" => "admin_action", 
        "childAction" => "child_action", 
        "dn" => "dn", 
        "id" => "id", 
        "ipAddress" => "ip_address", 
        "port" => "port", 
        "rn" => "rn", 
        "status" => "status", 
        "testConnctionStatus" => "test_connction_status", 
        "timeout" => "timeout", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_accessor :admin_action
    attr_reader :child_action
    attr_accessor :ip_address
    attr_accessor :port
    attr_accessor :status
    attr_reader :test_connction_status
    attr_accessor :timeout


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @admin_action = nil
        @child_action = nil
        @ip_address = nil
        @port = nil
        @status = nil
        @test_connction_status = nil
        @timeout = nil

        super(class_id: "KmipServer", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
