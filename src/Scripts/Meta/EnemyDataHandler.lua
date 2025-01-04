-- Contains generic functions to handle migrating enemy data from Hades to Hades II

-- Loads EnemyData from a file in Hades
-- Note: Must be loaded before EncounterData, as there are some references to it in EncounterData!
local function LoadHadesEnemyData()
	local originalEnemyData = game.DeepCopyTable(game.EnemyData)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts\\EnemyData.lua")
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		local hadesEnemyData = UnitSetData.Enemies
		game.EnemyData = originalEnemyData
		return hadesEnemyData
	else
		mod.DebugPrint("Error loading enemyData: " .. err)
	end
end


-- Applies modifications to base enemy objects, and then adds the new encounter objects to the game
local function ApplyModificationsAndInheritEnemyData(base, modifications, AIDataKeyReplacements)
	-- Apply modifications
	for enemyName, enemyData in pairs(modifications) do
		if not base[enemyName] then
			base[enemyName] = {}
		end
		mod.ApplyModifications(base[enemyName], enemyData)
	end

	-- Process data inheritance and add the new data to the game's global
	base = mod.AddTableKeysSkipDupes(game.EnemyData, base, nil)

	for enemyName, enemyData in pairs(base) do
		-- Replace keys that were renamed between the games
		if enemyData.DefaultAIData then
			for oldKey, newKey in pairs(AIDataKeyReplacements) do
				if enemyData.DefaultAIData[oldKey] then
					enemyData.DefaultAIData[newKey] = enemyData.DefaultAIData[oldKey]
					enemyData.DefaultAIData[oldKey] = nil
				end
			end
		end

		game.ProcessDataInheritance(enemyData, game.EnemyData)

		-- Remove keys we don't want the enemies to have
		-- None of the Hades II enemies have this key, and the game crashes when an enemy is picked for a spawn but it hits the large unit cap - there is no fallback enemy defined
		-- TODO: This behaviour in Hades II might change with a future update
		enemyData.LargeUnitCap = nil

		base[enemyName] = enemyData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.EnemyData, base)
end

local enemyData = LoadHadesEnemyData()

-- Some enemies exist in both Hades and Hades II, so we need to rename the Hades enemies
for oldName, newName in pairs(EnemyNameMappings) do
	enemyData[newName] = enemyData[oldName]
	enemyData[oldName] = nil
	-- Update the name in dependent fields
	-- Inherit properties from this name
	mod.UpdateField(enemyData, oldName, newName, { "InheritFrom" }, "EnemyData")
	-- If an enemy is spawned, this enemy cannot spawn
	mod.UpdateField(enemyData, oldName, newName, { "GeneratorData", "BlockEnemyTypes" }, "EnemyData")
	-- Other enemies can spawn this enemy
	mod.UpdateField(enemyData, oldName, newName, { "SpawnOptions" }, "EnemyData")
end

-- Note: Modifications to Base enemy types (which are inherited from by other new enemy types) don't seem to work - need to apply the modifications to the resulting enemy directly
local enemyModifications = {
	PunchingBagUnit = {
		-- Comes from the CharacterAnimationsEnemies.sjson entry which has the OnHit_Bink as VideoTexture
		StunAnimations =
		{
			Default = "EnemyWretchGluttonOnHit"
		},
	},
	HeavyMelee = {
		StunAnimations =
		{
			Default = "EnemyWretchThugOnHit"
		}
	},
	DisembodiedHand = {
		StunAnimations =
		{
			Default = "EnemyWringerOnHit"
		}
	},
	BaseCaster = {
		AIAggroRange = 1250
	},
	-- LightRanged renamed
	HadesLightRanged = {
		StunAnimations =
		{
			Default = "EnemyWretchCasterOnHit"
		},
		DefaultAIData = game.EnemyData.LightRanged.DefaultAIData,
	}
}

-- Some keys were renamed in the DefaultAIData property
local AIDataKeyReplacements = {
	AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
	AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
	AILineOfSightBuffer = "LoSBuffer",
	AIRequireUnitLineOfSight = "RequireUnitLoS",
	AIRequireProjectileLineOfSight = "RequireProjectileLoS",
	AILineOfSighEndBuffer = "LoSEndBuffer",
	AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
	AITrackTargetDuringCharge = "TrackTargetDuringCharge",
}

ApplyModificationsAndInheritEnemyData(enemyData, enemyModifications, AIDataKeyReplacements)
