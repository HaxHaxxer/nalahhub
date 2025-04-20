local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/HaxHaxxer/nalahhub/main/Orion.lua"))()
local UI = Orion:CreateOrion("🌌 Nalah HUB - Arise Crossover")

local TPSection = UI:CreateSection("🌍 Toutes les îles")

-- Fonction de téléportation répétée
local function teleportRepeat(pos)
	for i = 1, 5 do
		task.wait(0.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
	end
end

TPSection:TextButton("🥇 Ville de Nivellement (SoloWorld)", "", function()
	teleportRepeat(CFrame.new(578, 25.9, 261.5))
end)

TPSection:TextButton("🥈 Village d'herbe (NarutoWorld)", "", function()
	teleportRepeat(CFrame.new(-3380.2, 27.8, 2257.3))
end)

TPSection:TextButton("🥉 Île de Brum (OPWorld)", "", function()
	teleportRepeat(CFrame.new(-2851.1, 46.9, -2011.4))
end)

TPSection:TextButton("🧼 Ville de guérison faciale (BleachWorld)", "", function()
	teleportRepeat(CFrame.new(2641.8, 42.9, -2645.1))
end)

TPSection:TextButton("🍀 Lucky Kingdom (BCWorld)", "", function()
	teleportRepeat(CFrame.new(198.3, 36.2, 4296.1))
end)

TPSection:TextButton("🗾 Nipon City (ChainsawWorld)", "", function()
	teleportRepeat(CFrame.new(214.7, 30.4, -4301.6))
end)

TPSection:TextButton("🌃 Mori Town (JojoWorld)", "", function()
	teleportRepeat(CFrame.new(-4816.3, -27.4, -120.2))
end)

TPSection:TextButton("🐉 Dragon City (DBWorld)", "", function()
	teleportRepeat(CFrame.new(-6295.9, 24.7, -73.7))
end)

TPSection:TextButton("🏙️ XZ City (OPMWorld)", "", function()
	teleportRepeat(CFrame.new(5633.9, 22.9, -4555.0))
end)
