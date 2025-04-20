local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/HaxHaxxer/nalahhub/main/Orion.lua"))()
local UI = Orion:CreateOrion("🌌 Nalah HUB - Arise Crossover")

local TPSection = UI:CreateSection("🌍 Toutes les îles")

-- Fonction de téléportation renforcée
local function teleportForce(cframe)
	local char = game.Players.LocalPlayer.Character
	if not char then return end

	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")

	if hrp and hum then
		hum:ChangeState(11) -- évite les rollback sur certains serveurs
		hrp.Anchored = true
		hrp.CFrame = cframe
		task.wait(0.4)
		hrp.Anchored = false
	end
end

-- Boutons de téléportation
TPSection:TextButton("🥇 Ville de Nivellement (SoloWorld)", "", function()
	teleportForce(CFrame.new(578, 25.9, 261.5))
end)

TPSection:TextButton("🥈 Village d'herbe (NarutoWorld)", "", function()
	teleportForce(CFrame.new(-3380.2, 27.8, 2257.3))
end)

TPSection:TextButton("🥉 Île de Brum (OPWorld)", "", function()
	teleportForce(CFrame.new(-2851.1, 46.9, -2011.4))
end)

TPSection:TextButton("🧼 Ville de guérison faciale (BleachWorld)", "", function()
	teleportForce(CFrame.new(2641.8, 42.9, -2645.1))
end)

TPSection:TextButton("🍀 Lucky Kingdom (BCWorld)", "", function()
	teleportForce(CFrame.new(198.3, 36.2, 4296.1))
end)

TPSection:TextButton("🗾 Nipon City (ChainsawWorld)", "", function()
	teleportForce(CFrame.new(214.7, 30.4, -4301.6))
end)

TPSection:TextButton("🌃 Mori Town (JojoWorld)", "", function()
	teleportForce(CFrame.new(4885.21, 41.03, -160.83))
end)

TPSection:TextButton("🐉 Dragon City (DBWorld)", "", function()
	teleportForce(CFrame.new(-6295.9, 24.7, -73.7))
end)

TPSection:TextButton("🏙️ XZ City (OPMWorld)", "", function()
	teleportForce(CFrame.new(-6295.89, 27.2, -73.71))
end)
