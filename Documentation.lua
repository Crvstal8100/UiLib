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
local TextBox = Tab:CreateTextBox(placeholder: string, callback: function)

-- Create Slider
local Slider = Tab:CreateSlider(name: string, minvalue: number, maxvalue: number, callback:function)
