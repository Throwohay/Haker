-- Place this script inside a LocalScript within the Button object

local button = script.Parent
local players = game.Players:GetPlayers()

local function setCharacterSpeed(speed)
    for _, player in ipairs(players) do
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = speed
            end
        end
    end
end

local function onButtonClicked()
    setCharacterSpeed(30)
end

button.MouseButton1Click:Connect(onButtonClicked)
