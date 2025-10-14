-- Adds obstacles for the Surface biome from Hades to Hades II

local hadesSurfaceObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Surface.sjson")
local hadesSurfaceObstacleTable = mod.DecodeSjsonFile(hadesSurfaceObstacleFile)

local hadesTwoSurfaceObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Surface.sjson")

-- These need to be added before the others, as they are inherited from
local hadesObstacleAdditionsParents = {}
local hadesObstacleAdditions = {}
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
	-- Obstacles that shouldn't be passable
	SurfaceGravemarker07 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	SurfaceGravemarker07a = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	-- These should not just plop out of existence when the player sprints at them
	SurfaceGravemarker01 = { Life = { DieOnCollisionRequiredVelocity = 1000.0, }, },
	SurfaceGravemarker04 = { Life = { DieOnCollisionRequiredVelocity = 1000.0, }, },
	SurfaceGravemarker01a = { Life = { DieOnCollisionRequiredVelocity = 1000.0, }, },
	SurfaceGravemarker06 = { Life = { DieOnCollisionRequiredVelocity = 1000.0, }, },
	-- This causes occlusion when entering the boss room which is very distracting
	SurfaceDestructiblePillarB = { Thing = { CausesOcclusion = false, }, },
}

sjson.hook(hadesTwoSurfaceObstacleFile, function(data)
	-- Add new obstacles
	mod.AddTableKeysSkipDupes(data.Obstacles, hadesSurfaceObstacleTable.Obstacles, "Name")
	-- Apply modifications to existing obstacles
	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
