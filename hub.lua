repeat wait() until game:IsLoaded()

-- Chargement de l'interface personnalisée
local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/HaxHaxxer/nalahhub/main/oriongalaxy.lua"))()

-- Toggle avec Ctrl gauche
local UIS = game:GetService("UserInputService")
local isOpen = true

UIS.InputBegan:Connect(function(input, gp)
	if input.KeyCode == Enum.KeyCode.LeftControl and not gp then
		isOpen = not isOpen
		local ui = game.CoreGui:FindFirstChild("OrionUI")
		if ui then
			ui.Enabled = isOpen
		end
	end
end)

local UI = Orion:CreateOrion("🌌 Nalah HUB - Arise Crossover")

-- ACCUEIL
local HomeTab = UI:MakeTab({
	Name = "🏠 Accueil",
	Icon = "rbxassetid://7733765396",
	PremiumOnly = false
})

HomeTab:AddParagraph("🌌 Bienvenue sur Nalah HUB", "")
HomeTab:AddLabel("👑 Créé par : Nalah")
HomeTab:AddLabel("🧪 Version : v1.0.0")
HomeTab:AddLabel("✨ Merci d'utiliser notre hub !")

-- Fonction de téléportation
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

-- ONGLET FARM
local FarmTab = UI:MakeTab({
	Name = "⚔️ Auto Farm",
	Icon = "rbxassetid://7733920766",
	PremiumOnly = false
})

local autoFarm = false
FarmTab:AddToggle({
	Name = "Auto Farm Mobs",
	Default = false,
	Callback = function(val)
		autoFarm = val
		while autoFarm do
			print("[AUTO FARM] Farming...")
			task.wait(1)
		end
	end
})

local farmType = "Closest"
FarmTab:AddDropdown({
	Name = "Type de Farm",
	Default = "Closest",
	Options = {"Closest", "Furthest", "Lowest HP", "Highest HP"},
	Callback = function(v)
		farmType = v
		print("Farm Type:", v)
	end
})

local delayFarm = 1
FarmTab:AddSlider({
	Name = "⏱️ Delay to next mob",
	Min = 0,
	Max = 5,
	Default = 1,
	Increment = 0.1,
	Callback = function(v)
		delayFarm = v
	end
})

FarmTab:AddDropdown({
	Name = "Cibler un Mob",
	Default = "Mob1",
	Options = {"Mob1", "Mob2", "Boss1"},
	Callback = function(mob)
		print("[TARGET MOB] " .. mob)
	end
})

FarmTab:AddToggle({
	Name = "Auto Attack",
	Default = false,
	Callback = function(val)
		while val do
			print("[HIT] Attack!")
			task.wait(0.3)
		end
	end
})

FarmTab:AddToggle({
	Name = "Auto Send Shadow",
	Default = false,
	Callback = function(val)
		while val do
			print("[SHADOW] Envoi")
			task.wait(0.5)
		end
	end
})

FarmTab:AddToggle({
	Name = "Auto Arise",
	Default = false,
	Callback = function(val)
		print("[ARISE] Non encore configuré")
	end
})

FarmTab:AddToggle({
	Name = "Auto Clicker",
	Default = false,
	Callback = function(val)
		print("[CLICK] Non encore configuré")
	end
})

-- ONGLET TÉLÉPORTATIONS
local TPTab = UI:MakeTab({
	Name = "🌍 Téléports",
	Icon = "rbxassetid://7734053490",
	PremiumOnly = false
})

TPTab:AddButton({
	Name = "🥇 Ville de Nivellement",
	Callback = function()
		teleportForce(CFrame.new(578, 25.9, 261.5))
	end
})

TPTab:AddButton({
	Name = "🥈 Village d'herbe",
	Callback = function()
		teleportForce(CFrame.new(-3380.2, 27.8, 2257.3))
	end
})

TPTab:AddButton({
	Name = "🥉 Île de Brum",
	Callback = function()
		teleportForce(CFrame.new(-2851.1, 46.9, -2011.4))
	end
})

TPTab:AddButton({
	Name = "🧼 Ville de guérison faciale",
	Callback = function()
		teleportForce(CFrame.new(2641.8, 42.9, -2645.1))
	end
})

TPTab:AddButton({
	Name = "🍀 Lucky Kingdom",
	Callback = function()
		teleportForce(CFrame.new(198.3, 36.2, 4296.1))
	end
})

TPTab:AddButton({
	Name = "🗾 Nipon City",
	Callback = function()
		teleportForce(CFrame.new(214.7, 30.4, -4301.6))
	end
})

TPTab:AddButton({
	Name = "🌃 Mori Town",
	Callback = function()
		teleportForce(CFrame.new(4885.21, 41.03, -160.83))
	end
})

TPTab:AddButton({
	Name = "🐉 Dragon City",
	Callback = function()
		teleportForce(CFrame.new(-6295.89, 27.2, -73.71))
	end
})

TPTab:AddButton({
	Name = "🏙️ XZ City",
	Callback = function()
		teleportForce(CFrame.new(5633.9043, 25.39, 4555.0498))
	end
})
