-- Orion Galaxy UI Theme
-- Fichier "Orion.lua" à placer dans ton GitHub
-- Inspiré d'une interface moderne, galaxie, avec animations stylées et toggle Ctrl gauche

local Orion = {}

function Orion:CreateOrion(title)
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "OrionGalaxyUI"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 600, 0, 350)
    Main.Position = UDim2.new(0.3, 0, 0.3, 0)
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    Main.BackgroundTransparency = 0
    Main.Parent = ScreenGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 16)
    Corner.Parent = Main

    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0, -15, 0, -15)
    Shadow.Size = UDim2.new(1, 30, 1, 30)
    Shadow.Image = "rbxassetid://1316045217"
    Shadow.ImageColor3 = Color3.fromRGB(85, 0, 170)
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    Shadow.Parent = Main

    local TitleBar = Instance.new("TextLabel")
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.BackgroundTransparency = 1
    TitleBar.Text = title or "🌌 Orion Galaxy UI"
    TitleBar.Font = Enum.Font.GothamBold
    TitleBar.TextSize = 22
    TitleBar.TextColor3 = Color3.fromRGB(190, 150, 255)
    TitleBar.TextStrokeTransparency = 0.8
    TitleBar.Parent = Main

    local Content = Instance.new("Frame")
    Content.Name = "Content"
    Content.Position = UDim2.new(0, 10, 0, 50)
    Content.Size = UDim2.new(1, -20, 1, -60)
    Content.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Content.BackgroundTransparency = 0.05
    Content.Parent = Main

    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 12)
    ContentCorner.Parent = Content

    -- Toggle Ctrl gauche
    local open = true
    UserInputService.InputBegan:Connect(function(input, gp)
        if input.KeyCode == Enum.KeyCode.LeftControl and not gp then
            open = not open
            TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
                Position = open and UDim2.new(0.3, 0, 0.3, 0) or UDim2.new(0.3, 0, 1.5, 0)
            }):Play()
        end
    end)

    -- Retourne la frame pour ajout de contenu
    return Content
end

return Orion
