local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

-- LocalPlayer
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character

-- GUI
local GUI = Instance.new("ScreenGui")
GUI.Parent = game.CoreGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
MainFrame.Parent = GUI

-- Drag Bar
local DragBar = Instance.new("Frame")
DragBar.Size = UDim2.new(0, 300, 0, 20)
DragBar.Position = UDim2.new(0, 0, 0, 0)
DragBar.BackgroundColor3 = Color3.new(1, 1, 1)
DragBar.Parent = MainFrame

-- Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 300, 0, 20)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TitleLabel.TextColor3 = Color3.new(0, 0, 0)
TitleLabel.Text = "Murder Mystery 2 Hack"
TitleLabel.FontSize = 18
TitleLabel.Parent = DragBar

-- ESP
local function esp()
for _, player in pairs(Players:GetPlayers()) do
local character = player.Character
if character:FindFirstChild("Murderer") then
local espBox = Instance.new("BoxHandleAdornment")
espBox.Size = character.HumanoidRootPart.Size
espBox.Color3 = Color3.new(1, 0, 0) -- Red
espBox.Parent = character.HumanoidRootPart
elseif character:FindFirstChild("Sheriff") then
local espBox = Instance.new("BoxHandleAdornment")
espBox.Size = character.HumanoidRootPart.Size
espBox.Color3 = Color3.new(0, 0, 1) -- Dark Blue
espBox.Parent = character.HumanoidRootPart
else
local espBox = Instance.new("BoxHandleAdornment")
espBox.Size = character.HumanoidRootPart.Size
espBox.Color3 = Color3.new(0, 1, 0) -- Green
espBox.Parent = character.HumanoidRootPart
end
end
end

-- Aimbot
local function aimbot()
local murderer = nil
for _, player in pairs(Players:GetPlayers()) do
local character = player.Character
if character:FindFirstChild("Murderer") then
murderer = character
end
end
if murderer then
LocalPlayer.Character.HumanoidRootPart.CFrame = murderer.HumanoidRootPart.CFrame
end
end

-- Grad Gun
local function gradgun()
local innocent = nil
for _, player in pairs(Players:GetPlayers()) do
local character = player.Character
if not character:FindFirstChild("Murderer") and not character:FindFirstChild("Sheriff") then
innocent = character
end
end
if innocent then
local gun = Workspace:FindFirstChild("Gun")
if gun then
gun.CFrame = innocent.HumanoidRootPart.CFrame
end
end
end

-- Main Loop
while true do
esp()
aimbot()
gradgun()
wait(0.1)
end
