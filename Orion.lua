-- Version retravaillée avec un style galaxie (violet/noir), animations douces,
-- ouverture/fermeture avec Ctrl gauche et esthétique moderne.

local Orion = {}

function Orion:CreateOrion(orionName)
    orionName = orionName or "🌌 Nalah HUB - Galaxie"
    local isClosed = false

    local UIS = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    local gui = Instance.new("ScreenGui")
    gui.Name = "OrionGalaxyUI"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = game.CoreGui

    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 540, 0, 350)
    main.Position = UDim2.new(0.3, 0, 0.25, 0)
    main.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    main.BorderSizePixel = 0
    main.Parent = gui

    local corner = Instance.new("UICorner", main)
    corner.CornerRadius = UDim.new(0, 12)

    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, 40)
    topBar.BackgroundColor3 = Color3.fromRGB(70, 0, 120)
    topBar.Parent = main

    local topCorner = Instance.new("UICorner", topBar)
    topCorner.CornerRadius = UDim.new(0, 12)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -40, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.Text = orionName
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.BackgroundTransparency = 1
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = topBar

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0.5, -15)
    closeBtn.BackgroundColor3 = Color3.fromRGB(90, 0, 130)
    closeBtn.Text = "✕"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Parent = topBar

    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

    closeBtn.MouseButton1Click:Connect(function()
        isClosed = not isClosed
        main.Visible = not isClosed
    end)

    -- Ouvrir/Fermer avec Ctrl gauche
    UIS.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.LeftControl then
            main.Visible = not main.Visible
        end
    end)

    -- Créer un conteneur d'éléments
    local contentFrame = Instance.new("Frame")
    contentFrame.Position = UDim2.new(0, 0, 0, 40)
    contentFrame.Size = UDim2.new(1, 0, 1, -40)
    contentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
    contentFrame.BorderSizePixel = 0
    contentFrame.Parent = main
    Instance.new("UICorner", contentFrame).CornerRadius = UDim.new(0, 12)

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = contentFrame

    local SectionHandler = {}

    function SectionHandler:CreateSection(sectionTitle)
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(0.9, 0, 0, 30)
        titleLabel.Text = "🔹 " .. (sectionTitle or "Section")
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 16
        titleLabel.TextColor3 = Color3.fromRGB(180, 150, 255)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Parent = contentFrame

        local Section = {}

        function Section:TextLabel(text)
            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(0.9, 0, 0, 30)
            lbl.Text = text or ""
            lbl.Font = Enum.Font.Gotham
            lbl.TextSize = 14
            lbl.TextColor3 = Color3.fromRGB(230, 230, 255)
            lbl.BackgroundTransparency = 1
            lbl.Parent = contentFrame
        end

        function Section:TextButton(text, _, callback)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0.9, 0, 0, 30)
            btn.Text = text or "Bouton"
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 14
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.BackgroundColor3 = Color3.fromRGB(90, 0, 130)
            btn.Parent = contentFrame
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

            btn.MouseButton1Click:Connect(function()
                pcall(callback or function() end)
            end)
        end

        return Section
    end

    return SectionHandler
end

return Orion
