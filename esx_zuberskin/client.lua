ESX              = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)



RegisterNetEvent('zuberskin')
AddEventHandler('zuberskin', function(kahvikuppi)
	if IsPedArmed(PlayerPedId(), 7) then
		local tintit = GetWeaponTintCount(GetSelectedPedWeapon(PlayerPedId()))
		SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), -1)
		local outo = 0
		local elements = {}
		table.insert(elements, {label = "Perus", value = outo})
		for i=1,tintit do
			outo = outo + 1
			table.insert(elements, {label = outo, value = outo})
		end
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'zuberskin',
			{
				title    = "Superskin",
				align    = 'bottom-left',
				elements = elements,
			}, 
		function(data, menu)
	
			local action = data.current.value
	
			if action ~= nil then
				SetPedWeaponTintIndex(PlayerPedId(), GetSelectedPedWeapon(PlayerPedId()), action)
			end
	
		end, function(data, menu)
			menu.close()
		end)
	else
		ESX.ShowNotification('Ase ei ole kädessä tai siihen ei ole mahdollista laittaa skiniä!')
	end
end)
