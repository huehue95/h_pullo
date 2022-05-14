ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('pullo', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('pullo', 1)
    local nopeetmatikat = math.random(1,1000)
    if nopeetmatikat == 1 then 
        xPlayer.addInventoryItem('avain', 1)
        print(nopeetmatikat)
        TriggerClientEvent('esx:showNotification', source, 'sait avaimen')
    elseif nopeetmatikat <= 1000 then
        local rahalaskut = math.random(Config.minmoney,Config.maxmoney)
        xPlayer.addMoney(rahalaskut)
        TriggerClientEvent('esx:showNotification', source, 'sait rahaa '..rahalaskut)
    end
end)


ESX.RegisterUsableItem('avain', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('avain', 1)
    TriggerClientEvent('kiitiautost', source)

end)


RegisterServerEvent('bottle:setVehicleOwned')
AddEventHandler('bottle:setVehicleOwned', function (vehicleProps)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
    {
        ['@owner']   = xPlayer.identifier,
        ['@plate']   = vehicleProps.plate,
        ['@vehicle'] = json.encode(vehicleProps)
    }, function (rowsChanged)
        TriggerClientEvent('esx:showNotification', _source, 'Sait ajoneuvon kilvellä '..vehicleProps.plate)
    end)
end)