local function GetVehicleInDirection()
    local plyPed = PlayerPedId()
    local coords = GetEntityCoords(plyPed)
    local offset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 5.0, 0.0)
    local rayHandle = StartShapeTestRay(coords.x, coords.y, coords.z, offset.x, offset.y, offset.z, 10, plyPed, 0)
    local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
    return vehicle
end

RegisterCommand("dv", function()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh == 0 then
        veh = GetVehicleInDirection()
    end
    if veh ~= 0 then
        local netId = VehToNet(veh)
        TriggerServerEvent("joshdev_dv:deleteVehicle", netId)
    else
        TriggerEvent("chat:addMessage", {color = {255,0,0}, args = {"DV", "No vehicle to delete."}})
    end
end, false)
