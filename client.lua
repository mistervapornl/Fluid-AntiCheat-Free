-- Configuratie --

local resources = 0
local commands = 0
local playercoords= GetEntityCoords(GetEntityCoords)GetPlayerPed(-1))
local died = false
local lastTimerChack = 0
local health = 0

if(#forbiddenKeys > 0) then
	Citizen.CreateThread(function()
		if(checkHealthSetter) then
			chckHealthSetter = false
			Wait(6000)
			checkHealthSetter = true
		end
		while true do
			Wait(100)
			for ke in pairs(forbiddenKeys) do
				if(IsControlPressed(0, forbiddenKeys[ke])) then
					TriggerServerEvent("fluidanticheatkick", "keykick")
				end
			end
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		local playercoord = GetEntityCoords(GetPlayerPed(-1))
		if(checkDamageMultiplier)