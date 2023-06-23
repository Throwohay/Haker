-- Place this script inside a LocalScript within the Button object

local button = script.Parent
local players = game.Players:GetPlayers()

local function highlightOpposingTeam()
    for _, player in ipairs(players) do
        if player.Team ~= game.Players.LocalPlayer.Team then
            local character = player.Character
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") and part:IsA("HumanoidPart") then
                        -- Create a line
                        local line = Instance.new("LineHandleAdornment")
                        line.Adornee = part
                        line.Parent = part
                        
                        -- Create a block
                        local block = Instance.new("BlockMesh")
                        block.Scale = part.Size
                        block.Parent = part
                    end
                end
            end
        end
    end
end

button.MouseButton1Click:Connect(highlightOpposingTeam)
