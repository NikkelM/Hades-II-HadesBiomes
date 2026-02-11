-- #region Testaments of Night
-- The encounters for each bounty
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
				Path = { "GameState", "ShrineBountiesCompleted", },
				HasAll = {
					"BountyShrineStaffFBoss",
					"BountyShrineStaffGBoss",
					"BountyShrineStaffNBoss",
				},
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 2,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
			NamedRequirementsFalse = { "ModsNikkelMHadesBiomesStyxBossBountyLockedByEnding" },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 2,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
				HasAll = {
					"BountyShrineDaggerGBoss",
					"BountyShrineDaggerNBoss",
					"BountyShrineDaggerOBoss",
					"ModsNikkelMHadesBiomes_BountyShrineDaggers_AsphodelBoss",
					"BountyShrineDaggerHBoss",
					"BountyShrineDaggerPBoss",
					"BountyShrineDaggerFBoss",
				},
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
				Path = { "GameState", "ShrineBountiesCompleted", },
				HasAll = {
					"BountyShrineDaggerGBoss",
					"BountyShrineDaggerNBoss",
					"BountyShrineDaggerOBoss",
				},
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
				HasAll = {
					"BountyShrineDaggerGBoss",
					"BountyShrineDaggerNBoss",
					"BountyShrineDaggerOBoss",
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
				HasAll = {
					"BountyShrineDaggerGBoss",
					"BountyShrineDaggerNBoss",
					"BountyShrineDaggerOBoss",
					"ModsNikkelMHadesBiomes_BountyShrineDaggers_AsphodelBoss",
					"BountyShrineDaggerHBoss",
					"BountyShrineDaggerPBoss",
					"BountyShrineDaggerFBoss",
					"ModsNikkelMHadesBiomes_BountyShrineDaggers_TartarusBoss",
					"BountyShrineDaggerQBoss",
				},
			},
			NamedRequirementsFalse = { "ModsNikkelMHadesBiomesStyxBossBountyLockedByEnding" },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
				Path = { "GameState", "ShrineBountiesCompleted", },
				HasAll = {
					"BountyShrineTorchOBoss",
					"BountyShrineTorchHBoss",
					"BountyShrineTorchPBoss",
				},
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 2,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
			NamedRequirementsFalse = { "ModsNikkelMHadesBiomesStyxBossBountyLockedByEnding" },
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
				Path = { "GameState", "ShrineBountiesCompleted", },
				HasAll = {
					"BountyShrineAxeNBoss",
					"BountyShrineAxeOBoss",
					"BountyShrineAxeHBoss",
				},
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 2,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
			NamedRequirementsFalse = { "ModsNikkelMHadesBiomesStyxBossBountyLockedByEnding" },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 2,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
				Path = { "GameState", "ShrineBountiesCompleted", },
				HasAll = {
					"BountyShrineLobHBoss",
					"BountyShrineLobPBoss",
					"BountyShrineLobFBoss",
				},
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
			NamedRequirementsFalse = { "ModsNikkelMHadesBiomesStyxBossBountyLockedByEnding" },
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
				Path = { "GameState", "ShrineBountiesCompleted", },
				HasAll = {
					"BountyShrineSuitPBoss",
					"BountyShrineSuitFBoss",
					"BountyShrineSuitGBoss",
				},
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 3,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 2,
					},
				}
			},
		},
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ShrineBountiesCompleted", },
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
			NamedRequirementsFalse = { "ModsNikkelMHadesBiomesStyxBossBountyLockedByEnding" },
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

-- #region Bounty start VoiceLines
local function modifyBountyTextLineRequirements(textLine)
	if textLine.GameStateRequirements ~= nil then
		for _, requirement in ipairs(textLine.GameStateRequirements) do
			-- Fix bounty start voicelines referring to skipping ahead on any biome not F or N
			if requirement.Path ~= nil and #requirement.Path == 3 and requirement.Path[1] == "CurrentRun" and requirement.Path[2] == "CurrentRoom" and requirement.Path[3] == "RoomSetName"
					and requirement.IsNone ~= nil and #requirement.IsNone == 2 and requirement.IsNone[1] == "F" and requirement.IsNone[2] == "N" then
				requirement.IsNone = { "F", "N", "Tartarus" }
			end
			-- Add the new randomized trials to be eligible for voicelines for random trials
			if requirement.Path ~= nil and #requirement.Path == 2 and requirement.Path[1] == "CurrentRun" and requirement.Path[2] == "ActiveBounty"
					and requirement.IsAny ~= nil and game.Contains(requirement.IsAny, "PackageBountyRandomUnderworld_Difficulty1") then
				requirement.IsAny = game.ConcatTableValuesIPairs(requirement.IsAny, mod.RandomizedChaosTrialBountyNames)
			end
		end
	end
end

-- Modify both the parent groups themselves as well as potential requirements on the inner text lines themselves
for _, textLineGroup in ipairs(game.GlobalVoiceLines.StartPackagedBountyRunVoiceLines) do
	modifyBountyTextLineRequirements(textLineGroup)
	for _, textLine in ipairs(textLineGroup) do
		modifyBountyTextLineRequirements(textLine)
	end
end
-- #endregion

-- #region Randomized Trials
local newRandomizedBounties = {
	{
		Name = "ModsNikkelMHadesBiomes_BasePackageBountyRandom",
		InheritFrom = { "BasePackageBountyRandom" },
		DebugOnly = true,
		ModsNikkelMHadesBiomes_RandomBountyStreakEligible = true,
		-- So we can show the run clear screen after a clear
		ModsNikkelMHadesBiomesForceRunClearScreen = true,
		-- Allow the randomized bounties to count into the run clear statistics (all other bounties are not recording statistics)
		ModsNikkelMHadesBiomesAllowRecordRunClearedStatistics = true,
		-- Also allow the new keepsakes to be chosen
		-- TODO: If https://github.com/excellent-ae/zannc-GodsAPI/issues/22 is implemented, we can remove this override
		RandomKeepsakeNames = game.ConcatTableValuesIPairs({
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
		}, mod.SharedKeepsakePortKeepsakeTraitNames),
	},
	{
		Name = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty3",
		ModsNikkelMHadesBiomesInsertAfterBounty = "PackageBountyRandomUnderworld_Difficulty1",
		InheritFrom = { "ModsNikkelMHadesBiomes_BasePackageBountyRandom", "ModsNikkelMHadesBiomesHadesEncounters" },
		Text = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty3_Short",

		StartingBiome = "Tartarus",
		BiomeIcon = "GUIModded\\Screens\\BountyBoard\\Biome_Journey",
		BiomeText = "ModsNikkelMHadesBiomesModdedRoute",

		RandomMetaUpgradeCostTotal = 30,
		RandomShrineUpgradePointTotal = 32,

		LootOptions = {
			{
				Name = "WeaponPointsRareDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						WeaponPointsRare = 1,
					},
				},
			},
		},

		UnlockGameStateRequirements = {
			NamedRequirements = { "ModsNikkelMHadesBiomes_PackageBountyRandom" },
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
				Comparison = ">=",
				Value = 20,
			},
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty2",
		ModsNikkelMHadesBiomesInsertAfterBounty = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty3",
		InheritFrom = { "ModsNikkelMHadesBiomes_BasePackageBountyRandom", "ModsNikkelMHadesBiomesHadesEncounters" },
		Text = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty2_Short",

		StartingBiome = "Tartarus",
		BiomeIcon = "GUIModded\\Screens\\BountyBoard\\Biome_Journey",
		BiomeText = "ModsNikkelMHadesBiomesModdedRoute",

		RandomMetaUpgradeCostTotal = 30,
		RandomShrineUpgradePointTotal = 20,

		LootOptions = {
			{
				Name = "GemPointsBigDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						GemPoints = 100,
					},
				},
			},
		},

		UnlockGameStateRequirements = {
			NamedRequirements = { "ModsNikkelMHadesBiomes_PackageBountyRandom" },
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
				Comparison = ">=",
				Value = 10,
			},
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty1",
		ModsNikkelMHadesBiomesInsertAfterBounty = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty2",
		InheritFrom = { "ModsNikkelMHadesBiomes_BasePackageBountyRandom", "ModsNikkelMHadesBiomesHadesEncounters" },
		Text = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty1_Short",

		StartingBiome = "Tartarus",
		BiomeIcon = "GUIModded\\Screens\\BountyBoard\\Biome_Journey",
		BiomeText = "ModsNikkelMHadesBiomesModdedRoute",

		RandomMetaUpgradeCostTotal = 30,
		RandomShrineUpgradePointTotal = 0,

		LootOptions = {
			{
				Name = "GemPointsBigDrop",
				Overrides = {
					CanDuplicate = false,
					AddResources = {
						GemPoints = 40,
					},
				},
			},
		},

		UnlockGameStateRequirements = {
			NamedRequirements = { "ModsNikkelMHadesBiomes_PackageBountyRandom" },
		},
	},
}
for _, bountyData in ipairs(newRandomizedBounties) do
	game.BountyData[bountyData.Name] = bountyData
	-- Insert into Bounty Board
	if bountyData.ModsNikkelMHadesBiomesInsertAfterBounty then
		local insertIndex = 1
		for _, bountyName in ipairs(game.ScreenData.BountyBoard.ItemCategories[1]) do
			insertIndex = insertIndex + 1
			if bountyName == bountyData.ModsNikkelMHadesBiomesInsertAfterBounty then
				break
			end
		end
		table.insert(game.ScreenData.BountyBoard.ItemCategories[1], insertIndex, bountyData.Name)
	end
end
-- #endregion

-- #region Normal/One-Biome Trials
local newTargetedBiomeBounties = {
	-- #region Base Trials
	{
		Name = "ModsNikkelMHadesBiomes_BasePackageBountyBiomeTartarus",
		DebugOnly = true,
		InheritFrom = { "ModsNikkelMHadesBiomesMegaeraEncounters" },
		StartingBiome = "Tartarus",
		BiomeIcon = "GUIModded\\Screens\\BountyBoard\\Biome_Tartarus",
		BiomeText = "ModsNikkelMHadesBiomesLocation_Hades_Tartarus_Short",
	},
	{
		Name = "ModsNikkelMHadesBiomes_BasePackageBountyBiomeAsphodel",
		DebugOnly = true,
		InheritFrom = { "ModsNikkelMHadesBiomesHydraEncounters" },
		StartingBiome = "Asphodel",
		BiomeIcon = "GUIModded\\Screens\\BountyBoard\\Biome_Asphodel",
		BiomeText = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel_Short",
		RunOverrides = {
			DeepInheritance = true,
			ClearedBiomes = 1,
			BiomesReached = { Tartarus = true, },
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_BasePackageBountyBiomeElysium",
		DebugOnly = true,
		InheritFrom = { "ModsNikkelMHadesBiomesTheseusAndMinotaurEncounters" },
		StartingBiome = "Elysium",
		BiomeIcon = "GUIModded\\Screens\\BountyBoard\\Biome_Elysium",
		BiomeText = "ModsNikkelMHadesBiomesLocation_Hades_Elysium_Short",
		RunOverrides = {
			DeepInheritance = true,
			ClearedBiomes = 2,
			BiomesReached = { Tartarus = true, Asphodel = true, },
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_BasePackageBountyBiomeStyx",
		DebugOnly = true,
		InheritFrom = { "ModsNikkelMHadesBiomesHadesEncounters" },
		StartingBiome = "Styx",
		BiomeIcon = "GUIModded\\Screens\\BountyBoard\\Biome_Styx",
		BiomeText = "ModsNikkelMHadesBiomesLocation_Hades_Styx_Short",
		RunOverrides = {
			DeepInheritance = true,
			ClearedBiomes = 3,
			BiomesReached = { Tartarus = true, Asphodel = true, Elysium = true },
		},
	},
	-- #endregion
	-- Trial of Aggression
	{
		Name = "ModsNikkelMHadesBiomes_PackageBountyAggression",
		ModsNikkelMHadesBiomesInsertAfterBounty = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty1",
		InheritFrom = { "DefaultPackagedBounty", "ModsNikkelMHadesBiomes_BasePackageBountyBiomeTartarus", },

		Text = "ModsNikkelMHadesBiomes_PackageBountyAggression",

		DifficultyRating = 4,

		WeaponKitName = "WeaponAxe",
		WeaponUpgradeName = "AxePerfectCriticalAspect", -- Aspect of Thanatos
		KeepsakeName = "TimedBuffKeepsake",           -- Metallic Droplet
		FamiliarName = "FrogFamiliar",                -- Frinos

		RunOverrides = {
			MaxGodsPerRun = 2,
			LootTypeHistory = {
				AresUpgrade = 1,
				HeraUpgrade = 1,
				HermesUpgrade = 1,
			},
			ModsNikkelMHadesBiomesForcedTartarusBossRoom = "A_Boss03",
		},

		StartingTraits = {
			{ Name = "AresWeaponBoon",           Rarity = "Epic", },
			{ Name = "HeraSpecialBoon",          Rarity = "Epic", },
			{ Name = "HermesWeaponBoon",         Rarity = "Heroic", },
			{ Name = "RoomRewardMaxHealthTrait", },
		},

		RewardStoreOverrides = {
			RunProgress = {
				{
					Name = "RoomMoneyDrop",
					GameStateRequirements = {},
				},
				{
					Name = "StackUpgrade",
					GameStateRequirements = {
						NamedRequirements = { "StackUpgradeLegal", },
					}
				},
				{
					Name = "StackUpgrade",
					GameStateRequirements = {
						NamedRequirements = { "StackUpgradeLegal", },
					}
				},
				{
					Name = "MaxManaDrop",
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "HeraUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "HeraUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "AresUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "AresUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "AresUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "WeaponUpgrade",
					GameStateRequirements = {
						NamedRequirements = { "HammerLootRequirements" },
					}
				},
			},
		},

		MetaUpgradeStateEquipped = {
			"ChanneledCast",
			"LowManaDamageBonus",
			"CastCount",
			"SorceryRegenUpgrade",
			"CastBuff",
			"BonusDodge",
			"MagicCrit",
			"MaxHealthPerRoom",
			"StatusVulnerability",
			"RarityBoost",
			"LowHealthBonus",
		},

		ShrineUpgradesActive = {
			EnemyDamageShrineUpgrade = 3,
			EnemySpeedShrineUpgrade = 2,
			BiomeSpeedShrineUpgrade = 3,
		},

		UnlockGameStateRequirements = {
			-- Biome and Shrine unlocks
			NamedRequirements = { "ModsNikkelMHadesBiomes_PackageBountyBiomeTartarusTisiphone", "ShrineUnlocked" },
			-- Bounty progress
			{
				Path = { "GameState", "PackagedBountyClears" },
				HasAny = { "PackageBountyChaosIntro", "PackageBountyOceanus", "PackageBountyStarter", },
			},
			-- Weapon
			{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { "WeaponAxe", "AxePerfectCriticalAspect", },
			},
			-- Keepsake
			{
				PathTrue = { "GameState", "GiftPresentation", "TimedBuffKeepsake", },
			},
			-- Familiar
			{
				PathTrue = { "GameState", "FamiliarsUnlocked", "FrogFamiliar", },
			},
			-- FirstLoot
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "AresFirstPickUp", "HeraFirstPickUp" },
			},
			-- MetaUpgrades
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 10,
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "ChanneledCast", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowManaDamageBonus", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "CastCount", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "SorceryRegenUpgrade", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "CastBuff", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "BonusDodge", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "MagicCrit", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "MaxHealthPerRoom", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "StatusVulnerability", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "RarityBoost", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowHealthBonus", "Unlocked" },
			},
		},
	},
	-- Trial of Fire
	{
		Name = "ModsNikkelMHadesBiomes_PackageBountyFire",
		ModsNikkelMHadesBiomesInsertAfterBounty = "ModsNikkelMHadesBiomes_PackageBountyAggression",
		InheritFrom = { "DefaultPackagedBounty", "ModsNikkelMHadesBiomes_BasePackageBountyBiomeAsphodel", },

		Text = "ModsNikkelMHadesBiomes_PackageBountyFire",

		DifficultyRating = 3,

		WeaponKitName = "WeaponTorch",
		WeaponUpgradeName = "TorchDetonateAspect", -- Aspect of Moros
		KeepsakeName = "DecayingBoostKeepsake",  -- Lion Fang
		RemoveFamiliar = true,

		RunOverrides = {
			MaxGodsPerRun = 2,
			LootTypeHistory = {
				HestiaUpgrade = 3,
				ApolloUpgrade = 1,
				WeaponUpgrade = 2,
			},
		},

		StartingTraits = {
			{ Name = "HestiaWeaponBoon",         Rarity = "Epic", },
			{ Name = "HestiaCastBoon",           Rarity = "Epic", },
			{ Name = "HestiaSprintBoon",         Rarity = "Epic", },
			{ Name = "ApolloCastAreaBoon",       Rarity = "Rare", },
			{ Name = "TorchEnhancedAttackTrait" },
			{ Name = "TorchLongevityTrait" },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
		},

		RewardStoreOverrides = {
			RunProgress = {
				{
					Name = "RoomMoneyDrop",
					GameStateRequirements = {},
				},
				{
					Name = "MaxManaDrop",
					GameStateRequirements = {},
				},
				{
					Name = "MaxManaDrop",
					GameStateRequirements = {},
				},
				{
					Name = "MaxHealthDrop",
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "ApolloUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "ApolloUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {
						{
							Path = { "CurrentRun", "LootTypeHistory", "HestiaUpgrade" },
							Comparison = ">=",
							Value = 5,
						}
					},
				},
				{
					Name = "Boon",
					ForceLootName = "HestiaUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "HestiaUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "HestiaUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "HestiaUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "HestiaUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "HermesUpgrade",
					GameStateRequirements = {
						NamedRequirements = { "HermesUpgradeRequirements", },
					}
				},
			},
		},

		MetaUpgradeStateEquipped = {
			"HealthRegen",
			"BonusHealth",
			"SprintShield",
			"MaxHealthPerRoom",
			"StatusVulnerability",
			"DoorReroll",
			"StartingGold",
			"RarityBoost",
			"TradeOff",
			"ScreenReroll",
			"LowHealthBonus",
			"EpicRarityBoost",
		},

		ShrineUpgradesActive = {
			EnemyRespawnShrineUpgrade = 2,
			MinibossCountShrineUpgrade = 1,
			BiomeSpeedShrineUpgrade = 2,
			BossDifficultyShrineUpgrade = 2,
		},

		UnlockGameStateRequirements = {
			-- Biome and Shrine unlocks
			NamedRequirements = { "ModsNikkelMHadesBiomes_PackageBountyBiomeAsphodel", "ShrineUnlocked" },
			-- Bounty progress
			{
				Path = { "GameState", "PackagedBountyClears" },
				HasAny = { "PackageBountyChaosIntro", "PackageBountyOceanus", "PackageBountyStarter", },
			},
			-- Weapon
			{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { "WeaponTorch", "TorchDetonateAspect", },
			},
			-- Keepsake
			{
				PathTrue = { "GameState", "GiftPresentation", "DecayingBoostKeepsake", },
			},
			-- FirstLoot
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "HestiaFirstPickUp", "ApolloFirstPickUp" },
			},
			-- MetaUpgrades
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 10,
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "HealthRegen", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "BonusHealth", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "SprintShield", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "MaxHealthPerRoom", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "StatusVulnerability", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "DoorReroll", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "StartingGold", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "RarityBoost", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "TradeOff", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "ScreenReroll", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowHealthBonus", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "EpicRarityBoost", "Unlocked" },
			},
		},
	},
	-- Trial of Heavens
	{
		Name = "ModsNikkelMHadesBiomes_PackageBountyHeavens",
		ModsNikkelMHadesBiomesInsertAfterBounty = "ModsNikkelMHadesBiomes_PackageBountyFire",
		InheritFrom = { "DefaultPackagedBounty", "ModsNikkelMHadesBiomes_BasePackageBountyBiomeElysium", },

		Text = "ModsNikkelMHadesBiomes_PackageBountyHeavens",

		DifficultyRating = 2,

		WeaponKitName = "WeaponSuit",
		WeaponUpgradeName = "SuitHexAspect", -- Aspect of Selene
		KeepsakeName = "SpellTalentKeepsake", -- Moon Beam
		FamiliarName = "RavenFamiliar",     -- Raki

		RunOverrides = {
			MaxGodsPerRun = 2,
			LootTypeHistory = {
				ZeusUpgrade = 2,
				AphroditeUpgrade = 3,
				HermesUpgrade = 1,
				WeaponUpgrade = 2,
			},
		},

		StartingTraits = {
			{ Name = "AphroditeWeaponBoon",      Rarity = "Heroic", },
			{ Name = "ZeusSpecialBoon",          Rarity = "Heroic", },
			{ Name = "AphroditeManaBoon",        Rarity = "Heroic", },
			{ Name = "EchoExpirationBoon",       Rarity = "Heroic", },
			{ Name = "HighHealthOffenseBoon",    Rarity = "Heroic", },
			{ Name = "HermesSpecialBoon",        Rarity = "Heroic", },
			{ Name = "SuitSpecialBlockTrait" },
			{ Name = "SuitFullChargeTrait" },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
		},

		RewardStoreOverrides = {
			RunProgress = {
				{
					Name = "RoomMoneyDrop",
					GameStateRequirements = {},
				},
				{
					Name = "RoomMoneyDrop",
					GameStateRequirements = {},
				},
				{
					Name = "TalentDrop",
					GameStateRequirements = {
						{
							PathFalse = { "CurrentRun", "AllSpellInvestedCache", },
						},
					},
				},
				{
					Name = "TalentDrop",
					GameStateRequirements = {
						{
							PathFalse = { "CurrentRun", "AllSpellInvestedCache", },
						},
					},
				},
				{
					Name = "TalentDrop",
					GameStateRequirements = {
						{
							PathFalse = { "CurrentRun", "AllSpellInvestedCache", },
						},
					},
				},
				{
					Name = "TalentDrop",
					GameStateRequirements = {
						{
							PathFalse = { "CurrentRun", "AllSpellInvestedCache", },
						},
					},
				},
				{
					Name = "Boon",
					ForceLootName = "AphroditeUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "AphroditeUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "AphroditeUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "ZeusUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "ZeusUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "ZeusUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
			},
		},

		MetaUpgradeStateEquipped = {
			"ChanneledCast",
			"HealthRegen",
			"LowManaDamageBonus",
			"CastCount",
			"SorceryRegenUpgrade",
			"CastBuff",
			"BonusHealth",
			"ManaOverTime",
			"MagicCrit",
			"MaxHealthPerRoom",
			"StatusVulnerability",
			"ChanneledBlock",
			"LowHealthBonus",
			"EpicRarityBoost",
		},

		ShrineUpgradesActive = {},

		UnlockGameStateRequirements = {
			-- Biome and Shrine unlocks
			NamedRequirements = { "ModsNikkelMHadesBiomes_PackageBountyBiomeElysium", },
			-- Bounty progress
			{
				Path = { "GameState", "PackagedBountyClears" },
				HasAny = { "PackageBountyChaosIntro", "PackageBountyOceanus", "PackageBountyStarter", },
			},
			-- Weapon
			{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { "WeaponSuit", "SuitHexAspect", },
			},
			-- Keepsake
			{
				PathTrue = { "GameState", "GiftPresentation", "SpellTalentKeepsake", },
			},
			-- FirstLoot
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "SeleneFirstPickUp", "AphroditeFirstPickUp", "ZeusFirstPickUp" },
			},
			-- MetaUpgrades
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 10,
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "ChanneledCast", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "HealthRegen", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowManaDamageBonus", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "CastCount", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "SorceryRegenUpgrade", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "CastBuff", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "BonusHealth", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "ManaOverTime", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "MagicCrit", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "MaxHealthPerRoom", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "StatusVulnerability", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "ChanneledBlock", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowHealthBonus", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "EpicRarityBoost", "Unlocked" },
			},
		},
	},
	-- Trial of Family
	{
		Name = "ModsNikkelMHadesBiomes_PackageBountyFamily",
		ModsNikkelMHadesBiomesInsertAfterBounty = "ModsNikkelMHadesBiomes_PackageBountyHeavens",
		InheritFrom = { "DefaultPackagedBounty", "ModsNikkelMHadesBiomes_BasePackageBountyBiomeStyx", },

		Text = "ModsNikkelMHadesBiomes_PackageBountyFamily",

		DifficultyRating = 5,

		WeaponKitName = "WeaponLob",
		WeaponUpgradeName = "LobImpulseAspect", -- Aspect of Persephone
		KeepsakeName = "RarifyKeepsake",      -- Calling Card
		FamiliarName = "HoundFamiliar",       -- Hecuba

		RunOverrides = {
			MaxGodsPerRun = 1,
			LootTypeHistory = {
				NPC_Hades_Field_01 = 1,
				DemeterUpgrade = 5,
				HermesUpgrade = 2,
				WeaponUpgrade = 2,
			},
			-- Force fountain to be early, allowing a decision for going for more rooms to rarify more boons
			ModsNikkelMHadesBiomesForceStyxFountainDepth = 2,
		},

		StartingTraits = {
			{ Name = "HadesCastProjectileBoon", },
			{ Name = "DemeterWeaponBoon",        Rarity = "Common", },
			{ Name = "HeraSpecialBoon",          Rarity = "Common", },
			{ Name = "DemeterCastBoon",          Rarity = "Common", },
			{ Name = "DemeterSprintBoon",        Rarity = "Common", },
			{ Name = "BoonGrowthBoon",           Rarity = "Heroic", },
			{ Name = "RestockBoon",              Rarity = "Heroic" },
			-- Hammers
			{ Name = "LobAmmoTrait", },
			{ Name = "LobPulseAmmoCollectTrait", },
			-- Max Health/Mana
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxHealthTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
			{ Name = "RoomRewardMaxManaTrait", },
		},

		RewardStoreOverrides = {
			RunProgress = {
				{
					Name = "MaxHealthDrop",
					GameStateRequirements = {},
				},
				{
					Name = "MaxManaDrop",
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "DemeterUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "DemeterUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
				{
					Name = "Boon",
					ForceLootName = "DemeterUpgrade",
					AllowDuplicates = true,
					GameStateRequirements = {},
				},
			},
		},

		MetaUpgradeStateEquipped = {
			"HealthRegen",
			"LowManaDamageBonus",
			"SorceryRegenUpgrade",
			"CastBuff",
			"BonusHealth",
			"ManaOverTime",
			"SprintShield",
			"LastStand",
			"MaxHealthPerRoom",
			"StatusVulnerability",
			"ChanneledBlock",
			"StartingGold",
			"EpicRarityBoost",
		},

		ShrineUpgradesActive = {
			BossDifficultyShrineUpgrade = 4,
		},

		UnlockGameStateRequirements = {
			-- Biome and Shrine unlocks
			NamedRequirements = { "ModsNikkelMHadesBiomes_PackageBountyBiomeStyx", "ShrineUnlocked", "ModsNikkelMHadesBiomesHadesEM4Beaten" },
			-- Bounty progress
			{
				Path = { "GameState", "PackagedBountyClears" },
				HasAny = { "PackageBountyChaosIntro", "PackageBountyOceanus", "PackageBountyStarter", },
			},
			-- Weapon
			{
				Path = { "GameState", "WeaponsUnlocked", },
				HasAll = { "WeaponLob", "LobImpulseAspect", },
			},
			-- Keepsake
			{
				PathTrue = { "GameState", "GiftPresentation", "RarifyKeepsake", },
			},
			-- Familiar
			{
				PathTrue = { "GameState", "FamiliarsUnlocked", "HoundFamiliar", },
			},
			-- FirstLoot
			{
				Path = { "GameState", "TextLinesRecord", },
				HasAll = { "DemeterFirstPickUp", },
			},
			{
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "HadesFirstMeeting", "HadesFirstMeeting_B", "HadesFirstMeeting_C " },
			},
			-- MetaUpgrades
			{
				Path = { "GameState", "MetaUpgradeLimitLevel", },
				Comparison = ">=",
				Value = 10,
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "HealthRegen", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LowManaDamageBonus", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "SorceryRegenUpgrade", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "CastBuff", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "BonusHealth", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "ManaOverTime", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "SprintShield", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "LastStand", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "MaxHealthPerRoom", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "StatusVulnerability", "Unlocked", },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "ChanneledBlock", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "StartingGold", "Unlocked" },
			},
			{
				PathTrue = { "GameState", "MetaUpgradeState", "EpicRarityBoost", "Unlocked" },
			},
		},
	},
}
for _, bountyData in ipairs(newTargetedBiomeBounties) do
	game.BountyData[bountyData.Name] = bountyData
	-- Insert into Bounty Board
	if bountyData.ModsNikkelMHadesBiomesInsertAfterBounty then
		local insertIndex = 1
		for _, bountyName in ipairs(game.ScreenData.BountyBoard.ItemCategories[1]) do
			insertIndex = insertIndex + 1
			if bountyName == bountyData.ModsNikkelMHadesBiomesInsertAfterBounty then
				break
			end
		end
		table.insert(game.ScreenData.BountyBoard.ItemCategories[1], insertIndex, bountyData.Name)
	end
end
-- #endregion
-- #endregion
