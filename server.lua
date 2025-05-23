RegisterNetEvent("joshdev_dv:deleteVehicle", function(netId)
    local src = source
    if IsPlayerAceAllowed(src, "dv.use") then
        local veh = NetworkGetEntityFromNetworkId(netId)
        if veh and veh ~= 0 then
            DeleteEntity(veh)
            TriggerClientEvent("chat:addMessage", src, {color={0,255,0},args={"DV","Vehicle deleted."}})
        else
            TriggerClientEvent("chat:addMessage", src, {color={255,0,0},args={"DV","Failed to delete vehicle."}})
        end
    else
        TriggerClientEvent("chat:addMessage", src, {color={255,0,0},args={"DV","You lack permission to use /dv"}})
    end
end)
