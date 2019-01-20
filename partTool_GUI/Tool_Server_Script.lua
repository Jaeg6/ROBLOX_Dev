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

--[[
	function connected to the UI RemoteEvent
	Determines whether the blue or red button was pressed
	and sets the boolean values appropriately

	player parameter represents the player who triggered the event
	input parameter represents the colour input the player chose
--]]
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

--[[
	Creates a new part and adjusts the colour appropriately
	according the current state of the colour boolean values

	location parameter represents the saved mouse location
--]]
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

--[[
	function connected to click RemoteEvent
	
	player represents the player who triggered the event
	location represents the saved mouse location at the time of the event being triggered
--]]
local function onClick(player, location)
	print(player.Name, " just produced a click event")
	createPart(location)
end


--At time of equip all appropriate RemoteEvents are connected, waiting for an event to be fired
local function onEquip()
	clickEventConnection = event.OnServerEvent:connect(onClick)
	uiEventConnection = uiEvent.OnServerEvent:connect(colourPref)
	
end

--When tool is put away all RemoteEvents are disconnected
local function onUnequip()
	clickEventConnection:Disconnect()
	uiEventConnection:Disconnect()
end

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
