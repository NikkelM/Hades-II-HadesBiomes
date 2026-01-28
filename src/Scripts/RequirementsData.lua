-- #region Modifications
-- Block the Death Taunt when dying in a modded run
local blockChronosNightmareInModdedRunsRequirement = {
	PathFalse = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" }
}
table.insert(game.NamedRequirementsData.NightmarePresentationRequirements, blockChronosNightmareInModdedRunsRequirement)

-- Add the modded Devotion encounters to the named requirement check, used for god quips when being chosen
game.NamedRequirementsData.IsDevotionEncounter[1].IsAny = game.CombineTables(
	game.NamedRequirementsData.IsDevotionEncounter[1].IsAny, {
		"DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium"
	})

-- Add the new randomized Chaos Trials/Bounties to the check for the current bounty type
game.NamedRequirementsData.StandardPackageBountyActive[2].IsNone = game.ConcatTableValuesIPairs(
	game.NamedRequirementsData.StandardPackageBountyActive[2].IsNone, mod.RandomizedChaosTrialBountyNames)
-- #endregion

-- #region New requirements
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
}
mod.AddTableKeysSkipDupes(game.NamedRequirementsData, newNamedRequirements)
-- #endregion
