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
local HomeTab = UI:CreateTab("Accueil", "", true)
local Home = HomeTab:CreateSection("Accueil")
Home:CreateLabel("\ud83c\udf0c Bienvenue sur Nalah HUB")
Home:CreateLabel("\ud83d\udc51 Créé par : Nalah")
Home:CreateLabel("\ud83e\uddea Version : v1.0.0")
Home:CreateLabel("\u2728 Merci d’utiliser notre hub !")

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
local FarmTab = UI:CreateTab("Auto Farm", "")
local Farm = FarmTab:CreateSection("\ud83c\udf3e Farm")

-- Auto Farm Mobs
local autoFarm = false
Farm:CreateToggle("Auto Farm Mobs", false, function(bool)
	autoFarm = bool
	task.spawn(function()
		while autoFarm do
			print("[AUTO FARM] Farming...")
			task.wait(1)
		end
	end)
end)

-- Type de farm
local farmType = "Closest"
Farm:CreateDropdown("Type de Farm", {"Closest", "Furthest", "Lowest HP", "Highest HP"}, function(v)
	farmType = v
	print("Farm Type:", v)
end)

-- Delay entre mobs
local delayFarm = 1
Farm:CreateSlider("\u23f1\ufe0f Delay to next mob", 0, 5, 1, function(val)
	delayFarm = val
end)

-- Auto Farm Selected Mobs
local autoFarmSelected = false
Farm:CreateToggle("Auto Farm Mobs Sélectionnés", false, function(bool)
	autoFarmSelected = bool
	task.spawn(function()
		while autoFarmSelected do
			print("[AUTO SELECTED] Farm mobs ciblés...")
			task.wait(delayFarm)
		end
	end)
end)

-- Liste de mobs sélectionnables
Farm:CreateDropdown("Cibler un Mob", {"Mob1", "Mob2", "Boss1"}, function(mob)
	print("[TARGET MOB] " .. mob)
end)

-- Auto Attack
local autoAttack = false
Farm:CreateToggle("Auto Attack", false, function(bool)
	autoAttack = bool
	task.spawn(function()
		while autoAttack do
			print("[HIT] Attack!")
			task.wait(0.3)
		end
	end)
end)

-- Auto Send Shadow
local autoShadow = false
Farm:CreateToggle("Auto Send Shadow", false, function(bool)
	autoShadow = bool
	task.spawn(function()
		while autoShadow do
			print("[SHADOW] Envoi")
			task.wait(0.5)
		end
	end)
end)

Farm:CreateToggle("Auto Arise", false, function()
	print("[ARISE] Pas encore configuré.")
end)

Farm:CreateToggle("Auto Clicker", false, function()
	print("[CLICK] Pas encore configuré.")
end)

-- Onglet Téléportation
local TPTab = UI:CreateTab("Téléportations", "")
local TP = TPTab:CreateSection("\ud83c\udf0d Toutes les îles")

TP:CreateButton("\ud83e\udd47 Ville de Nivellement", function()
	teleportForce(CFrame.new(578, 25.9, 261.5))
end)

TP:CreateButton("\ud83e\udd48 Village d'herbe", function()
	teleportForce(CFrame.new(-3380.2, 27.8, 2257.3))
end)

TP:CreateButton("\ud83e\udd49 Île de Brum", function()
	teleportForce(CFrame.new(-2851.1, 46.9, -2011.4))
end)

TP:CreateButton("\ud83e\uddfc Ville de guérison faciale", function()
	teleportForce(CFrame.new(2641.8, 42.9, -2645.1))
end)

TP:CreateButton("\ud83c\udf40 Lucky Kingdom", function()
	teleportForce(CFrame.new(198.3, 36.2, 4296.1))
end)

TP:CreateButton("\ud83d\uddfe Nipon City", function()
	teleportForce(CFrame.new(214.7, 30.4, -4301.6))
end)

TP:CreateButton("\ud83c\udf03 Mori Town", function()
	teleportForce(CFrame.new(4885.21, 41.03, -160.83))
end)

TP:CreateButton("\ud83d\udc09 Dragon City", function()
	teleportForce(CFrame.new(-6295.89, 27.2, -73.71))
end)

TP:CreateButton("\ud83c\udfd9\ufe0f XZ City", function()
	teleportForce(CFrame.new(5633.9043, 25.39, 4555.0498))
end)
