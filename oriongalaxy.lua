repeat wait() until game:IsLoaded()

-- Load custom UI (ton fichier oriongalaxy.lua)
local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/HaxHaxxer/nalahhub/main/oriongalaxy.lua"))()

-- Toggle UI with Ctrl gauche (KeyCode 17)
local UIS = game:GetService("UserInputService")
local isOpen = true

UIS.InputBegan:Connect(function(input, gp)
	if input.KeyCode == Enum.KeyCode.LeftControl and not gp then
		isOpen = not isOpen
		local gui = game.CoreGui:FindFirstChild("ScreenGui")
		if gui then
			gui.Enabled = isOpen
		end
	end
end)

-- Crée l'interface
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
		print("[AUTO FARM] Farming...")
		task.wait(1)
	end
end)

-- Type de farm
local farmType = "Closest"
Farm:Dropdown("Type de Farm", {"Closest", "Furthest", "Lowest HP", "Highest HP"}, function(v)
	farmType = v
	print("Farm Type:", v)
end)

-- Delay entre mobs
local delayFarm = 1
Farm:Slider("⏱️ Delay to next mob", 0, 5, function(val)
	delayFarm = val
end)

-- Auto Farm Selected Mobs
local autoFarmSelected = false
Farm:Toggle("Auto Farm Mobs Sélectionnés", function(bool)
	autoFarmSelected = bool
	while autoFarmSelected do
		print("[AUTO SELECTED] Farm mobs ciblés...")
		task.wait(delayFarm)
	end
end)

-- Liste de mobs sélectionnables
Farm:Dropdown("Cibler un Mob", {"Mob1", "Mob2", "Boss1"}, function(mob)
	print("[TARGET MOB] " .. mob)
end)

-- Auto Attack
local autoAttack = false
Farm:Toggle("Auto Attack", function(bool)
	autoAttack = bool
	while autoAttack do
		print("[HIT] Attack!")
		task.wait(0.3)
	end
end)

-- Auto Send Shadow
local autoShadow = false
Farm:Toggle("Auto Send Shadow", function(bool)
	autoShadow = bool
	while autoShadow do
		print("[SHADOW] Envoi")
		task.wait(0.5)
	end
end)

Farm:Toggle("Auto Arise", function(b)
	print("[ARISE] Pas encore configuré.")
end)

Farm:Toggle("Auto Clicker", function(b)
	print("[CLICK] Pas encore configuré.")
end)

-- Onglet Téléportation
local TP = UI:CreateSection("🌍 Téléportations")

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
	teleportForce(CFrame.new(4885.21, 41.03, -160.83))
end)

TP:TextButton("🐉 Dragon City", "", function()
	teleportForce(CFrame.new(-6295.89, 27.2, -73.71))
end)

TP:TextButton("🏙️ XZ City", "", function()
	teleportForce(CFrame.new(5633.9043, 25.39, 4555.0498))
end)
