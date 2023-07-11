RegisterNetEvent("rsv_utils:print")
AddEventHandler("rsv_utils:print", function(msg)
    print(msg)
end)

RegisterNetEvent("rsv_utils:spawnvehicle")
AddEventHandler("rsv_utils:spawnvehicle", function(model)
    RemoveVehicle()
    local hash = LoadModel(model)
    if (not hash) then
        ChatMessage({"~r~[ERROR]", "~r~Invalid model!"})
    end
    local veh = SpawnVehicle(hash)
    DisplayNotification("~g~".. GetMakeNameFromVehicleModel(GetEntityModel(veh)) .."vehicle appears with success!")
end)

RegisterNetEvent("rsv_utils:repairvehicle")
AddEventHandler("rsv_utils:repairvehicle", function(netId)
    RepairVehicle(NetworkGetEntityFromNetworkId(netId))
end)

status = false
RegisterNetEvent("rsv_utils:coords")
AddEventHandler("rsv_utils:coords", function()
    status = not status
    if status then
        DisplayCoords()
    end
end)