-- This file is currently not used
-- Adds non-character enemy animations from Hades to Hades II

local hadesObstacleAnimationsFile = rom.path.combine(mod.hadesGameFolder,
	"Content\\Game\\Animations\\ObstacleAnimations.sjson")
local hadesObstacleAnimationsTable = sjson.decode_file(hadesObstacleAnimationsFile)

local hadesTwoObstacleAnimationsFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Obstacle_Deprecated_VFX.sjson")

-- Modifications
local animationsToRemove = {
	"MainMenuIn",
	"MainMenuLoop",
	"SupergiantLogoConsole",
	"MainMenuNextUpdateBox",
	"MainMenuNextUpdateBoxHighlightOn",
	"MainMenuNextUpdateBoxPress",
	"MainMenuNextUpdateBoxCallout",
	"HealthFountainFull",
	"HealthFountainFullStart",
	"HealthFountainStreaks",
	"HealthFountainSparkle",
	"HealthFountainWater",
	"HealthFountainEmpty",
	"RemBGIntro",
	"RemBG",
	"HadesOverlay",
	"ZeusOverlay",
	"PoseidonOverlay",
	"AphroditeOverlay",
	"ArtemisOverlay",
	"DemeterOverlay",
	"ChaosOverlay",
	"EpilogueBaseAnim",
	"TorchMarker",
	"TorchMarkerLarge",
}

local function shouldRemoveAnimation(name)
	for _, removeName in ipairs(animationsToRemove) do
		if name == removeName then
			return true
		end
	end
	return false
end

for i = #hadesObstacleAnimationsTable.Animations, 1, -1 do
	local animation = hadesObstacleAnimationsTable.Animations[i]
	if shouldRemoveAnimation(animation.Name) then
		table.remove(hadesObstacleAnimationsTable.Animations, i)
		mod.DebugPrint("Removed animation: " .. animation.Name .. " from EnemyAnimations.sjson", 4)
	end
end

local hadesObstacleAnimationsAdditions = {}

local hadesObstacleAnimationsModifications = {}

-- Add the added animations
mod.AddTableKeysSkipDupes(hadesObstacleAnimationsTable.Animations, hadesObstacleAnimationsAdditions, "Name")
-- Apply modifications
mod.ApplyNestedSjsonModifications(hadesObstacleAnimationsTable.Animations, hadesObstacleAnimationsModifications)
-- Add to the Hades II file
sjson.hook(hadesTwoObstacleAnimationsFile, function(data)
	mod.AddTableKeysSkipDupes(data.Animations, hadesObstacleAnimationsTable.Animations, "Name")
end)
