-- Nalah HUB - Inspired by Alchemy HUB
-- Premium always enabled for everyone

repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer

-- Auto rejoin & Anti AFK
local Player = game.Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")

-- Anti AFK
Player.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- Auto Rejoin on error prompt
game.CoreGui.ChildAdded:Connect(function(obj)
    if obj:FindFirstChild("ErrorPrompt") then
        TeleportService:Teleport(game.PlaceId)
    end
end)

-- Streamer mode: Hide player name
local function ProtectName(name, replacement)
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextBox") or obj:IsA("TextButton") then
            if string.find(obj.Text, name) then
                obj.Text = string.gsub(obj.Text, name, replacement)
                obj:GetPropertyChangedSignal("Text"):Connect(function()
                    obj.Text = string.gsub(obj.Text, name, replacement)
                end)
            end
        end
    end

    game.DescendantAdded:Connect(function(obj)
        if obj:IsA("TextLabel") or obj:IsA("TextBox") or obj:IsA("TextButton") then
            if string.find(obj.Text, name) then
                obj.Text = string.gsub(obj.Text, name, replacement)
                obj:GetPropertyChangedSignal("Text"):Connect(function()
                    obj.Text = string.gsub(obj.Text, name, replacement)
                end)
            end
        end
    end)
end

-- Enable streamer mode
ProtectName(Player.Name, "[Protected]")
ProtectName(Player.DisplayName, "[Protected]")

-- Main UI Loader
local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/HaxHaxxer/nalahhub/main/oriongalaxy.lua"))()
local UI = Orion:CreateOrion("🌌 Nalah HUB - Arise Crossover")

-- Ctrl gauche to toggle
local UIS = game:GetService("UserInputService")
local isOpen = true
UIS.InputBegan:Connect(function(input, gp)
    if input.KeyCode == Enum.KeyCode.LeftControl and not gp then
        isOpen = not isOpen
        local ui = game.CoreGui:FindFirstChild("ScreenGui")
        if ui then
            ui.Enabled = isOpen
        end
    end
end)

-- Section: Accueil
local Home = UI:CreateSection("🏠 Accueil")
Home:TextLabel("🌌 Bienvenue sur Nalah HUB")
Home:TextLabel("👑 Créé par : Nalah")
Home:TextLabel("🧪 Version : v1.0.0")
Home:TextLabel("✨ Merci d’utiliser notre hub !")

-- Section: TP
local function teleportForce(cframe)
    local char = Player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hrp and hum then
        hum:ChangeState(11)
        hrp.Anchored = true
        hrp.CFrame = cframe
        task.wait(0.4)
        hrp.Anchored = false
    end
end

local TP = UI:CreateSection("🌍 Toutes les îles")
TP:TextButton("🥇 Ville de Nivellement", "", function() teleportForce(CFrame.new(578, 25.9, 261.5)) end)
TP:TextButton("🥈 Village d'herbe", "", function() teleportForce(CFrame.new(-3380.2, 27.8, 2257.3)) end)
TP:TextButton("🥉 Île de Brum", "", function() teleportForce(CFrame.new(-2851.1, 46.9, -2011.4)) end)
TP:TextButton("🧼 Ville de guérison faciale", "", function() teleportForce(CFrame.new(2641.8, 42.9, -2645.1)) end)
TP:TextButton("🍀 Lucky Kingdom", "", function() teleportForce(CFrame.new(198.3, 36.2, 4296.1)) end)
TP:TextButton("🗾 Nipon City", "", function() teleportForce(CFrame.new(214.7, 30.4, -4301.6)) end)
TP:TextButton("🌃 Mori Town", "", function() teleportForce(CFrame.new(4885.21, 41.03, -160.83)) end)
TP:TextButton("🐉 Dragon City", "", function() teleportForce(CFrame.new(-6295.89, 27.2, -73.71)) end)
TP:TextButton("🏙️ XZ City", "", function() teleportForce(CFrame.new(5633.9043, 25.39, 4555.0498)) end)

-- Section: Farm
local Farm = UI:CreateSection("🌾 Farm")
local autoFarm, autoAttack, autoShadow, autoSelected = false, false, false, false
local delayFarm, selectedMob, farmType = 3, "", "Closest"

Farm:Toggle("Auto Farm Mobs", function(v)
    autoFarm = v
    while autoFarm do
        print("[AUTO FARM]", farmType)
        wait(delayFarm)
    end
end)
Farm:Dropdown("Select Farm Type", {"Closest", "Furthest", "Lowest HP", "Highest HP"}, function(v) farmType = v end)
Farm:Slider("Delay To Next Mob", 0, 10, function(v) delayFarm = v end)
Farm:Toggle("Auto Farm Selected Mobs", function(v) autoSelected = v end)
Farm:Dropdown("Select Mobs to Farm", {"Mob1", "Mob2", "Boss1"}, function(v) selectedMob = v end)
Farm:Toggle("Auto Attack", function(v) autoAttack = v end)
Farm:Toggle("Auto Send Shadow", function(v) autoShadow = v end)
Farm:Toggle("Auto Destroy", function(v) end)
Farm:Toggle("Auto Arise", function(v) end)
Farm:Toggle("Auto Clicker", function(v) end)
