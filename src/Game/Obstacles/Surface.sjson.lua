-- Adds obstacles for the Surface biome from Hades to Hades II

local hadesSurfaceObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Surface.sjson")
local hadesSurfaceObstacleTable = mod.DecodeSjsonFile(hadesSurfaceObstacleFile)

local hadesTwoSurfaceObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Surface.sjson")

-- These need to be added before the others, as they are inherited from
local hadesObstacleAdditionsParents = {}
local hadesObstacleAdditions = {
	EndCreditsVignette = {
		Name = "EndCreditsVignette",
		InheritFrom = "1_BaseGUIObstacle",
		DisplayInEditor = false,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "EndCreditsVignette",
			-- To account for a little pixel at the bottom being uncovered otherwise
			Scale = 1.02
		},
	},
}
-- Add the added obstacles
mod.AddTableKeysSkipDupes(hadesSurfaceObstacleTable.Obstacles, hadesObstacleAdditionsParents, "Name")
mod.AddTableKeysSkipDupes(hadesSurfaceObstacleTable.Obstacles, hadesObstacleAdditions, "Name")

-- Obstacles that are defined in a different file and therefore not caught by AddTableKeysSkipDupes()
local obstaclesToRemove = {
	"SurfaceBackgroundOceanc_Ripple",
	"SurfaceMoon01",
	"SurfaceTerrainSnowLumps02",
}

for i = #hadesSurfaceObstacleTable.Obstacles, 1, -1 do
	local obstacle = hadesSurfaceObstacleTable.Obstacles[i]
	if mod.ShouldRemoveEntry(obstacle.Name, obstaclesToRemove) then
		table.remove(hadesSurfaceObstacleTable.Obstacles, i)
		mod.DebugPrint("Removed obstacle: " .. obstacle.Name .. " from Surface.sjson", 4)
	end
end

-- Modifications for new obstacles copied from Hades
local obstacleModifications = {}

-- Rename attached animations/Fx graphics
for oldName, newName in pairs(mod.FxAnimationMappings) do
	mod.UpdateField(hadesSurfaceObstacleTable.Obstacles, oldName, newName, { "Thing", "Graphic" }, "Surface.sjson")
	mod.UpdateField(hadesSurfaceObstacleTable.Obstacles, oldName, newName, { "Thing", "AttachedAnim" }, "Surface.sjson")
end

mod.ApplyNestedSjsonModifications(hadesSurfaceObstacleTable.Obstacles, obstacleModifications)

-- Modifications to existing obstacles in Hades II
local hadesTwoObstacleModifications = {
	-- Destructible pillars that crumble when hit
	SurfaceDestructiblePillar = { InheritFrom = "1_BaseVulnerableObstacle", },
	-- Obstacles that shouldn't be passable
	SurfaceGravemarker07 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceGravemarker07a = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceBush01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceBush03 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceRock01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceRock02 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceRock03 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceRock04 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceTrellis01a = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceCrop01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceCrop02 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceCrop03 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceCrop05 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceCrop06 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceWell01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfacePillar03 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceChair01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceTable01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceLemonTree01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	Surface_TravelBag_01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceSign01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceShovel01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfacePitchfork01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceCrate01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },

	-- These should not just plop out of existence when the player sprints at them
	SurfaceGravemarker01 = { Life = { DieOnCollisionRequiredVelocity = 1000.0, }, },
	SurfaceGravemarker04 = { Life = { DieOnCollisionRequiredVelocity = 1000.0, }, },
	SurfaceGravemarker01a = { Life = { DieOnCollisionRequiredVelocity = 1000.0, }, },
	SurfaceGravemarker06 = { Life = { DieOnCollisionRequiredVelocity = 1000.0, }, },
	-- This causes occlusion when entering the boss room which is very distracting
	SurfaceDestructiblePillarB = { Thing = { CausesOcclusion = false, }, },
}

sjson.hook(hadesTwoSurfaceObstacleFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Surface"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Obstacles, hadesSurfaceObstacleTable.Obstacles, "Name")
	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
