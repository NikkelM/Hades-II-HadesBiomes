-- Adds Graybox obstacles from Hades to Hades II

-- We don't need all obstacles, we manually add a few only
-- local hadesGrayboxObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Graybox.sjson")
-- local hadesGrayboxObstacleTable = mod.DecodeSjsonFile(hadesGrayboxObstacleFile)
local hadesGrayboxObstacleTable = { Obstacles = {} }

local hadesTwoGrayboxObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Graybox.sjson")

-- These need to be added before the others, as they are inherited from
local hadesObstacleAdditionsParents = {
	ShrinePointDoor = {
		Name = "ShrinePointDoor",
		InheritFrom = "SecretDoor",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "ShrinePointDoor_Default",
		},
	},
}
local hadesObstacleAdditions = {
	ShrinePointExitDoor = {
		Name = "ShrinePointExitDoor",
		InheritFrom = "ShrinePointDoor",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
		},
	},
}

-- Add the added obstacles
mod.AddTableKeysSkipDupes(hadesGrayboxObstacleTable.Obstacles, hadesObstacleAdditionsParents, "Name")
mod.AddTableKeysSkipDupes(hadesGrayboxObstacleTable.Obstacles, hadesObstacleAdditions, "Name")

-- Modifications for new obstacles copied from Hades
local obstacleModifications = {}

-- Rename attached animations/Fx graphics
for oldName, newName in pairs(mod.FxAnimationMappings) do
	mod.UpdateField(hadesGrayboxObstacleTable.Obstacles, oldName, newName, { "Thing", "Graphic" }, "Graybox.sjson")
	mod.UpdateField(hadesGrayboxObstacleTable.Obstacles, oldName, newName, { "Thing", "AttachedAnim" }, "Graybox.sjson")
end

mod.ApplyNestedSjsonModifications(hadesGrayboxObstacleTable.Obstacles, obstacleModifications)

-- Modifications to existing obstacles in Hades II
local hadesTwoObstacleModifications = {}

sjson.hook(hadesTwoGrayboxObstacleFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Graybox"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Obstacles, hadesGrayboxObstacleTable.Obstacles, "Name")
	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
