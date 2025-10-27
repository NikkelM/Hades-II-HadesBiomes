-- Adds obstacles for the Styx biome from Hades to Hades II

local hadesStyxObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Styx.sjson")
local hadesStyxObstacleTable = mod.DecodeSjsonFile(hadesStyxObstacleFile)

local hadesTwoStyxObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Styx.sjson")

-- These need to be added before the others, as they are inherited from
local hadesObstacleAdditionsParents = {
	HealthFountainStyx = {
		Name = "HealthFountainStyx",
		InheritFrom = "HealthFountain",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "HealthFountainFullStyxStart",
			Tallness = 300.0,
			Offset = { X = 0, Y = -130 },
			Points = {
				{ X = -552, Y = -31 },
				{ X = -355, Y = 157 },
				{ X = 61,   Y = 249 },
				{ X = 407,  Y = 1 },
				{ X = 498,  Y = -230 },
				{ X = -317, Y = -447 },
				{ X = -542, Y = -276 },
			},
			Using = {
				{ Name = "HealthFountainEmpty" },
				{ Name = "HealthFountainEmptyStyx" },
			},
		}
	},
}
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
	HealthFountainStyx = {
		Name = "HealthFountainStyx",
		InheritFrom = "HealthFountain",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "HealthFountainFullStyxStart",
			Tallness = 300.0,
			Offset = { X = 0, Y = -130 },
			Points = {
				{ X = -552, Y = -31 },
				{ X = -355, Y = 157 },
				{ X = 61,   Y = 249 },
				{ X = 407,  Y = 1 },
				{ X = 498,  Y = -230 },
				{ X = -317, Y = -447 },
				{ X = -542, Y = -276 },
			},
			Using = {
				{ Name = "HealthFountainEmpty" },
				{ Name = "HealthFountainEmptyStyx" },
			},
		},
	},
	PoisonCureFountainStyx = {
		Name = "PoisonCureFountainStyx",
		InheritFrom = "HealthFountainStyx",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "PoisonCureFountainStyxFullStart",
			Tallness = 200.0,
			Interact = {
				Distance = 170.0,
				OffsetX = 0.0,
				OffsetY = -20.0,
			},
			Offset = { X = 0, Y = 256 },
			Points = {
				{ X = -191, Y = -24 },
				{ X = -141, Y = 45 },
				{ X = 107,  Y = 52 },
				{ X = 202,  Y = -21 },
				{ X = 94,   Y = -92 },
				{ X = -90,  Y = -91 },
			},
			Using = {
				{ Name = "HealthFountainEmpty" },
				{ Name = "HealthFountainEmptyStyx" },
				{ Name = "PoisonCureFountainEmpty" },
			},
		},
	},
	StyxWarpDoor = {
		Name = "StyxWarpDoor",
		InheritFrom = "ExitDoor",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "StyxWarpDoor_Closed",
			Interact = {
				Distance = 200.0,
				OffsetY = 0.0,
			},
			Points = {
				{ X = -2, Y = 2 },
				{ X = 2,  Y = 2 },
				{ X = 0,  Y = -2 },
			},
		},
	},
	FinalBossExitDoor = {
		Name = "FinalBossExitDoor",
		InheritFrom = "ExitDoor",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "FinalBossExitDoorLocked",
			Interact = {
				Distance = 300.0,
				OffsetY = 175.0,
			},
			Points = {
				{ X = -2, Y = 2 },
				{ X = 2,  Y = 2 },
				{ X = 0,  Y = -2 },
			},
		},
	},
	CerberusKey = {
		Name = "CerberusKey",
		InheritFrom = "BaseLoot",
		DisplayInEditor = true,
		Thing = {
			AttachedAnim = "LootShadowCerberusKey",
			EditorOutlineDrawBounds = false,
			Graphic = "CerberusKey",
			Interact = {
				-- DeathFx turns into this
				VisualFx = "CerberusKeyPickup",
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
	-- Destructible pillars that crumble when hit
	StyxDestructiblePillar = { InheritFrom = "1_BaseVulnerableObstacle", },
	-- Obstacles that shouldn't be passable
	StyxPillar01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxPillarBase02 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxPillarBase01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxTent01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxShrine01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxRubble01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxRubble02 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxTerrainBrick03 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxTable01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxTable02 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxChair01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxWallBrick01 = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxWallBrick01a = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxWallBrick01b = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxWallBrick01c = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
	StyxWallBrick01d = { InheritFrom = "1_BaseInvulnerableImpassableObstacle", },
}

sjson.hook(hadesTwoStyxObstacleFile, function(data)
	-- Add new obstacles
	mod.AddTableKeysSkipDupes(data.Obstacles, hadesStyxObstacleTable.Obstacles, "Name")
	-- Apply modifications to existing obstacles
	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
