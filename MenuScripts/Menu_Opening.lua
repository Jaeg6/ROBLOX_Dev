--[[ basic menu opening script
	Created by: Jaeg6
--]]

local parent = script.Parent
local openButton = parent:WaitForChild('MenuOpen')
local menu = parent:WaitForChild('Menu')

local function openMenu()
	menu.Visible = true
	openButton.Visible = false
end

openButton.Activated:Connect(openMenu)