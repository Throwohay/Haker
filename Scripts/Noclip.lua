-- Place this script inside a LocalScript within the Button object

local button = script.Parent
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local noclipEnabled = false
local originalCollisionGroup = Enum.CollisionGroup.Default

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    
    if noclipEnabled then
        -- Enable noclip
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        character.HumanoidRootPart.CanCollide = false
        
        -- Set the collision group of all parts to an empty group
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CollisionGroupId = 0
            end
        end
        
        -- Update button text
        button.Text = "No Clip Enabled"
    else
        -- Disable noclip
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        character.HumanoidRootPart.CanCollide = true
        
        -- Restore original collision group
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CollisionGroupId = originalCollisionGroup.Value
            end
        end
        
        -- Update button text
        button.Text = "No Clip Disabled"
    end
end

button.MouseButton1Click:Connect(toggleNoclip)
