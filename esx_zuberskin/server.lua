ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('superskini', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('zuberskin', source)

end)