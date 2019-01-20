--[[
	local script for tool
	By: Jaeg
--]]

local tool = script.Parent
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local event = ReplicatedStorage:WaitForChild('ClickEvent')
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()


local function onClick()
	local location = mouse.Hit
	event:FireServer(location)
	print("ez")
end

local function onEquip()
	print("equip")
end

local function onUnequip()
	print("Sheathe")
end

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
tool.Activated:connect(onClick)