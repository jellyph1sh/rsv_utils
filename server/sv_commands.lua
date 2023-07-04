RegisterCommand("coords", function(src)
    TriggerClientEvent("rsv_utils:coords", src)
end, true)

RegisterCommand("veh", function(src, args)
    if (src < 0) then
        print("This command can be used by players only!")
        return
    end
    if (#args == 0) then
        SendChatMessage(src, {"Please insert one argument."}, {255, 0, 0})
        return
    elseif (#args > 1) then
        SendChatMessage(src, {"Please insert only one argument."}, {255, 0, 0})
        return
    end

    TriggerClientEvent("rsv_utils:spawnvehicle", src, args[1])
end, true)

RegisterCommand("repair", function(src)
    local veh = GetVehiclePedIsIn(GetPlayerPed(src), true)
    if (veh == 0) then
        return
    end
    TriggerClientEvent("rsv_utils:repairvehicle", -1, NetworkGetNetworkIdFromEntity(veh))
end)

RegisterCommand("delveh", function(src)
    RemoveVehicle(GetPlayerPed(src))
end, true)