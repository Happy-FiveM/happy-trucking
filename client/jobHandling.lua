local QBCore = exports['qb-core']:GetCoreObject()

local currentTruck = nill
local currentTrailer = nill
local destinationBlip = nill
local trailerBlip = nill

-- ENTRY POINT FUNCTIONS --
function startJob(terminal)
    Config.General.jobInProgress = true
    Config.General.currentDestination = Config.Terminals[terminal.destinations[math.random(#terminal.destinations)]]
    createTruck(terminal)
end

function endJob()
    clearJob()
end

function cancelJob()
    clearJob()
end


-- UTILITY FUNCTIONS --
function createTruck(terminal)
    local ped = PlayerPedId()
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
    TaskWarpPedIntoVehicle(ped, currentTruck, -1)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(currentTruck))

    SetModelAsNoLongerNeeded(vehHash)

    if truck.trailerIncluded == false then
        createTrailer(terminal)
    else
        routeToDestination()
    end
end

function clearJob()
    Config.General.jobInProgress = false
    RemoveBlip(trailerBlip)
    RemoveBlip(destinationBlip)
    Config.General.currentDestination = nill

    if currentTruck ~= 0 then
        SetEntityAsMissionEntity(currentTruck, true, true)
        DeleteVehicle(currentTruck)
    end
    if currentTrailer ~= 0 then
        SetEntityAsMissionEntity(currentTruck, true, true)
        DeleteVehicle(currentTruck)
    end
end

function createTrailer(terminal)
    local trailer = Config.Trailers[math.random(#Config.Trailers)]
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
    destinationBlip = AddBlipForCoord(Config.General.currentDestination.endJob)
    SetBlipSprite(destinationBlip, 1)
    SetBlipRoute(destinationBlip,  true)
    SetBlipRouteColour(destinationBlip, 2)
    SetBlipColour(destinationBlip, 2)
end

function startTrackingTrailer()
    while Config.General.jobInProgress do
        if IsVehicleAttachedToTrailer(currentTruck) then
            RemoveBlip(trailerBlip)
            if DoesBlipExist(destinationBlip) == false then
                routeToDestination()
            end
        else
            if DoesBlipExist(destinationBlip) then
                RemoveBlip(destinationBlip)
                destinationBlip = nill
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

-- pinkcage:destroy()

-- RegisterNetEvent('QBCore:Command:SpawnVehicle', function(vehName)
--     local ped = PlayerPedId()
--     local hash = GetHashKey(vehName)
--     if not IsModelInCdimage(hash) then
--         return
--     end
--     RequestModel(hash)
--     while not HasModelLoaded(hash) do
--         Wait(10)
--     end
--     local vehicle = CreateVehicle(hash, GetEntityCoords(ped), GetEntityHeading(ped), true, false)
--     TaskWarpPedIntoVehicle(ped, vehicle, -1)
--     SetModelAsNoLongerNeeded(vehicle)
--     TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
-- end)