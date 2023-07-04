RegisterNetEvent("rsv_utils:print")
AddEventHandler("rsv_utils:print", function(msg)
    print(msg)
end)

RegisterNetEvent("rsv_utils:spawnvehicle")
AddEventHandler("rsv_utils:spawnvehicle", function(model)
    RemoveVehicle()
    SpawnVehicle(model)
end)

RegisterNetEvent("rsv_utils:repairvehicle")
AddEventHandler("rsv_utils:repairvehicle", function(netId)
    local veh = NetworkGetEntityFromNetworkId(netId)
    RepairVehicle(veh)
end)

status = false
RegisterNetEvent("rsv_utils:coords")
AddEventHandler("rsv_utils:coords", function()
    status = not status
    if status then
        DisplayCoords()
    end
end)