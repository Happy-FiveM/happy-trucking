Citizen.CreateThread(function()
    for _, terminal in pairs(Config.Terminals) do
        createBlip(terminal)

        terminal.getJobZone = lib.zones.sphere({
            coords  = vec3(terminal.getJob),
            radius  = Config.General.sphereZoneRadius,
            debug   = Config.General.debug,
            onEnter = function(self)
                spawnPedAndSetup(terminal)

                if (Config.General.JobState.currentTruck ~= nil) then
                    local truckPos = GetEntityCoords(Config.General.JobState.currentTruck)
                    Config.General.JobState.truckAtDestination = Config.General.sphereZoneRadius >= #(truckPos - vec3(terminal.getJob))
                end
            end,
            onExit = function(self)
                if (terminal.getJobPed) then
                    DeletePed(terminal.getJobPed)
                end

                Config.General.JobState.truckAtDestination = false
            end
        })

        local destinationDisplayList = {}
        terminal.getJobPedDestinations = {}
        for _, dest in pairs(terminal.destinations) do
            destinationDisplayList[#destinationDisplayList+1] = Config.Terminals[dest].display
            terminal.getJobPedDestinations[Config.Terminals[dest].display] = dest
        end

        lib.registerMenu({
            id = terminal.name .. '_start_job',
            title = 'Delivery Options',
            position = 'top-left',
            options = {
                {
                    label  = 'Destination',
                    values = destinationDisplayList
                }
            }
        }, function(selected, scrollIndex, args)
            local destName = terminal.getJobPedDestinations[destinationDisplayList[scrollIndex]]
            startJob(terminal.name, destName)
        end)

        if (Config.General.debug) then
            RegisterCommand(terminal.name, function()
                lib.showMenu(terminal.name .. '_start_job')
            end)
        end
    end
end)

function createBlip(terminal)
    terminal.blip = AddBlipForCoord(terminal.getJob.x, terminal.getJob.y, terminal.getJob.z)
    SetBlipSprite(terminal.blip, Config.General.blip.sprite)
    SetBlipDisplay(terminal.blip, Config.General.blip.display)
    SetBlipScale(terminal.blip, Config.General.blip.scale)
    SetBlipAsShortRange(terminal.blip, Config.General.blip.shortRange)
    SetBlipColour(terminal.blip, Config.General.blip.colour)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.General.blip.label)
    EndTextCommandSetBlipName(terminal.blip)
end

function spawnPedAndSetup(terminal)
    if not HasModelLoaded(Config.General.getJobPedModel) then RequestModel(Config.General.getJobPedModel) end
    while not HasModelLoaded(Config.General.getJobPedModel) do
        Citizen.Wait(10)
    end

    terminal.getJobPed = CreatePed(1, Config.General.getJobPedModel, terminal.getJob.x, terminal.getJob.y, terminal.getJob.z, terminal.getJob.w, false, true)
    FreezeEntityPosition(terminal.getJobPed, true)
    SetEntityInvincible(terminal.getJobPed, true)
    SetBlockingOfNonTemporaryEvents(terminal.getJobPed, true)
    TaskStartScenarioInPlace(terminal.getJobPed, 'WORLD_HUMAN_CLIPBOARD', true)

    SetModelAsNoLongerNeeded(Config.General.getJobPedModel)

    exports.qtarget:AddTargetEntity(terminal.getJobPed, {
        options = {
            {
                action = function ()
                    lib.showMenu(terminal.name .. '_start_job')
                end,
                icon = "fas fa-truck-arrow-right",
                label = "Start Delivery",
                canInteract = function()
                    return not Config.General.JobState.jobInProgress
                end
            },
            {
                event = "happy:trucking:client:completeJob",
                icon = "fas fa-truck-fast",
                label = "Complete delivery",
                canInteract = function()
                    if not Config.General.JobState.currentDestination then return end
                    local rightPlace = Config.General.JobState.currentDestination.name == terminal.name
                    local trailer = not Config.General.JobState.trailerRequired or IsVehicleAttachedToTrailer(Config.General.JobState.currentTruck)
                    return Config.General.JobState.jobInProgress and rightPlace and Config.General.JobState.truckAtDestination and trailer
                end
            }
        },
        distance = 4
    })
end