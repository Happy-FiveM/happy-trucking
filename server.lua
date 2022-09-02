local inProgressJobs = {}

RegisterServerEvent('happy:trucking:server:startJob', function(t1, t2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local t1 = Config.Terminals[t1]
    local t2 = Config.Terminals[t2]
    
    --check if they're close to the start terminal
    local distanceToTerminal = #(vec3(t1.getJob) - GetEntityCoords(GetPlayerPed(source)))
    if (distanceToTerminal > 10 and not Config.General.debug) then
        -- log the bad thing
        -- ban/warn the person
        return -- early exit
    end

    inProgressJobs[source] = {
        start  = t1.name,
        finish = t2.name
    }
end)

RegisterServerEvent('happy:trucking:server:finishJob', function(distanceDriven, engineHealth, tankHealth, bodyHealth, fuel, tyres, doors)
    if (not inProgressJobs[source]) then
        -- log bad thing
        -- tell the naughty people off
        TriggerClientEvent('happy:trucking:client:jobCompleteNotification', source, math.random(6000))
        return
    end
    local activeJobInfo = inProgressJobs[source]
    inProgressJobs[source] = nil
    local dist = #(Config.Terminals[activeJobInfo.start].getJob - Config.Terminals[activeJobInfo.finish].getJob)
    local payment = math.floor(dist * Config.General.distanceToMoneyFactorial) + math.random(Config.General.payVariationMax)

    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('bank', payment)
    
    TriggerClientEvent('happy:trucking:client:jobCompleteNotification', source, payment)
    TriggerEvent('okokBanking:AddNewTransaction', xPlayer.getName(), xPlayer.getIdentifier(), 'Los Santos Shipping', 'ls_shipping', payment, 'Trucking Pay')
end)
