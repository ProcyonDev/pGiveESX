function HaveWeaponInLoadout(xPlayer, weapon)
    for i, v in pairs(xPlayer.loadout) do
        if (GetHashKey(v.name) == weapon) then
            return true;
        end
    end
    return false;
end

RegisterServerEvent('procyon:weapon')
AddEventHandler('procyon:weapon', function(weapon)
    local xPlayer = ESX.GetPlayerFromId(source)
    if (xPlayer) then
        if not (HaveWeaponInLoadout(xPlayer, weapon)) then
            DropPlayer(source, Config.Kick.message)
            if Config.AntiGiveWeaponESX.printactive then
            print("^2[pGive] ^7Players Detected to GiveWeaponESX")
            end
        end
    end
end)

AddEventHandler('weaponDamageEvent', function (sender, data)
    if Config.AntiShootAll.active then
    if data.damageType == 3 then
        local xPlayer = ESX.GetPlayerFromId(sender)
        if data.weaponType ~= 2725352035 then
            if Config.listeArmes[data.weaponType] == nil then
                DropPlayer(sender, Config.Kick.message)
            else
                if not xPlayer.hasWeapon(Config.listeArmes[data.weaponType].name) then
                    DropPlayer(sender, Config.Kick.message)
                end
            end
        end
    end
end
end)
