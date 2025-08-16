-- Adds obstacles for the Styx biome from Hades to Hades II

local hadesStyxObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Styx.sjson")
local hadesStyxObstacleTable = sjson.decode_file(hadesStyxObstacleFile)

local hadesTwoStyxObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Styx.sjson")

-- These need to be added before the others, as they are inherited from
local hadesObstacleAdditionsParents = {}
local hadesObstacleAdditions = {
	-- These are imported from the Hades Gameplay.sjson
	HadesBidentReturnPoint = {
		Name = "HadesBidentReturnPoint",
		DisplayInEditor = true,
		Life = {
			Invulnerable = true,
		},
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "HadesBidentReturnPoint",
			StopsProjectiles = false,
			StopsUnits = false,
			Tallness = 227.0,
			Points = {
				{ X = 0,   Y = 10 },
				{ X = 10,  Y = 5 },
				{ X = 0,   Y = 0 },
				{ X = -10, Y = 5 },
			},
		},
	},
}
-- Add the added obstacles
mod.AddTableKeysSkipDupes(hadesStyxObstacleTable.Obstacles, hadesObstacleAdditionsParents, "Name")
mod.AddTableKeysSkipDupes(hadesStyxObstacleTable.Obstacles, hadesObstacleAdditions, "Name")

-- Modifications for new obstacles copied from Hades
local obstacleModifications = {}

-- Rename attached animations/Fx graphics
for oldName, newName in pairs(mod.FxAnimationMappings) do
	mod.UpdateField(hadesStyxObstacleTable.Obstacles, oldName, newName, { "Thing", "Graphic" }, "Styx.sjson")
	mod.UpdateField(hadesStyxObstacleTable.Obstacles, oldName, newName, { "Thing", "AttachedAnim" }, "Styx.sjson")
end

mod.ApplyNestedSjsonModifications(hadesStyxObstacleTable.Obstacles, obstacleModifications)

-- Modifications to existing obstacles in Hades II
local hadesTwoObstacleModifications = {
	-- Obstacles that shouldn't be passable
	StyxPillar01 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
}

sjson.hook(hadesTwoStyxObstacleFile, function(data)
	-- Add new obstacles
	mod.AddTableKeysSkipDupes(data.Obstacles, hadesStyxObstacleTable.Obstacles, "Name")
	-- Apply modifications to existing obstacles
	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
