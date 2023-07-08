-- Load UI Lib
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Crvstal8100/UiLib/main/Lib.lua"))()

-- Create UI
local UI = Library:Create(name: string)

-- Create Tab
local Tab = UI:Create(name: string)

-- Create Button
local Button = Tab:CreateButton(name: string, callback: function)

-- Create Toggle
local Toggle = Tab:CreateToggle(name: string, state: bool, callback: function)

-- Create TextBox
local TextBox = Tab:CreateTextBox(name: string, placeholder: string, callback: function)

-- Create Slider
local Slider = Tab:CreateSlider(name: string, minvalue: number, maxvalue: number, callback:function)

-- Other

-- Toggle
local State = Toggle:GetState() -- returns State
Toggle:SetState(state: bool) -- sets State to bool

-- TextBox
local Text = TextBox:GetText() -- returns Text
Text:SetText(text: string)

-- Slider
local Value = Slider:GetValue() -- returns Value

-- Examples:

-- Load UI Lib
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Crvstal8100/UiLib/main/Lib.lua"))()

-- Create UI
local UI = Library:Create("Balls UI")

-- Create Tab
local Tab = UI:Create("Target")

-- Create Button
local Button = Tab:CreateButton("Button1", function()
    print("Hello World.")
end)

-- Create Toggle
local Toggle = Tab:CreateToggle("Toggle1", false, function(state)
    print(state)
end)

-- Create TextBox
local TextBox = Tab:CreateTextBox("TextBox1", "...", function(text)
    print(text)
end)

-- Create Slider
local Slider = Tab:CreateSlider("Slider1", 0, 100, function(value)
    print(value)
end)

-- Other
local Button2 = Tab:CreateButton("Button2", function()
    print(Toggle:GetState())
end)

local Button3 = Tab:CreateButton("Button3", function()
    print(Toggle:SetState(true))
end)

