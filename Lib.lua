local Library = {} 
function Library:Create(Name)
	local CsgoFunny = Instance.new("ScreenGui")

	local Closed = false
	
	CsgoFunny.Name = Name
	CsgoFunny.Parent = game.CoreGui
	CsgoFunny.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local Frame = Instance.new("Frame")

	Frame.Parent = CsgoFunny
	Frame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.342022121, 0, 0.328217238, 0)
	Frame.Size = UDim2.new(0, 400, 0, 290)

	local Title = Instance.new("Frame")

	Title.Name = "Title"
	Title.Parent = Frame
	Title.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
	Title.BorderColor3 = Color3.fromRGB(24, 24, 24)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0, 400, 0, 40)

	local CloseButton = Instance.new("ImageButton")

	CloseButton.Parent = Title
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(0.909999967, 0, 0.100000001, 0)
	CloseButton.Size = UDim2.new(0, 30, 0, 30)
	CloseButton.Image = "rbxassetid://9545003266"

	CloseButton.MouseButton1Down:Connect(function()
		CsgoFunny:Destroy()
	end)

	game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
		if gpe then return end

		if input.UserInputType == Enum.UserInputType.Keyboard then
			if input.KeyCode == Enum.KeyCode.V then
				if Closed then
					CsgoFunny.Enabled = true
					Closed = false
				else
					CsgoFunny.Enabled = false
					Closed = true
				end
			end
		end
	end)

	local TitleText = Instance.new("TextLabel")

	TitleText.Parent = Title
	TitleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleText.BackgroundTransparency = 1.000
	TitleText.BorderSizePixel = 0
	TitleText.Position = UDim2.new(0.0375000015, 0, -0.014228058, 0)
	TitleText.Size = UDim2.new(0, 1, 0, 41)
	TitleText.Font = Enum.Font.Code
	TitleText.Text = Name
	TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
	TitleText.TextSize = 14.000
	TitleText.TextXAlignment = Enum.TextXAlignment.Left
	TitleText.Text = Name

	local TabButtons = Instance.new("Frame")

	TabButtons.Name = "TabButtons"
	TabButtons.Parent = Frame
	TabButtons.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	TabButtons.BackgroundTransparency = 1.000
	TabButtons.BorderColor3 = Color3.fromRGB(42, 42, 42)
	TabButtons.BorderSizePixel = 0
	TabButtons.Position = UDim2.new(0.0149999997, 0, 0.172413796, 0)
	TabButtons.Size = UDim2.new(0, 394, 0, 35)

	local UIGridLayout = Instance.new("UIGridLayout")

	UIGridLayout.Parent = TabButtons
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
	UIGridLayout.CellSize = UDim2.new(0, 97, 0, 35)

	local Buttons = Instance.new("Frame")


	Buttons.Name = "Buttons"
	Buttons.Parent = Frame
	Buttons.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
	Buttons.BorderSizePixel = 0
	Buttons.Position = UDim2.new(0.0149999997, 0, 0.37931034, 0)
	Buttons.Size = UDim2.new(0, 388, 0, 171)

	local UIS = game:GetService("UserInputService")
	local function dragify(Frame)
		local dragToggle = nil
		local dragSpeed = 1
		local dragInput = nil
		local dragStart = nil
		local dragPos = nil
		local startPos = nil
		local function updateInput(input)
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end

	dragify(Frame)

	local TabsE = {}

	local Tabs = Instance.new("Folder")

	Tabs.Parent = Buttons
	Tabs.Name = "Tabs"

	function TabsE:Create(Name)
		local TextButton = Instance.new('TextButton')
		TextButton.Parent = TabButtons
		TextButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		TextButton.BorderColor3 = Color3.fromRGB(24, 24, 24)
		TextButton.BorderSizePixel = 2
		TextButton.Position = UDim2.new(0, 0, 0.00742892548, 0)
		TextButton.Size = UDim2.new(0, 131, 0, 32)
		TextButton.AutoButtonColor = false
		TextButton.Font = Enum.Font.Code
		TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextSize = 14.000
		TextButton.Text = Name

		local TabName = Instance.new("Frame")
		local Tab = Instance.new("ScrollingFrame")
		local TabName_2 = Instance.new("TextLabel")
		local UIGridLayout2 = Instance.new("UIGridLayout")

		TabName.Name = Name
		TabName.Parent = Tabs
		TabName.Visible = false
		TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabName.BackgroundTransparency = 1.000
		TabName.Size = UDim2.new(0, 100, 0, 100)

		Tab.Name = "Tab"
		Tab.Parent = TabName
		Tab.Active = true
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0.0900000036, 0, 0.0650875866, 0)
		Tab.Size = UDim2.new(0, 372, 0, 158)
		Tab.CanvasSize = UDim2.new(0, 0, 6, 0)
		Tab.ScrollBarThickness = 6

		UIGridLayout2.Parent = Tab
		UIGridLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout2.CellPadding = UDim2.new(0, 250, 0, 5)
		UIGridLayout2.CellSize = UDim2.new(0, 100, 0, 25)

		TabName_2.Name = "TabName"
		TabName_2.Parent = TabName
		TabName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabName_2.BorderSizePixel = 0
		TabName_2.Position = UDim2.new(0, 0, -0.100000001, 0)
		TabName_2.Size = UDim2.new(0, 0, 0, 1)
		TabName_2.Font = Enum.Font.Code
		TabName_2.Text = Name
		TabName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabName_2.TextSize = 14.000
		TabName_2.TextXAlignment = Enum.TextXAlignment.Left


		TextButton.MouseEnter:Connect(function()
			TextButton.BackgroundColor3 = Color3.fromRGB(49, 135, 236)
		end)

		TextButton.MouseLeave:Connect(function()
			TextButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		end)

		TextButton.MouseButton1Click:Connect(function()
			if Tabs:FindFirstChild(Name) then
				for i,v in pairs(Tabs:GetChildren()) do
					v.Visible = false
				end
				Tabs:FindFirstChild(Name).Visible = true
			end
		end)

		return TabName
	end
	
	function TabsE:CreateButton(tab, name, callback)
		callback = callback or function () end

		local TextButton2 = Instance.new("TextButton")

		TextButton2.Parent = tab.Tab
		TextButton2.AutoButtonColor = false
		TextButton2.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		TextButton2.BorderSizePixel = 0
		TextButton2.Size = UDim2.new(0, 200, 0, 50)
		TextButton2.Font = Enum.Font.Code
		TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton2.TextSize = 14.000
		TextButton2.TextWrapped = true
		TextButton2.Text = name

		TextButton2.MouseEnter:Connect(function()
			TextButton2.BackgroundColor3 = Color3.fromRGB(49, 135, 236)
		end)

		TextButton2.MouseLeave:Connect(function()
			TextButton2.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		end)

		TextButton2.MouseButton1Click:Connect(function()
			pcall(callback)
		end)
	end

	function TabsE:CreateToggle(tab, name, state, callback)
		callback = callback or function () end	

		local TextLabel3 = Instance.new("TextLabel")
		local ImageButton = Instance.new("ImageButton")
		local UIGradient = Instance.new("UIGradient")

		TextLabel3.Parent = tab.Tab
		TextLabel3.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		TextLabel3.BackgroundTransparency = 1.000
		TextLabel3.BorderColor3 = Color3.fromRGB(36, 36, 36)
		TextLabel3.BorderSizePixel = 0
		TextLabel3.Position = UDim2.new(0, 0, 0.189873606, 0)
		TextLabel3.Size = UDim2.new(0, 100, 0, 205)
		TextLabel3.Font = Enum.Font.Code
		TextLabel3.Text = name
		TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel3.TextSize = 14.000
		TextLabel3.TextXAlignment = Enum.TextXAlignment.Left

		ImageButton.Parent = TextLabel3
		ImageButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
		ImageButton.BorderColor3 = Color3.fromRGB(36, 36, 36)
		ImageButton.BorderSizePixel = 2
		ImageButton.Position = UDim2.new(3.3499999, 0, 0.0799999982, 0)
		ImageButton.Size = UDim2.new(0, 20, 0, 20)
		ImageButton.AutoButtonColor = false

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.50), NumberSequenceKeypoint.new(1.00, 0.50)}
		UIGradient.Parent = ImageButton

		ImageButton.MouseButton1Click:Connect(function()
			if state == false then
				state = true
				ImageButton.BackgroundColor3 = Color3.fromRGB(49, 135, 236)
			elseif state == true then
				state = false
				ImageButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			end
			pcall(callback, state)
		end)
	end

	function TabsE:CreateTextBox(tab, placeholder, text, callback)
		callback = callback or function () end

		local TextBox = Instance.new("TextBox")

		TextBox.Parent = tab.Tab
		TextBox.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		TextBox.BackgroundTransparency = 0.200
		TextBox.BorderSizePixel = 0
		TextBox.Size = UDim2.new(0, 200, 0, 50)
		TextBox.Font = Enum.Font.Code
		TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.PlaceholderText = placeholder
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextSize = 14.000
		TextBox.TextStrokeTransparency = 0.500
		TextBox.TextWrapped = true
		TextBox.TextTransparency = 0.300

		TextBox.FocusLost:Connect(function()
			text = TextBox.Text
			pcall(callback, text)
		end)
	end

	function TabsE:CreateSlider(tab, name, minvalue, maxvalue, callback)
		callback = callback or function () end

		local Value
		local mouse = game.Players.LocalPlayer:GetMouse()
		local uis = game:GetService("UserInputService")

		local TextLabelD = Instance.new("TextLabel")
		local ImageButtonXD = Instance.new("ImageButton")
		local ImageLabelDFDFD = Instance.new("ImageLabel")
		local UIGradientXDED = Instance.new("UIGradient")

		local TextLabelXDX = Instance.new("TextLabel")

		--Properties:

		TextLabelXDX.Parent = ImageButtonXD
		TextLabelXDX.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabelXDX.BackgroundTransparency = 1.000
		TextLabelXDX.Position = UDim2.new(0.0333333351, 0, 0, 0)
		TextLabelXDX.Size = UDim2.new(0, 145, 0, 20)
		TextLabelXDX.Font = Enum.Font.Code
		TextLabelXDX.Text = "0"
		TextLabelXDX.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabelXDX.TextSize = 14.000
		TextLabelXDX.TextWrapped = true
		TextLabelXDX.TextXAlignment = Enum.TextXAlignment.Left

		TextLabelD.Parent = tab.Tab
		TextLabelD.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		TextLabelD.BackgroundTransparency = 1.000
		TextLabelD.BorderColor3 = Color3.fromRGB(36, 36, 36)
		TextLabelD.BorderSizePixel = 0
		TextLabelD.Position = UDim2.new(0, 0, 0.189873606, 0)
		TextLabelD.Size = UDim2.new(0, 100, 0, 205)
		TextLabelD.Font = Enum.Font.Code
		TextLabelD.Text = name
		TextLabelD.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabelD.TextSize = 14.000
		TextLabelD.TextXAlignment = Enum.TextXAlignment.Left

		ImageButtonXD.Parent = TextLabelD
		ImageButtonXD.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		ImageButtonXD.BorderColor3 = Color3.fromRGB(24, 24, 24)
		ImageButtonXD.BorderSizePixel = 2
		ImageButtonXD.Position = UDim2.new(2.04999995, 0, 0.0799999982, 0)
		ImageButtonXD.Size = UDim2.new(0, 150, 0, 20)
		ImageButtonXD.AutoButtonColor = false

		ImageLabelDFDFD.Parent = ImageButtonXD
		ImageLabelDFDFD.BackgroundColor3 = Color3.fromRGB(49, 135, 236)
		ImageLabelDFDFD.Size = UDim2.new(0, 0, 0, 20)

		UIGradientXDED.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
		UIGradientXDED.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.50), NumberSequenceKeypoint.new(1.00, 0.50)}
		UIGradientXDED.Parent = ImageLabelDFDFD

		ImageButtonXD.MouseButton1Down:Connect(function()
			Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 150) * ImageLabelDFDFD.AbsoluteSize.X) + tonumber(minvalue)) or 0
			pcall(function()
				callback(Value)
			end)
			ImageLabelDFDFD.Size = UDim2.new(0, math.clamp(mouse.X - ImageLabelDFDFD.AbsolutePosition.X, 0, 150), 0, 20)
			
			local moveconnection
			local releaseconnection
			
			moveconnection = mouse.Move:Connect(function()
				TextLabelXDX.Text = Value
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 150) * ImageLabelDFDFD.AbsoluteSize.X) + tonumber(minvalue))
				pcall(function()
					callback(Value)
				end)
				ImageLabelDFDFD.Size = UDim2.new(0, math.clamp(mouse.X - ImageLabelDFDFD.AbsolutePosition.X, 0, 150), 0, 20)
			end)
			releaseconnection = uis.InputEnded:Connect(function(Mouse)
				if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 150) * ImageLabelDFDFD.AbsoluteSize.X) + tonumber(minvalue))
					pcall(function()
						callback(Value)
					end)
					ImageLabelDFDFD.Size = UDim2.new(0, math.clamp(mouse.X - ImageLabelDFDFD.AbsolutePosition.X, 0, 150), 0, 20)
					moveconnection:Disconnect()
					releaseconnection:Disconnect()
				end
			end)
		end)		
	end

	return TabsE

end

return Library
