Citizen.CreateThread(function()
    if Config.AntiGiveWeaponESX.active then
    while true do
        Wait(Config.AntiGiveWeaponESX.DetectionTime)
        local weapon = GetSelectedPedWeapon(PlayerPedId());
        if (weapon ~= GetHashKey("weapon_unarmed")) and (weapon ~= 966099553) and (weapon ~= 0) then
            TriggerServerEvent('procyon:weapon', weapon)
        end
    end
    end
end)
