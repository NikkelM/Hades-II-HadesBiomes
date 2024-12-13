-- Contains generic functions to handle migrating enemy data from Hades to Hades II

-- Loads EnemyData from a file in Hades
-- Note:Must be loaded before EncounterData, as there are some references to it in EncounterData!
local function LoadHadesEnemyData(fileName)
	local originalEnemyData = game.EnemyData
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts", fileName)
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		local hadesEnemyData = UnitSetData.Enemies
		game.EnemyData = originalEnemyData
		return hadesEnemyData
	else
		print("Error loading enemyData: " .. err)
	end
end


-- Applies modifications to base enemy objects, and then adds the new encounter objects to the game
local function ApplyModificationsAndInheritEnemyData(base, modifications)
	-- Apply modifications
	for encounterName, encounterData in pairs(modifications) do
		for key, value in pairs(encounterData) do
			base[encounterName][key] = value
		end
	end

	-- Process data inheritance and add the new data to the game's global
	game.AddTableKeysCheckDupes(game.UnitSetData, base)
	for encounterName, encounterData in pairs(base) do
		game.ProcessDataInheritance(encounterData, game.UnitSetData)
		base[encounterName] = encounterData
	end
	game.AddTableKeysCheckDupes(game.UnitSetData, base)
end

local enemyData = LoadHadesEnemyData("EnemyData.lua")
local enemyModifications = {}

game.EnemySets.EnemiesBiome1 = {
	-- TODO: The other enemy types are not implemented (Swarmer is a re-used name for Hades II Tartarus skulls)
	"Swarmer",            -- Wretch Swarmer
	-- "SwarmerElite",       -- Wretch Swarmer
	-- "LightSpawner",
	-- "ThiefMineLayer",     -- Wretch Thief
	-- "ThiefMineLayerElite", -- Wretch Thief

	-- "PunchingBagUnit",    -- Wretch Glutton
	-- "HeavyMelee",         -- Wretch Thug
	-- "DisembodiedHand",
	-- "DisembodiedHandElite",

	-- "LightRanged", -- Wretch Caster
	-- "HeavyRanged", -- Crystal
	-- --"Grenadier", -- Wretch Caster

	-- "HeavyMeleeElite",     -- Wretch Thug Elite
	-- "LightRangedElite",    -- Wretch Caster Elite
	-- "PunchingBagUnitElite", -- Wretch Glutton Elite
	-- "HeavyRangedElite",
}

ApplyModificationsAndInheritEnemyData(enemyData, enemyModifications)
