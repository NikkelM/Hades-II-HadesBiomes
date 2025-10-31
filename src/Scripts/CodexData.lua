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

local storyNPCNames = {
	"NPC_Sisyphus_01",
	"NPC_Eurydice_01",
	"NPC_Patroclus_01",
}

-- For duplicate Portraits, see mod.HadesPortraitAnimationAdditions
local hadesCodexOrdering = {
	ModsNikkelMHadesBiomesCodexEntry = {
		-- Locations
		"Tartarus", "Asphodel", "Elysium", "Styx", "Challenge", "Surface",
		-- NPCs
		"NPC_Sisyphus_01", "NPC_Eurydice_01", "NPC_Patroclus_01", "NPC_Thanatos_01", -- "NPC_Persephone_Home_01",
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
	-- These will be moved into Enemies after the mapping
	Biomes = "ModsNikkelMHadesBiomesBiomes",
	OtherDenizens = "ModsNikkelMHadesBiomesOtherDenizens",
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
		"Elysium",
		"Challenge",
	},
	Enemies = {
		"BloodlessNakedBerserker",
		"BloodlessGrenadier",
		"BloodlessSelfDestruct",
		"BloodlessPitcher",
		"Crawler",
		"CrawlerMiniBoss",
		"HeavyMelee",
		-- "NPC_Hades_01", -- Done in SavedEntries
		-- "NPC_FurySister_01", -- Done in SavedEntries
		-- "NPC_Thanatos_01", -- Done in SavedEntries
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

for oldName, newName in pairs(mod.HadesCodexTextNameMappings) do
	mod.UpdateField(hadesCodexData, oldName, newName, { "Entries", "*", "Entries", "*", "Text" }, "CodexData entries")
end

local updatedCodexData = {}
-- Manually copy some entries from other groups
updatedCodexData.SavedEntries = {}
updatedCodexData.SavedEntries.NPC_FurySister_01 = hadesCodexData.ChthonicGods.Entries.NPC_FurySister_01
updatedCodexData.SavedEntries.NPC_FurySister_01.Entries[4] = nil -- Romance entry
updatedCodexData.SavedEntries.NPC_FurySister_01.Image = "ModsNikkelMHadesBiomes_" ..
		updatedCodexData.SavedEntries.NPC_FurySister_01.Image
updatedCodexData.SavedEntries.NPC_Thanatos_01 = hadesCodexData.ChthonicGods.Entries.NPC_Thanatos_01
updatedCodexData.SavedEntries.NPC_Thanatos_01.Image = "ModsNikkelMHadesBiomes_" ..
		updatedCodexData.SavedEntries.NPC_Thanatos_01.Image
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
		elseif groupData.UnlockType == "Interact" then
			for characterName, characterCollection in pairs(groupData.Entries) do
				for _, entry in ipairs(characterCollection.Entries) do
					if entry.UnlockThreshold then
						entry.UnlockGameStateRequirements =
						{
							{
								Path = { "GameState", "UseRecord", characterName },
								Comparison = ">=",
								Value = entry.UnlockThreshold,
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

		-- For the NPCs, add the NoRequirements flag to the top-level, to allow to always view their boons, even if the codex entry has not been unlocked yet
		for name, data in pairs(groupData.Entries) do
			if game.Contains(storyNPCNames, name) then
				data.NoRequirements = true
			end
		end

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

-- Move the Biome and OtherDenizens entries to the enemies group, so they are all in one tab
for entryName, entry in pairs(updatedCodexData[codexGroupNameMappings.Biomes].Entries) do
	updatedCodexData[codexGroupNameMappings.Enemies].Entries[entryName] = entry
end
updatedCodexData[codexGroupNameMappings.Biomes] = nil
-- We don't have all OtherDenizens in the mod, so we only add the ones that are in the hadesCodexOrdering
for entryName, entry in pairs(updatedCodexData[codexGroupNameMappings.OtherDenizens].Entries) do
	if game.Contains(storyNPCNames, entryName) then
		updatedCodexData[codexGroupNameMappings.Enemies].Entries[entryName] = entry
	end
end
updatedCodexData[codexGroupNameMappings.OtherDenizens] = nil

-- Set metadata for the new group
updatedCodexData[codexGroupNameMappings.Enemies].Icon = "Portraits\\ModsNikkelMHadesBiomesRunHistory\\RunHistory_Door_Red_72x72"
updatedCodexData[codexGroupNameMappings.Enemies].TitleText = "ModsNikkelMHadesBiomesCodexEntryTitleText"

hadesCodexData = updatedCodexData

local additionalCodexTabs = {
	{ X = -10, Y = -88, Animation = "GUI\\Screens\\Codex\\CategoryTab3", Highlight = "GUI\\Screens\\Codex\\CategoryTabHighlight3", Active = "GUI\\Screens\\Codex\\CategoryTabActiveHighlightOverlay3" },
}

for groupName, _ in pairs(hadesCodexOrdering) do
	table.insert(game.CodexOrdering.Order, groupName)
end
for _, tab in ipairs(additionalCodexTabs) do
	table.insert(game.ScreenData.Codex.Tabs, tab)
end

mod.AddTableKeysSkipDupes(game.CodexOrdering, hadesCodexOrdering)
mod.AddTableKeysSkipDupes(game.CodexData, hadesCodexData)

-- Modifications to the tab layout of the Codex, as we need to squish them left to ensure our new tab doesn't go beyond the overlayed area
game.ScreenData.Codex.ChapterX = 405
game.ScreenData.Codex.ChapterSpacingX = 84
game.ScreenData.Codex.CategoryIconOffsetX = -2
