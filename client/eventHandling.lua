AddEventHandler('happy:client:startJob', function(data)
    startJob(data.startTerminal, data.endTerminal)
end)

AddEventHandler('happy:client:cancelJob', function(data)
    clearJob()
end)

AddEventHandler('happy:client:completeJob', function(data)
    endJob()
end)
