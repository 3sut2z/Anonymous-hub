local player = game.Players.LocalPlayer
local character = player.Character

-- Function to get all players
local function getAllPlayers()
    local players = {}
    for _, p in pairs(game.Players:GetPlayers()) do
        table.insert(players, p)
    end
    return players
end

-- Function to get the murderer
local function getMurderer()
    for _, p in pairs(getAllPlayers()) do
        if p.Character and p.Character:FindFirstChild("Murderer") then
            return p
        end
    end
    return nil
end

-- Function to get the sheriff
local function getSheriff()
    for _, p in pairs(getAllPlayers()) do
        if p.Character and p.Character:FindFirstChild("Sheriff") then
            return p
        end
    end
    return nil
end

-- Function to kill a player
local function killPlayer(p)
    if p.Character and p.Character:FindFirstChild("Humanoid") then
        p.Character.Humanoid.Health = 0
    end
end

-- Function to give a player a role
local function giveRole(p, role)
    if p.Character then
        local tag = Instance.new("BoolValue")
        tag.Name = role
        tag.Parent = p.Character
    end
end

-- Function to teleport to a player
local function teleportToPlayer(p)
    if p.Character and character and character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
    end
end

-- Function to fly
local function fly()
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = 100
        character.Humanoid.JumpPower = 100
    end
end

-- Function to ESP (Extra Sensory Perception)
local function esp()
    for _, p in pairs(getAllPlayers()) do
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local box = Instance.new("BoxHandleAdornment")
            box.Size = p.Character.HumanoidRootPart.Size
            box.Color3 = Color3.new(1, 0, 0)
            box.Adornee = p.Character.HumanoidRootPart
            box.Parent = p.Character.HumanoidRootPart
        end
    end
end

-- Function to collect items
local function collectItems()
    for _, item in pairs(workspace:GetDescendants()) do
        if item.Name == "Coin" or item.Name == "Egg" then
            firetouchinterest(item, character.HumanoidRootPart, 0)
        end
    end
end

-- Loop to run selected functions
while true do
    -- Get the murderer and kill them
    local murderer = getMurderer()
    if murderer then
        killPlayer(murderer)
    end

    -- Get the sheriff and give them the murderer role
    local sheriff = getSheriff()
    if sheriff then
        giveRole(sheriff, "Murderer")
    end

    -- Teleport to a random player
    local players = getAllPlayers()
    if #players > 0 then
        local randomPlayer = players[math.random(1, #players)]
        teleportToPlayer(randomPlayer)
    end

    -- Fly
    fly()

    -- ESP
    esp()

    -- Collect items
    collectItems()

    -- Wait for a short period of time
    wait(1)  -- Increased wait time to prevent excessive resource usage
end
