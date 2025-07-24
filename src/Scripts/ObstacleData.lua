local function applyModificationsAndInheritObstacleData(base, modifications, additions, needInheritanceProcessing)
	-- Apply additions
	for obstacleName, obstacleData in pairs(additions) do
		if base[obstacleName] then
			mod.DebugPrint("Obstacle " .. obstacleName .. " already exists, skipping", 1)
		else
			base[obstacleName] = obstacleData
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
	-- TARTARUS
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
	-- ASPHODEL
	AsphodelTerrainRock01 = {
		DeathFx = "RubbleFall",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	AsphodelSkull = {
		DeathFx = "RubbleFall",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFallLarge", },
	},
	HealthFountainAsphodel = {
		InheritFrom = { "HealthFountain" },
		HealingSpentAnimation = "HealthFountainEmptyAsphodel",
	},
	-- ELYSIUM
	EnemyShield = {
		SwapToUnitOnPickup = "ShadeShieldUnit",
	},
	EnemyBow = {
		SwapToUnitOnPickup = "ShadeBowUnit",
	},
	EnemySword = {
		SwapToUnitOnPickup = "ShadeSwordUnit",
	},
	EnemySpear = {
		SwapToUnitOnPickup = "ShadeSpearUnit",
	},
	EnemyDagger = {
		SwapToUnitOnPickup = "ShadeSwordUnit",
	},
	HealthFountainElysium = {
		InheritFrom = { "HealthFountain" },
		HealingSpentAnimation = "HealthFountainEmptyElysium",
	},
	ElysiumRubble04 = {
		DeathFx = "RubbleFall",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	-- STYX
}

local addedObstacles = {
	-- TARTARUS
	MultiFuryMegaeraIntro = { ExitAnimation = "MegaeraMultiFuryTakeOff", },
	MultiFuryAlectoIntro = { ExitAnimation = "AlectoMultiFuryTakeOff", },
	MultiFuryTisiphoneIntro = { ExitAnimation = "TisiphoneMultiFuryTakeOff", },
	-- ASPHODEL
	-- ELYSIUM
	-- STYX
}

-- We need to re-process data inheritance for any redefined obstacles that define an InheritFrom
local needInheritanceProcessing = {
	"HealthFountainAsphodel",
	"HealthFountainElysium",
}

applyModificationsAndInheritObstacleData(game.ObstacleData, obstacleModifications, addedObstacles,
	needInheritanceProcessing)
