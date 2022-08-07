local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('happy:server:finishJob')
AddEventHandler('happy:server:finishJob', function(dist)
    local payment = math.floor(dist * Config.General.distanceToMoneyFactorial)
    print(payment)
    payment = payment + math.random(Config.General.payVariationMax)
    print(payment)
    local player = QBCore.Functions.GetPlayer(source)
    local charInfo = player.PlayerData.charinfo
    local charName = charInfo.firstname .. ' ' .. charInfo.lastname

    player.Functions.AddMoney('bank', payment)
    TriggerClientEvent('QBCore:Notify', source, 'Completed delivery fee received')
    TriggerEvent('okokBanking:AddNewTransaction', charName, charInfo.cid, 'Los Santos Shipping', 'ls_shipping', payment, 'Trucking Pay')
end)

