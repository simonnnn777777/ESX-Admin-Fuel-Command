RegisterNetEvent("fuel:refill")
AddEventHandler("fuel:refill", function(fuelLevel)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle and vehicle ~= 0 then
        if GetResourceState("ox_fuel") == "started" then
            -- Nutze State Bags für ox_fuel
            Entity(vehicle).state.fuel = fuelLevel
        else
            -- Falls ox_fuel nicht läuft, nutze das native GTA Fuel System
            SetVehicleFuelLevel(vehicle, fuelLevel + 0.0)
        end

        -- ox_lib Notify verwenden
        lib.notify({
            title = 'Tank aufgefüllt',
            description = 'Dein Tank wurde auf ' .. fuelLevel .. '% gesetzt.',
            type = 'success' -- Typ: success, error, info, warning
        })
    else
        -- Falls kein Fahrzeug vorhanden ist, Fehlermeldung
        lib.notify({
            title = 'Fehler',
            description = 'Du bist in keinem Fahrzeug!',
            type = 'error'
        })
    end
end)