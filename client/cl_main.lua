ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)

        Citizen.Wait(5)
    end
end)

RegisterNetEvent('kiitiautost')
AddEventHandler('kiitiautost', function()
    if getItems("avain")then
        local v = Config.models[math.random(1, #Config.models)]
        RequestModel(v)
        while not HasModelLoaded(v) do
            Citizen.Wait(10)
        end
        local p = PlayerPedId()
        local pos = GetEntityCoords(p)
        local veh = CreateVehicle(v, pos.x, pos.y, pos.z, GetEntityHeading(p), true, false)
        local newPlate     = exports.esx_vehicleshop:GeneratePlate()
        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
        vehicleProps.plate = newPlate
        TaskWarpPedIntoVehicle(p, veh, -1)
        SetVehicleNumberPlateText(veh, newPlate)
        TriggerServerEvent('bottle:setVehicleOwned', vehicleProps)
    else
        TriggerServerEvent('bottle:eiitemiä')
    end
end)


function getItems(item)
    local Inventory = ESX.GetPlayerData().inventory
    for i=1, #Inventory, 1 do
        if Inventory[i].name == item then
            if Inventory[i].count and Inventory[i].count > 0 then
                return true
            end
        end
    end
    return false
end
