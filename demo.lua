-- Ждём загрузку игры
repeat task.wait() until game:IsLoaded()

-- Создаём интерфейс
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 150)
Frame.Position = UDim2.new(0.5, -110, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.Text = "Pet Auto Farm"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = Frame

local AutoBtn = Instance.new("TextButton")
AutoBtn.Size = UDim2.new(0, 180, 0, 40)
AutoBtn.Position = UDim2.new(0, 20, 0, 50)
AutoBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AutoBtn.Text = "Auto Farm: OFF"
AutoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBtn.Font = Enum.Font.GothamBold
AutoBtn.TextSize = 16
AutoBtn.Parent = Frame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 25)
StatusLabel.Position = UDim2.new(0, 0, 0, 100)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: idle"
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 14
StatusLabel.Parent = Frame

-- Логика
local autoFarm = false

-- Функция нажатия кнопки по имени
local function pressButton(buttonName)
    for _, gui in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
        if gui:IsA("TextButton") and gui.Name == buttonName then
            gui:Activate()
            return true
        end
    end
    return false
end

-- Кнопка вкл/выкл
AutoBtn.MouseButton1Click:Connect(function()
    autoFarm = not autoFarm
    AutoBtn.Text = autoFarm and "Auto Farm: ON" or "Auto Farm: OFF"
    AutoBtn.BackgroundColor3 = autoFarm and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    StatusLabel.Text = autoFarm and "Status: working..." or "Status: idle"
end)

-- Основной цикл автофарма
task.spawn(function()
    while true do
        task.wait(2)
        if not autoFarm then continue end
        
        local char = game.Players.LocalPlayer.Character
        if not char then continue end
        
        -- Пытаемся нажать кнопки для питомца
        if pressButton("Feed") then
            StatusLabel.Text = "Status: feeding pet..."
        elseif pressButton("Shower") then
            StatusLabel.Text = "Status: showering pet..."
        elseif pressButton("Sleep") then
            StatusLabel.Text = "Status: putting pet to sleep..."
        elseif pressButton("Play") then
            StatusLabel.Text = "Status: playing with pet..."
        else
            StatusLabel.Text = "Status: buttons not found"
        end
    end
end)
