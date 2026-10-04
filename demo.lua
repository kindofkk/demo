local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Главное окно
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.BorderSizePixel = 0
Title.Text = "  TbiGui Window - Beta"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

-- Кнопки вкладок (Main, AutoFarm, Bucks transfer, Extras)
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -20, 0, 35)
TabFrame.Position = UDim2.new(0, 10, 0, 45)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0, 5)
TabLayout.Parent = TabFrame

local function makeTab(text, isActive, order)
    local Tab = Instance.new("TextButton")
    Tab.Size = UDim2.new(0, 85, 0, 30)
    Tab.BackgroundColor3 = isActive and Color3.fromRGB(80, 80, 80) or Color3.fromRGB(45, 45, 45)
    Tab.BorderSizePixel = 0
    Tab.Text = text
    Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    Tab.Font = Enum.Font.Gotham
    Tab.TextSize = 13
    Tab.LayoutOrder = order
    Tab.Parent = TabFrame
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = Tab
    return Tab
end

local TabMain = makeTab("Main", true, 1)
local TabAuto = makeTab("AutoFarm", false, 2)
local TabBucks = makeTab("Bucks transfer", false, 3)
local TabExtras = makeTab("Extras", false, 4)

-- Раздел "Info"
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, -20, 0, 20)
InfoLabel.Position = UDim2.new(0, 10, 0, 90)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Info"
InfoLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.TextSize = 12
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.Parent = MainFrame

-- Строка 1: "You earned: 10 Bucks"
local Line1 = Instance.new("TextButton")
Line1.Size = UDim2.new(1, -20, 0, 35)
Line1.Position = UDim2.new(0, 10, 0, 115)
Line1.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Line1.BorderSizePixel = 0
Line1.Text = "  💰  You earned: 10 Bucks"
Line1.TextColor3 = Color3.fromRGB(255, 255, 255)
Line1.Font = Enum.Font.Gotham
Line1.TextSize = 13
Line1.TextXAlignment = Enum.TextXAlignment.Left
Line1.Parent = MainFrame

local C1 = Instance.new("UICorner")
C1.CornerRadius = UDim.new(0, 6)
C1.Parent = Line1

-- Строка 2: "You farmed: 0 Age Potions"
local Line2 = Instance.new("TextButton")
Line2.Size = UDim2.new(1, -20, 0, 35)
Line2.Position = UDim2.new(0, 10, 0, 155)
Line2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Line2.BorderSizePixel = 0
Line2.Text = "  🧪  You farmed: 0 Age Potions"
Line2.TextColor3 = Color3.fromRGB(255, 255, 255)
Line2.Font = Enum.Font.Gotham
Line2.TextSize = 13
Line2.TextXAlignment = Enum.TextXAlignment.Left
Line2.Parent = MainFrame

local C2 = Instance.new("UICorner")
C2.CornerRadius = UDim.new(0, 6)
C2.Parent = Line2

-- Строка 3: переключатель "Disable Information"
local Line3 = Instance.new("TextButton")
Line3.Size = UDim2.new(1, -20, 0, 35)
Line3.Position = UDim2.new(0, 10, 0, 195)
Line3.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Line3.BorderSizePixel = 0
Line3.Text = "  Disable Information (Might reduce lags)"
Line3.TextColor3 = Color3.fromRGB(255, 255, 255)
Line3.Font = Enum.Font.Gotham
Line3.TextSize = 13
Line3.TextXAlignment = Enum.TextXAlignment.Left
Line3.Parent = MainFrame

local C3 = Instance.new("UICorner")
C3.CornerRadius = UDim.new(0, 6)
C3.Parent = Line3

-- Сам переключатель (Toggle)
local ToggleBG = Instance.new("Frame")
ToggleBG.Size = UDim2.new(0, 40, 0, 20)
ToggleBG.Position = UDim2.new(1, -50, 0.5, -10)
ToggleBG.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ToggleBG.BorderSizePixel = 0
ToggleBG.Parent = Line3

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleBG

local ToggleKnob = Instance.new("Frame")
ToggleKnob.Size = UDim2.new(0, 16, 0, 16)
ToggleKnob.Position = UDim2.new(0, 2, 0.5, -8)
ToggleKnob.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ToggleKnob.BorderSizePixel = 0
ToggleKnob.Parent = ToggleBG

local KnobCorner = Instance.new("UICorner")
KnobCorner.CornerRadius = UDim.new(1, 0)
KnobCorner.Parent = ToggleKnob

-- Логика переключателя
local toggleOn = false
Line3.MouseButton1Click:Connect(function()
    toggleOn = not toggleOn
    ToggleBG.BackgroundColor3 = toggleOn and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(80, 80, 80)
    ToggleKnob.Position = toggleOn and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
end)

-- Раздел "Settings"
local SettingsLabel = Instance.new("TextLabel")
SettingsLabel.Size = UDim2.new(1, -20, 0, 20)
SettingsLabel.Position = UDim2.new(0, 10, 0, 240)
SettingsLabel.BackgroundTransparency = 1
SettingsLabel.Text = "Settings"
SettingsLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
SettingsLabel.Font = Enum.Font.Gotham
SettingsLabel.TextSize = 12
SettingsLabel.TextXAlignment = Enum.TextXAlignment.Left
SettingsLabel.Parent = MainFrame

-- Кнопка "Pick Color for Platform"
local ColorBtn = Instance.new("TextButton")
ColorBtn.Size = UDim2.new(1, -20, 0, 35)
ColorBtn.Position = UDim2.new(0, 10, 0, 265)
ColorBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ColorBtn.BorderSizePixel = 0
ColorBtn.Text = "  Pick Color for Platform"
ColorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ColorBtn.Font = Enum.Font.Gotham
ColorBtn.TextSize = 13
ColorBtn.TextXAlignment = Enum.TextXAlignment.Left
ColorBtn.Parent = MainFrame

local C4 = Instance.new("UICorner")
C4.CornerRadius = UDim.new(0, 6)
C4.Parent = ColorBtn

-- Кнопка "Destroy Platform" (заблокирована)
local DestroyBtn = Instance.new("TextButton")
DestroyBtn.Size = UDim2.new(1, -20, 0, 35)
DestroyBtn.Position = UDim2.new(0, 10, 0, 305)
DestroyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
DestroyBtn.BorderSizePixel = 0
DestroyBtn.Text = "  Destroy Platform"
DestroyBtn.TextColor3 = Color3.fromRGB(120, 120, 120)
DestroyBtn.Font = Enum.Font.Gotham
DestroyBtn.TextSize = 13
DestroyBtn.TextXAlignment = Enum.TextXAlignment.Left
DestroyBtn.Parent = MainFrame

local C5 = Instance.new("UICorner")
C5.CornerRadius = UDim.new(0, 6)
C5.Parent = DestroyBtn

-- Надпись "button" справа
local DestroyHint = Instance.new("TextLabel")
DestroyHint.Size = UDim2.new(0, 60, 0, 35)
DestroyHint.Position = UDim2.new(1, -70, 0, 0)
DestroyHint.BackgroundTransparency = 1
DestroyHint.Text = "button"
DestroyHint.TextColor3 = Color3.fromRGB(80, 80, 80)
DestroyHint.Font = Enum.Font.Gotham
DestroyHint.TextSize = 12
DestroyHint.TextXAlignment = Enum.TextXAlignment.Right
DestroyHint.Parent = DestroyBtn

-- Кнопка "Select ailments to disable them"
local AilmentBtn = Instance.new("TextButton")
AilmentBtn.Size = UDim2.new(1, -20, 0, 35)
AilmentBtn.Position = UDim2.new(0, 10, 0, 345)
AilmentBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
AilmentBtn.BorderSizePixel = 0
AilmentBtn.Text = "  Select ailments to disable them"
AilmentBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AilmentBtn.Font = Enum.Font.Gotham
AilmentBtn.TextSize = 13
AilmentBtn.TextXAlignment = Enum.TextXAlignment.Left
AilmentBtn.Parent = MainFrame
local C6 = Instance.new("UICorner")
C6.CornerRadius = UDim.new(0, 6)
C6.Parent = AilmentBtn

-- Надпись "None" справа
local AilmentHint = Instance.new("TextLabel")
AilmentHint.Size = UDim2.new(0, 60, 0, 35)
AilmentHint.Position = UDim2.new(1, -70, 0, 0)
AilmentHint.BackgroundTransparency = 1
AilmentHint.Text = "None  v"
AilmentHint.TextColor3 = Color3.fromRGB(180, 180, 180)
AilmentHint.Font = Enum.Font.Gotham
AilmentHint.TextSize = 12
AilmentHint.TextXAlignment = Enum.TextXAlignment.Right
AilmentHint.Parent = AilmentBtn

-- Раздел "Pet Selection"
local PetLabel = Instance.new("TextLabel")
PetLabel.Size = UDim2.new(1, -20, 0, 20)
PetLabel.Position = UDim2.new(0, 10, 0, 390)
PetLabel.BackgroundTransparency = 1
PetLabel.Text = "Pet Selection"
PetLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
PetLabel.Font = Enum.Font.Gotham
PetLabel.TextSize = 12
PetLabel.TextXAlignment = Enum.TextXAlignment.Left
PetLabel.Parent = MainFrame
