Citizen.CreateThread(function()
    for _, terminal in pairs(Config.Terminals) do
        createBlip(terminal)

        terminal.getJobZone = CircleZone:Create(terminal.getJob, 60, {
            name = terminal.name .. "_near_terminal_zone",
            debugPoly = Config.General.debug,
        })

        -- Build this array outside the events so that we don't rebuild it every time someone enters the zone cause that'd be dum
        terminal.getJobPedDestinations = {
            {
                event = "happy:client:completeJob",
                icon = "fas fa-truck-fast",
                label = "Complete delivery",
                canInteract = function()
                    if not Config.General.JobState.currentDestination then return end
                    local rightPlace = Config.General.JobState.currentDestination.name == terminal.name
                    local trailer = not Config.General.JobState.trailerRequired or IsVehicleAttachedToTrailer(Config.General.JobState.currentTruck)
                    return Config.General.JobState.jobInProgress and rightPlace and Config.General.JobState.truckAtDestination and trailer
                end
            }
        }
        for _, dest in pairs(terminal.destinations) do
            terminal.getJobPedDestinations[#terminal.getJobPedDestinations+1] = {
                event = "happy:client:startJob",
                icon = "fas fa-truck-arrow-right",
                label = "Deliver to " .. Config.Terminals[dest].display,
                canInteract = function()
                    return not Config.General.JobState.jobInProgress
                end,
                startTerminal = terminal.name,
                endTerminal = dest
            }
        end

        -- ped spawn stuff
        terminal.getJobZone:onPlayerInOut(function(isPointInside, point)
            if (not isPointInside) then -- this will nix the job giver ped and early exit
                if (terminal.getJobPed ~= nil) then
                    DeletePed(terminal.getJobPed)
                end
                return
            end
            
            -- load model and then bugger off 
            if not HasModelLoaded(Config.General.getJobPedModel) then RequestModel(Config.General.getJobPedModel) end
            while not HasModelLoaded(Config.General.getJobPedModel) do
                Citizen.Wait(10)
            end

            -- spawn ped and give them a clipboard and make em invincible and shiz
            terminal.getJobPed = CreatePed(1, Config.General.getJobPedModel, terminal.getJob.x, terminal.getJob.y, terminal.getJob.z, terminal.getJob.w, false, true)
            FreezeEntityPosition(terminal.getJobPed, true)
            SetEntityInvincible(terminal.getJobPed, true)
            SetBlockingOfNonTemporaryEvents(terminal.getJobPed, true)
            TaskStartScenarioInPlace(terminal.getJobPed, 'WORLD_HUMAN_CLIPBOARD', true)

            -- unload model
            SetModelAsNoLongerNeeded(Config.General.getJobPedModel)
            
            -- set qtarget for job ped to destination options and job completion bits, all conditional etc
            exports.qtarget:AddTargetEntity(terminal.getJobPed, {
                options = terminal.getJobPedDestinations,
                distance = 4
            })
        end)

        -- stuff to deal with if truck is actually at dest
        terminal.getJobZone:onPlayerInOut(function(isPointInside, point)
            if (not isPointInside) then -- this will falsify the at destination val and early exit
                Config.General.JobState.truckAtDestination = false
                return
            end

            -- if terminal isn't destination but they've entered the area then early exit
            if (Config.General.JobState.currentDestination ~= nil and terminal.name ~= Config.General.JobState.currentDestination.name) then
                return
            end

            -- if truck isn't set early exist
            if (Config.General.JobState.currentTruck == nil) then
                return
            end

            -- get truck pos and checks if inside once player enters zone
            local truckPos = GetEntityCoords(Config.General.JobState.currentTruck)
            Config.General.JobState.truckAtDestination = terminal.getJobZone:isPointInside(truckPos)
        end)
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