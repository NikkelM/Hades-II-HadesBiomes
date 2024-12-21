-- Contains generic functions to handle migrating encounter data from Hades to Hades II

-- Loads EncounterData from a file in Hades
-- Note: EnemyData must be loaded first, as there are some references to it in EncounterData!
local function LoadHadesEncounterData(fileName)
	local originalEncounterData = game.EncounterData
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
		print("Error loading encounterData: " .. err)
	end
end

-- Updates the InheritFrom field in the encounter data to match the new property name
local function updateInheritFrom(encounterData, find, replaceWith)
	for _, encounter in pairs(encounterData) do
		if encounter.InheritFrom then
			for i, value in ipairs(encounter.InheritFrom) do
				if value == find then
					encounter.InheritFrom[i] = replaceWith
				end
			end
		end
	end
end

-- Applies modifications to base encounter objects, and then adds the new encounter objects to the game
local function ApplyModificationsAndInheritEncounterData(base, modifications)
	-- Apply modifications
	for encounterName, encounterData in pairs(modifications) do
		for key, value in pairs(encounterData) do
			base[encounterName][key] = value
		end
	end

	-- Process data inheritance and add the new data to the game's global
	game.AddTableKeysCheckDupes(game.EncounterData, base)
	for encounterName, encounterData in pairs(base) do
		game.ProcessDataInheritance(encounterData, game.EncounterData)
		base[encounterName] = encounterData
	end
	game.AddTableKeysCheckDupes(game.EncounterData, base)
end

-- TODO: Should this be moved to an EncounterDataTartarus.lua?
local encounterData = LoadHadesEncounterData("EncounterData.lua")
local encounterDataTartarus = {
	ModsNikkelMHadesBiomesGenerated = encounterData.Generated,
	GeneratedTartarus = encounterData.GeneratedTartarus,
	OpeningGenerated = encounterData.OpeningGenerated,
}

updateInheritFrom(encounterDataTartarus, "Generated", "ModsNikkelMHadesBiomesGenerated")

encounterDataTartarus.OpeningGenerated.PreSpawnEnemies = false
encounterDataTartarus.OpeningGenerated.UnthreadedEvents =
{
	{
		FunctionName = "SpawnRoomReward",
		Args =
		{
			WaitUntilPickup = true,
		}
	},
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "BeginOpeningEncounter" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
}

local encounterModifications = {}

-- TODO: Move to own file
game.EncounterSets.TartarusEncountersDefault =
{
	"GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus",
	-- "GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus", "SurvivalTartarus",
	-- "GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus", "SurvivalTartarus", "ThanatosTartarus"
}

ApplyModificationsAndInheritEncounterData(encounterDataTartarus, encounterModifications)
