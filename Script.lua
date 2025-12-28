– Player Highlight Script for Executors
– This script adds highlights to all players in the game

local Players = game:GetService(“Players”)
local RunService = game:GetService(“RunService”)
local LocalPlayer = Players.LocalPlayer

– Configuration
local HIGHLIGHT_COLOR = Color3.fromRGB(255, 0, 0) – Red color
local HIGHLIGHT_TRANSPARENCY = 0.5
local OUTLINE_COLOR = Color3.fromRGB(255, 255, 255) – White outline
local OUTLINE_TRANSPARENCY = 0

– Function to create highlight for a character
local function addHighlight(character)
if character:FindFirstChildOfClass(“Highlight”) then
return – Already has highlight
end

```
local highlight = Instance.new("Highlight")
highlight.Name = "PlayerHighlight"
highlight.FillColor = HIGHLIGHT_COLOR
highlight.FillTransparency = HIGHLIGHT_TRANSPARENCY
highlight.OutlineColor = OUTLINE_COLOR
highlight.OutlineTransparency = OUTLINE_TRANSPARENCY
highlight.Parent = character
```

end

– Function to handle new players
local function onPlayerAdded(player)
– Handle current character
if player.Character then
addHighlight(player.Character)
end

```
-- Handle future characters (respawns)
player.CharacterAdded:Connect(function(character)
    addHighlight(character)
end)
```

end

– Add highlights to existing players
for _, player in pairs(Players:GetPlayers()) do
onPlayerAdded(player)
end

– Handle new players joining
Players.PlayerAdded:Connect(onPlayerAdded)

print(“Player Highlight Script loaded! All players are now highlighted.”)
