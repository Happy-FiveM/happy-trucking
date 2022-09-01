RegisterNetEvent('happy:trucking:client:cancelJob', function(data)
    clearJob()
end)

RegisterNetEvent('happy:trucking:client:completeJob', function(data)
    endJob()
end)

RegisterNetEvent('happy:trucking:client:jobCompleteNotification', function(payment)
    lib.notify({
        title       = 'Completed Delivery',
        description = 'Paid $' .. payment .. ' for completing the delivery',
        type        = 'success',
        position    = 'top-left',
    })
end)
