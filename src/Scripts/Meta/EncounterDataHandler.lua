-- Contains generic functions to handle migrating encounter data from Hades to Hades II

-- Loads EncounterData from a file in Hades
-- Note: EnemyData must be loaded first, as there are some references to it in EncounterData!
mod.CachedHadesEncounterData = nil

-- Importing files only ever read individual entries, so hand out a proxy that copies each entry on first access
-- This avoids deep copying the whole of Hades' EncounterData once per importing file
local function encounterDataProxy()
	return setmetatable({}, {
		__index = function(proxy, key)
			local value = mod.CachedHadesEncounterData[key]
			if type(value) == "table" then
				value = game.DeepCopyTable(value)
			end
			rawset(proxy, key, value)
			return value
		end,
	})
end

function mod.LoadHadesEncounterData(fileName)
	if mod.CachedHadesEncounterData then
		return encounterDataProxy()
	end
	local originalWaveDifficultyPatterns = game.WaveDifficultyPatterns
	local originalTimerBlockCombatExcludes = game.TimerBlockCombatExcludes
	local originalBaseWaveOverrideValues = game.BaseWaveOverrideValues
	local originalElysiumWaveOverrideValues = game.ElysiumWaveOverrideValues
	local originalIntroWaveOverrideValues = game.IntroWaveOverrideValues
	local originalEncounterData = game.EncounterData
	-- MinimumDifficulty is the only key the file writes in place, so it is the only one that needs saving separately
	local originalMinimumDifficulty = game.ConstantsData.MinimumDifficulty
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts", fileName)
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- The chunk assigned a brand new table that nothing else holds a reference to, and callers only ever get copies of it
		---@diagnostic disable-next-line: undefined-global
		mod.CachedHadesEncounterData = EncounterData
		game.ConstantsData.MinimumDifficulty = originalMinimumDifficulty
		game.WaveDifficultyPatterns = originalWaveDifficultyPatterns
		game.TimerBlockCombatExcludes = originalTimerBlockCombatExcludes
		game.BaseWaveOverrideValues = originalBaseWaveOverrideValues
		game.ElysiumWaveOverrideValues = originalElysiumWaveOverrideValues
		game.IntroWaveOverrideValues = originalIntroWaveOverrideValues
		game.EncounterData = originalEncounterData
		return encounterDataProxy()
	else
		mod.DebugPrint("Error loading encounterData: " .. err, 1)
	end
end

-- Applies modifications to base encounter objects, and then adds the new encounter objects to the game
function mod.ApplyModificationsAndInheritEncounterData(base, modifications, replacements)
	-- Some enemies exist in both Hades and Hades II, so we need to rename the Hades enemies in encounters that reference them
	for oldName, newName in pairs(mod.EnemyNameMappings) do
		-- If an encounter has predefined spawn waves, spawn the correct enemies
		mod.UpdateField(base, oldName, newName, { "SpawnWaves", "*", "Spawns", "*", "Name" }, "EncounterData.lua")
		mod.UpdateField(base, oldName, newName, { "WaveTemplate", "Spawns", "*", "Name" }, "EncounterData.lua")
		mod.UpdateField(base, oldName, newName, { "ManualWaveTemplates", "*", "Spawns", "*", "Name" }, "EncounterData.lua")
	end
	-- Rename the requirement for MinibossCountShrineUpgrade
	mod.UpdatePropertyName(base, "RequiredMetaUpgrade", "RequiredMiniBossShrine",
		{ "ManualWaveTemplates", "*", "Spawns", "*" }, "EncounterData.lua")
	mod.UpdateField(base, "MinibossCountShrineUpgrade", true,
		{ "ManualWaveTemplates", "*", "Spawns", "*", "RequiredMiniBossShrine" }, "EncounterData.lua")

	-- Apply replacements
	for encounterName, encounterData in pairs(replacements) do
		if not base[encounterName] then
			base[encounterName] = {}
		end
		mod.ApplyModifications(base[encounterName], encounterData, true)
	end

	-- Apply modifications
	for encounterName, encounterData in pairs(modifications) do
		if not base[encounterName] then
			base[encounterName] = {}
		end
		mod.ApplyModifications(base[encounterName], encounterData, false)
	end

	-- Process data inheritance and add the new data to the game's global
	base = mod.AddTableKeysSkipDupes(game.EncounterData, base, nil)
	for encounterName, encounterData in pairs(base) do
		-- Add a name key
		encounterData.Name = encounterName

		game.ProcessDataInheritance(encounterData, game.EncounterData)
		base[encounterName] = encounterData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.EncounterData, base)
end
