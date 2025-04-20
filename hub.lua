local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/HaxHaxxer/nalahhub/main/Orion.lua"))()

-- Ouvrir / Fermer avec Ctrl gauche (KeyCode 17)
local UIS = game:GetService("UserInputService")
local isOpen = true
UIS.InputBegan:Connect(function(input, gp)
	if input.KeyCode == Enum.KeyCode.LeftControl and not gp then
		isOpen = not isOpen
		game.CoreGui:FindFirstChild("ScreenGui").Enabled = isOpen
	end
end)

local UI = Orion:CreateOrion("🌌 Nalah HUB - Arise Crossover")

-- 🌠 Onglet Accueil
local Home = UI:CreateSection("🏠 Accueil")
Home:TextLabel("🌌 Bienvenue sur Nalah HUB")
Home:TextLabel("🧑‍💻 Créé par : Nalah")
Home:TextLabel("🧪 Version : v1.0.0")
Home:TextLabel("💫 Merci d’utiliser notre hub !")

-- Fonction TP renforcée
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

-- 🌍 Onglet Téléportation
local TPSection = UI:CreateSection("🌍 Toutes les îles")

TPSection:TextButton("🥇 Ville de Nivellement", "", function()
	teleportForce(CFrame.new(578, 25.9, 261.5))
end)

TPSection:TextButton("🥈 Village d'herbe", "", function()
	teleportForce(CFrame.new(-3380.2, 27.8, 2257.3))
end)

TPSection:TextButton("🥉 Île de Brum", "", function()
	teleportForce(CFrame.new(-2851.1, 46.9, -2011.4))
end)

TPSection:TextButton("🧼 Ville de guérison faciale", "", function()
	teleportForce(CFrame.new(2641.8, 42.9, -2645.1))
end)

TPSection:TextButton("🍀 Lucky Kingdom", "", function()
	teleportForce(CFrame.new(198.3, 36.2, 4296.1))
end)

TPSection:TextButton("🗾 Nipon City", "", function()
	teleportForce(CFrame.new(214.7, 30.4, -4301.6))
end)

TPSection:TextButton("🌃 Mori Town", "", function()
	teleportForce(CFrame.new(4885.21, 41.03, -160.83))
end)

TPSection:TextButton("🐉 Dragon City", "", function()
	teleportForce(CFrame.new(-6295.89, 27.2, -73.71))
end)

TPSection:TextButton("🏙️ XZ City", "", function()
	teleportForce(CFrame.new(5633.9043, 25.39, 4555.0498))
end)
