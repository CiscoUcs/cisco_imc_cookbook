#This module contains the general information for AaaSession ManagedObject.

require_relative '../../imcmo'
require_relative '../../imccoremeta'
require_relative '../../imcmeta'


class AaaSessionConsts
    UI_EP = "ep"
    UI_NONE = "none"
    UI_SERIAL = "serial"
    UI_SHELL = "shell"
    UI_V_MEDIA = "vMedia"
    UI_WEB = "web"
    UI_SERVER_1_SOL = "server-1:SOL"
    UI_SERVER_1_V_KVM = "server-1:vKVM"
    UI_SERVER_1_V_MEDIA = "server-1:vMedia"
    UI_SERVER_2_SOL = "server-2:SOL"
    UI_SERVER_2_V_KVM = "server-2:vKVM"
    UI_SERVER_2_V_MEDIA = "server-2:vMedia"
end


class AaaSession < ManagedObject
    #This is AaaSession class.

    @@consts = AaaSessionConsts.new()
#    @@naming_props = set([u'id'])

    @@mo_meta = {
        "classic" => MoMeta.new("AaaSession", "aaaSession", "term-[id]", VersionMeta::VERSION151F, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"]),
        "modular" => MoMeta.new("AaaSession", "aaaSession", "term-[id]", VersionMeta::VERSION2013E, "OutputOnly", 0xf, [], ["admin", "read-only", "user"], ["Get"])
    }

    def self.mo_meta
        @@mo_meta
    end

    @@prop_meta = {

        "classic" => {
        "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION151F, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
        "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
        "host" => MoPropertyMeta.new("host", "host", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
        "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION151F, MoPropertyMeta::NAMING, nil, 1, 32, nil, [], []), 
        "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
        "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
        "ui" => MoPropertyMeta.new("ui", "ui", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["ep", "none", "serial", "shell", "vMedia", "web"], []), 
        "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION151F, MoPropertyMeta::READ_ONLY, nil, 0, 255, nil, [], []), 
        },

        "modular" => {
            "child_action" => MoPropertyMeta.new("child_action", "childAction", "string", VersionMeta::VERSION2013E, MoPropertyMeta::INTERNAL, nil, nil, nil, nil, [], []), 
            "dn" => MoPropertyMeta.new("dn", "dn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x2, 0, 255, nil, [], []), 
            "host" => MoPropertyMeta.new("host", "host", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, [], []), 
            "id" => MoPropertyMeta.new("id", "id", "string", VersionMeta::VERSION2013E, MoPropertyMeta::NAMING, nil, 1, 32, nil, [], []), 
            "rn" => MoPropertyMeta.new("rn", "rn", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x4, 0, 255, nil, [], []), 
            "status" => MoPropertyMeta.new("status", "status", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, 0x8, nil, nil, %q{((removed|created|modified|deleted),){0,3}(removed|created|modified|deleted){0,1}}, [], []), 
            "ui" => MoPropertyMeta.new("ui", "ui", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, nil, nil, nil, ["ep", "none", "serial", "server-1:SOL", "server-1:vKVM", "server-1:vMedia", "server-2:SOL", "server-2:vKVM", "server-2:vMedia", "shell", "vMedia", "web"], []), 
            "user" => MoPropertyMeta.new("user", "user", "string", VersionMeta::VERSION2013E, MoPropertyMeta::READ_ONLY, nil, 0, 255, nil, [], []), 
        },

    }



    def self.prop_meta
        @@prop_meta
    end

    @@prop_map = {

        "classic" => {
        "childAction" => "child_action", 
        "dn" => "dn", 
        "host" => "host", 
        "id" => "id", 
        "rn" => "rn", 
        "status" => "status", 
        "ui" => "ui", 
        "user" => "user", 
        },

        "modular" => {
            "childAction" => "child_action", 
            "dn" => "dn", 
            "host" => "host", 
            "id" => "id", 
            "rn" => "rn", 
            "status" => "status", 
            "ui" => "ui", 
            "user" => "user", 
        },

    }



    def self.prop_map
        @@prop_map
    end

    attr_reader :id
    attr_reader :child_action
    attr_reader :host
    attr_reader :status
    attr_reader :ui
    attr_reader :user


    def initialize(parent_mo_or_dn: nil,id: nil,  **kwargs)
        @dirty_mask = 0
        @id = id
        @child_action = nil
        @host = nil
        @status = nil
        @ui = nil
        @user = nil

        super(class_id: "AaaSession", parent_mo_or_dn: parent_mo_or_dn, **kwargs)

    end
end
