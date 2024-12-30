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
		mod.debugPrint("Error loading enemyData: " .. err)
	end
end


-- Applies modifications to base enemy objects, and then adds the new encounter objects to the game
local function ApplyModificationsAndInheritEnemyData(base, modifications)
	-- Apply modifications
	for enemyName, enemyData in pairs(modifications) do
		for key, value in pairs(enemyData) do
			base[enemyName][key] = value
		end
	end

	-- Process data inheritance and add the new data to the game's global
	base = mod.AddTableKeysSkipDupes(game.EnemyData, base, nil)
	for enemyName, enemyData in pairs(base) do
		game.ProcessDataInheritance(enemyData, game.EnemyData)
		base[enemyName] = enemyData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.EnemyData, base)
end

local enemyData = LoadHadesEnemyData()
-- Note: Modifications to Base enemy types (which are inherited from by other new enemy types) don't seem to work - need to apply the modifications to the resulting enemy directly
local enemyModifications = {
	PunchingBagUnit = {
		-- Comes from the CharacterAnimationsEnemies.sjson entry which has the OnHit_Bink as VideoTexture
		StunAnimations =
		{
			Default = "EnemyWretchGluttonOnHit"
		},
	},
}

ApplyModificationsAndInheritEnemyData(enemyData, enemyModifications)
