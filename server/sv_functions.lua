function SendChatMessage(src, messages, colour)
    TriggerClientEvent("chat:addMessage", src, {
        args = messages,
        color = colour
    })
end

function RemoveVehicle(ped)
    local veh = GetVehiclePedIsIn(ped, false)
    if (veh == 0) then
        return
    end
    DeleteEntity(veh)
end

exports("RemoveVehicle", RemoveVehicle)
exports("SendChatMessage", SendChatMessage)