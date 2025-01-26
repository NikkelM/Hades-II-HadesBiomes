-- Adds obstacles for the Tartarus biome from Hades to Hades II

local hadesTartarusObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Tartarus.sjson")
local hadesTartarusObstacleTable = sjson.decode_file(hadesTartarusObstacleFile)

local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Tartarus.sjson")
-- local hadesTwoTartarusObstacleTable = sjson.decode_file(hadesTwoTartarusObstacleFile)

local hadesObstacleAdditions = {
	-- Vases
	Breakable = {
		Name = "Breakable",
		InheritFrom = "1_BaseVulnerableObstacle",
		DisplayInEditor = true,
		Life = {
			HitSound = "/EmptyCue",
			HomingEligible = false,
			JumpTargetEligible = false,
			ProjectilesAlwaysPenetrate = true,
			RequiresDamageToAffect = true,
		},
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "BreakableIdle1",
			StopsLight = true,
			Tallness = 114.0,
			UseBoundsForSortDrawArea = true,
			-- Using this offset makes the vases move to invalid places sometimes
			-- TODO: Maybe this is different for the different vase types?
			-- Offset = { X = 0, Y = -105 },
			Points = {
				{ X = 0,   Y = 16 },
				{ X = 32,  Y = 0 },
				{ X = 0,   Y = -16 },
				{ X = -32, Y = 0 },
			},
			Using = {
				{ Name = "BreakableIdle2" },
				{ Name = "BreakableIdle3" },
			},
		},
	},
}

-- Add the added obstacles
mod.AddTableKeysSkipDupes(hadesTartarusObstacleTable.Obstacles, hadesObstacleAdditions, "Name")

-- Modifications for new obstacles copied from Hades
local obstacleModifications = {}

-- Rename attached animations/Fx graphics
for oldName, newName in pairs(mod.FxAnimationMappings) do
	mod.UpdateField(hadesTartarusObstacleTable.Obstacles, oldName, newName, { "Thing", "Graphic" }, "Tartarus.sjson")
	mod.UpdateField(hadesTartarusObstacleTable.Obstacles, oldName, newName, { "Thing", "AtachedAnim" }, "Tartarus.sjson")
end

mod.ApplyNestedSjsonModifications(hadesTartarusObstacleTable.Obstacles, obstacleModifications)

-- Modifications to existing obstacles in Hades II
local hadesTwoObstacleModifications = {
	-- Obstacles that should not be passable, but are for some reason
	TartarusWallBrick11 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusPillarBase03 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusPillarBase04 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusPillarBase08b = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusPillarBase12 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusPillarBase13 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusArchitrave01 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusCornice01 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusCornice01A = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusCornice03 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusCornice04 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusCornice04b = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusCornice05 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusFencePost03 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
	TartarusGable04 = {
		InheritFrom = "1_BaseInvulnerableImpassableObstacle",
	},
}

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	-- Add new obstacles
	mod.AddTableKeysSkipDupes(data.Obstacles, hadesTartarusObstacleTable.Obstacles, "Name")
	-- Apply modifications to existing obstacles
	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
