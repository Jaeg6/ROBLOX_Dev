--[[script for buttons within opened menu
	Created by: Jaeg6
--]]

local parent = script.Parent
local button = parent:WaitForChild('TextButton')
local buttonClose = parent:WaitForChild('MenuClose')
local textBox = parent:WaitForChild('TextBox')
local openButton = parent.Parent:WaitForChild('MenuOpen')
local toggled = false

local function buttonPress()
	if not toggled then
		textBox.Text = "Toggle"
		toggled = true
	else
		textBox.Text = "Untoggle"
		toggled = false
	end
end

local function closeMenu()
	parent.Visible = false
	openButton.Visible = true 
	wait(2)
end

button.Activated:Connect(buttonPress)
buttonClose.Activated:Connect(closeMenu)