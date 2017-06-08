#multiple recipe in a recipe file, 
#could configure single cisco imc server or multiple cisco imc server
cisco_imc_ipmi_config 'enable ipmi case1' do
    ipaddress '10.65.182.245'
    auth_data 'xyz'
    admin_state 'enabled'
    priv 'user'
    action :enable
end
cisco_imc_led_config 'Server Led on [10.65.182.238]' do
    ipaddress "10.65.182.245"
    auth_data "xyz"
    admin_state "on"
    server_id 1
    action :on
end
cisco_imc_led_config 'Server Led on [10.65.182.238]' do
    ipaddress "10.65.182.238"
    auth_data "xyz"
    admin_state "on"
    server_id 1
    action :on
end