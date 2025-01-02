-- Contains generic functions to handle migrating encounter data from Hades to Hades II

-- Loads EncounterData from a file in Hades
-- Note: EnemyData must be loaded first, as there are some references to it in EncounterData!
function mod.LoadHadesEncounterData(fileName)
	local originalEncounterData = game.DeepCopyTable(game.EncounterData)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts", fileName)
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		local hadesEncounterData = EncounterData
		game.EncounterData = originalEncounterData
		return hadesEncounterData
	else
		mod.DebugPrint("Error loading encounterData: " .. err)
	end
end

-- Applies modifications to base encounter objects, and then adds the new encounter objects to the game
function mod.ApplyModificationsAndInheritEncounterData(base, modifications)
	-- Apply modifications
	for encounterName, encounterData in pairs(modifications) do
		for key, value in pairs(encounterData) do
			base[encounterName][key] = value
		end
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
