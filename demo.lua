repeat task.wait() until game:IsLoaded()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 170)
Frame.Position = UDim2.new(0.5, -110, 0.5, -85)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.Text = "Baby Auto Farm"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = Frame

local AutoBtn = Instance.new("TextButton")
AutoBtn.Size = UDim2.new(0, 180, 0, 40)
AutoBtn.Position = UDim2.new(0, 20, 0, 45)
AutoBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AutoBtn.Text = "Auto Farm: OFF"
AutoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.TextSize = 16
AutoBtn.Parent = Frame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 25)
StatusLabel.Position = UDim2.new(0, 0, 0, 95)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: idle"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 14
StatusLabel.Parent = Frame

local autoFarm = false

-- Телепортирует персонажа к объекту с заданным именем
local function teleportTo(objectName)
    local char = game.Players.LocalPlayer.Character
    if not char then return false end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Name == objectName and v:IsA("BasePart") then
            hrp.CFrame = v.CFrame + Vector3.new(0, 3, 0)
            return true
        end
    end
    return false
end

-- Ищет кнопку и пытается её активировать через все доступные способы
local function activateNeed(buttonName, parentName)
    for _, gui in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
        if gui:IsA("TextButton") and gui.Name == buttonName and gui.Parent.Name == parentName then
            -- Способ 1: прямой вызов события
            if gui.MouseButton1Click then
                gui.MouseButton1Click:Fire()
            end
            -- Способ 2: стандартная активация
            gui:Activate()
            return true
        end
    end
    return false
end

AutoBtn.MouseButton1Click:Connect(function()
    autoFarm = not autoFarm
    AutoBtn.Text = autoFarm and "Auto Farm: ON" or "Auto Farm: OFF"
    AutoBtn.BackgroundColor3 = autoFarm and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    StatusLabel.Text = autoFarm and "Status: working..." or "Status: idle"
end)

task.spawn(function()
    while true do
        task.wait(1.5)
        if not autoFarm then continue end
        
        local char = game.Players.LocalPlayer.Character
        if not char then continue end
        
        -- Телепорт к локациям, где можно выполнить потребности
        -- Сначала ищем объекты для взаимодействия
        if activateNeed("Add", "hungry") then
            StatusLabel.Text = "Status: feeding..."
            teleportTo("Food") -- телепорт к еде, если есть
        elseif activateNeed("Add", "thirsty") then
            StatusLabel.Text = "Status: drinking..."
            teleportTo("Water")
        elseif activateNeed("Add", "sick") then
            StatusLabel.Text = "Status: healing..."
            teleportTo("Bed") -- кровать обычно лечит
        elseif activateNeed("Add", "bored") then
            StatusLabel.Text = "Status: playing..."
            teleportTo("Playground")
        elseif activateNeed("Add", "toilet") then
            StatusLabel.Text = "Status: toilet..."
            teleportTo("Toilet")
        elseif activateNeed("Add", "salon") then
            StatusLabel.Text = "Status: salon..."
            teleportTo("Salon")
        else
            StatusLabel.Text = "Status: all good"
        end
    end
end)
