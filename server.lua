RegisterCommand("fuel", function(source, args)
    if IsPlayerAceAllowed(source, "fuelcommand.use") then
        local fuelLevel = tonumber(args[1]) -- Eingabe in Zahl umwandeln

        if fuelLevel and fuelLevel >= 0 and fuelLevel <= 100 then
            TriggerClientEvent("fuel:refill", source, fuelLevel) -- Sende Wert an Client
        else
            TriggerClientEvent("chat:addMessage", source, {
                args = {"[Fuel]", "Bitte gib einen gültigen Wert zwischen 0 und 100 an!"}
            })
        end
    else
        TriggerClientEvent("chat:addMessage", source, {
            args = {"[Fuel]", "Du hast keine Berechtigung für diesen Befehl!"}
        })
    end
end)