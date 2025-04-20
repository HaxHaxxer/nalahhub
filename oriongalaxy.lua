-- 🌌 Orion UI Rework - Thème Galaxie / Pro
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Orion = {}

function Orion:CreateOrion(title)
    title = title or "Nalah HUB"
    local isOpen = true

    -- UI Parent
    local gui = Instance.new("ScreenGui")
    gui.Name = "OrionGalaxyUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = game.CoreGui

    -- UI Container
    local main = Instance.new("Frame")
    main.Name = "MainFrame"
    main.Size = UDim2.new(0, 600, 0, 350)
    main.Position = UDim2.new(0.5, -300, 0.5, -175)
    main.BackgroundColor3 = Color3.fromRGB(20, 18, 30)
    main.BorderSizePixel = 0
    main.ClipsDescendants = true
    main.Parent = gui

    -- Glow Border Effect
    local glow = Instance.new("UIStroke")
    glow.Color = Color3.fromRGB(134, 94, 255)
    glow.Thickness = 2
    glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    glow.Transparency = 0.2
    glow.Parent = main

    -- Corner Radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 15)
    corner.Parent = main

    -- Title Bar
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 40)
    header.BackgroundColor3 = Color3.fromRGB(40, 20, 70)
    header.BorderSizePixel = 0
    header.Parent = main

    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 15)
    headerCorner.Parent = header

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.Text = "🌌  " .. title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header

    -- Close Button
    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0, 30, 0, 30)
    close.Position = UDim2.new(1, -35, 0, 5)
    close.BackgroundTransparency = 1
    close.Text = "✖"
    close.TextColor3 = Color3.fromRGB(255, 100, 100)
    close.Font = Enum.Font.GothamBold
    close.TextSize = 18
    close.Parent = header

    close.MouseButton1Click:Connect(function()
        isOpen = false
        gui.Enabled = false
    end)

    -- Ctrl Left Toggle
    UserInputService.InputBegan:Connect(function(input, gp)
        if input.KeyCode == Enum.KeyCode.LeftControl and not gp then
            isOpen = not isOpen
            gui.Enabled = isOpen
        end
    end)

    -- Content Area
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -20, 1, -60)
    container.Position = UDim2.new(0, 10, 0, 50)
    container.BackgroundTransparency = 1
    container.Name = "Container"
    container.Parent = main

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    layout.Parent = container

    local handler = {}

    function handler:CreateSection(name)
        local section = Instance.new("Frame")
        section.Size = UDim2.new(1, 0, 0, 40)
        section.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
        section.BorderSizePixel = 0
        section.Parent = container

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = section

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 1, 0)
        label.Position = UDim2.new(0, 5, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.TextColor3 = Color3.fromRGB(200, 180, 255)
        label.Font = Enum.Font.GothamSemibold
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = section

        local secHandler = {}

        function secHandler:TextLabel(text)
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, -10, 0, 30)
            label.BackgroundColor3 = Color3.fromRGB(35, 35, 55)
            label.Text = text
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.Font = Enum.Font.Gotham
            label.TextSize = 14
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.BorderSizePixel = 0
            label.Parent = container

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 8)
            corner.Parent = label
        end

        function secHandler:TextButton(text, _, callback)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -10, 0, 35)
            btn.BackgroundColor3 = Color3.fromRGB(80, 60, 150)
            btn.Text = text
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 14
            btn.AutoButtonColor = true
            btn.BorderSizePixel = 0
            btn.Parent = container

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 8)
            corner.Parent = btn

            btn.MouseButton1Click:Connect(callback)
        end

        return secHandler
    end

    return handler
end

return Orion
