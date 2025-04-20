-- Chargement du framework Orion Galaxy
local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/HaxHaxxer/nalahhub/main/oriongalaxy.lua"))()

-- Toggle via Ctrl gauche
local UIS = game:GetService("UserInputService")
local isOpen = true
UIS.InputBegan:Connect(function(input, gp)
	if input.KeyCode == Enum.KeyCode.LeftControl and not gp then
		isOpen = not isOpen
		local ui = game.CoreGui:FindFirstChild("ScreenGui")
		if ui then ui.Enabled = isOpen end
	end
end)

-- Création du hub
local UI = Orion:CreateOrion("🌌 Nalah HUB - Arise Crossover")

-- ACCUEIL
local Accueil = UI:CreateSection("🏠 Accueil")
Accueil:TextLabel("🌌 Bienvenue sur Nalah HUB")
Accueil:TextLabel("👑 Crée par : Nalah")
Accueil:TextLabel("🧪 Version : v1.0.0")
Accueil:TextLabel("✨ Merci d'utiliser notre hub !")

-- FARM
local Farm = UI:CreateSection("⚔️ Auto Farm")
local autoFarm = false
local autoFarmSelected = false
local autoAttack, autoShadow, autoClicker = false, false, false
local delayFarm = 3
local farmType = "Closest"
local selectedMob = ""

Farm:Toggle("Auto Farm Mobs", function(state)
	autoFarm = state
	while autoFarm do
		print("[AutoFarm] Mobs", farmType)
		task.wait(delayFarm)
	end
end)

Farm:Dropdown("Select Farm Type", {"Closest", "Furthest", "Lowest HP", "Highest HP"}, function(v)
	farmType = v
end)

Farm:Slider("Delay To Next Mob", 0, 10, function(v)
	delayFarm = v
end)

Farm:Toggle("Auto Farm Selected Mobs", function(state)
	autoFarmSelected = state
	while autoFarmSelected do
		print("[Selected Farm] Mob:", selectedMob)
		task.wait(delayFarm)
	end
end)

Farm:Dropdown("Select Mobs to Farm", {"Mob1", "Mob2", "Boss1"}, function(v)
	selectedMob = v
end)

Farm:Toggle("Auto Attack", function(v)
	autoAttack = v
	while autoAttack do print("[Hit]") task.wait(0.3) end
end)

Farm:Toggle("Auto Send Shadow", function(v)
	autoShadow = v
	while autoShadow do print("[Shadow sent]") task.wait(0.5) end
end)

Farm:Toggle("Auto Clicker", function(v)
	autoClicker = v
	while autoClicker do print("[Clicking...]") task.wait(0.1) end
end)

Farm:Toggle("Auto Arise", function(v) print("[ARISE] Not implemented") end)
Farm:Toggle("Auto Destroy", function(v) print("[DESTROY] Not implemented") end)

-- TELEPORT
local TP = UI:CreateSection("🌍 Teleports")
local function teleportForce(cf)
	local p = game.Players.LocalPlayer.Character
	if not p then return end
	local hrp = p:FindFirstChild("HumanoidRootPart")
	if hrp then hrp.Anchored = true hrp.CFrame = cf task.wait(0.4) hrp.Anchored = false end
end

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

-- DUNGEONS
local Dungeon = UI:CreateSection("🏰 Dungeons")
Dungeon:Toggle("AutoFarm Nearest (Dungeon)", function(b) print("[DUNGEON] AutoFarm:", b) end)
Dungeon:Toggle("Check All Islands (Loop)", function(b) print("[ISLANDS] Loop:", b) end)
Dungeon:Toggle("Auto Join RedCastle", function(b) print("[JOIN] RedCastle:", b) end)
Dungeon:Toggle("Auto Create And Start Dungeon", function(b) print("[START] Dungeon:", b) end)

-- RANKS
local Rank = UI:CreateSection("🎖️ Ranks")
Rank:Toggle("Auto Farm Nearest (Rank)", function(b) print("[RANK] Farm:", b) end)
Rank:TextButton("TP to Exam/Ranker (Dungeon)", "", function()
	print("[TP] Dungeon")
end)

-- SETTINGS
local Settings = UI:CreateSection("⚙️ Settings")
Settings:Toggle("Anti AFK", function(b)
	print("[ANTI AFK]", b)
end)

Settings:Dropdown("Theme", {"Dark", "Light", "Galaxy"}, function(val)
	print("[THEME] Choisi:", val)
end)

Settings:TextBox("Config name", "MyConfig", function(txt)
	print("[CONFIG NAME]", txt)
end)

Settings:TextButton("Create config", "", function() print("[CONFIG] Crée") end)
Settings:TextButton("Load config", "", function() print("[CONFIG] Chargée") end)
Settings:TextButton("Save config", "", function() print("[CONFIG] Sauvegardée") end)
Settings:TextButton("Set as Autoload", "", function() print("[AUTOLOAD] Config") end)
