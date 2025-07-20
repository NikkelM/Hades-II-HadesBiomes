-- Adds obstacles for the Asphodel biome from Hades to Hades II

local hadesAsphodelObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Asphodel.sjson")
local hadesAsphodelObstacleTable = sjson.decode_file(hadesAsphodelObstacleFile)

local hadesTwoAsphodelObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Asphodel.sjson")
-- local hadesTwoAsphodelObstacleTable = sjson.decode_file(hadesTwoAsphodelObstacleFile)

-- These need to be added before the others, as they are inherited from
local hadesObstacleAdditionsParents = {}
local hadesObstacleAdditions = {}

-- Add the added obstacles
mod.AddTableKeysSkipDupes(hadesAsphodelObstacleTable.Obstacles, hadesObstacleAdditionsParents, "Name")
mod.AddTableKeysSkipDupes(hadesAsphodelObstacleTable.Obstacles, hadesObstacleAdditions, "Name")

-- Modifications for new obstacles copied from Hades
local obstacleModifications = {}

-- Rename attached animations/Fx graphics
for oldName, newName in pairs(mod.FxAnimationMappings) do
	mod.UpdateField(hadesAsphodelObstacleTable.Obstacles, oldName, newName, { "Thing", "Graphic" }, "Asphodel.sjson")
	mod.UpdateField(hadesAsphodelObstacleTable.Obstacles, oldName, newName, { "Thing", "AttachedAnim" }, "Asphodel.sjson")
end

mod.ApplyNestedSjsonModifications(hadesAsphodelObstacleTable.Obstacles, obstacleModifications)

-- Modifications to existing obstacles in Hades II
local hadesTwoObstacleModifications = {
	-- Destructible pillars that crumble when hit
	AsphodelPillar06 = {
		InheritFrom = "1_BaseVulnerableObstacle",
	},
	-- Obstacles that shouldn't be passable
	AsphodelHydraRock01 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	AsphodelHydraRock02 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	AsphodelHydraRock02a = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	AsphodelHydraRock03 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	AsphodelHydraRock03a = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
}

sjson.hook(hadesTwoAsphodelObstacleFile, function(data)
	-- Add new obstacles
	mod.AddTableKeysSkipDupes(data.Obstacles, hadesAsphodelObstacleTable.Obstacles, "Name")
	-- Apply modifications to existing obstacles
	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
