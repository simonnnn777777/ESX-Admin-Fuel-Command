fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'SM X Simon'
description 'Admin Fuel Command'
version '1.2.1'

server_script 'server.lua'
client_script 'client.lua'

shared_script '@ox_lib/init.lua' -- WICHTIG für ox_lib
dependencies {
    'ox_lib' -- ox_lib als Abhängigkeit setzen
}