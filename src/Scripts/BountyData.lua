-- #region Testaments of Night
-- The encounters for each bounty
-- TODO: Add to postBoss room arguments for the BiomeMapPresentation
local newBountyEncounters = {
	ModsNikkelMHadesBiomesMegaeraEncounters = {
		DebugOnly = true,
		Encounters = { "BossHarpy1", "BossHarpy2", "BossHarpy3", },
	},
	ModsNikkelMHadesBiomesHydraEncounters = {
		DebugOnly = true,
		Encounters = { "BossHydra" },
	},
	ModsNikkelMHadesBiomesTheseusAndMinotaurEncounters = {
		DebugOnly = true,
		Encounters = { "BossTheseusAndMinotaur" },
	},
	ModsNikkelMHadesBiomesHadesEncounters = {
		DebugOnly = true,
		Encounters = { "BossHades" },
	},
}
mod.AddTableKeysSkipDupes(game.BountyData, newBountyEncounters)

-- All of the new bounties, for each weapon
-- The original heats are 1, 2, 4, 8, 10, 12, 16, 20 (one for each boss)
-- Modded heats are 6, 14, 18, 22 (one for each boss)
-- Each new bounty must have all bounties for the same weapon with lower heat in its UnlockGameStateRequirements
local newShrineBounties = {
	-- #region Staff
	ModsNikkelMHadesBiomes_BountyShrineStaff_TartarusBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesMegaeraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHarpy1" },
			},
			HasAll = {
				"BountyShrineStaffFBoss",
				"BountyShrineStaffGBoss",
				"BountyShrineStaffNBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponStaffSwing" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineStaff_AsphodelBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHydraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHydra" },
			},
			HasAll = {
				"BountyShrineStaffFBoss",
				"BountyShrineStaffGBoss",
				"BountyShrineStaffNBoss",
				"ModsNikkelMHadesBiomes_BountyShrineStaff_TartarusBoss",
				"BountyShrineStaffOBoss",
				"BountyShrineStaffHBoss",
				"BountyShrineStaffPBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponStaffSwing" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 14,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineStaff_ElysiumBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesTheseusAndMinotaurEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossTheseusAndMinotaur" },
			},
			HasAll = {
				"BountyShrineStaffFBoss",
				"BountyShrineStaffGBoss",
				"BountyShrineStaffNBoss",
				"ModsNikkelMHadesBiomes_BountyShrineStaff_TartarusBoss",
				"BountyShrineStaffOBoss",
				"BountyShrineStaffHBoss",
				"BountyShrineStaffPBoss",
				"ModsNikkelMHadesBiomes_BountyShrineStaff_AsphodelBoss",
				"BountyShrineStaffIBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponStaffSwing" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 18,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineStaff_StyxBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHadesEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHades" },
			},
			HasAll = {
				"BountyShrineStaffFBoss",
				"BountyShrineStaffGBoss",
				"BountyShrineStaffNBoss",
				"ModsNikkelMHadesBiomes_BountyShrineStaff_TartarusBoss",
				"BountyShrineStaffOBoss",
				"BountyShrineStaffHBoss",
				"BountyShrineStaffPBoss",
				"ModsNikkelMHadesBiomes_BountyShrineStaff_AsphodelBoss",
				"BountyShrineStaffIBoss",
				"ModsNikkelMHadesBiomes_BountyShrineStaff_ElysiumBoss",
				"BountyShrineStaffQBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponStaffSwing" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 22,
			},
		},
	},
	-- #endregion
	-- #region Daggers
	ModsNikkelMHadesBiomes_BountyShrineDaggers_TartarusBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesMegaeraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHarpy1" },
			},
			HasAll = {
				"BountyShrineDaggerGBoss",
				"BountyShrineDaggerNBoss",
				"BountyShrineStaffNBoss",
				"ModsNikkelMHadesBiomes_BountyShrineDaggers_AsphodelBoss",
				"BountyShrineDaggerHBoss",
				"BountyShrineDaggerPBoss",
				"BountyShrineDaggerFBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponDagger" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 14,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineDaggers_AsphodelBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHydraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHydra" },
			},
			HasAll = {
				"BountyShrineDaggerGBoss",
				"BountyShrineDaggerNBoss",
				"BountyShrineStaffNBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponDagger" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineDaggers_ElysiumBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesTheseusAndMinotaurEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossTheseusAndMinotaur" },
			},
			HasAll = {
				"BountyShrineDaggerGBoss",
				"BountyShrineDaggerNBoss",
				"BountyShrineStaffNBoss",
				"ModsNikkelMHadesBiomes_BountyShrineDaggers_AsphodelBoss",
				"BountyShrineDaggerHBoss",
				"BountyShrineDaggerPBoss",
				"BountyShrineDaggerFBoss",
				"ModsNikkelMHadesBiomes_BountyShrineDaggers_TartarusBoss",
				"BountyShrineDaggerQBoss",
				"ModsNikkelMHadesBiomes_BountyShrineDaggers_StyxBoss",
				"BountyShrineDaggerIBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponDagger" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 22,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineDaggers_StyxBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHadesEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHades" },
			},
			HasAll = {
				"BountyShrineDaggerGBoss",
				"BountyShrineDaggerNBoss",
				"BountyShrineStaffNBoss",
				"ModsNikkelMHadesBiomes_BountyShrineDaggers_AsphodelBoss",
				"BountyShrineDaggerHBoss",
				"BountyShrineDaggerPBoss",
				"BountyShrineDaggerFBoss",
				"ModsNikkelMHadesBiomes_BountyShrineDaggers_TartarusBoss",
				"BountyShrineDaggerQBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponDagger" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 18,
			},
		},
	},
	-- #endregion
	-- #region Torches
	ModsNikkelMHadesBiomes_BountyShrineTorches_TartarusBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesMegaeraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHarpy1" },
			},
			HasAll = {
				"BountyShrineTorchOBoss",
				"BountyShrineTorchHBoss",
				"BountyShrineTorchPBoss",
				"ModsNikkelMHadesBiomes_BountyShrineTorches_ElysiumBoss",
				"BountyShrineTorchFBoss",
				"BountyShrineTorchGBoss",
				"BountyShrineTorchNBoss",
				"ModsNikkelMHadesBiomes_BountyShrineTorches_StyxBoss",
				"BountyShrineTorchQBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponTorch" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 18,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineTorches_AsphodelBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHydraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHydra" },
			},
			HasAll = {
				"BountyShrineTorchOBoss",
				"BountyShrineTorchHBoss",
				"BountyShrineTorchPBoss",
				"ModsNikkelMHadesBiomes_BountyShrineTorches_ElysiumBoss",
				"BountyShrineTorchFBoss",
				"BountyShrineTorchGBoss",
				"BountyShrineTorchNBoss",
				"ModsNikkelMHadesBiomes_BountyShrineTorches_StyxBoss",
				"BountyShrineTorchQBoss",
				"ModsNikkelMHadesBiomes_BountyShrineTorches_TartarusBoss",
				"BountyShrineTorchIBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponTorch" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 22,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineTorches_ElysiumBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesTheseusAndMinotaurEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossTheseusAndMinotaur" },
			},
			HasAll = {
				"BountyShrineTorchOBoss",
				"BountyShrineTorchHBoss",
				"BountyShrineTorchPBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponTorch" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineTorches_StyxBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHadesEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHades" },
			},
			HasAll = {
				"BountyShrineTorchOBoss",
				"BountyShrineTorchHBoss",
				"BountyShrineTorchPBoss",
				"ModsNikkelMHadesBiomes_BountyShrineTorches_ElysiumBoss",
				"BountyShrineTorchFBoss",
				"BountyShrineTorchGBoss",
				"BountyShrineTorchNBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponTorch" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 14,
			},
		},
	},
	-- #endregion
	-- #region Axe
	ModsNikkelMHadesBiomes_BountyShrineAxe_TartarusBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesMegaeraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHarpy1" },
			},
			HasAll = {
				"BountyShrineAxeNBoss",
				"BountyShrineAxeOBoss",
				"BountyShrineAxeHBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponAxe" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineAxe_AsphodelBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHydraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHydra" },
			},
			HasAll = {
				"BountyShrineAxeNBoss",
				"BountyShrineAxeOBoss",
				"BountyShrineAxeHBoss",
				"ModsNikkelMHadesBiomes_BountyShrineAxe_TartarusBoss",
				"BountyShrineAxePBoss",
				"BountyShrineAxeFBoss",
				"BountyShrineAxeGBoss",
				"ModsNikkelMHadesBiomes_BountyShrineAxe_ElysiumBoss",
				"BountyShrineAxeIBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponAxe" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 18,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineAxe_ElysiumBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesTheseusAndMinotaurEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossTheseusAndMinotaur" },
			},
			HasAll = {
				"BountyShrineAxeNBoss",
				"BountyShrineAxeOBoss",
				"BountyShrineAxeHBoss",
				"ModsNikkelMHadesBiomes_BountyShrineAxe_TartarusBoss",
				"BountyShrineAxePBoss",
				"BountyShrineAxeFBoss",
				"BountyShrineAxeGBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponAxe" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 14,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineAxe_StyxBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHadesEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHades" },
			},
			HasAll = {
				"BountyShrineAxeNBoss",
				"BountyShrineAxeOBoss",
				"BountyShrineAxeHBoss",
				"ModsNikkelMHadesBiomes_BountyShrineAxe_TartarusBoss",
				"BountyShrineAxePBoss",
				"BountyShrineAxeFBoss",
				"BountyShrineAxeGBoss",
				"ModsNikkelMHadesBiomes_BountyShrineAxe_ElysiumBoss",
				"BountyShrineAxeIBoss",
				"ModsNikkelMHadesBiomes_BountyShrineAxe_AsphodelBoss",
				"BountyShrineAxeQBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponAxe" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 22,
			},
		},
	},
	-- #endregion
	-- #region Lob/Skull
	ModsNikkelMHadesBiomes_BountyShrineLob_TartarusBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesMegaeraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHarpy1" },
			},
			HasAll = {
				"BountyShrineLobHBoss",
				"BountyShrineLobPBoss",
				"BountyShrineLobFBoss",
				"ModsNikkelMHadesBiomes_BountyShrineLob_AsphodelBoss",
				"BountyShrineLobGBoss",
				"BountyShrineLobNBoss",
				"BountyShrineLobOBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponLob" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 14,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineLob_AsphodelBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHydraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHydra" },
			},
			HasAll = {
				"BountyShrineLobHBoss",
				"BountyShrineLobPBoss",
				"BountyShrineLobFBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponLob" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineLob_ElysiumBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesTheseusAndMinotaurEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossTheseusAndMinotaur" },
			},
			HasAll = {
				"BountyShrineLobHBoss",
				"BountyShrineLobPBoss",
				"BountyShrineLobFBoss",
				"ModsNikkelMHadesBiomes_BountyShrineLob_AsphodelBoss",
				"BountyShrineLobGBoss",
				"BountyShrineLobNBoss",
				"BountyShrineLobOBoss",
				"ModsNikkelMHadesBiomes_BountyShrineLob_TartarusBoss",
				"BountyShrineLobIBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponLob" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 18,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineLob_StyxBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHadesEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHades" },
			},
			HasAll = {
				"BountyShrineLobHBoss",
				"BountyShrineLobPBoss",
				"BountyShrineLobFBoss",
				"ModsNikkelMHadesBiomes_BountyShrineLob_AsphodelBoss",
				"BountyShrineLobGBoss",
				"BountyShrineLobNBoss",
				"BountyShrineLobOBoss",
				"ModsNikkelMHadesBiomes_BountyShrineLob_TartarusBoss",
				"BountyShrineLobIBoss",
				"ModsNikkelMHadesBiomes_BountyShrineLob_ElysiumBoss",
				"BountyShrineLobQBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponLob" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 22,
			},
		},
	},
	-- #endregion
	-- #region Suit
	ModsNikkelMHadesBiomes_BountyShrineSuit_TartarusBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesMegaeraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHarpy1" },
			},
			HasAll = {
				"BountyShrineSuitPBoss",
				"BountyShrineSuitFBoss",
				"BountyShrineSuitGBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponSuit" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineSuit_AsphodelBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHydraEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHydra" },
			},
			HasAll = {
				"BountyShrineSuitPBoss",
				"BountyShrineSuitFBoss",
				"BountyShrineSuitGBoss",
				"ModsNikkelMHadesBiomes_BountyShrineSuit_TartarusBoss",
				"BountyShrineSuitNBoss",
				"BountyShrineSuitOBoss",
				"BountyShrineSuitHBoss",
				"ModsNikkelMHadesBiomes_BountyShrineSuit_StyxBoss",
				"BountyShrineSuitQBoss",
				"ModsNikkelMHadesBiomes_BountyShrineSuit_ElysiumBoss",
				"BountyShrineSuitIBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponSuit" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 22,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineSuit_ElysiumBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesTheseusAndMinotaurEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossTheseusAndMinotaur" },
			},
			HasAll = {
				"BountyShrineSuitPBoss",
				"BountyShrineSuitFBoss",
				"BountyShrineSuitGBoss",
				"ModsNikkelMHadesBiomes_BountyShrineSuit_TartarusBoss",
				"BountyShrineSuitNBoss",
				"BountyShrineSuitOBoss",
				"BountyShrineSuitHBoss",
				"ModsNikkelMHadesBiomes_BountyShrineSuit_StyxBoss",
				"BountyShrineSuitQBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponSuit" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 18,
			},
		},
	},
	ModsNikkelMHadesBiomes_BountyShrineSuit_StyxBoss = {
		InheritFrom = { "DefaultBossHeatBounty", "ModsNikkelMHadesBiomesHadesEncounters" },
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersOccurredCache", "BossHades" },
			},
			HasAll = {
				"BountyShrineSuitPBoss",
				"BountyShrineSuitFBoss",
				"BountyShrineSuitGBoss",
				"ModsNikkelMHadesBiomes_BountyShrineSuit_TartarusBoss",
				"BountyShrineSuitNBoss",
				"BountyShrineSuitOBoss",
				"BountyShrineSuitHBoss",
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { "WeaponSuit" },
			},
			{
				Path = { "GameState", "SpentShrinePointsCache", },
				Comparison = ">=",
				Value = 14,
			},
		},
	},
	-- #endregion
}
mod.AddTableKeysSkipDupes(game.BountyData, newShrineBounties)

-- #endregion

-- #region Chaos Trials

-- #endregion
