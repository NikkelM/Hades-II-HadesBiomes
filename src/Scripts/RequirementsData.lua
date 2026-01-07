local blockChronosNightmareInModdedRunsRequirement = {
	PathFalse = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" }
}
table.insert(game.NamedRequirementsData.NightmarePresentationRequirements, blockChronosNightmareInModdedRunsRequirement)

local newNamedRequirements = {
	-- Can't get a Hades bounty if the next encounter would be BossHadesPeaceful
	ModsNikkelMHadesBiomesStyxBossBountyLockedByEnding = {
		{
			PathTrue = { "CurrentRun", "Hero", "IsDead" },
		},
		{
			PathTrue = { "GameState", "TextLinesRecord", "PersephoneMeeting09" },
		},
		{
			PathFalse = { "GameState", "TextLinesRecord", "PersephoneReturnsHome01" },
		},
	},
	-- If the first modded incantation can be unlocked or not - also controls if the cauldron category shows up
	ModsNikkelMHadesBiomes_UnlockInRunWellShopsIncantation_Unlockable = {
		{
			-- Player already has Wells of Charon in vanilla runs
			PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeWellShops" },
		},
		{
			PathTrue = { "GameState", "RoomsEntered", "A_Boss01" },
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
			Comparison = ">=",
			Value = 1,
		},
	},
}
mod.AddTableKeysSkipDupes(game.NamedRequirementsData, newNamedRequirements)
