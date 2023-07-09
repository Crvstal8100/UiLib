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
local Slider = Tab:CreateSlider(name: string, minvalue: number, maxvalue: number, callback: function)

-- Create Dropdown
local Dropdown = Tab:CreateDropdown(name: string, options: table, callback: function)

-- Create Keybind
local Keybind = Tab:CreateKeybind(name: string, keybind: string, callback: function)

                        
-- Other

-- Notification
local Notification = Library:Notify(title: string, description: string, callback: function)
            
-- Toggle
local State = Toggle:GetState() -- returns State
Toggle:SetState(state: bool) -- sets State to bool

-- TextBox
local Text = TextBox:GetText() -- returns Text
Text:SetText(text: string)

-- Slider
local Value = Slider:GetValue() -- returns Value

-- Dropdown
local Option = Dropdown:GetOption()
Dropdown:SetOption(option: string)
Dropdown:AddOption(option: string)
Dropdown:RemoveOption(option: string)

-- Keybind
local Keybind = Keybind:GetKeybind()
Keybind:SetKeybind(keybind: string)

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

-- Create Dropdown
local Dropdown = Tab:CreateDropdown("Dropdown1", {"Option1", "Option2", "Option3"}, function(option)
    print(option)
end)

-- Create Keybind
local Keybind = Tab:CreateKeybind("Keybind1", "K", function(keybind)
    print(keybind)
end)

-- Other
local Notification = Library:Notify("Notification", "Hello World!", function(answer)
    print(answer)
end)
              
local Button2 = Tab:CreateButton("Button2", function()
    print(Toggle:GetState())
end)

local Button3 = Tab:CreateButton("Button3", function()
    print(Toggle:SetState(true))
end)

local Button4 = Tab:CreateButton("Button4", function()
    Dropdown:AddOption("Option4")
end)

local Button5 = Tab:CreateButton("Button5", function()
    Dropdown:RemoveOption("Option3")
end)

