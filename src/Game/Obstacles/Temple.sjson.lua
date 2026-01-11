-- local hadesTempleObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Temple.sjson")
-- local hadesTempleObstacleTable = mod.DecodeSjsonFile(hadesTempleObstacleFile)

local hadesTwoTempleObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Temple.sjson")
-- local hadesTwoTempleObstacleTable = mod.DecodeSjsonFile(hadesTwoTempleObstacleFile)

-- These need to be added before the others, as they are inherited from
-- local hadesObstacleAdditionsParents = {}
-- local hadesObstacleAdditions = {}

-- Add the added obstacles
-- mod.AddTableKeysSkipDupes(hadesTempleObstacleTable.Obstacles, hadesObstacleAdditionsParents, "Name")
-- mod.AddTableKeysSkipDupes(hadesTempleObstacleTable.Obstacles, hadesObstacleAdditions, "Name")

-- Modifications for new obstacles copied from Hades
-- local obstacleModifications = {}

-- Rename attached animations/Fx graphics
-- for oldName, newName in pairs(mod.FxAnimationMappings) do
	-- mod.UpdateField(hadesTempleObstacleTable.Obstacles, oldName, newName, { "Thing", "Graphic" }, "Temple.sjson")
	-- mod.UpdateField(hadesTempleObstacleTable.Obstacles, oldName, newName, { "Thing", "AttachedAnim" }, "Temple.sjson")
-- end

-- mod.ApplyNestedSjsonModifications(hadesTempleObstacleTable.Obstacles, obstacleModifications)

-- Modifications to existing obstacles in Hades II
local hadesTwoObstacleModifications = {
	-- Obstacles that shouldn't be passable
	CharonTogglePillar = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
}

sjson.hook(hadesTwoTempleObstacleFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Temple"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	-- mod.AddTableKeysSkipDupes(data.Obstacles, hadesTempleObstacleTable.Obstacles, "Name")
	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
