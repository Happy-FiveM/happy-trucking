local QBCore = exports['qb-core']:GetCoreObject()

local currentTruck = nil
local currentTrailer = nil
local destinationBlip = nil
local trailerBlip = nil
local localPlayer = nil

local currentJobDistance = nil

Citizen.CreateThread(function()
    while PlayerPedId() == nil do
        Citizen.Wait(100)
    end
    localPlayer = PlayerPedId()
end)

-- ENTRY POINT FUNCTIONS --
function startJob(startTerminal, endTerminal)
    startTerminal = Config.Terminals[startTerminal]
    Config.General.JobState.jobInProgress = true
    Config.General.JobState.currentDestination = Config.Terminals[endTerminal]
    currentJobDistance = #(startTerminal.getJob.xy - Config.General.JobState.currentDestination.getJob.xy)
    createTruck(startTerminal)
end

function endJob()
    TriggerServerEvent('happy:server:finishJob', currentJobDistance)
    clearJob()
end

-- UTILITY FUNCTIONS --
function createTruck(terminal)
    local truck = Config.Trucks[math.random(#Config.Trucks)]
    local vehHash = GetHashKey(truck.model)

    if not IsModelInCdimage(vehHash) then
        return
    end
    RequestModel(vehHash)
    while not HasModelLoaded(vehHash) do
        Wait(10)
    end

    local truckSpawn = terminal.truckSpawns[math.random(#terminal.truckSpawns)]
    currentTruck = CreateVehicle(vehHash, vector3(truckSpawn.x, truckSpawn.y, truckSpawn.z), truckSpawn.w, true, false)
    Config.General.JobState.currentTruck = currentTruck
    exports['LegacyFuel']:SetFuel(currentTruck, 100.0)
    TaskWarpPedIntoVehicle(localPlayer, currentTruck, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(currentTruck))

    SetModelAsNoLongerNeeded(vehHash)

    exports.qtarget:AddTargetEntity(currentTruck, {
        options = {
            {
                event = "happy:client:cancelJob",
                icon = "fas fa-truck",
                label = "Cancel current delivery",
            }
        },
        distance = 4
    })

    if truck.trailerIncluded == false then
        createTrailer(terminal)
    else
        routeToDestination()
    end
end

function clearJob()
    Config.General.JobState.jobInProgress = false
    Config.General.JobState.currentDestination = nil
    Config.General.JobState.truckAtDestination = false
    Config.General.JobState.trailerRequired = false
    RemoveBlip(trailerBlip)
    RemoveBlip(destinationBlip)
    currentJobDistance = nil

    if currentTruck ~= 0 then
        TaskLeaveVehicle(localPlayer, currentTruck, 1)
        while IsPedInAnyVehicle(localPlayer, false) do
            Wait(100)
        end
        SetEntityAsMissionEntity(currentTruck, true, true)
        DeleteVehicle(currentTruck)
    end
    if currentTrailer ~= 0 then
        SetEntityAsMissionEntity(currentTrailer, true, true)
        DeleteVehicle(currentTrailer)
    end

    currentTruck = nil
    currentTrailer = nil
    Config.General.JobState.currentTruck = nil
end

function createTrailer(terminal)
    Config.General.JobState.trailerRequired = true
    local trailer = Config.General.JobState.currentDestination.trailersToLocation[math.random(#Config.General.JobState.currentDestination.trailersToLocation)]
    local trailerHash = GetHashKey(trailer)

    if not IsModelInCdimage(trailerHash) then
        return
    end
    RequestModel(trailerHash)
    while not HasModelLoaded(trailerHash) do
        Wait(10)
    end

    local trailerSpawn = terminal.trailerSpawns[math.random(#terminal.trailerSpawns)]
    currentTrailer = CreateVehicle(trailerHash, vector3(trailerSpawn.x, trailerSpawn.y, trailerSpawn.z), trailerSpawn.w, true, false)

    trailerBlip = AddBlipForCoord(trailerSpawn)
    SetBlipSprite(trailerBlip, 1)
    SetBlipRoute(trailerBlip,  true)
    SetBlipRouteColour(trailerBlip, 3)
    SetBlipColour(trailerBlip, 3)

    while DoesBlipExist(trailerBlip) do
        if IsVehicleAttachedToTrailer(currentTruck) then
            RemoveBlip(trailerBlip)
            routeToDestination()
            startTrackingTrailer()
        end
        Citizen.Wait(500)
    end
end

function routeToDestination()
    destinationBlip = AddBlipForCoord(Config.General.JobState.currentDestination.getJob)
    SetBlipSprite(destinationBlip, 1)
    SetBlipRoute(destinationBlip,  true)
    SetBlipRouteColour(destinationBlip, 2)
    SetBlipColour(destinationBlip, 2)
end

function startTrackingTrailer()
    while Config.General.JobState.jobInProgress do
        if IsVehicleAttachedToTrailer(currentTruck) then
            RemoveBlip(trailerBlip)
            if DoesBlipExist(destinationBlip) == false then
                routeToDestination()
            end
        else
            if DoesBlipExist(destinationBlip) then
                RemoveBlip(destinationBlip)
                destinationBlip = nil
            end
            if DoesBlipExist(trailerBlip) == false then
                trailerBlip = AddBlipForCoord(GetEntityCoords(currentTrailer))
                SetBlipSprite(trailerBlip, 1)
                SetBlipRoute(trailerBlip,  true)
                SetBlipRouteColour(trailerBlip, 3)
                SetBlipColour(trailerBlip, 3)
            end
        end  
        Citizen.Wait(500)
    end
end
