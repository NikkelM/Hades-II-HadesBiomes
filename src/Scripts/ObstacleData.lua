local function applyModificationsAndInheritObstacleData(base, modifications, additions, needInheritanceProcessing)
	-- Apply additions
	for obstacleName, obstacleData in pairs(additions) do
		if base[obstacleName] then
			mod.DebugPrint("Obstacle " .. obstacleName .. " already exists, skipping", 1)
		else
			base[obstacleName] = obstacleData
		end
		if base[obstacleName].Name == nil then
			base[obstacleName].Name = obstacleName
		end
	end

	-- Apply modifications
	for obstacleName, obstacleData in pairs(modifications) do
		if not base[obstacleName] then
			base[obstacleName] = {}
		end
		mod.ApplyModifications(base[obstacleName], obstacleData, false)
	end

	-- Process data inheritance
	for _, obstacleName in ipairs(needInheritanceProcessing) do
		game.ProcessDataInheritance(game.ObstacleData[obstacleName], game.ObstacleData)
	end
end

-- Also works for already existing obstacles in Hades II
local obstacleModifications = {
	-- #region TARTARUS
	TartarusDoor03b = {
		-- Red and blue reward preview backing
		CustomLockedAnimation_Run = "HadesDoorLocked",
		CustomLockedAnimation_Meta = "DoorLocked_MetaReward",
		UnlockedAnimation = "DoorLocked_MetaReward",
	},
	-- Rubble that falls when hitting destructible pillars
	TartarusRubble02 = {
		DeathFx = "RubbleFall",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	-- So they don't all immediately get destroyed in the fight with Tisiphone
	TartarusPillarBase04 = {
		ImpactReaction = {
			RequireNotProjectileNames = { "HarpyBeamTisiphone" },
		},
	},
	TartarusPillarBase04A = {
		ImpactReaction = {
			RequireNotProjectileNames = { "HarpyBeamTisiphone" },
		},
	},
	TartarusPillarBase04B = {
		ImpactReaction = {
			RequireNotProjectileNames = { "HarpyBeamTisiphone" },
		},
	},
	-- #endregion

	-- #region ASPHODEL
	AsphodelTerrainRock01 = {
		DeathFx = "AsphodelTerrainRockCollapse",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	AsphodelTerrainRock02 = {
		DeathFx = "AsphodelTerrainRockCollapse",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	AsphodelTerrainRock03 = {
		DeathFx = "AsphodelTerrainRockCollapse",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	AsphodelSkull = {
		DeathFx = "AsphodelTerrainRockCollapse",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFallLarge", },
	},
	HealthFountainAsphodel = {
		InheritFrom = { "HealthFountain" },
		HealingSpentAnimation = "HealthFountainEmptyAsphodel",
	},
	-- #endregion

	-- #region ELYSIUM
	HealthFountainElysium = {
		InheritFrom = { "HealthFountain" },
		HealingSpentAnimation = "HealthFountainEmptyElysium",
	},
	ElysiumRubble04 = {
		DeathFx = "RubbleFall",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	-- Red pillars in the boss room
	ElysiumPillar06 = {
		OnHitShake = mod.NilValue,
	},
	-- #endregion

	-- #region STYX
	-- #endregion
}

local addedObstacles = {
	-- #region TARTARUS
	MultiFuryMegaeraIntro = { ExitAnimation = "MegaeraMultiFuryTakeOff", },
	MultiFuryAlectoIntro = { ExitAnimation = "AlectoMultiFuryTakeOff", },
	MultiFuryTisiphoneIntro = { ExitAnimation = "TisiphoneMultiFuryTakeOff", },
	-- #endregion

	-- #region ASPHODEL
	-- #endregion

	-- #region ELYSIUM
	EnemyShield = {
		IsEnemyWeapon = true,
		UseText = "UseEnemyWeapon",
		BeginPickupAnimation = "EnemyShieldPickupContainer",
		PickupFailedAnimation = "EnemyShieldIdleContainer",
		SwapToUnitOnPickup = "ShadeShieldUnit",
	},
	EnemyBow = {
		IsEnemyWeapon = true,
		UseText = "UseEnemyWeapon",
		BeginPickupAnimation = "EnemyBowPickupContainer",
		PickupFailedAnimation = "EnemyBowIdleContainer",
		SwapToUnitOnPickup = "ShadeBowUnit",
	},
	EnemySpear = {
		IsEnemyWeapon = true,
		UseText = "UseEnemyWeapon",
		BeginPickupAnimation = "EnemySpearPickupContainer",
		PickupFailedAnimation = "EnemySpearIdleContainer",
		SwapToUnitOnPickup = "ShadeSpearUnit",
	},
	EnemySword = {
		IsEnemyWeapon = true,
		UseText = "UseEnemyWeapon",
		BeginPickupAnimation = "EnemySwordPickupContainer",
		PickupFailedAnimation = "EnemySwordIdleContainer",
		SwapToUnitOnPickup = "ShadeSwordUnit",
	},
	-- #endregion

	-- #region STYX
	-- #endregion
}

-- We need to re-process data inheritance for any redefined obstacles that define an InheritFrom
local needInheritanceProcessing = {
	"HealthFountainAsphodel",
	"HealthFountainElysium",
}

applyModificationsAndInheritObstacleData(game.ObstacleData, obstacleModifications, addedObstacles,
	needInheritanceProcessing)
