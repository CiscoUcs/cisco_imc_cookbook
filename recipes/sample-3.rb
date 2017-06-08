# configure same recipe in a loop on different cisco imc servers

ipaddress = ["10.65.182.238", "10.105.219.18"]

ipaddress.each do |server|
    cisco_imc_led_config "Server Led on [#{server}]" do
        ipaddress server
        auth_data "xyz"
        admin_state 'on'
        server_id 1
        action :on
    end
end