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
		-- Used for the Hades II vanilla quest
		RandomBountyStreakEligible = false,
		-- TODO: New quest
		ModsNikkelMHadesBiomes_RandomBountyStreakEligible = true,
		-- So we can show the run clear screen after a clear
		ModsNikkelMHadesBiomesForceRunClearScreen = true,
		-- Also allow the new keepsakes to be chosen
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
		Name = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty1",
		ModsNikkelMHadesBiomesInsertAfterBounty = "PackageBountyRandomUnderworld_Difficulty1",
		InheritFrom = { "ModsNikkelMHadesBiomes_BasePackageBountyRandom", "ModsNikkelMHadesBiomesHadesEncounters" },
		Text = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty1_Short",

		StartingBiome = "Tartarus",
		BiomeIcon = "GUIModded\\Screens\\BountyBoard\\Biome_Journey",
		-- "Nightmare"
		BiomeText = "WeaponPointsRare",

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
	{
		Name = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty2",
		ModsNikkelMHadesBiomesInsertAfterBounty = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty1",
		InheritFrom = { "ModsNikkelMHadesBiomes_BasePackageBountyRandom", "ModsNikkelMHadesBiomesHadesEncounters" },
		Text = "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty2_Short",

		StartingBiome = "Tartarus",
		BiomeIcon = "GUIModded\\Screens\\BountyBoard\\Biome_Journey",
		-- "Nightmare"
		BiomeText = "WeaponPointsRare",

		RandomMetaUpgradeCostTotal = 30,
		RandomShrineUpgradePointTotal = 20,

		UnlockGameStateRequirements = {
			NamedRequirements = { "ModsNikkelMHadesBiomes_PackageBountyRandom" },
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
				Comparison = ">=",
				Value = 10,
			},
		},
	},
	-- TODO: Difficulty 3
}
for _, bountyData in ipairs(newRandomizedBounties) do
	game.BountyData[bountyData.Name] = bountyData
	-- Insert into Bounty Board
	if bountyData.ModsNikkelMHadesBiomesInsertAfterBounty then
		local insertIndex = 1
		for _, bountyName in ipairs(game.ScreenData.BountyBoard.ItemCategories[1]) do
			if bountyName == bountyData.ModsNikkelMHadesBiomesInsertAfterBounty then
				break
			end
			insertIndex = insertIndex + 1
		end
		table.insert(game.ScreenData.BountyBoard.ItemCategories[1], insertIndex, bountyData.Name)
	end
end
-- #endregion
-- #endregion
