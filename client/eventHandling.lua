AddEventHandler('happy:trucking:client:startJob', function(data)
    startJob(data.startTerminal, data.endTerminal)
end)

AddEventHandler('happy:trucking:client:cancelJob', function(data)
    clearJob()
end)

AddEventHandler('happy:trucking:client:completeJob', function(data)
    endJob()
end)
