local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/HaxHaxxer/nalahhub/main/oriongalaxy.lua"))()

-- Toggle avec Ctrl gauche
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

-- Création de l'interface principale
local UI = Orion:CreateOrion("🌌 Nalah HUB - Arise Crossover")

-- Onglet Accueil
local Home = UI:CreateSection("🏠 Accueil")
Home:TextLabel("🌌 Bienvenue sur Nalah HUB")
Home:TextLabel("👑 Créé par : Nalah")
Home:TextLabel("🧪 Version : v1.0.0")
Home:TextLabel("✨ Merci d’utiliser notre hub !")

-- Fonction TP améliorée
local function teleportForce(cframe)
	local char = game.Players.LocalPlayer.Character
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

-- Onglet Farm
local Farm = UI:CreateSection("🌾 Farm")

-- Auto Farm Mobs
local autoFarm = false
Farm:Toggle("Auto Farm Mobs", function(bool)
    autoFarm = bool
    while autoFarm do
        -- log pour test, remplace par ta logique de farm
        print("[AUTO FARM] Farming...")
        task.wait(delayFarm)
    end
end)

-- Choix type de farm
local farmType = "Closest"
Farm:Dropdown("Select Farm Type", {"Closest", "Furthest", "Lowest HP", "Highest HP"}, function(selected)
    farmType = selected
    print("[FARM TYPE] Choisi:", farmType)
end)

-- Delay farm
local delayFarm = 3
Farm:Slider("Delay To Next Mob", 0, 10, function(value)
    delayFarm = value
end)

-- Auto Farm Selected Mobs
local autoFarmSelected = false
Farm:Toggle("Auto Farm Selected Mobs", function(bool)
    autoFarmSelected = bool
    while autoFarmSelected do
        print("[FARM SELECTED] Farming selected mobs...")
        task.wait(delayFarm)
    end
end)

-- Liste des mobs
Farm:Dropdown("Select Mobs to Farm", {"Mob1", "Mob2", "Boss1"}, function(mob)
    print("[TARGET MOB] ", mob)
    -- stocke le mob pour le farm ciblé
end)

-- Auto Attack
local autoAttack = false
Farm:Toggle("Auto Attack", function(bool)
    autoAttack = bool
    while autoAttack do
        print("[AUTO ATTACK] Hit")
        task.wait(0.3)
    end
end)

-- Auto Send Shadow
local autoShadow = false
Farm:Toggle("Auto Send Shadow", function(bool)
    autoShadow = bool
    while autoShadow do
        print("[SHADOW] Sent")
        task.wait(0.5)
    end
end)

-- Placeholder boutons
Farm:Toggle("Auto Destroy", function(bool)
    print("[DESTROY] Non configuré encore")
end)

Farm:Toggle("Auto Arise", function(bool)
    print("[ARISE] Non configuré encore")
end)

Farm:Toggle("Auto Clicker", function(bool)
    print("[CLICKER] Non configuré encore")
end)


-- Onglet TP
local TP = UI:CreateSection("🌍 Toutes les îles")

TP:TextButton("🥇 Ville de Nivellement", "", function()
	teleportForce(CFrame.new(578, 25.9, 261.5))
end)

TP:TextButton("🥈 Village d'herbe", "", function()
	teleportForce(CFrame.new(-3380.2, 27.8, 2257.3))
end)

TP:TextButton("🥉 Île de Brum", "", function()
	teleportForce(CFrame.new(-2851.1, 46.9, -2011.4))
end)

TP:TextButton("🧼 Ville de guérison faciale", "", function()
	teleportForce(CFrame.new(2641.8, 42.9, -2645.1))
end)

TP:TextButton("🍀 Lucky Kingdom", "", function()
	teleportForce(CFrame.new(198.3, 36.2, 4296.1))
end)

TP:TextButton("🗾 Nipon City", "", function()
	teleportForce(CFrame.new(214.7, 30.4, -4301.6))
end)

TP:TextButton("🌃 Mori Town", "", function()
	teleportForce(CFrame.new(4885.21, 41.03, -160.83)) -- corrigé
end)

TP:TextButton("🐉 Dragon City", "", function()
	teleportForce(CFrame.new(-6295.89, 27.2, -73.71)) -- corrigé
end)

TP:TextButton("🏙️ XZ City", "", function()
	teleportForce(CFrame.new(5633.9043, 25.39, 4555.0498)) -- corrigé
end)
