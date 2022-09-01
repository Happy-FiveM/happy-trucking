RegisterServerEvent('happy:trucking:server:finishJob')
AddEventHandler('happy:trucking:server:finishJob', function(dist)
    local payment = math.floor(dist * Config.General.distanceToMoneyFactorial)
    payment = payment + math.random(Config.General.payVariationMax)

    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('bank', payment)
    
    TriggerClientEvent('happy:trucking:client:jobCompleteNotification', source, payment)
    TriggerEvent('okokBanking:AddNewTransaction', xPlayer.getName(), xPlayer.getIdentifier(), 'Los Santos Shipping', 'ls_shipping', payment, 'Trucking Pay')
end)

