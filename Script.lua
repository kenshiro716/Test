local Players = game:GetService("Players")

local function createVersionLabel(player)
    local gui = Instance.new("ScreenGui")
    gui.Name = "VersionDisplay"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 200, 0, 50)
    label.Position = UDim2.new(0.5, -100, 0, 10)
    label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    label.BackgroundTransparency = 0.5
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Version 1"
    label.Parent = gui
end

Players.PlayerAdded:Connect(createVersionLabel)

for _, player in pairs(Players:GetPlayers()) do
    createVersionLabel(player)
end

print("Version label created!")
