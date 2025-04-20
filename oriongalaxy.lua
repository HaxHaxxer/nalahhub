-- Orion UI - Galaxie Edition
-- Style personnalisé : Onglets verticaux à gauche + animation + toggle avec Ctrl gauche
-- Créateur : ChatGPT pour Nalah ✨

local Orion = {}

function Orion:CreateOrion(hubName)
    hubName = hubName or "Nalah HUB"

    local UIS = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local isOpen = true

    local gui = Instance.new("ScreenGui", game.CoreGui)
    gui.Name = "OrionGalaxyUI"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0, 600, 0, 400)
    main.Position = UDim2.new(0.3, 0, 0.2, 0)
    main.BackgroundColor3 = Color3.fromRGB(25, 0, 40)
    main.BorderSizePixel = 0
    main.BackgroundTransparency = 0
    main.Active = true
    main.Draggable = true

    local mainCorner = Instance.new("UICorner", main)
    mainCorner.CornerRadius = UDim.new(0, 16)

    local tabContainer = Instance.new("Frame", main)
    tabContainer.Size = UDim2.new(0, 120, 1, 0)
    tabContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    tabContainer.BorderSizePixel = 0

    local tabLayout = Instance.new("UIListLayout", tabContainer)
    tabLayout.FillDirection = Enum.FillDirection.Vertical
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 5)

    local contentContainer = Instance.new("Frame", main)
    contentContainer.Size = UDim2.new(1, -130, 1, -20)
    contentContainer.Position = UDim2.new(0, 130, 0, 10)
    contentContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    contentContainer.BorderSizePixel = 0

    local contentCorner = Instance.new("UICorner", contentContainer)
    contentCorner.CornerRadius = UDim.new(0, 12)

    local folderPages = Instance.new("Folder", contentContainer)
    folderPages.Name = "Pages"

    -- Toggle avec Ctrl gauche
    UIS.InputBegan:Connect(function(input, gp)
        if input.KeyCode == Enum.KeyCode.LeftControl and not gp then
            isOpen = not isOpen
            gui.Enabled = isOpen
        end
    end)

    local OrionFunctions = {}

    function OrionFunctions:CreateSection(name)
        local page = Instance.new("ScrollingFrame", folderPages)
        page.Size = UDim2.new(1, 0, 1, 0)
        page.CanvasSize = UDim2.new(0, 0, 0, 0)
        page.ScrollBarThickness = 6
        page.Visible = false
        page.BackgroundTransparency = 1

        local list = Instance.new("UIListLayout", page)
        list.SortOrder = Enum.SortOrder.LayoutOrder
        list.Padding = UDim.new(0, 8)

        local tabBtn = Instance.new("TextButton", tabContainer)
        tabBtn.Size = UDim2.new(1, 0, 0, 40)
        tabBtn.BackgroundColor3 = Color3.fromRGB(35, 0, 55)
        tabBtn.Text = name
        tabBtn.Font = Enum.Font.GothamBold
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabBtn.TextSize = 14

        local btnCorner = Instance.new("UICorner", tabBtn)
        btnCorner.CornerRadius = UDim.new(0, 6)

        tabBtn.MouseEnter:Connect(function()
            TweenService:Create(tabBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 0, 100)}):Play()
        end)
        tabBtn.MouseLeave:Connect(function()
            TweenService:Create(tabBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 0, 55)}):Play()
        end)

        tabBtn.MouseButton1Click:Connect(function()
            for _, pageChild in pairs(folderPages:GetChildren()) do
                if pageChild:IsA("ScrollingFrame") then
                    pageChild.Visible = false
                end
            end
            page.Visible = true
        end)

        local SectionFuncs = {}

        function SectionFuncs:TextLabel(text)
            local label = Instance.new("TextLabel", page)
            label.Size = UDim2.new(1, -20, 0, 30)
            label.BackgroundColor3 = Color3.fromRGB(45, 0, 60)
            label.Text = text
            label.Font = Enum.Font.GothamSemibold
            label.TextSize = 14
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextXAlignment = Enum.TextXAlignment.Left
            local corner = Instance.new("UICorner", label)
            corner.CornerRadius = UDim.new(0, 6)
        end

        function SectionFuncs:TextButton(text, desc, callback)
            local button = Instance.new("TextButton", page)
            button.Size = UDim2.new(1, -20, 0, 30)
            button.BackgroundColor3 = Color3.fromRGB(80, 0, 120)
            button.Text = text
            button.Font = Enum.Font.GothamBold
            button.TextSize = 14
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            local corner = Instance.new("UICorner", button)
            corner.CornerRadius = UDim.new(0, 6)
            button.MouseButton1Click:Connect(callback)
        end

        return SectionFuncs
    end

    return OrionFunctions
end

return Orion
