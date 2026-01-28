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
	-- To be able to unlock the new randomized Chaos Trials
	ModsNikkelMHadesBiomes_PackageBountyRandom = {
		NamedRequirements = { "HasAllMetaCardsUnlocked" },
		{
			-- Has reached modded ending
			PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
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
}
mod.AddTableKeysSkipDupes(game.NamedRequirementsData, newNamedRequirements)
-- #endregion
