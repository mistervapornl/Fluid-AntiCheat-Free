--- FluidAntiCheat By Vapor: Server Configuration ---

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
