RegisterNetEvent("fuel:refill")
AddEventHandler("fuel:refill", function(fuelLevel)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle and vehicle ~= 0 then
        if GetResourceState("ox_fuel") == "started" then
            -- Nutze State Bags, um den Treibstoffstand zu setzen
            Entity(vehicle).state.fuel = fuelLevel
        else
            -- Falls ox_fuel nicht läuft, nutze das native GTA V Fuel System
            SetVehicleFuelLevel(vehicle, fuelLevel + 0.0)
        end

        TriggerEvent("fuel:notify", "Dein Tank wurde auf " .. fuelLevel .. "% gesetzt.")
    else
        TriggerEvent("fuel:notify", "Du bist in keinem Fahrzeug!")
    end
end)