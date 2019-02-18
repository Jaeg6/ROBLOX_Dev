--[[
	Basic mouse clicking to activate block's effects
	By: Jaeg6
--]]

local click = game.Workspace.ClickButton:WaitForChild('ClickDetector')
local button = game.Workspace.ClickButton
local fireBlock = game.Workspace.FireBlock
local on = false

local function onClick()
	print("Clicked")
	if on then --Destroy fire particle, and make block red to resemble an 'off' state
		local fire = fireBlock:WaitForChild('Fire')
		fire:Destroy()
		button.BrickColor = BrickColor.new(50,0,0)
		on = false
	else --Create fire particle, and make block greed to resemble an 'on' state
		local fire = Instance.new('Fire')
		fire.Parent = fireBlock
		button.BrickColor = BrickColor.new(0,50,0)
		on = true
	end
end

click.MouseClick:Connect(onClick)