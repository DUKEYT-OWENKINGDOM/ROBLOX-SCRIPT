--==================================================
-- 🧍 SERVICES
--==================================================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

--==================================================
-- 🔔 CREDIT
--==================================================
pcall(function()
	StarterGui:SetCore("SendNotification",{
		Title = "Ui Loaded!",
		Text = "made by DUKEYT | OwenKingdom FB",
		Duration = 5
	})
end)

--==================================================
-- 🎨 CHARACTER APPLY (BLACKHORN)
--==================================================
local function applyBlackhorn()
	local char = player.Character or player.CharacterAdded:Wait()

	-- BodyColor
	local bc = char:FindFirstChildOfClass("BodyColors") or Instance.new("BodyColors",char)
	bc.HeadColor3 = Color3.new(1,1,1)
	bc.TorsoColor3 = Color3.new(1,1,1)
	bc.LeftArmColor3 = Color3.new(1,1,1)
	bc.RightArmColor3 = Color3.new(1,1,1)
	bc.LeftLegColor3 = Color3.new(1,1,1)
	bc.RightLegColor3 = Color3.new(1,1,1)

	local function addAcc(part,name,mesh,tex,cf)
		local acc = Instance.new("Accessory")
		acc.Name = name
		acc.Parent = char

		local h = Instance.new("Part")
		h.Name = "Handle"
		h.Size = Vector3.one
		h.CanCollide = false
		h.Massless = true
		h.Parent = acc

		local m = Instance.new("SpecialMesh",h)
		m.MeshId = mesh
		m.TextureId = tex

		local w = Instance.new("Weld",h)
		w.Part0 = char:WaitForChild(part)
		w.Part1 = h
		w.C0 = cf
	end

	-- Hats
	addAcc("Head","Horns","rbxassetid://15342928691","rbxassetid://15342957953",CFrame.new(0,0.9,0))
	addAcc("Head","Valk","rbxassetid://83487943665219","rbxassetid://101121337118531",CFrame.new(0,0.9,0.25))
	addAcc("Head","Fang","rbxassetid://97449122812583","rbxassetid://89035446210279",CFrame.new(0,-0.25,-0.55))
	addAcc("Head","Shadow","rbxassetid://14156677253","rbxassetid://14160073134",CFrame.new(0,0.3,0))

	-- Shirt / Pants
	(char:FindFirstChildOfClass("Shirt") or Instance.new("Shirt",char)).ShirtTemplate =
		"rbxassetid://115882037007953"
	(char:FindFirstChildOfClass("Pants") or Instance.new("Pants",char)).PantsTemplate =
		"rbxassetid://15901064828"
end

--==================================================
-- 🖥️ UI
--==================================================
local gui = Instance.new("ScreenGui",player.PlayerGui)
gui.ResetOnSpawn = false

local Main = Instance.new("Frame",gui)
Main.Size = UDim2.new(0,420,0,340)
Main.Position = UDim2.new(0.5,-210,0.5,-170)
Main.BackgroundColor3 = Color3.fromRGB(25,20,40)
Main.BorderSizePixel = 0
Instance.new("UICorner",Main).CornerRadius = UDim.new(0,18)

-- Top
local Top = Instance.new("Frame",Main)
Top.Size = UDim2.new(1,0,0,50)
Top.BackgroundColor3 = Color3.fromRGB(35,28,60)
Top.BorderSizePixel = 0
Instance.new("UICorner",Top).CornerRadius = UDim.new(0,18)

local Title = Instance.new("TextLabel",Top)
Title.Size = UDim2.new(1,-120,1,0)
Title.Position = UDim2.new(0,16,0,0)
Title.BackgroundTransparency = 1
Title.Text = "TSB MOVESET TH"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(230,200,255)
Title.TextXAlignment = Left

-- Min
local Min = Instance.new("TextButton",Top)
Min.Size = UDim2.new(0,32,0,32)
Min.Position = UDim2.new(1,-80,0.5,-16)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 22
Min.BackgroundColor3 = Color3.fromRGB(80,60,120)
Min.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner",Min).CornerRadius = UDim.new(1,0)

-- Close
local Close = Instance.new("TextButton",Top)
Close.Size = UDim2.new(0,32,0,32)
Close.Position = UDim2.new(1,-40,0.5,-16)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 16
Close.BackgroundColor3 = Color3.fromRGB(120,50,50)
Close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner",Close).CornerRadius = UDim.new(1,0)

Close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Content
local Btn = Instance.new("TextButton",Main)
Btn.Size = UDim2.new(1,-40,0,50)
Btn.Position = UDim2.new(0,20,0,80)
Btn.Text = "Blackhorn Lord Moveset"
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 16
Btn.BackgroundColor3 = Color3.fromRGB(45,35,80)
Btn.TextColor3 = Color3.fromRGB(220,200,255)
Instance.new("UICorner",Btn).CornerRadius = UDim.new(0,14)

Btn.MouseButton1Click:Connect(applyBlackhorn)

--==================================================
-- 🔘 TOGGLE BUTTON
--==================================================
local Toggle = Instance.new("ImageButton",gui)
Toggle.Size = UDim2.new(0,56,0,56)
Toggle.Position = UDim2.new(0,20,0.5,-28)
Toggle.Image = "rbxassetid://109840897407260"
Toggle.Visible = false
Toggle.BackgroundColor3 = Color3.fromRGB(150,90,255)
Instance.new("UICorner",Toggle).CornerRadius = UDim.new(1,0)

Min.MouseButton1Click:Connect(function()
	Main.Visible = false
	Toggle.Visible = true
end)

Toggle.MouseButton1Click:Connect(function()
	Main.Visible = true
	Toggle.Visible = false
end)

--==================================================
-- 🖱️ DRAG (แก้แล้ว ลากได้จริง)
--==================================================
local drag,dragStart,startPos
Top.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		drag = true
		dragStart = i.Position
		startPos = Main.Position
	end
end)

UserInputService.InputChanged:Connect(function(i)
	if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
		local d = i.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
	end
end)

UserInputService.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 then
		drag = false
	end
end)
