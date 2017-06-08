# single recipe in a recipe file.
cisco_imc_led_config 'Server Led on [10.105.219.18]' do
    ipaddress "10.105.219.18"
    auth_data "xyz"
    admin_state "on"
    server_id 1
    action :on
end