--[[
	Tool script testing
	Server tool script for 'doot'
	By: Jaeg6
--]]

local tool = script.Parent
local clickEvent = tool.ClickEvent
local clickEventConnection

--This function will create the part. The parameter is the location of the mouse click
local function createPart(location)
	local part = Instance.new('Part')
	part.CFrame = location	--Will place part at 'location'
	part.Parent = workspace	--Put newly created block in the game's workspace
end

--onClick will communicate with onClick in the localscript to access the mouse's location
local function onClick(player, clickLocation)
	createPart(clickLocation)
end

--When the tool is equipped this will produce a connection with the remote event
local function onEquip()
	print("Equipped")
	clickEventConnection = clickEvent.OnServerEvent:connect(onClick)
	--Stuff to do when tool is equipped
end

--When the tool is unequipped; the connection is cut
local function onUnequip()
	print("Sheathed")
	clickEventConnection:disconnect()
	--Stuff to do when tool is sheathed
end

--Test functions
local function onActivate()
	print("Clicked")
	--Stuff to do when you click with tool equipped
end

local function onDeactivate()
	print("Released")
	--Stuff to do when you release after activating tool
end

tool.Equipped:connect(onEquip)
tool.Unequipped:connect(onUnequip)
tool.Activated:connect(onActivate)
tool.Deactivated:connect(onDeactivate)