--[[
	Server side script for tool
	By: Jaeg6
--]]

local tool = script.Parent
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local event = ReplicatedStorage:WaitForChild('ClickEvent')
local uiEvent = ReplicatedStorage:WaitForChild('UIEvent')
local clickEventConnection
local uiEventConnection
local blue = false
local red = false

local function colourPref(player, input)
	print("Active", input)
	if input == 1 then
		red = false
		blue = true
	elseif input == 2 then
		blue = false
		red = true
	end
end

local function createPart(location)
	local part = Instance.new('Part')
	if blue then
		print("...")
		part.BrickColor = BrickColor.new(0,0,30)
	elseif red then
		part.BrickColor = BrickColor.new(30,0,0)
	end
	part.CFrame = location
	part.Parent = workspace
end

local function onClick(player, location)
	print(player.Name, " just produced a click event")
	createPart(location)
end



local function onEquip()
	clickEventConnection = event.OnServerEvent:connect(onClick)
	uiEventConnection = uiEvent.OnServerEvent:connect(colourPref)
	
end

local function onUnequip()
	clickEventConnection:Disconnect()
	uiEventConnection:Disconnect()
end

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)