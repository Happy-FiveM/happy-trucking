fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'config.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    'client/setupTerminals.lua',
    'client/jobHandling.lua',
    'client/eventHandling.lua',
}

server_scripts {
    'server.lua',
}