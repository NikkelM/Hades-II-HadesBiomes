-- Adds obstacles for the Elysium biome from Hades to Hades II

local hadesElysiumObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Elysium.sjson")
local hadesElysiumObstacleTable = sjson.decode_file(hadesElysiumObstacleFile)

local hadesTwoElysiumObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Elysium.sjson")

local hadesObstacleAdditions = {}

-- Add the added obstacles
mod.AddTableKeysSkipDupes(hadesElysiumObstacleTable.Obstacles, hadesObstacleAdditions, "Name")

-- Modifications for new obstacles copied from Hades
local obstacleModifications = {}

-- Rename attached animations/Fx graphics
for oldName, newName in pairs(mod.FxAnimationMappings) do
	mod.UpdateField(hadesElysiumObstacleTable.Obstacles, oldName, newName, { "Thing", "Graphic" }, "Elysium.sjson")
	mod.UpdateField(hadesElysiumObstacleTable.Obstacles, oldName, newName, { "Thing", "AtachedAnim" }, "Elysium.sjson")
end

mod.ApplyNestedSjsonModifications(hadesElysiumObstacleTable.Obstacles, obstacleModifications)

-- Modifications to existing obstacles in Hades II
local hadesTwoObstacleModifications = {
	-- Destructible pillars that crumble when hit
	ElysiumDestructiblePillar = {
		InheritFrom = "1_BaseVulnerableObstacle",
	},
	ElysiumDestructiblePillarB = {
		InheritFrom = "1_BaseVulnerableObstacle",
	},
	ElysiumDestructiblePillarC = {
		InheritFrom = "1_BaseVulnerableObstacle",
	},
	ElysiumPillar06 = {
		InheritFrom = "1_BaseVulnerableObstacle",
	},
	ElysiumPillar06a = {
		InheritFrom = "1_BaseVulnerableObstacle",
	},
	-- Obstacles that should not be passable, but are for some reason
	ElysiumPlanter01 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	ElysiumPlanter02 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	ElysiumBush01 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	ElysiumFence05 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
}

sjson.hook(hadesTwoElysiumObstacleFile, function(data)
	-- Add new obstacles
	mod.AddTableKeysSkipDupes(data.Obstacles, hadesElysiumObstacleTable.Obstacles, "Name")
	-- Apply modifications to existing obstacles
	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
