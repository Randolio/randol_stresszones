local QBCore = exports['qb-core']:GetCoreObject()
local inZone = false

CreateThread(function()
    for k, v in pairs(Config.StressZones) do
        stressBlips = AddBlipForCoord(v.coords.xyz)
        SetBlipSprite(stressBlips, 311)
        SetBlipDisplay(stressBlips, 4)
        SetBlipScale(stressBlips, 0.7)
        SetBlipColour(stressBlips, 23)
        SetBlipAsShortRange(stressBlips, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Stress Zone")
        EndTextCommandSetBlipName(stressBlips)
    end
end)

CreateThread(function()
    local stressZones = {}
    for k, v in pairs(Config.StressZones) do
        stressZones[#stressZones + 1] = BoxZone:Create(v.coords, v.length, v.width, {
        name = 'noStresspls_' .. k,
        minZ = v.coords.z-1.5,
        maxZ = v.coords.z + 3.5,
        heading = v.coords.w
        })
    end

    local stressZonesCombo = ComboZone:Create(stressZones, {
    name = "stressZonesCombo",
    debugPoly = false
    })
    stressZonesCombo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            inZone = true
            QBCore.Functions.Notify("Use emotes sit3/sit4/yoga to relieve stress.", "success")
        else
            inZone = false
        end
    end)
    while true do
        if inZone then
            if IsEntityPlayingAnim(PlayerPedId(), "amb@world_human_picnic@male@idle_a", "idle_a", 3) 
                or IsEntityPlayingAnim(PlayerPedId(), "amb@world_human_picnic@female@idle_a", "idle_a", 3) 
                    or IsPedUsingScenario(PlayerPedId(), "WORLD_HUMAN_YOGA") then
                    local PlayerData = QBCore.Functions.GetPlayerData()
                    local currentstress = PlayerData.metadata['stress']
                    if currentstress >= 2 then
                        TriggerServerEvent('hud:server:RelieveStress', 2)
                    elseif currentstress == 1 then
                        TriggerServerEvent('hud:server:RelieveStress', 1)
                    end
            end
        end
        Wait(Config.Timer)
    end
end)
