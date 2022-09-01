fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "Happychap612#0001"
description "Happy Trucking"
version "1.2"

dependency 'ox_lib'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}

server_script 'server.lua'

client_scripts {
    'client/setupTerminals.lua',
    'client/jobHandling.lua',
    'client/eventHandling.lua',
}