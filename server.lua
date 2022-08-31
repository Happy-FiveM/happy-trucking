RegisterServerEvent('orrp:trucking:server:finishJob')
AddEventHandler('orrp:trucking:server:finishJob', function(dist)
    local payment = math.floor(dist * Config.General.distanceToMoneyFactorial)
    payment = payment + math.random(Config.General.payVariationMax)

    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('bank', payment)
    TriggerClientEvent('okokNotify:Alert', source, "Completed Delivery", "Paid $" .. payment .. " for completing the delivery", 5000, 'success')
    TriggerEvent('okokBanking:AddNewTransaction', xPlayer.getName(), xPlayer.getIdentifier(), 'Los Santos Shipping', 'ls_shipping', payment, 'Trucking Pay')
end)

