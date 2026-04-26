-- #region Modifications
-- #region Death Taunt, Devotion quips
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
-- #endregion

-- #region Chaos Trials/Bounties
-- Add the new randomized Chaos Trials/Bounties to the check for the current bounty type
game.NamedRequirementsData.StandardPackageBountyActive[2].IsNone = game.ConcatTableValuesIPairs(
	game.NamedRequirementsData.StandardPackageBountyActive[2].IsNone, mod.RandomizedChaosTrialBountyNames)
-- #endregion

-- #region DreamRuns/Dream Dives
-- Correctly guessing the next biome, known and reverse paths
game.NamedRequirementsData.DreamRunCorrectBiomeGuess.OrRequirements[4][2].IsAny = { "I", "Tartarus" }

game.NamedRequirementsData.DreamRunIncorrectBiomeGuess.OrRequirements[4][2].IsNone = { "I", "Tartarus" }

local moddedDreamRunFamiliarPaths = {
	{
		{
			Path = { "CurrentRun", "PrevDreamBiome" },
			IsAny = { "Tartarus" },
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsAny = { "Asphodel" },
		},
	},
	{
		{
			Path = { "CurrentRun", "PrevDreamBiome" },
			IsAny = { "Asphodel" },
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsAny = { "Elysium" },
		},
	},
	{
		{
			Path = { "CurrentRun", "PrevDreamBiome" },
			IsAny = { "Elysium" },
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsAny = { "Styx" },
		},
	},
}
for _, path in ipairs(moddedDreamRunFamiliarPaths) do
	table.insert(game.NamedRequirementsData.DreamRunFamiliarPath.OrRequirements, path)
end

local moddedDreamRunUnfamiliarPaths = {
	{
		{
			Path = { "CurrentRun", "PrevDreamBiome" },
			IsAny = { "Tartarus" },
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsNone = { "Asphodel" },
		},
	},
	{
		{
			Path = { "CurrentRun", "PrevDreamBiome" },
			IsAny = { "Asphodel" },
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsNone = { "Elysium" },
		},
	},
	{
		{
			Path = { "CurrentRun", "PrevDreamBiome" },
			IsAny = { "Elysium" },
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsNone = { "Styx" },
		},
	},
}
for _, path in ipairs(moddedDreamRunUnfamiliarPaths) do
	table.insert(game.NamedRequirementsData.DreamRunUnfamiliarPath.OrRequirements, path)
end

local moddedDreamRunReversePaths = {
	{
		{
			Path = { "CurrentRun", "PrevDreamBiome" },
			IsAny = { "Styx" },
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsAny = { "Elysium" },
		},
	},
	{
		{
			Path = { "CurrentRun", "PrevDreamBiome" },
			IsAny = { "Elysium" },
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsAny = { "Asphodel" },
		},
	},
	{
		{
			Path = { "CurrentRun", "PrevDreamBiome" },
			IsAny = { "Asphodel" },
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsAny = { "Tartarus" },
		},
	},
}
for _, path in ipairs(moddedDreamRunReversePaths) do
	table.insert(game.NamedRequirementsData.DreamRunReversePath.OrRequirements, path)
end
-- #endregion

-- #endregion

-- #region New requirements
local newNamedRequirements = {
	-- #region GENERAL
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
	-- Has beaten Hades on EM4
	ModsNikkelMHadesBiomesHadesEM4Beaten = {
		OrRequirements = {
			{
				-- Using this instead of the textline as the textline may be delayed by the first clear dialogue
				{
					Path = { "GameState", "ModsNikkelMHadesBiomes_ClearedWithShrineUpgrades", "Styx", "BossDifficultyShrineUpgrade" },
					Comparison = ">=",
					Value = 4,
				},
			},
			{
				-- For backwards compatibility of saves that have already beaten EM4 before the dialogue was patched to be delayed
				{
					PathTrue = { "GameState", "TextLinesRecord", "LordHadesExtremeMeasuresDefeat01" },
				},
			},
		},
	},
	-- #endregion

	-- #region Bounties/Chaos Trials
	-- For normal packaged bounty unlocks, must have completed the relevant biome/beaten it's boss
	ModsNikkelMHadesBiomes_PackageBountyBiomeTartarusMegaera = {
		{
			Path = { "GameState", "EncountersCompletedCache", "BossHarpy1" },
			Comparison = ">=",
			Value = 1
		},
	},
	ModsNikkelMHadesBiomes_PackageBountyBiomeTartarusAlecto = {
		-- So the room is always eligible in the base game
		-- Not checking for Sisyphus since his room is blocked in bounty runs
		{
			Path = { "GameState", "TextLinesRecord" },
			HasAll = { "HermesFirstPickUp", "ChaosFirstPickUp" }
		},
		{
			Path = { "GameState", "EncountersCompletedCache", "BossHarpy2" },
			Comparison = ">=",
			Value = 1
		},
	},
	ModsNikkelMHadesBiomes_PackageBountyBiomeTartarusTisiphone = {
		-- So the room is always eligible in the base game
		-- Not checking for Sisyphus since his room is blocked in bounty runs
		{
			Path = { "GameState", "TextLinesRecord" },
			HasAll = { "HermesFirstPickUp", "ChaosFirstPickUp" }
		},
		{
			Path = { "GameState", "EncountersCompletedCache", "BossHarpy3" },
			Comparison = ">=",
			Value = 1
		},
	},
	ModsNikkelMHadesBiomes_PackageBountyBiomeTartarusAll = {
		{
			Path = { "GameState", "TextLinesRecord" },
			HasAll = { "HermesFirstPickUp", "ChaosFirstPickUp" }
		},
		{
			Path = { "GameState", "EncountersCompletedCache" },
			HasAll = { "BossHarpy1", "BossHarpy2", "BossHarpy3" },
		},
	},
	-- Are Alecto/Tisiphone eligible for Vow of Rivals/Extreme Measures for bounties
	ModsNikkelMHadesBiomes_PackageBountyBiomeTartarusExtremeMeasuresAltFights = {
		-- Alternate fury EM fights are only eligible after having met Meg with the other furies
		{
			PathTrue = { "GameState", "TextLinesRecord", "FurySistersUnion01" },
		},
	},
	ModsNikkelMHadesBiomes_PackageBountyBiomeAsphodel = {
		{
			Path = { "GameState", "EncountersCompletedCache", "BossHydra" },
			Comparison = ">=",
			Value = 1
		},
	},
	ModsNikkelMHadesBiomes_PackageBountyBiomeElysium = {
		{
			Path = { "GameState", "EncountersCompletedCache", "BossTheseusAndMinotaur" },
			Comparison = ">=",
			Value = 1
		},
	},
	-- Styx is special as we only allow packaged bounties after completing the story
	ModsNikkelMHadesBiomes_PackageBountyBiomeStyx = {
		{
			PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
		},
	},
	-- To be able to unlock the new randomized Chaos Trials
	ModsNikkelMHadesBiomes_PackageBountyRandom = {
		NamedRequirements = { "HasAllMetaCardsUnlocked" },
		{
			-- Has reached modded ending
			PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
		},
		{
			-- Back-compat: Has started at least one normal run to get the new forced Chaos boon in RoomOpening
			PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns01" },
		},
		{
			-- Has the post-boss keepsake racks
			PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockPostBossGiftRackIncantation" },
		},
		{
			Path = { "GameState", "MetaUpgradeLimitLevel", },
			Comparison = ">=",
			Value = 15,
		},
		{
			Path = { "GameState", "WeaponsUnlocked", },
			HasAll = {
				"WeaponStaffSwing",
				"StaffClearCastAspect",
				"StaffSelfHitAspect",
				"StaffRaiseDeadAspect",
				"WeaponDagger",
				"DaggerBlockAspect",
				"DaggerHomingThrowAspect",
				"DaggerTripleAspect",
				"WeaponTorch",
				"TorchDetonateAspect",
				"TorchSprintRecallAspect",
				"TorchAutofireAspect",
				"WeaponAxe",
				"AxeArmCastAspect",
				"AxePerfectCriticalAspect",
				"AxeRallyAspect",
				"WeaponLob",
				"LobCloseAttackAspect",
				"LobImpulseAspect",
				"LobGunAspect",
				"WeaponSuit",
				"SuitHexAspect",
				"SuitMarkCritAspect",
				"SuitComboAspect",
			},
		},
		{
			Path = { "GameState", "GiftPresentation" },
			HasAll = game.ConcatTableValuesIPairs({
				"ManaOverTimeRefundKeepsake",
				"BossPreDamageKeepsake",
				"ReincarnationKeepsake",
				"DoorHealReserveKeepsake",
				"DeathVengeanceKeepsake",
				"BlockDeathKeepsake",
				"EscalatingKeepsake",
				"BonusMoneyKeepsake",
				"TimedBuffKeepsake",
				"LowHealthCritKeepsake",
				"SpellTalentKeepsake",
				"ForceZeusBoonKeepsake",
				"ForceHeraBoonKeepsake",
				"ForcePoseidonBoonKeepsake",
				"ForceDemeterBoonKeepsake",
				"ForceApolloBoonKeepsake",
				"ForceAphroditeBoonKeepsake",
				"ForceHephaestusBoonKeepsake",
				"ForceHestiaBoonKeepsake",
				"ForceAresBoonKeepsake",
				"AthenaEncounterKeepsake",
				"SkipEncounterKeepsake",
				"ArmorGainKeepsake",
				"FountainRarityKeepsake",
				"UnpickedBoonKeepsake",
				"DecayingBoostKeepsake",
				"DamagedDamageBoostKeepsake",
				"BossMetaUpgradeKeepsake",
				"TempHammerKeepsake",
				"RandomBlessingKeepsake",
				"RarifyKeepsake",
				"HadesAndPersephoneKeepsake",
				"GoldifyKeepsake"
			}, mod.SharedKeepsakePortKeepsakeTraitNames),
		},
		{
			Path = { "GameState", "FamiliarsUnlocked", },
			HasAll = {
				"FrogFamiliar",
				"CatFamiliar",
				"RavenFamiliar",
				"HoundFamiliar",
				"PolecatFamiliar",
			},
		},
	},
	-- #endregion

	-- #region NPC interactions
	ModsNikkelMHadesBiomesOrpheusSingsAgainRoomStart = {
		{
			Path = { "GameState", "TextLinesRecord" },
			HasAny = { "OrpheusSingsAgain01", "OrpheusSingsAgain01_B", "OrpheusSingsAgain01_C", "OrpheusSingsAgain01_D", "OrpheusSingsAgain02", "OrpheusSingsAgain03", "OrpheusSingsAgain03_B" },
		},
	},
	ModsNikkelMHadesBiomesOrpheusSingsAgain = {
		{
			Path = { "GameState", "TextLinesRecord" },
			HasAny = { "OrpheusSingsAgain01", "OrpheusSingsAgain01_B", "OrpheusSingsAgain01_C", "OrpheusSingsAgain01_D", "OrpheusSingsAgain02", "OrpheusSingsAgain03", "OrpheusSingsAgain03_B" },
		},
		{
			-- He teleports away after this dialogue
			PathFalse = { "CurrentRun", "TextLinesRecord", "OrpheusAboutSingersReunionQuest01" },
		},
	},
	-- #endregion
}
mod.AddTableKeysSkipDupes(game.NamedRequirementsData, newNamedRequirements)
-- #endregion
