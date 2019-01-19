--[[
	Tool script testing
	local script
	By: Jaeg6
--]]

local tool = script.Parent
local clickEvent = tool:WaitForChild('ClickEvent')
local player = game.Players.LocalPlayer
local mouse = player:GetMouse() --Literally gets the client's mouse information

--[[This function stores the mouse's location in a variable
	Where it will then fire the variable through the remote
		event so that it can be used by the server side script
--]]
local function onClick()
	local clickLocation = mouse.Hit		--Mouse location variable - retrieve the mouse's clicked location
	clickEvent:FireServer(clickLocation)--Accessing the serverside script function
end

mouse.Button1Down:connect(onClick)