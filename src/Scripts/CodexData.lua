-- Load CodexData from Hades
mod.CachedHadesCodexData = nil
local function loadHadesCodexData(fileName)
	if mod.CachedHadesCodexData then
		return game.DeepCopyTable(mod.CachedHadesCodexData)
	end
	local originalCodexOrdering = game.DeepCopyTable(game.CodexOrdering)
	local originalCodexUnlockTypes = game.DeepCopyTable(game.CodexUnlockTypes)
	local originalCodex = game.DeepCopyTable(game.Codex)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts", fileName)
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		mod.CachedHadesCodexData = game.DeepCopyTable(Codex)
		game.CodexOrdering = originalCodexOrdering
		game.CodexUnlockTypes = originalCodexUnlockTypes
		game.Codex = originalCodex
		return game.DeepCopyTable(mod.CachedHadesCodexData)
	else
		mod.DebugPrint("Error loading CodexData: " .. err, 1)
	end
end

local hadesCodexOrdering = {
	-- ModsNikkelMHadesBiomesChthonicGods = {
	-- TODO: Move to standard Chthonic gods? Will probably clash with the actual Zagreus being added at some point
	-- 	"PlayerUnit",
	-- },
	-- TODO: Add when the story rooms are fixed
	-- ModsNikkelMHadesBiomesOtherDenizens = {
	-- 	"NPC_Sisyphus_01", "NPC_Eurydice_01", "NPC_Patroclus_01", "NPC_Persephone_Home_01",
	-- },
	-- Moved NPC_FurySister_01, Harpy2, Harpy3, Theseus, Minotaur, NPC_Hades_01 here from ChthonicGods
	ModsNikkelMHadesBiomesCodexEntry = {
		-- Locations
		"Tartarus", "Asphodel", "Elysium", "Styx", "Challenge", "Surface",
		-- Enemies
		"HeavyMelee", "LightRanged", "PunchingBagUnit", "ThiefMineLayer", "WretchAssassinMiniboss", "Swarmer", "LightSpawner",
		"DisembodiedHand", "HeavyRanged", "HeavyRangedSplitterMiniboss", "NPC_FurySister_01", "Harpy2", "Harpy3",
		"ShieldRanged", "BloodlessNaked", "BloodlessNakedBerserker", "BloodlessGrenadier", "BloodlessSelfDestruct",
		"BloodlessPitcher", "BloodlessWaveFist", "RangedBurrower", "SpreadShotUnit", "FreezeShotUnit", "CrusherUnit",
		"HitAndRunUnit", "HydraHeadImmortal", "SplitShotUnit", "Chariot", "ChariotSuicide", "ShadeSwordUnit",
		"ShadeSpearUnit", "ShadeBowUnit", "ShadeShieldUnit", "FlurrySpawner", "Theseus", "Minotaur", "Crawler", "RatThug",
		"CrawlerMiniBoss", "ThiefImpulseMineLayer", "HeavyRangedForked", "SatyrRanged", "NPC_Hades_01",
	},
}

-- Defines mappings, and all that are not in here are removed
local codexGroupNameMappings = {
	-- Used as the base category we create the new one from
	Enemies = "ModsNikkelMHadesBiomesCodexEntry",
	-- Will be moved into Enemies after the mapping
	Biomes = "ModsNikkelMHadesBiomesBiomes",
}

-- Defines which enemies correspond to a Genus group
-- In order they appear per biome in EnemyData.lua
local hadesEnemyCodexGroups = {
	-- TARTARUS
	HeavyMelee = { "HeavyMelee", "HeavyMeleeElite", "HeavyMeleeSuperElite", },
	WretchAssassinMiniboss = { "WretchAssassin", "WretchAssassinMiniboss", "WretchAssassinMinibossSuperElite", },
	DisembodiedHand = { "DisembodiedHand", "DisembodiedHandElite", "DisembodiedHandSuperElite", },
	Swarmer = { "Swarmer", "SwarmerElite", "SwarmerSuperElite", "SwarmerHelmeted", },
	PunchingBagUnit = { "PunchingBagUnit", "PunchingBagUnitElite", "PunchingBagUnitSuperElite", },
	ThiefMineLayer = { "ThiefMineLayer", "ThiefMineLayerElite" },
	LightRanged = { "LightRanged", "LightRangedElite", "LightRangedSuperElite" },
	HeavyRanged = { "HeavyRanged", "HeavyRangedElite" },
	HeavyRangedSplitterMiniboss = { "HeavyRangedSplitterMiniboss", "HeavyRangedSplitterMinibossSuperElite", },
	LightSpawner = { "LightSpawner", "LightSpawnerElite", "LightSpawnerSuperElite", },
	NPC_FurySister_01 = { "Harpy", },
	Harpy2 = { "Harpy2", },
	Harpy3 = { "Harpy3", },
	-- ASPHODEL
	SpreadShotUnit = { "SpreadShotUnit", "SpreadShotUnitElite", "SpreadShotUnitMiniboss", },
	RangedBurrower = { "RangedBurrower", "RangedBurrowerElite", "RangedBurrowerSuperElite", },
	BloodlessNaked = { "BloodlessNaked", "BloodlessNakedElite", "BloodlessNakedSuperElite", },
	BloodlessNakedBerserker = { "BloodlessNakedBerserker", "BloodlessNakedBerserkerElite", },
	BloodlessWaveFist = { "BloodlessWaveFist", "BloodlessWaveFistElite", },
	BloodlessGrenadier = { "BloodlessGrenadier", "BloodlessGrenadierElite", },
	BloodlessSelfDestruct = { "BloodlessSelfDestruct", "BloodlessSelfDestructElite", },
	BloodlessPitcher = { "BloodlessPitcher", "BloodlessPitcherElite", "BloodlessPitcherSuperElite", },
	CrusherUnit = { "CrusherUnit", "CrusherUnitElite", "CrusherUnitSuperElite", },
	FreezeShotUnit = { "FreezeShotUnit", "FreezeShotUnitElite", },
	HitAndRunUnit = { "HitAndRunUnit", "HitAndRunUnitElite", "HitAndRunUnitSuperElite", }, -- Megagorgon
	HydraHeadImmortal = { "HydraHeadImmortal", "HydraHeadImmortalLavamaker", "HydraHeadImmortalSummoner", "HydraHeadImmortalSlammer", "HydraHeadImmortalWavemaker", },
	-- ELYSIUM
	SplitShotUnit = { "SplitShotUnit", "SplitShotUnitElite", },
	ShieldRanged = { "ShieldRanged", "ShieldRangedElite", "ShieldRangedSuperElite", "ShieldRangedMiniBoss", },
	Chariot = { "Chariot", "ChariotElite", "ChariotSuperElite", },
	ChariotSuicide = { "ChariotSuicide", "ChariotSuicideElite", },
	FlurrySpawner = { "FlurrySpawner", "FlurrySpawnerElite", "FlurrySpawnerSuperElite", },
	ShadeBowUnit = { "ShadeBowUnit", "ShadeBowUnitElite", "ShadeBowUnitSuperElite", },
	ShadeSpearUnit = { "ShadeSpearUnit", "ShadeSpearUnitElite", "ShadeSpearUnitSuperElite", },
	ShadeShieldUnit = { "ShadeShieldUnit", "ShadeShieldUnitElite", "ShadeShieldUnitSuperElite", },
	ShadeSwordUnit = { "ShadeSwordUnit", "ShadeSwordUnitElite", "ShadeSwordUnitSuperElite", },
	Theseus = { "Theseus", "Theseus2", },
	Minotaur = { "Minotaur", "Minotaur2", },
	-- STYX
	ThiefImpulseMineLayer = { "ThiefImpulseMineLayer", "ThiefImpulseMineLayerElite", "ThiefImpulseMineLayerMiniboss", },
	HeavyRangedForked = { "HeavyRangedForked", "HeavyRangedForkedElite", "HeavyRangedForkedMiniboss", },
	SatyrRanged = { "SatyrRanged", "SatyrRangedElite", "SatyrRangedMiniboss", },
	Crawler = { "Crawler", },
	CrawlerMiniBoss = { "CrawlerMiniBoss", },
	RatThug = { "RatThug", "RatThugElite", "RatThugMiniboss", },
	NPC_Hades_01 = { "Hades", },
}

local duplicateCodexPortraits = {
	Biomes = {
		"Tartarus",
		"Asphodel",
		"Challenge",
	},
	Enemies = {
		"BloodlessNakedBerserker",
		"BloodlessGrenadier",
		"BloodlessSelfDestruct",
		"BloodlessPitcher",
		"Crawler",
		"CrawlerMiniBoss",
		-- "NPC_Hades_01", -- Done in SavedEntries
		"HeavyMelee",
	},
}

local hadesCodexData = loadHadesCodexData("CodexData.lua") or {}

for oldName, newName in pairs(mod.EnemyNameMappings) do
	mod.UpdateField(hadesCodexOrdering, oldName, newName, {}, "CodexOrdering")

	mod.UpdatePropertyName(hadesCodexData, oldName, newName, { "Entries" }, "CodexData")

	mod.UpdatePropertyName(hadesEnemyCodexGroups, oldName, newName, {}, "hadesEnemyCodexGroups")
	mod.UpdateField(hadesEnemyCodexGroups, oldName, newName, { "*" }, "hadesEnemyCodexGroups")

	mod.UpdateField(duplicateCodexPortraits, oldName, newName, { "*" }, "duplicateCodexPortraits")
end

local updatedCodexData = {}
-- Manually copy some entries from other groups
updatedCodexData.SavedEntries = {}
updatedCodexData.SavedEntries.NPC_FurySister_01 = hadesCodexData.ChthonicGods.Entries.NPC_FurySister_01
-- Romance entry
updatedCodexData.SavedEntries.NPC_FurySister_01.Entries[4] = nil
updatedCodexData.SavedEntries.Harpy2 = hadesCodexData.ChthonicGods.Entries.Harpy2
updatedCodexData.SavedEntries.Harpy3 = hadesCodexData.ChthonicGods.Entries.Harpy3
updatedCodexData.SavedEntries.Theseus = hadesCodexData.OtherDenizens.Entries.Theseus
updatedCodexData.SavedEntries.Minotaur = hadesCodexData.OtherDenizens.Entries.Minotaur
updatedCodexData.SavedEntries.NPC_Hades_01 = hadesCodexData.ChthonicGods.Entries.NPC_Hades_01
updatedCodexData.SavedEntries.NPC_Hades_01.Entries[1].UnlockThreshold = 1
updatedCodexData.SavedEntries.NPC_Hades_01.Entries[2].UnlockThreshold = 3
updatedCodexData.SavedEntries.NPC_Hades_01.Entries[3].UnlockThreshold = 7
updatedCodexData.SavedEntries.NPC_Hades_01.Entries[4].UnlockThreshold = 10
updatedCodexData.SavedEntries.NPC_Hades_01.Image = "ModsNikkelMHadesBiomes_" ..
		updatedCodexData.SavedEntries.NPC_Hades_01.Image

-- Remove all groups in CodexData that are not in the mappings, and rename the others
for groupName, groupData in pairs(hadesCodexData) do
	if codexGroupNameMappings[groupName] then
		local newGroupName = codexGroupNameMappings[groupName]
		updatedCodexData[newGroupName] = groupData
		mod.DebugPrint("Renamed " .. groupName .. " to " .. newGroupName .. " in CodexData", 4)

		-- Map unlock requirements to the new system
		if groupData.UnlockType == "Enter" then
			for biomeName, biomeCollection in pairs(groupData.Entries) do
				for _, entry in ipairs(biomeCollection.Entries) do
					if entry.UnlockThreshold then
						entry.UnlockGameStateRequirements =
						{
							{
								Path = { "GameState", "BiomeVisits", biomeName },
								Comparison = ">=",
								Value = entry.UnlockThreshold,
							},
						}
						entry.UnlockThreshold = nil
					end
				end
			end
		elseif groupData.UnlockType == "Slay" or groupData.UnlockType == "SlayAlt" then
			for enemyName, enemyCollection in pairs(groupData.Entries) do
				for _, entry in ipairs(enemyCollection.Entries) do
					if entry.UnlockThreshold then
						local newThreshold = entry.UnlockThreshold
						-- For normal enemies, up the requirements
						if groupData.UnlockType == "Slay" then
							if newThreshold == 1 then
								newThreshold = 5
							else
								newThreshold = newThreshold * 2
							end
						end
						entry.UnlockGameStateRequirements = {
							{
								Path = { "GameState", "EnemyKills" },
								SumOf = hadesEnemyCodexGroups[enemyName] or { enemyName },
								Comparison = ">=",
								Value = newThreshold,
							},
						}
						entry.UnlockThreshold = nil
					end
				end
			end
		else
			mod.DebugPrint("Unknown unlock type: " .. groupData.UnlockType, 1)
		end
		groupData.UnlockType = nil

		-- Update portraits if needed
		if duplicateCodexPortraits[groupName] then
			for _, entryName in ipairs(duplicateCodexPortraits[groupName]) do
				local entry = updatedCodexData[codexGroupNameMappings[groupName]].Entries[entryName]
				if entry then
					entry.Image = "ModsNikkelMHadesBiomes_" .. entry.Image
				end
			end
		end
	end
end
-- Add the saved entries to the ModsNikkelMHadesBiomesEnemies group
for entryName, entry in pairs(updatedCodexData.SavedEntries) do
	-- Update the unlock requirements
	for _, entryData in ipairs(entry.Entries) do
		if entryData.UnlockThreshold then
			entryData.UnlockGameStateRequirements = {
				{
					Path = { "GameState", "EnemyKills" },
					SumOf = hadesEnemyCodexGroups[entryName] or { entryName },
					Comparison = ">=",
					Value = entryData.UnlockThreshold,
				},
			}
			entryData.UnlockThreshold = nil
		end
	end
	updatedCodexData[codexGroupNameMappings.Enemies].Entries[entryName] = entry
end
updatedCodexData.SavedEntries = nil

-- Move the biome entries to the enemies group, so they are all in one tab
for entryName, entry in pairs(updatedCodexData[codexGroupNameMappings.Biomes].Entries) do
	updatedCodexData[codexGroupNameMappings.Enemies].Entries[entryName] = entry
end
updatedCodexData[codexGroupNameMappings.Biomes] = nil

-- Add some additional mappings for the run history screen
-- E.g. for the Bloodmine mapping to the image of the ThiefMineLayer
updatedCodexData.ModsNikkelMHadesBiomesHiddenCodexEntries = {
	TitleText = "Codex_EnemiesChapter",
	Entries = {
		BloodMine = {
			Entries = {},
			Image = "Codex_Portrait_Thief",
		},
	},
}

-- Set metadata for the new group
updatedCodexData[codexGroupNameMappings.Enemies].Icon = "GUI\\Icons\\Critical"
updatedCodexData[codexGroupNameMappings.Enemies].TitleText = "ModsNikkelMHadesBiomesCodexEntryTitleText"

hadesCodexData = updatedCodexData

local additionalCodexTabs = {
	{ X = 0, Y = -88, Animation = "GUI\\Screens\\Codex\\CategoryTab1", Highlight = "GUI\\Screens\\Codex\\CategoryTabHighlight1", Active = "GUI\\Screens\\Codex\\CategoryTabActiveHighlightOverlay1" },
}

for groupName, _ in pairs(hadesCodexOrdering) do
	table.insert(game.CodexOrdering.Order, groupName)
end
for _, tab in ipairs(additionalCodexTabs) do
	table.insert(game.ScreenData.Codex.Tabs, tab)
end

mod.AddTableKeysSkipDupes(game.CodexOrdering, hadesCodexOrdering)
mod.AddTableKeysSkipDupes(game.CodexData, hadesCodexData)
