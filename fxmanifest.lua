fx_version 'cerulean'
game 'gta5'

author "Happychap612#0001"
description "Happy Trucking"
version "1.0"
shared_scripts {
    'config.lua',
}

server_scripts {
    'server.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    'client/setupTerminals.lua',
    'client/jobHandling.lua',
    'client/eventHandling.lua',
}