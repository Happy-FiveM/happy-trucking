Citizen.CreateThread(function()
    for _, terminal in pairs(Config.Terminals) do
        if terminal.deliveryOnly == false then
            createBlip(terminal)
        end

        terminal.getJobZone = CircleZone:Create(terminal.getJob, 2.0, {
            name = terminal.name .. "_get_job_zone",
            debugPoly = Config.General.debug,
        })

        terminal.getJobZone:onPlayerInOut(function(isPointInside, point)
            terminal.getJobPlayerIn = isPointInside
            TriggerEvent('happy:client:truckingStartZone', terminal)
        end)


        terminal.endJobZone = CircleZone:Create(terminal.endJob, 3.5, {
            name = terminal.name .. "_end_job_zone",
            debugPoly = Config.General.debug,
        })

        terminal.endJobZone:onPlayerInOut(function(isPointInside, point)
            terminal.endJobPlayerIn = isPointInside
            TriggerEvent('happy:client:truckingEndZone', terminal)
        end)

        if terminal.cancelJob then
            terminal.cancelJobZone = CircleZone:Create(terminal.cancelJob.center, terminal.cancelJob.radius, {
                name = terminal.name .. "_cancel_job_zone",
                debugPoly = Config.General.debug,
            })

            terminal.cancelJobZone:onPlayerInOut(function(isPointInside, point)
                terminal.cancelJobPlayerIn = isPointInside
                TriggerEvent('happy:client:truckingCancelZone', terminal)
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