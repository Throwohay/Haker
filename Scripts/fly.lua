-- Place this script inside a LocalScript within the Button object

local button = script.Parent
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local flyEnabled = false

local function toggleFly()
    flyEnabled = not flyEnabled
    if flyEnabled then
        -- Enable flight
        character.Humanoid:SetFlightMode(true)
    else
        -- Disable flight
        character.Humanoid:SetFlightMode(false)
    end
end

button.MouseButton1Click:Connect(toggleFly)
