-- Place this script inside a LocalScript within the Button object

local button = script.Parent
local camera = game.Workspace.CurrentCamera
local player = game.Players.LocalPlayer
local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
local lockEnabled = false
local lockTarget = nil

local function getClosestCharacter()
    local closestDist = math.huge
    local closestCharacter = nil
    
    for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local otherCharacter = otherPlayer.Character
            if otherCharacter and otherCharacter:FindFirstChild("Humanoid") then
                local head = otherCharacter:FindFirstChild("Head")
                if head then
                    local dist = (head.Position - camera.CFrame.Position).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closestCharacter = otherCharacter
                    end
                end
            end
        end
    end
    
    return closestCharacter
end

local function lockOntoCharacter()
    lockEnabled = true
    
    while lockEnabled do
        lockTarget = getClosestCharacter()
        wait(0.1)
    end
end

button.MouseButton1Down:Connect(function()
    -- Right mouse button is pressed
    if humanoid then
        humanoid.AutoRotate = false
    end
    
    lockOntoCharacter()
end)

button.MouseButton1Up:Connect(function()
    -- Right mouse button is released
    if humanoid then
        humanoid.AutoRotate = true
    end
    
    lockEnabled = false
    lockTarget = nil
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if lockEnabled and lockTarget then
        local head = lockTarget:FindFirstChild("Head")
        if head then
            camera.CFrame = CFrame.new(camera.CFrame.Position, head.Position)
        end
    end
end)
