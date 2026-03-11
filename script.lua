local player = game:GetService("Players").LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KiXzY_HUB"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- --- VARIABLES D'ÉTAT ---
local autoAcceptEnabled = false
local autoCancelEnabled = false
local freezeActive = false

-- --- CADRE PRINCIPAL ---
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 320)
frame.Position = UDim2.new(0.5, -130, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true 
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = frame

-- --- TITRE [K] KiXzY HUB ---
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.7, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 15, 0, 5)
titleLabel.Text = "[K] KiXzY HUB"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- --- BOUTON RÉDUIRE (-) ---
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -40, 0, 10)
minimizeBtn.Text = "-"
minimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.Parent = frame
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)

-- --- ICÔNE RÉOUVERTURE ---
local openIcon = Instance.new("TextButton")
openIcon.Size = UDim2.new(0, 60, 0, 60)
openIcon.Position = UDim2.new(0, 15, 0.5, -30)
openIcon.Text = "KiXzY"
openIcon.Visible = false
openIcon.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
openIcon.TextColor3 = Color3.new(1, 1, 1)
openIcon.Font = Enum.Font.GothamBold
openIcon.Parent = screenGui
Instance.new("UICorner", openIcon).CornerRadius = UDim.new(0, 12)

-- --- CRÉATION DES BOUTONS ---
local function createButton(name, pos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 50)
    btn.Position = pos
    btn.Text = name
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    return btn
end

local btn1 = createButton("Freeze Trade (Visual)", UDim2.new(0.075, 0, 0, 60), Color3.fromRGB(45, 45, 45))
local btn2 = createButton("Auto Accept : OFF", UDim2.new(0.075, 0, 0, 125), Color3.fromRGB(45, 45, 45))
local btn3 = createButton("Auto Cancel : OFF", UDim2.new(0.075, 0, 0, 190), Color3.fromRGB(45, 45, 45))

-- --- LOGIQUE DE DÉTECTION (SCAN) ---
local function firesignal_compat(button)
    if button and button:IsA("TextButton") then
        for _, connection in pairs(getconnections(button.MouseButton1Click)) do
            connection:Fire()
        end
    end
end

local function findBtn(names)
    for _, v in pairs(player.PlayerGui:GetDescendants()) do
        if v:IsA("TextButton") and v.Visible then
            for _, n in pairs(names) do
                if v.Name:lower():find(n:lower()) or v.Text:lower():find(n:lower()) then return v end
            end
        end
    end
end

-- --- BOUCLE DE SURVEILLANCE ---
task.spawn(function()
    while task.wait(0.5) do
        if autoAcceptEnabled then
            local target = findBtn({"Confirm", "Accept", "Ready", "Prêt"})
            if target then firesignal_compat(target) end
        end
        if autoCancelEnabled then
            local target = findBtn({"Cancel", "Decline", "Annuler", "Refuse"})
            if target then firesignal_compat(target) end
        end
    end
end)

-- --- ACTIONS DES BOUTONS ---
minimizeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false; openIcon.Visible = true
end)

openIcon.MouseButton1Click:Connect(function()
    frame.Visible = true; openIcon.Visible = false
end)btn1.MouseButton1Click:Connect(function()
local player = game:GetService("Players").LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KiXzY_HUB"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- --- VARIABLES D'ÉTAT ---
local autoAcceptEnabled = false
local autoCancelEnabled = false
local freezeActive = false

-- --- CADRE PRINCIPAL ---
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 320)
frame.Position = UDim2.new(0.5, -130, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true 
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = frame

-- --- TITRE [K] KiXzY HUB ---
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.7, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 15, 0, 5)
titleLabel.Text = "[K] KiXzY HUB"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- --- BOUTON RÉDUIRE (-) ---
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -40, 0, 10)
minimizeBtn.Text = "-"
minimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.Parent = frame
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)

-- --- ICÔNE RÉOUVERTURE ---
local openIcon = Instance.new("TextButton")
openIcon.Size = UDim2.new(0, 60, 0, 60)
openIcon.Position = UDim2.new(0, 15, 0.5, -30)
openIcon.Text = "KiXzY"
openIcon.Visible = false
openIcon.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
openIcon.TextColor3 = Color3.new(1, 1, 1)
openIcon.Font = Enum.Font.GothamBold
openIcon.Parent = screenGui
Instance.new("UICorner", openIcon).CornerRadius = UDim.new(0, 12)

-- --- CRÉATION DES BOUTONS ---
local function createButton(name, pos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 50)
    btn.Position = pos
    btn.Text = name
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    return btn
end

local btn1 = createButton("Freeze Trade (Visual)", UDim2.new(0.075, 0, 0, 60), Color3.fromRGB(45, 45, 45))
local btn2 = createButton("Auto Accept : OFF", UDim2.new(0.075, 0, 0, 125), Color3.fromRGB(45, 45, 45))
local btn3 = createButton("Auto Cancel : OFF", UDim2.new(0.075, 0, 0, 190), Color3.fromRGB(45, 45, 45))

-- --- LOGIQUE DE DÉTECTION (SCAN) ---
local function firesignal_compat(button)
    if button and button:IsA("TextButton") then
        for _, connection in pairs(getconnections(button.MouseButton1Click)) do
            connection:Fire()
        end
    end
end

local function findBtn(names)
    for _, v in pairs(player.PlayerGui:GetDescendants()) do
        if v:IsA("TextButton") and v.Visible then
            for _, n in pairs(names) do
                if v.Name:lower():find(n:lower()) or v.Text:lower():find(n:lower()) then return v end
            end
        end
    end
end

-- --- BOUCLE DE SURVEILLANCE ---
task.spawn(function()
    while task.wait(0.5) do
        if autoAcceptEnabled then
            local target = findBtn({"Confirm", "Accept", "Ready", "Prêt"})
            if target then firesignal_compat(target) end
        end
        if autoCancelEnabled then
            local target = findBtn({"Cancel", "Decline", "Annuler", "Refuse"})
            if target then firesignal_compat(target) end
        end
    end
end)

-- --- ACTIONS DES BOUTONS ---
minimizeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false; openIcon.Visible = true
end)

openIcon.MouseButton1Click:Connect(function()
    frame.Visible = true; openIcon.Visible = false
end)btn1.MouseButton1Click:Connect(function()
-- Add this code before the "local function createButton" line:
local tradeMachine = Instance.new("Model")
tradeMachine.Name = "Trade Machine"
tradeMachine.Parent = screenGui

local brainrotLock = Instance.new("TextLabel")
brainrotLock.Text = "Locked Brainrot"
brainrotLock.Size = UDim2.new(0.1, 0, 0, 20)
brainrotLock.Position = UDim2.new(0.5, -10, 0.5, -30)
brainrotLock.TextColor3 = Color3.new(1, 0, 0) -- Red
brainrotLock.Font = Enum.Font.GothamBold
brainrotLock.TextSize = 12
brainrotLock.Parent = tradeMachine

-- Add this code before the "local function firesignal" line:
local brainrotLocked = false

-- Modify the "firesignal" function like this:
local function firesignal_compat(button)
    if button and button:IsA("TextButton") then
        for _, connection in pairs(getconnections(button.MouseButton1Click)) do
            connection:Fire()
        end
    end
end

-- Add this code at the end of the script:
-- Lock the brainrot when it's placed in the trade machine
local function lockBrainrot()
    if not brainrotLocked then
        brainrotLocked = true
        brainrotLock.Text = "Locked Brainrot"
    end
end