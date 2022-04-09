local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        local wait = 1000
        Citizen.Wait(wait)
    end
end)

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