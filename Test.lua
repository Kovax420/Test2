ESX = exports['es_extended']:getSharedObject()
 
RegisterCommand('discord', function()
  TriggerEvent('notifications', "springgreen", "Discord", "dsc.gg/faithcl")
end, false)

-- Players

RegisterCommand("online", function(source, args, raw) --change command here
    TriggerEvent('notifications', "springgreen", "Online", "Insgesamt: " .. #GetActivePlayers() .. " Spieler Eingeloggt!")
end, false) --False, allow everyone to run it
        
-- kofferraum


  local kofferraum = false
RegisterCommand('kofferraum', function()
    kofferraum = not kofferraum
    if kofferraum then
    local Veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
    SetVehicleDoorOpen(Veh, 5, false, false)
else
    local Veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
    SetVehicleDoorShut(Veh, 5, false)
end
end)

RegisterKeyMapping('kofferraum', 'Kofferraum im Fahrzeug öffnen', 'keyboard', 'K')

-- Hände Heben

Citizen.CreateThread(function()
    local dict = "missfbi5ig_21"
    local playerPed = GetPlayerPed(-1)

     RequestAnimDict(dict)
     while not HasAnimDictLoaded(dict) do
          Citizen.Wait(100)
     end
    local handsup = false
     while true do
          Citizen.Wait(0)
        if IsControlJustPressed(1, 74) and not IsPedInAnyVehicle(GetPlayerPed(-1), true) and not IsPedFalling(GetPlayerPed(-1), true) then
            if not handsup then
                DisablePlayerFiring(playerPed, true)
                TaskPlayAnim(GetPlayerPed(-1), dict, "hand_up_scientist", 6.0, 6.0, -1, 50, 0, false, false, false)
                handsup = true
            else
                handsup = false
                DisablePlayerFiring(playerPed, false)
                Citizen.Wait(100)
                --ClearPedTasksImmediately(GetPlayerPed(-1))
                StopAnimTask(GetPlayerPed(-1), 'missfbi5ig_21', 'hand_up_scientist', 1.0)

            end
        end
    end
end)

local kannmachen = true

RegisterNetEvent('kovax:schnneballanim')
AddEventHandler('kovax:schnneballanim', function()
    if kannmachen == true and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        local playerPed = GetPlayerPed(-1)
        loadAnimDict('anim@mp_snowball')

        TaskPlayAnim(GetPlayerPed(-1), 'anim@mp_snowball', 'pickup_snowball', 8.0, -8.0, -1, 0, 0, false, false, false)
        Citizen.Wait(1250)   
        ClearPedTasksImmediately(playerPed)
    end
end)
