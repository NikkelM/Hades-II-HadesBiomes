-- Contains generic functions to handle migrating encounter data from Hades to Hades II

-- Loads EncounterData from a file in Hades
-- Note: EnemyData must be loaded first, as there are some references to it in EncounterData!
mod.CachedHadesEncounterData = nil
function mod.LoadHadesEncounterData(fileName)
	if mod.CachedHadesEncounterData then
		return game.DeepCopyTable(mod.CachedHadesEncounterData)
	end
	local originalEncounterData = game.DeepCopyTable(game.EncounterData)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts", fileName)
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		mod.CachedHadesEncounterData = game.DeepCopyTable(EncounterData)
		game.EncounterData = originalEncounterData
		return game.DeepCopyTable(mod.CachedHadesEncounterData)
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
		game.ProcessDataInheritance(encounterData, game.EncounterData)
		base[encounterName] = encounterData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.EncounterData, base)
end
