function DisplayText(text, pos, colors)
    if not text then
        return
    end
    SetTextFont(0)
    SetTextScale(0.4, 0.4)
    SetTextColour(colors.r, colors.g, colors.b, colors.a)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(pos[1], pos[2])
end

function DisplayCoords()
    Citizen.CreateThread(function()
        while status do
            local ped = PlayerPedId()
            local x, y, z = table.unpack(GetEntityCoords(ped))
            local w = GetEntityHeading(ped)
            DisplayText(string.format("x : %.2f y : %.2f z : %.2f w : %.2f", x, y, z, w), {0.35, 0.005}, {r = 255, g = 255, b = 255, a = 255})
            Citizen.Wait(5)
        end
    end)
end

function LoadModel(model)
    local hash = GetHashKey(model)
    if (not IsModelInCdimage(hash)) then
        print("Not a game model!")
        return
    end

    RequestModel(hash)

    while (not HasModelLoaded(hash)) do
        Wait(50)
    end

    return hash
end

function RepairVehicle(veh)
    SetVehicleEngineHealth(veh, 1000.0)
    SetVehicleFixed(veh)
    SetVehicleDirtLevel(veh, 0.0)
end

function RemoveVehicle()
    local veh = GetVehiclePedIsIn(PlayerPedId(), true)
    if (veh == 0) then
        return
    end
    SetEntityAsMissionEntity(veh, true, true)
    DeleteVehicle(veh)
end

function SpawnVehicle(model)
    local hash = LoadModel(model)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped, true)
    local heading = GetEntityHeading(ped)
    local veh = CreateVehicle(hash, coords, heading, true, true)
    SetModelAsNoLongerNeeded(hash)
    SetEntityAsMissionEntity(veh, true, true)
    SetPedIntoVehicle(ped, veh, -1)
    SetRadioToStationName("OFF")
    return veh
end

exports("DisplayText", DisplayText)
exports("LoadModel", LoadModel)
exports("SpawnVehicle", SpawnVehicle)
exports("RemoveVehicle", RemoveVehicle)
exports("RepairVehicle", RepairVehicle)