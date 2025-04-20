-- Orion Galaxy Hub Refait dans le style Alchemy Hub
-- Par Nalah avec amour galactique

local Orion = {}

function Orion:CreateOrion(hubTitle)
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local LeftMenu = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local TabPages = Instance.new("Folder")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")

    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "NalahGalaxyUI"

    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
    Main.Position = UDim2.new(0.2, 0, 0.2, 0)
    Main.Size = UDim2.new(0, 600, 0, 400)

    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Main

    LeftMenu.Name = "LeftMenu"
    LeftMenu.Parent = Main
    LeftMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    LeftMenu.Size = UDim2.new(0, 140, 1, 0)

    UIListLayout.Parent = LeftMenu
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 10)

    TabPages.Name = "TabPages"
    TabPages.Parent = Main

    -- Animation
    TweenService:Create(Main, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 620, 0, 420)
    }):Play()

    -- Toggle Ctrl gauche
    local isOpen = true
    UserInputService.InputBegan:Connect(function(input, gpe)
        if input.KeyCode == Enum.KeyCode.LeftControl and not gpe then
            isOpen = not isOpen
            Main.Visible = isOpen
        end
    end)

    local function CreateTab(name)
        local Button = Instance.new("TextButton")
        Button.Name = name .. "Tab"
        Button.Parent = LeftMenu
        Button.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
        Button.Size = UDim2.new(1, -10, 0, 40)
        Button.Font = Enum.Font.GothamBold
        Button.Text = tostring(name)
        Button.TextColor3 = Color3.fromRGB(170, 130, 255)
        Button.TextSize = 14

        local Tab = Instance.new("ScrollingFrame")
        Tab.Name = name .. "Page"
        Tab.Parent = TabPages
        Tab.Size = UDim2.new(1, -150, 1, -20)
        Tab.Position = UDim2.new(0, 150, 0, 10)
        Tab.BackgroundTransparency = 1
        Tab.Visible = false
        Tab.ScrollBarThickness = 5
        Tab.CanvasSize = UDim2.new(0, 0, 5, 0)

        local List = Instance.new("UIListLayout")
        List.Parent = Tab
        List.Padding = UDim.new(0, 10)
        List.HorizontalAlignment = Enum.HorizontalAlignment.Center
        List.SortOrder = Enum.SortOrder.LayoutOrder

        Button.MouseButton1Click:Connect(function()
            for _, child in pairs(TabPages:GetChildren()) do
                if child:IsA("ScrollingFrame") then
                    child.Visible = false
                end
            end
            Tab.Visible = true
        end)

        local elementHandler = {}

        function elementHandler:TextLabel(text)
            local lbl = Instance.new("TextLabel")
            lbl.Size = UDim2.new(0, 400, 0, 30)
            lbl.BackgroundTransparency = 1
            lbl.Text = text
            lbl.TextColor3 = Color3.fromRGB(200, 200, 255)
            lbl.Font = Enum.Font.GothamSemibold
            lbl.TextSize = 16
            lbl.Parent = Tab
        end

        function elementHandler:TextButton(label, tooltip, callback)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0, 400, 0, 40)
            btn.BackgroundColor3 = Color3.fromRGB(45, 45, 70)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 14
            btn.Text = label
            btn.Parent = Tab
            btn.MouseButton1Click:Connect(callback)
        end

        function elementHandler:Toggle(label, callback)
            local toggle = Instance.new("TextButton")
            toggle.Size = UDim2.new(0, 400, 0, 40)
            toggle.BackgroundColor3 = Color3.fromRGB(45, 45, 70)
            toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggle.Font = Enum.Font.GothamBold
            toggle.TextSize = 14
            toggle.Text = label .. ": OFF"
            toggle.Parent = Tab

            local state = false
            toggle.MouseButton1Click:Connect(function()
                state = not state
                toggle.Text = label .. (state and ": ON" or ": OFF")
                callback(state)
            end)
        end

        function elementHandler:Slider(label, min, max, callback)
            local val = min
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0, 400, 0, 40)
            btn.BackgroundColor3 = Color3.fromRGB(45, 45, 70)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 14
            btn.Text = label .. ": " .. val
            btn.Parent = Tab
            btn.MouseButton1Click:Connect(function()
                val = val + 1
                if val > max then val = min end
                btn.Text = label .. ": " .. val
                callback(val)
            end)
        end

        function elementHandler:Dropdown(label, options, callback)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0, 400, 0, 40)
            btn.BackgroundColor3 = Color3.fromRGB(45, 45, 70)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 14
            btn.Text = label .. "... "
            btn.Parent = Tab
            local index = 1
            btn.MouseButton1Click:Connect(function()
                index = index + 1
                if index > #options then index = 1 end
                btn.Text = label .. ": " .. options[index]
                callback(options[index])
            end)
        end

        return elementHandler
    end

    return {
        CreateSection = CreateTab
    }
end

return Orion
