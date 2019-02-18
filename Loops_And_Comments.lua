--A collection of commenting structures...
--This is a single line comment

--[[ This is a multi-line comment
	Can comment on multiple lines
	s
	s
	s
--]]

--[==[
	This is a whole block comment
	Perhaps used to comment out chunks of code in order to run your program
	without them temporarily
--]==]


--Testing Lua looping stuff

-- for loop
k = 0

for i=5,0,-1 do 	--for [variable], [condition], [variable increment] do ... end
	print("This is ", i, " using a for loop") --So we made i = 5 and while it is above 0 perform the loop
	wait(2)									  --At the end of each loop i will be decremented by one
	l = i
end

while l ~= 5 do 	--while [this condition is true] do ... end
	print("This is ", l, "using a while loop")
	l = l+1
	wait(2)
end