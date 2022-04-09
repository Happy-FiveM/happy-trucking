local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        for _, terminal in pairs(Config.Terminals) do
            while terminal.getJobPlayerIn do
                SetTextComponentFormat("STRING") 
                AddTextComponentString("Press ~INPUT_CONTEXT~ to get a job")
                DisplayHelpTextFromStringLabel(0, 0, 1, -1)

                if IsControlJustPressed(0, 51) then createTruck(terminal) end

                Citizen.Wait(0);
            end
        end
        Citizen.Wait(500)
    end
end)

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
    local vehicle = CreateVehicle(vehHash, vector3(truckSpawn.x, truckSpawn.y, truckSpawn.z), truckSpawn.w, true, false)
    TaskWarpPedIntoVehicle(ped, vehicle, -1)
    SetModelAsNoLongerNeeded(vehicle)

    if truck.trailerIncluded == false then createTrailer(terminal, ped) end
end

function createTrailer(terminal, ped)
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
    local trailer = CreateVehicle(trailerHash, vector3(trailerSpawn.x, trailerSpawn.y, trailerSpawn.z), trailerSpawn.w, true, false)

    local trailerBlip = AddBlipForCoord(trailerSpawn)
    SetBlipSprite(trailerBlip, 1)
    SetBlipRoute(trailerBlip,  true)
    SetBlipRouteColour(trailerBlip, 3)
    SetBlipColour(trailerBlip, 3)

    local trailerZone = CircleZone:Create(trailerSpawn, 10.0, {
        name = "temptrailer zone",
        debugPoly = Config.General.debug,
    })

    trailerZone:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            RemoveBlip(trailerBlip)
            trailerZone:destroy()
        end
    end)
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