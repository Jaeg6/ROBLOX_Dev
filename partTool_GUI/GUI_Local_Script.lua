--[[
	Script for tool UI selection
	By: Jaeg6
--]]

local ui = script.Parent

local ReplicatedStorage = game:GetService('ReplicatedStorage')
local event = ReplicatedStorage:WaitForChild('UIEvent')

local blue = ui:WaitForChild('ColourBlue')
local red = ui:WaitForChild('ColourRed')

local function onSelectBlue()
	print("Blue selected")
	event:FireServer(1)
end

local function onSelectRed()
	print("Red selected")
	event:FireServer(2)
end

blue.Activated:connect(onSelectBlue)
red.Activated:connect(onSelectRed)