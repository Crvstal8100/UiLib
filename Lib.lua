local Library = {} 

function Library:Create(Name)

	local Closed = false
	local Minimized = false

	if game.CoreGui:FindFirstChild(Name) then
		game.CoreGui:FindFirstChild(Name):Destroy()
	end

	local CsgoFunny = Instance.new("ScreenGui")

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
	Title.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
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


	local MinimizeButton = Instance.new("ImageButton")

	MinimizeButton.Parent = Title
	MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MinimizeButton.BackgroundTransparency = 1.000
	MinimizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MinimizeButton.BorderSizePixel = 0
	MinimizeButton.Position = UDim2.new(0.834999979, 0, 0.100000001, 0)
	MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
	MinimizeButton.Image = "rbxassetid://11622919444"

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

	local TabButtons = Instance.new("ScrollingFrame")
	local UIGridLayout = Instance.new("UIGridLayout")

	TabButtons.Name = "TabButtons"
	TabButtons.Parent = Frame
	TabButtons.Active = true
	TabButtons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabButtons.BackgroundTransparency = 1.000
	TabButtons.BorderSizePixel = 0
	TabButtons.Position = UDim2.new(0.0149999997, 0, 0.172000006, 0)
	TabButtons.Size = UDim2.new(0, 388, 0, 35)
	TabButtons.CanvasSize = UDim2.new(0, 0, 1, 0)
	TabButtons.ScrollBarThickness = 6

	UIGridLayout.Parent = TabButtons
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
	UIGridLayout.CellSize = UDim2.new(0, 97, 0, 35)

	local Buttons = Instance.new("Frame")

	Buttons.Name = "Buttons"
	Buttons.Parent = Frame
	Buttons.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	Buttons.BorderSizePixel = 0
	Buttons.Position = UDim2.new(0.0149999997, 0, 0.37931034, 0)
	Buttons.Size = UDim2.new(0, 388, 0, 171)
	
	MinimizeButton.MouseButton1Down:Connect(function()
		if Minimized then
			Minimized = false
			Buttons.Visible = true
			TabButtons.Visible = true
			Frame.Size = UDim2.new(0, 400, 0, 290)
			MinimizeButton.Image = "rbxassetid://11622919444"
		else
			Minimized = true
			Buttons.Visible = false
			TabButtons.Visible = false
			Frame.Size = UDim2.new(0, 400, 0, 40)
			MinimizeButton.Image = "rbxassetid://12072054746"
		end
	end)
	
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
		local TextButton = Instance.new("TextButton")
		local UIGradient = Instance.new("UIGradient")
		
		TextButton.Parent = TabButtons
		TextButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		TextButton.BorderColor3 = Color3.fromRGB(24, 24, 24)
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0.0370014645, 0, 0.0285714287, 0)
		TextButton.Size = UDim2.new(0, 66, 0, 35)
		TextButton.Font = Enum.Font.Code
		TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextSize = 14.000
		TextButton.Text = Name

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
		UIGradient.Parent = TextButton

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
		UIGridLayout2.CellPadding = UDim2.new(0, 25, 0, 35)
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

		local TabButtons = {}

		function TabButtons:CreateButton(name, callback)
			callback = callback or function () end

			local TextLabel = Instance.new("TextLabel")
			local TextButton = Instance.new("TextButton")
			local UIGradient = Instance.new("UIGradient")

			TextLabel.Parent = Tab
			TextLabel.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(36, 36, 36)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 0, 0.189873606, 0)
			TextLabel.Size = UDim2.new(0, 100, 0, 205)
			TextLabel.Font = Enum.Font.Code
			TextLabel.Text = name
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000

			TextButton.Parent = TextLabel
			TextButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			TextButton.BorderColor3 = Color3.fromRGB(24, 24, 24)
			TextButton.BorderSizePixel = 2
			TextButton.Position = UDim2.new(0, 0, 1.24000025, 0)
			TextButton.Size = UDim2.new(0, 100, 0, 25)
			TextButton.Font = Enum.Font.Code
			TextButton.Text = ""
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.TextStrokeTransparency = 0.000
			TextButton.TextWrapped = true

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
			UIGradient.Parent = TextButton

			TextButton.MouseEnter:Connect(function()
				TextButton.BackgroundColor3 = Color3.fromRGB(49, 135, 236)
			end)

			TextButton.MouseLeave:Connect(function()
				TextButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			end)

			TextButton.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
		end

		function TabButtons:CreateToggle(name, state, callback)
			callback = callback or function () end	

			local TextLabel3 = Instance.new("TextLabel")
			local ImageButton = Instance.new("ImageButton")
			local UIGradient = Instance.new("UIGradient")

			local toggle = {}

			TextLabel3.Parent = Tab
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

			ImageButton.Parent = TextLabel3
			ImageButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			ImageButton.BorderColor3 = Color3.fromRGB(24, 24, 24)
			ImageButton.BorderSizePixel = 2
			ImageButton.Position = UDim2.new(0.400000006, 0, 1.29999995, 0)
			ImageButton.Size = UDim2.new(0, 20, 0, 20)
			ImageButton.AutoButtonColor = false

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
			UIGradient.Parent = ImageButton

			local function Update(changestate)
				if changestate then
					if state == false then
						state = true
						ImageButton.BackgroundColor3 = Color3.fromRGB(49, 135, 236)
					elseif state == true then
						state = false
						ImageButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
					end
				else
					if state == false then
						ImageButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
					elseif state == true then
						ImageButton.BackgroundColor3 = Color3.fromRGB(49, 135, 236)
					end
				end
			end

			Update(false)

			ImageButton.MouseButton1Click:Connect(function()
				Update(true)
				pcall(callback, state)
			end)

			function toggle:GetState()
				return state
			end

			function toggle:SetState(bool)
				bool = bool  or ""

				if bool ~= false and bool ~= true then return end

				state = bool

				Update(false)
				pcall(callback, state)
			end

			return toggle
		end

		function TabButtons:CreateTextBox(name, placeholder, callback)
			callback = callback or function () end

			local TextLabel = Instance.new("TextLabel")
			local TextBox = Instance.new("TextBox")
			local Frame = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")

			local textBox = {}

			TextLabel.Parent = Tab
			TextLabel.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(36, 36, 36)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 0, 0.189873606, 0)
			TextLabel.Size = UDim2.new(0, 100, 0, 205)
			TextLabel.Font = Enum.Font.Code
			TextLabel.Text = name
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000

			TextBox.Parent = TextLabel
			TextBox.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			TextBox.BackgroundTransparency = 1.000
			TextBox.BorderSizePixel = 0
			TextBox.Position = UDim2.new(-0.00903260708, 0, 1.28500009, 0)
			TextBox.Size = UDim2.new(0, 100, 0, 20)
			TextBox.ZIndex = 2
			TextBox.Font = Enum.Font.Code
			TextBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.PlaceholderText = placeholder
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox.TextSize = 14.000
			TextBox.TextStrokeTransparency = 0.500
			TextBox.TextTransparency = 0.300
			TextBox.TextWrapped = true

			Frame.Parent = TextLabel
			Frame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			Frame.BorderColor3 = Color3.fromRGB(24, 24, 24)
			Frame.BorderSizePixel = 2
			Frame.Position = UDim2.new(-0.00999999978, 0, 1.27999985, 0)
			Frame.Size = UDim2.new(0, 100, 0, 20)

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
			UIGradient.Parent = Frame

			TextBox.FocusLost:Connect(function()
				local text = TextBox.Text
				pcall(callback, text)
			end)

			function textBox:GetText()
				return TextBox.Text
			end

			function textBox:SetText(text)
				text = text  or ""

				TextBox.Text = text

				pcall(callback, text)
			end

			return textBox
		end

		function TabButtons:CreateSlider(name, minvalue, maxvalue, callback)
			callback = callback or function () end

			local Value
			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")

			local TextLabelFart = Instance.new("TextLabel")
			local ImageButtonBalls = Instance.new("ImageButton")
			local ImageLabelSex = Instance.new("ImageLabel")
			local UIGradientBru = Instance.new("UIGradient")
			local TextLabel_2 = Instance.new("TextLabel")
			local UIGradient_2 = Instance.new("UIGradient")


			TextLabelFart.Parent = Tab
			TextLabelFart.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			TextLabelFart.BackgroundTransparency = 1.000
			TextLabelFart.BorderColor3 = Color3.fromRGB(36, 36, 36)
			TextLabelFart.BorderSizePixel = 0
			TextLabelFart.Position = UDim2.new(0, 0, 0.189873606, 0)
			TextLabelFart.Size = UDim2.new(0, 100, 0, 205)
			TextLabelFart.Font = Enum.Font.Code
			TextLabelFart.Text = name
			TextLabelFart.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabelFart.TextSize = 14.000

			ImageButtonBalls.Parent = TextLabelFart
			ImageButtonBalls.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			ImageButtonBalls.BorderColor3 = Color3.fromRGB(24, 24, 24)
			ImageButtonBalls.BorderSizePixel = 2
			ImageButtonBalls.Position = UDim2.new(0, 0, 1.28000009, 0)
			ImageButtonBalls.Size = UDim2.new(0, 100, 0, 20)
			ImageButtonBalls.AutoButtonColor = false

			ImageLabelSex.Parent = ImageButtonBalls
			ImageLabelSex.BackgroundColor3 = Color3.fromRGB(49, 135, 236)
			ImageLabelSex.Size = UDim2.new(0, 0, 0, 20)

			UIGradientBru.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
			UIGradientBru.Parent = ImageLabelSex

			TextLabel_2.Parent = ImageButtonBalls
			TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.BackgroundTransparency = 1.000
			TextLabel_2.Position = UDim2.new(0.0466668047, 0, 0, 0)
			TextLabel_2.Size = UDim2.new(0, 95, 0, 20)
			TextLabel_2.Font = Enum.Font.Code
			TextLabel_2.Text = "0"
			TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.TextSize = 14.000
			TextLabel_2.TextWrapped = true
			TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

			UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
			UIGradient_2.Parent = ImageButtonBalls

			local slider = {}

			ImageButtonBalls.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 100) * ImageLabelSex.AbsoluteSize.X) + tonumber(minvalue)) or 0
				pcall(callback, Value)
				ImageLabelSex.Size = UDim2.new(0, math.clamp(mouse.X - ImageLabelSex.AbsolutePosition.X, 0, 100), 0, 20)

				local moveconnection
				local releaseconnection

				moveconnection = mouse.Move:Connect(function()
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 100) * ImageLabelSex.AbsoluteSize.X) + tonumber(minvalue))
					TextLabel_2.Text = Value
					pcall(callback, Value)
					ImageLabelSex.Size = UDim2.new(0, math.clamp(mouse.X - ImageLabelSex.AbsolutePosition.X, 0, 100), 0, 20)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 100) * ImageLabelSex.AbsoluteSize.X) + tonumber(minvalue))
						TextLabel_2.Text = Value
						pcall(function()
							callback(Value)
						end)
						ImageLabelSex.Size = UDim2.new(0, math.clamp(mouse.X - ImageLabelSex.AbsolutePosition.X, 0, 100), 0, 20)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)

			function slider:GetValue()
				return Value
			end

			return slider
		end

		function TabButtons:CreateDropdown(name, options, callback)
			callback = callback or function () end

			local option

			local dropdown = {}

			local TextLabel = Instance.new("TextLabel")
			local Frame = Instance.new("Frame")
			local UIGradient = Instance.new("UIGradient")
			local ImageButton = Instance.new("ImageButton")
			local TextLabel_2 = Instance.new("TextLabel")
			local Frame_2 = Instance.new("Frame")
			local UIGradient_2 = Instance.new("UIGradient")
			local UIGridLayout = Instance.new("UIGridLayout")

			TextLabel.Parent = Tab
			TextLabel.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(36, 36, 36)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 0, 0.189873606, 0)
			TextLabel.Size = UDim2.new(0, 100, 0, 205)
			TextLabel.Font = Enum.Font.Code
			TextLabel.Text = name
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000
			TextLabel.ZIndex = 2

			Frame.Parent = TextLabel
			Frame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			Frame.BorderColor3 = Color3.fromRGB(24, 24, 24)
			Frame.BorderSizePixel = 2
			Frame.Position = UDim2.new(0, 0, 1.24000001, 0)
			Frame.Size = UDim2.new(0, 100, 0, 25)
			Frame.ZIndex = 2
			
			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
			UIGradient.Parent = Frame

			ImageButton.Parent = Frame
			ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton.BackgroundTransparency = 1.000
			ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageButton.BorderSizePixel = 0
			ImageButton.Position = UDim2.new(0.810000002, 0, 0.239999995, 0)
			ImageButton.Rotation = 180.000
			ImageButton.Size = UDim2.new(0, 12, 0, 12)
			ImageButton.Image = "rbxassetid://6798365555"
			ImageButton.ZIndex = 2

			TextLabel_2.Parent = Frame
			TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.BackgroundTransparency = 1.000
			TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel_2.BorderSizePixel = 0
			TextLabel_2.Position = UDim2.new(0.0466668718, 0, 0, 0)
			TextLabel_2.Size = UDim2.new(0, 65, 0, 25)
			TextLabel_2.Font = Enum.Font.Code
			TextLabel_2.Text = ""
			TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel_2.TextSize = 14.000
			TextLabel_2.TextWrapped = true
			TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel_2.ZIndex = 2

			Frame_2.Parent = Frame
			Frame_2.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			Frame_2.BackgroundTransparency = 1.000
			Frame_2.BorderColor3 = Color3.fromRGB(24, 24, 24)
			Frame_2.BorderSizePixel = 2
			Frame_2.Position = UDim2.new(-0, 0, 1.10000002, 0)
			Frame_2.Size = UDim2.new(0, 100, 0, 0)
			Frame_2.Visible = false
			Frame_2.ZIndex = 2

			UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
			UIGradient_2.Parent = Frame_2

			UIGridLayout.Parent = Frame_2
			UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 3)
			UIGridLayout.CellSize = UDim2.new(0, 100, 0, 25)
			
			local function findValue(whichArray, itemName)

				for currentIndex = 1, #whichArray do

					if whichArray[currentIndex] == itemName then

						return currentIndex

					end

				end

			end

			ImageButton.MouseButton1Down:Connect(function()
				if Frame_2.Visible then
					Frame_2.Visible = false
				else
					Frame_2.Visible = true
				end
			end)

			for i,v in pairs(options) do
				local TextButton = Instance.new("TextButton")
				TextButton.Parent = Frame_2
				TextButton.Name = v
				TextButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
				TextButton.BorderColor3 = Color3.fromRGB(24, 24, 24)
				TextButton.BorderSizePixel = 2
				TextButton.Position = UDim2.new(0, 0, 1.24000025, 0)
				TextButton.Size = UDim2.new(0, 100, 0, 25)
				TextButton.Font = Enum.Font.Code
				TextButton.Text = v
				TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.TextSize = 14.000
				TextButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.TextWrapped = true
				TextButton.ZIndex = 2

				local UIGradient_3 = Instance.new("UIGradient")

				UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
				UIGradient_3.Parent = TextButton

				TextButton.MouseEnter:Connect(function()
					TextButton.BackgroundColor3 = Color3.fromRGB(49, 135, 236)
				end)

				TextButton.MouseLeave:Connect(function()
					TextButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
				end)

				TextButton.MouseButton1Click:Connect(function()
					option = TextButton.Text
					TextLabel_2.Text = option

					if Frame_2.Visible then
						Frame_2.Visible = false
					end

					pcall(callback, option)
				end)

				Frame_2.Size += UDim2.new(0, 0, 0, 25)
			end

			function dropdown:GetOption()
				return option
			end

			function dropdown:SetOption(Option)
				if table.find(options, Option) then
					option = Option
					TextLabel_2.Text = option
					pcall(callback, option)
				end
			end

			function dropdown:AddOption(Option)
				if table.find(options, Option) then
					return
				else
					table.insert(options, Option)

					local TextButton = Instance.new("TextButton")
					TextButton.Parent = Frame_2
					TextButton.Name = Option
					TextButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
					TextButton.BorderColor3 = Color3.fromRGB(24, 24, 24)
					TextButton.BorderSizePixel = 2
					TextButton.Position = UDim2.new(0, 0, 1.24000025, 0)
					TextButton.Size = UDim2.new(0, 100, 0, 25)
					TextButton.Font = Enum.Font.Code
					TextButton.Text = Option
					TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.TextSize = 14.000
					TextButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.TextWrapped = true
					TextButton.ZIndex = 2

					local UIGradient_3 = Instance.new("UIGradient")

					UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
					UIGradient_3.Parent = TextButton

					TextButton.MouseEnter:Connect(function()
						TextButton.BackgroundColor3 = Color3.fromRGB(49, 135, 236)
					end)

					TextButton.MouseLeave:Connect(function()
						TextButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
					end)

					TextButton.MouseButton1Click:Connect(function()
						option = TextButton.Text
						TextLabel_2.Text = option

						if Frame_2.Visible then
							Frame_2.Visible = false
						end

						pcall(callback, option)
					end)

					Frame_2.Size += UDim2.new(0, 0, 0, 25)
				end
			end

			function dropdown:RemoveOption(Option)
				local FindOption = findValue(options, Option)
				
				if FindOption then
					table.remove(options, FindOption)
					
					if option == Option then
						option = nil
						TextLabel_2.Text = ""
					end
					
					for i,v in pairs(Frame_2:GetChildren()) do
						if v.Name == Option then
							v:Destroy()
						end
					end
					
					Frame_2.Size -= UDim2.new(0, 0, 0, 25)
				end
			end

			return dropdown
		end
		
		function TabButtons:CreateKeybind(name, keybind, callback)
			callback = callback or function () end

			local TextLabel = Instance.new("TextLabel")
			local TextButton = Instance.new("TextButton")
			local UIGradient = Instance.new("UIGradient")

			TextLabel.Parent = Tab
			TextLabel.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(36, 36, 36)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0, 0, 0.189873606, 0)
			TextLabel.Size = UDim2.new(0, 100, 0, 205)
			TextLabel.Font = Enum.Font.Code
			TextLabel.Text = name
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14.000

			TextButton.Parent = TextLabel
			TextButton.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
			TextButton.BorderColor3 = Color3.fromRGB(24, 24, 24)
			TextButton.BorderSizePixel = 2
			TextButton.Position = UDim2.new(0, 0, 1.27999997, 0)
			TextButton.Size = UDim2.new(0, 100, 0, 20)
			TextButton.Font = Enum.Font.Code
			TextButton.Text = "Keybind: "..keybind
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.TextStrokeTransparency = 0.000
			TextButton.TextWrapped = true

			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(111, 111, 111)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(175, 175, 175))}
			UIGradient.Parent = TextButton

			local KEYBIND = {}

			local keybindtoggle = false
			TextButton.MouseButton1Click:Connect(function()
				if keybindtoggle == false then
					keybindtoggle = true
					TextButton.Text = "..."
					local CheckKeyPress
					CheckKeyPress = UIS.InputBegan:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.Keyboard then
							TextButton.Text = "Keybind: "..input.KeyCode.Name
							keybind = input.KeyCode.Name
							keybindtoggle = false
							CheckKeyPress:Disconnect()
						else
							TextButton.Text = "Keybind: Unknown"
							CheckKeyPress:Disconnect()
						end
					end)
				else
					keybindtoggle = false
				end
			end)

			UIS.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if keybindtoggle then return end

				if input.UserInputType == Enum.UserInputType.Keyboard then
					if input.KeyCode.Name == keybind then
						pcall(callback, keybind)
					end
				end
			end)

			function KEYBIND:GetKeybind()
				return keybind
			end

			function KEYBIND:SetKeybind(KEYbind)
				keybind = KEYbind
				TextButton.Text = "Keybind: "..keybind
			end

			return KEYBIND
		end

		return TabButtons
	end
	
	return TabsE

end

function Library:Notify(title, description, callback)
	callback = callback or function () end
	
	if game.CoreGui:FindFirstChild("Notification") == nil then
		local Notification = Instance.new("ScreenGui")
		local Frame = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")

		Notification.Name = "Notification"
		Notification.Parent = game.CoreGui
		Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		Notification.DisplayOrder = 1

		Frame.Parent = Notification
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.741999984, 0, 0, 0)
		Frame.Size = UDim2.new(0.257625729, 0, 1, 0)

		UIListLayout.Parent = Frame
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		UIListLayout.Padding = UDim.new(0, 5)
	end
	
	local Frame_2 = Instance.new("Frame")
	local Frame_3 = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Description = Instance.new("TextLabel")
	local NoButton = Instance.new("ImageButton")
	local YesButton = Instance.new("ImageButton")

	Frame_2.Parent = game.CoreGui:FindFirstChild("Notification"):FindFirstChild("Frame")
	Frame_2.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0.742380559, 0, 0.823402226, 0)
	Frame_2.Size = UDim2.new(0.99999994, 0, 0.206953645, 0)

	Frame_3.Parent = Frame_2
	Frame_3.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_3.BorderSizePixel = 0
	Frame_3.Position = UDim2.new(0.0233772993, 0, 0.0442148745, 0)
	Frame_3.Size = UDim2.new(0.952000022, 0, 0.903999984, 0)

	Title.Name = "Title"
	Title.Parent = Frame_3
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(1, 0, 0.17699115, 0)
	Title.Font = Enum.Font.Unknown
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextWrapped = true

	Description.Name = "Description"
	Description.Parent = Frame_3
	Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Description.BackgroundTransparency = 1.000
	Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Description.BorderSizePixel = 0
	Description.Position = UDim2.new(0.0252100844, 0, 0.176991418, 0)
	Description.Size = UDim2.new(0.974789917, 0, 0.646018386, 0)
	Description.Font = Enum.Font.Code
	Description.Text = description
	Description.TextColor3 = Color3.fromRGB(255, 255, 255)
	Description.TextSize = 14.000
	Description.TextWrapped = true
	Description.TextXAlignment = Enum.TextXAlignment.Left
	Description.TextYAlignment = Enum.TextYAlignment.Top

	NoButton.Name = "NoButton"
	NoButton.Parent = Frame_3
	NoButton.BackgroundColor3 = Color3.fromRGB(255, 67, 67)
	NoButton.BackgroundTransparency = 1.000
	NoButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NoButton.BorderSizePixel = 0
	NoButton.Position = UDim2.new(0.0252100844, 0, 0.823008835, 0)
	NoButton.Rotation = 45.000
	NoButton.Size = UDim2.new(0, 20, 0, 20)
	NoButton.Image = "rbxassetid://401613236"
	NoButton.ImageColor3 = Color3.fromRGB(255, 67, 67)

	YesButton.Name = "YesButton"
	YesButton.Parent = Frame_3
	YesButton.BackgroundColor3 = Color3.fromRGB(255, 67, 67)
	YesButton.BackgroundTransparency = 1.000
	YesButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	YesButton.BorderSizePixel = 0
	YesButton.Position = UDim2.new(0.138655469, 0, 0.823008835, 0)
	YesButton.Size = UDim2.new(0, 20, 0, 20)
	YesButton.Image = "rbxassetid://505845268"
	YesButton.ImageColor3 = Color3.fromRGB(157, 255, 157)
	
	YesButton.MouseButton1Down:Connect(function()
		pcall(callback, "true")
		
		Frame_2:Destroy()
	end)
	
	NoButton.MouseButton1Down:Connect(function()
		pcall(callback, "false")
		
		Frame_2:Destroy()
	end)
end

return Library
