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
		if(GetplayerName(source)) then
			if(GetPlayerName(source)):find(author)) then 
	
	end)