-- local hadesHouseObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\House.sjson")
-- local hadesHouseObstacleTable = mod.DecodeSjsonFile(hadesHouseObstacleFile)
local hadesHouseObstacleTable = { Obstacles = {} }

local hadesTwoHouseObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\House.sjson")
-- local hadesTwoHouseObstacleTable = mod.DecodeSjsonFile(hadesTwoHouseObstacleFile)

-- These need to be added before the others, as they are inherited from
-- local hadesObstacleAdditionsParents = {}
local hadesObstacleAdditions = {
	ModsNikkelMHadesBiomes_HouseStatueDraped01 = {
		Name = "ModsNikkelMHadesBiomes_HouseStatueDraped01",
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
		DisplayInEditor = true,
		Life = {
			TriggerOnHit = true,
		},
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "NikkelM-HadesBiomesCrossroads\\Tilesets\\House\\House_StatueDraped_01",
			Tallness = 1072.0,
			Offset = { X = 0, Y = -240 },
			Points = {
				{ X = 90,  Y = 0 },
				{ X = 0,   Y = -60 },
				{ X = -90, Y = 0 },
				{ X = 0,   Y = 60 },
			},
		},
	},
	ModsNikkelMHadesBiomes_HouseStatueSkelly01 = {
		Name = "ModsNikkelMHadesBiomes_HouseStatueSkelly01",
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
		DisplayInEditor = true,
		Life = {
			TriggerOnHit = true,
		},
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "NikkelM-HadesBiomesCrossroads\\Tilesets\\House\\House_StatueSkelly_01",
			Tallness = 1035.0,
			Offset = { X = 0, Y = -574 },
			Points = {
				{ X = 221,  Y = 0 },
				{ X = -5,   Y = -98 },
				{ X = -208, Y = 0 },
				{ X = 0,    Y = 113 },
			},
		},
	},
	ModsNikkelMHadesBiomes_HouseStatueSkelly02 = {
		Name = "ModsNikkelMHadesBiomes_HouseStatueSkelly02",
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
		DisplayInEditor = true,
		Life = {
			TriggerOnHit = true,
		},
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "NikkelM-HadesBiomesCrossroads\\Tilesets\\House\\House_StatueSkelly_02",
			Tallness = 1035.0,
			Offset = { X = 0, Y = -571 },
			Points = {
				{ X = 221,  Y = 0 },
				{ X = -5,   Y = -98 },
				{ X = -208, Y = 0 },
				{ X = 0,    Y = 113 },
			},
		},
	},
	ModsNikkelMHadesBiomes_HouseStatueSkelly04 = {
		Name = "ModsNikkelMHadesBiomes_HouseStatueSkelly04",
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
		DisplayInEditor = true,
		Life = {
			TriggerOnHit = true,
		},
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "NikkelM-HadesBiomesCrossroads\\Tilesets\\House\\House_StatueSkelly_04",
			Tallness = 1035.0,
			Offset = { X = 0, Y = -568 },
			Points = {
				{ X = 221,  Y = 0 },
				{ X = -5,   Y = -98 },
				{ X = -208, Y = 0 },
				{ X = 0,    Y = 113 },
			},
		},
	},
}

-- Add the added obstacles
-- mod.AddTableKeysSkipDupes(hadesHouseObstacleTable.Obstacles, hadesObstacleAdditionsParents, "Name")
mod.AddTableKeysSkipDupes(hadesHouseObstacleTable.Obstacles, hadesObstacleAdditions, "Name")

-- Modifications for new obstacles copied from Hades
-- local obstacleModifications = {}

-- Rename attached animations/Fx graphics
-- for oldName, newName in pairs(mod.FxAnimationMappings) do
-- mod.UpdateField(hadesHouseObstacleTable.Obstacles, oldName, newName, { "Thing", "Graphic" }, "House.sjson")
-- mod.UpdateField(hadesHouseObstacleTable.Obstacles, oldName, newName, { "Thing", "AttachedAnim" }, "House.sjson")
-- end

-- mod.ApplyNestedSjsonModifications(hadesHouseObstacleTable.Obstacles, obstacleModifications)

-- Modifications to existing obstacles in Hades II
-- local hadesTwoObstacleModifications = {}

sjson.hook(hadesTwoHouseObstacleFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["House"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Obstacles, hadesHouseObstacleTable.Obstacles, "Name")
	-- mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
