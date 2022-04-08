
local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('orrp:server:dumpsterTimer')
AddEventHandler('orrp:server:dumpsterTimer', function(car)
    startTimer(source, car)
end)

RegisterServerEvent('orrp:server:giveItem')
AddEventHandler('orrp:server:giveItem', function(item, amount)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    if (amount == nil) then
        amount = math.random(1, 2)
    end
    Player.Functions.AddItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
end)

function startTimer(id, object)
    local timer = 10 * 60000

    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            TriggerClientEvent('orrp:removeDumpster', id, object)
        end
    end
end