-- Adds Travel obstacles from Hades to Hades II

local hadesTravelObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Travel.sjson")
local hadesTravelObstacleTable = sjson.decode_file(hadesTravelObstacleFile)

local hadesTwoTravelObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Travel.sjson")

-- These need to be added before the others, as they are inherited from
local hadesObstacleAdditionsParents = {}

local hadesObstacleAdditions = {}
-- Add the added obstacles
mod.AddTableKeysSkipDupes(hadesTravelObstacleTable.Obstacles, hadesObstacleAdditionsParents, "Name")
mod.AddTableKeysSkipDupes(hadesTravelObstacleTable.Obstacles, hadesObstacleAdditions, "Name")

-- Modifications for new obstacles copied from Hades
local obstacleModifications = {}

-- Rename attached animations/Fx graphics
for oldName, newName in pairs(mod.FxAnimationMappings) do
	mod.UpdateField(hadesTravelObstacleTable.Obstacles, oldName, newName, { "Thing", "Graphic" }, "Travel.sjson")
	mod.UpdateField(hadesTravelObstacleTable.Obstacles, oldName, newName, { "Thing", "AttachedAnim" }, "Travel.sjson")
end

mod.ApplyNestedSjsonModifications(hadesTravelObstacleTable.Obstacles, obstacleModifications)

-- Modifications to existing obstacles in Hades II
local hadesTwoObstacleModifications = {}

sjson.hook(hadesTwoTravelObstacleFile, function(data)
	-- Add new obstacles
	mod.AddTableKeysSkipDupes(data.Obstacles, hadesTravelObstacleTable.Obstacles, "Name")
	-- Apply modifications to existing obstacles
	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
