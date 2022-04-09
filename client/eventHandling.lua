local currentTerminal

AddEventHandler('happy:client:truckingStartZone', function(terminal)
    currentTerminal = terminal
    while currentTerminal.getJobPlayerIn and Config.General.jobInProgress ~= true do
        SetTextComponentFormat("STRING") 
        AddTextComponentString("Press ~INPUT_CONTEXT~ to get a job")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)

        if IsControlJustPressed(0, 51) then startJob(currentTerminal) end

        Citizen.Wait(0)
    end
end)

AddEventHandler('happy:client:truckingEndZone', function()
    if Config.General.currentDestination ~= nill then
        while Config.General.currentDestination.endJobPlayerIn do
            SetTextComponentFormat("STRING") 
            AddTextComponentString("Press ~INPUT_CONTEXT~ to finish the job")
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustPressed(0, 51) then endJob() end

            Citizen.Wait(0)
        end
    end
end)

AddEventHandler('happy:client:truckingCancelZone', function(terminal)
    currentTerminal = terminal
    while currentTerminal.cancelJobPlayerIn and Config.General.jobInProgress do
        SetTextComponentFormat("STRING") 
        AddTextComponentString("Press ~INPUT_CONTEXT~ to cancel the job")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)

        if IsControlJustPressed(0, 51) then cancelJob() end

        Citizen.Wait(0)
    end
end)