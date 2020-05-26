--- FluidAntiCheat By !Vapor#4180: Server Configuration ---

--- Fake Events (set to "" to disable) ----
local eventname1 = "chocohax:anticheat"
local eventname2 = "antibot:playerDied"
local eventname3 = "adminmenu:adminKick"

local webhookurl = ""

local checkComsEveRes = true --- Check if resource is correct ---

local minKills = 7 --- Minimal kills to detect ---

local checkChatMessage = true --- Testing Phase ---

if(checkChatMessage) then
	RegisterServerEvent("_chat:messageEntered")
	RegisterServerEvent("chat:addMessage")
	AddEventHandler('_chat:messageEntered', function(author, color, message)
		if(GetPlayerName(source)) then
			if(GetPlayerName(source):find(author)) then
				CancelEvent()
				if(IsPlayerAceAllowed(source, "fluidanticheat.bypass")) then
					print("FluidAntiCheat: " .. GetPlayerName(source) .. " [" .. source .. "] Heeft permissies om dit uittevoeren.")
				else
					TriggerClientEvent("chatMessage", -1, "FluidAntiCheat", {180, 0, 0}, GetPlayerName(source) .. " is verbannen.")
					if(not webhookurl == "") then
						PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = "FluidAntiCheat", content = GetPlayerName(source) .. " [" .. source .. "] is verbannen."}), { ['Content-Type'] = 'application/json' })
					end
					if(reson == "resources") then
						print()
						print(GetPlayerName(source) .. " [" .. source .. "] is verbannen, omdat hij een nep bericht heeft geplaatst. Identifiers:")
						for id in pairs(GetPlayerIdentifiers(source)) do
							print(GetPlayerIdentifiers(source)[id])
						end
						print()		
						DropPlayer(source, "FluidAntiCheat: Dit bericht is niet normaal!")
					end
				end
			end
		end
	end)

	AddEventHandler('chat:addMessage', function(author, color, message)
		if(GetPlayerName(source)) then
			if(GetPlayerName(source):find(author)) then
				CancelEvent()
				if(IsPlayerAceAllowed(source, "fluidanticheat.bypass")) then
					print("FluidAntiCheat: " .. GetPlayerName(source) .. " [" .. source .. "]  Heeft permissies om dit uittevoeren.")
				else
					TriggerClientEvent("chatMessage", -1, "AppleCheat", {180, 0, 0}, GetPlayerName(source) .. " is verbannen.")
					if(not webhookurl == "") then
						PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = "FluidAntiCheat", content = GetPlayerName(source) .. " [" .. source .. "] is verbannen."}), { ['Content-Type'] = 'application/json' })
					end
					if(reson == "resources") then
						print()
						print(GetPlayerName(source) .. " [" .. source .. "] is verbannen, omdat hij een nep bericht heeft geplaatst. Identifiers:")
						for id in pairs(GetPlayerIdentifiers(source)) do
							print(GetPlayerIdentifiers(source)[id])
						end
						print()		
						DropPlayer(source, "FluidAntiCheat: Dit bericht is niet normaal!")
					end
				end
			end
		end
	end)
end

RegisterServerEvent("fluidanticheatkick")
AddEventHandler("fluidanticheatkick", function(reson)
	if(IsPlayerAceAllowed(source, "fluidanticheat.bypass")) then
		if(not reson == "verbodenkeys") then
			print("FluidAntiCheat: " .. GetPlayerName(source) .. " [" .. source .. "] Heeft permissies om dit uittevoeren.")
		end
	else
		if(GetPlayerName(source)) then
			TriggerClientEvent("chatMessage", -1, "FluidAntiCheat", {180, 0, 0}, GetPlayerName(source) .. " Is verbannen.")
		end
		if(not webhookurl == "") then
			PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = "FluidAntiCheat", content = GetPlayerName(source) .. " [" .. source .. "] is verbannen."}), { ['Content-Type'] = 'application/json' })
		end
		if(reson == "resources") then
			print()
			print(GetPlayerName(source) .. " [" .. source .. "] is verbannen omdat de resources zijn veranderd. Identifiers:")
			for id in pairs(GetPlayerIdentifiers(source)) do
				print(GetPlayerIdentifiers(source)[id])
			end
			print()		
			DropPlayer(source, "FluidAntiCheat: Je resources zijn veranderd!")
		elseif(reson == "commands") then
			print()
			print(GetPlayerName(source) .. " [" .. source .. "] is verbannen omdat commands veranderd zijn. Identifiers:")
			for id in pairs(GetPlayerIdentifiers(source)) do
				print(GetPlayerIdentifiers(source)[id])
			end
			print()
			DropPlayer(source, "FluidAntiCheat: je commands zijn veranderd!")
		elseif(reson == "godmode") then
			print()
			print(GetPlayerName(source) .. " [" .. source .. "] is verbannen, voor het gebruik van godmode. Identifiers:")
			for id in pairs(GetPlayerIdentifiers(source)) do
				print(GetPlayerIdentifiers(source)[id])
			end
			print()
			DropPlayer(source, "FluidAntiCheat: er is godmode gedetecteerd!")
		elseif(reson == "verbodenkeys") then
			print()
			print(GetPlayerName(source) .. " [" .. source .. "] is verbannen voor het gebruik van verboden toetsen. Identifiers:")
			for id in pairs(GetPlayerIdentifiers(source)) do
				print(GetPlayerIdentifiers(source)[id])
			end
			print()
			DropPlayer(source, "FluidAntiCheat: Je hebt verboden toetsen gebruikt!")
		elseif(reson == "ontzichtbaarvoertuig") then
			print()
			print(GetPlayerName(source) .. " [" .. source .. "] is verbannen omdat voertuig ontzichbaar is. Identifiers:")
			for id in pairs(GetPlayerIdentifiers(source)) do
				print(GetPlayerIdentifiers(source)[id])
			end
			print()
			DropPlayer(source, "FluidAntiCheat: Je voertuig is ontzichtbaar!!")
		elseif(reson == "tp") then
			print()
			DropPlayer(source, "FluidAntiCheat: server events zijn veranderd!")
		elseif(reson == "handling") then
			print()
			print(GetPlayerName(source) .. " [" .. source .. "] is verbannen omdat de handling is veranderd. Identifiers:")
			for id in pairs(GetPlayerIdentifiers(source)) do
				print(GetPlayerIdentifiers(source)[id])
			end
			print()
			DropPlayer(source, "FluidAntiCheat: Je handling is veranderd!")
		elseif(reson == "visible") then
			print()
			print(GetPlayerName(source) .. " [" .. source .. "] is verbannen omdat hij onzichtbaar was. Identifiers:")
			for id in pairs(GetPlayerIdentifiers(source)) do
				print(GetPlayerIdentifiers(source)[id])
			end
			print()
			DropPlayer(source, "FluidAntiCheat: je bent ontzichtbaar!")
		else
			print()
			print(GetPlayerName(source) .. " [" .. source .. "] is verbannen. Identifiers:")
			for id in pairs(GetPlayerIdentifiers(source)) do
				print(GetPlayerIdentifiers(source)[id])
			end
			print()
			DropPlayer(source, "FluidAntiCheat: speler is verbannen.")
		end
	end
end)

--- Fake TriggerEvents ---

RegisterServerEvent("deadcheat")
AddEventHandler("deadcheat", function()
	table.insert(deadplayers, source)
end)

if(not eventname1 == "") then
	RegisterServerEvent(eventname)
	AddEventHandler(eventname, function()
		print()
		print(GetPlayerName(source) .. " [" .. source .. "] is verbannen, verboden triggerevent gebruikt. Identifiers:")
		for id in pairs(GetPlayerIdentifiers(source)) do
			print(GetPlayerIdentifiers(source)[id])
		end
		print()		
		DropPlayer(source, "FluidAntiCheat: verboden triggerevent!")
	end)
end
if(not eventname2 == "") then
	RegisterServerEvent(eventname)
	AddEventHandler(eventname, function()
		print()
		print(GetPlayerName(source) .. " [" .. source .. "] is verbannen, verboden triggerevent gebruikt. Identifiers:")
		for id in pairs(GetPlayerIdentifiers(source)) do
			print(GetPlayerIdentifiers(source)[id])
		end
		print()		
		DropPlayer(source, "FluidAntiCheat: verboden triggerevent!")
	end)
end
if(not eventname3 == "") then
	RegisterServerEvent(eventname)
	AddEventHandler(eventname, function()
		print()
		print(GetPlayerName(source) .. " [" .. source .. "] is verbannen, verboden triggerevent gebruikt. Identifiers:")
		for id in pairs(GetPlayerIdentifiers(source)) do
			print(GetPlayerIdentifiers(source)[id])
		end
		print()		
		DropPlayer(source, "FluidAntiCheat: verboden triggerevent!")
	end)
end