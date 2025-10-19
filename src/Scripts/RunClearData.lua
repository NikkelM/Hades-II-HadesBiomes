game.GameData.ModsNikkelMHadesBiomesRunClearMessageData = {
	DefaultMessage = {
		DebugOnly = true,
	},
	-- #region ORIGINAL HADES MESSAGES
	ModsNikkelMHadesBiomes_RunClear_ClearNumOne = {
		InheritFrom = { "DefaultMessage" },
		Priority = true,
		GameStateRequirements = {
			RequiredRunsCleared = 1,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearNumTen = {
		InheritFrom = { "DefaultMessage" },
		Priority = true,
		GameStateRequirements = {
			RequiredRunsCleared = 10,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearNumFifty = {
		InheritFrom = { "DefaultMessage" },
		Priority = true,
		GameStateRequirements = {
			RequiredRunsCleared = 50,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearNumOneHundred = {
		InheritFrom = { "DefaultMessage" },
		Priority = true,
		GameStateRequirements = {
			RequiredRunsCleared = 100,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearNumTwoFifty = {
		InheritFrom = { "DefaultMessage" },
		Priority = true,
		GameStateRequirements = {
			RequiredRunsCleared = 250,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearNumFiveHundred = {
		InheritFrom = { "DefaultMessage" },
		Priority = true,
		GameStateRequirements = {
			RequiredRunsCleared = 500,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearNearDeath = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredMaxHealthFraction = 0.05,
			RequiredMaxLastStands = 0,
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearFullHealth = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				FunctionName = "RequiredHealthFraction",
				FunctionArgs = { Comparison = ">=", Value = 1.0, },
			},
			{
				PathFalse = { "CurrentRun", "Hero", "LastStandsUsed", }
			},
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearHighMaxHealth = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredMinMaxHealthAmount = 550,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearTimeFast = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredCurrentClearTimeMax = 900,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearTimeVeryFast = {
		InheritFrom = { "DefaultMessage" },
		Priority = true,
		GameStateRequirements = {
			RequiredCurrentClearTimeMax = 720,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearTimeSlow = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredCurrentClearTimeMin = 3600,
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearMoneyNone = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "GameState", "Resources", "Money" },
				Comparison = "<=",
				Value = 0,
			},
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearMoneyHigh = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "GameState", "Resources", "Money" },
				Comparison = ">=",
				Value = 1000,
			},
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearMetaPointsInvestedNone = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = game.GameData.AllMetaUpgradeTraits,
				Comparison = "==",
				Value = 0,
			},
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearNoOlympianBoons = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "OlympianBoonCount" },
				Comparison = "==",
				Value = 0,
			},
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearAllStoryRooms = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredRoomsThisRun = { "A_Story01", "B_Story01", "C_Story01", },
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearAllReprieveRooms = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredRoomsThisRun = { "A_Reprieve01", "B_Reprieve01", "C_Reprieve01", },
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearAllShopRooms = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredRoomsThisRun = { "A_Shop01", "B_Shop01", "C_Shop01", },
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearRequiredTraitsZeus = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "SpawnKillBoon" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = {
					"ZeusWeaponBoon",
					"ZeusSpecialBoon",
					"ZeusCastBoon",
					"ZeusSprintBoon",
					"ZeusManaBoon",
					"ZeusManaBoltBoon",
					"BoltRetaliateBoon",
					"CastAnywhereBoon",
					"FocusLightningBoon",
					"DoubleBoltBoon",
					"EchoExpirationBoon",
					"LightningDebuffGeneratorBoon",
				},
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearRequiredTraitsPoseidon = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "AmplifyConeBoon" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = {
					"PoseidonWeaponBoon",
					"PoseidonSpecialBoon",
					"PoseidonCastBoon",
					"PoseidonSprintBoon",
					"PoseidonManaBoon",
					"EncounterStartOffenseBuffBoon",
					"RoomRewardBonusBoon",
					"FocusDamageShaveBoon",
					"DoubleRewardBoon",
					"PoseidonStatusBoon",
					"PoseidonExCastBoon",
					"OmegaPoseidonProjectileBoon",
				},
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	-- God doesn't exist in this way
	-- ClearRequiredTraitsAthena = {
	-- 	InheritFrom = { "DefaultMessage" },
	-- 	GameStateRequirements = {
	-- 		RequiredCountOfTraitsCount = 6,
	-- 		RequiredCountOfTraits =
	-- 		{
	-- 			"AthenaWeaponTrait",
	-- 			"AthenaSecondaryTrait",
	-- 			"AthenaRushTrait",
	-- 			"AthenaRangedTrait",
	-- 			"AthenaShoutTrait",

	-- 			"TrapDamageTrait",
	-- 			"EnemyDamageTrait",
	-- 			"AthenaRetaliateTrait",
	-- 			"PreloadSuperGenerationTrait",

	-- 			"AthenaBackstabDebuffTrait",
	-- 			"AthenaShieldTrait",
	-- 			"ShieldHitTrait",
	-- 		},
	-- 		RequiredOneOfTraits = { "ShieldHitTrait" },
	-- 	},
	-- },
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearRequiredTraitsAres = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "DoubleBloodDropBoon" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = {
					"AresWeaponBoon",
					"AresSpecialBoon",
					"AresCastBoon",
					"AresSprintBoon",
					"AresManaBoon",
					"AresExCastBoon",
					"RendBloodDropBoon",
					"AresStatusDoubleDamageBoon",
					"BloodDropRevengeBoon",
					"MissingHealthCritBoon",
					"AloneDamageBoon",
					"LowHealthLifestealBoon",
					"OmegaDelayedDamageBoon",
				},
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	-- God doesn't exist in this way
	-- ClearRequiredTraitsArtemis = {
	-- 	InheritFrom = { "DefaultMessage" },
	-- 	GameStateRequirements = {
	-- 		RequiredCountOfTraitsCount = 6,
	-- 		RequiredCountOfTraits =
	-- 		{
	-- 			"ArtemisWeaponTrait",
	-- 			"ArtemisRushTrait",
	-- 			"ArtemisRangedTrait",
	-- 			"ArtemisSecondaryTrait",
	-- 			"ArtemisShoutTrait",

	-- 			"AmmoReclaimTrait",
	-- 			"CritBonusTrait",
	-- 			"ArtemisSupportingFireTrait",
	-- 			"ArtemisBonusProjectileTrait",
	-- 			"CritVulnerabilityTrait",
	-- 			"ArtemisCriticalTrait",
	-- 			"CriticalBufferMultiplierTrait",
	-- 			"CriticalSuperGenerationTrait",
	-- 			"ArtemisAmmoExitTrait",
	-- 			"MoreAmmoTrait",
	-- 		},
	-- 		RequiredOneOfTraits = { "MoreAmmoTrait" },
	-- 	},
	-- },
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearRequiredTraitsAphrodite = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "RandomStatusBoon" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = {
					"AphroditeWeaponBoon",
					"AphroditeSpecialBoon",
					"AphroditeCastBoon",
					"AphroditeSprintBoon",
					"AphroditeManaBoon",
					"HighHealthOffenseBoon",
					"HealthRewardBonusBoon",
					"DoorHealToFullBoon",
					"WeakPotencyBoon",
					"WeakVulnerabilityBoon",
					"ManaBurstBoon",
					"FocusRawDamageBoon",
				},
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	-- God doesn't exist in this way
	-- ClearRequiredTraitsDionysus = {
	-- 	InheritFrom = { "DefaultMessage" },
	-- 	GameStateRequirements = {
	-- 		RequiredCountOfTraitsCount = 6,
	-- 		RequiredCountOfTraits =
	-- 		{
	-- 			"DionysusWeaponTrait",
	-- 			"DionysusSecondaryTrait",
	-- 			"DionysusRushTrait",
	-- 			"DionysusRangedTrait",
	-- 			"DionysusShoutTrait",
	-- 			"FountainDamageBonusTrait",

	-- 			"DoorHealTrait",
	-- 			"LowHealthDefenseTrait",
	-- 			"DionysusSpreadTrait",
	-- 			"DionysusSlowTrait",
	-- 			"DionysusPoisonPowerTrait",
	-- 			"DionysusDefenseTrait",
	-- 			"DionysusComboVulnerability",
	-- 		},
	-- 		RequiredOneOfTraits = { "DionysusComboVulnerability" },
	-- 	},
	-- },
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearRequiredTraitsDemeter = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "InstantRootKill" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = {
					"DemeterWeaponBoon",
					"DemeterSpecialBoon",
					"DemeterCastBoon",
					"DemeterSprintBoon",
					"DemeterManaBoon",
					"CastNovaBoon",
					"PlantHealthBoon",
					"BoonGrowthBoon",
					"ReserveManaHitShieldBoon",
					"SlowExAttackBoon",
					"CastAttachBoon",
					"RootDurationBoon",
				},
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearRequiredTraitsHermes = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "TimeStopLastStandBoon" },
			},
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearRequiredTraitsChaos = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "ChaosLastStandBlessing" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = {
					"ChaosWeaponBlessing",
					"ChaosSpecialBlessing",
					"ChaosCastBlessing",
					"ChaosHealthBlessing",
					"ChaosRarityBlessing",
					"ChaosMoneyBlessing",
					"ChaosLastStandBlessing",
					"ChaosManaBlessing",
					"ChaosManaOverTimeBlessing",
					"ChaosExSpeedBlessing",
					"ChaosElementalBlessing",
					"ChaosManaCostBlessing",
					"ChaosSpeedBlessing",
					"ChaosDoorHealBlessing",
					"ChaosHarvestBlessing",
				},
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearSynergyTraits = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = game.GameData.AllDuoBoons,
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearLegendaryTraits = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = game.GameData.AllLegendaryBoons,
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearChallengeSwitches = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredEncountersThisRun = {
				"TimeChallengeTartarus",
				"TimeChallengeAsphodel",
				"TimeChallengeElysium",
			},
			-- Doesn't exist in Hades II
			-- RequiredTrait = "TemporaryForcedChallengeSwitchTrait",
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearDevotionEncounters = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredMinEncountersThisRun = {
				Count = 2,
				Names = {
					"DevotionTestTartarus",
					"DevotionTestAsphodel",
					"DevotionTestElysium",
				},
			},
			RequiredInteractedGodsThisRun = 4,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearShrineChallengeEncounters = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredMinEncountersThisRun = {
				Count = 3,
				Names = {
					"ShrineChallengeTartarus",
					"ShrineChallengeAsphodel",
					"ShrineChallengeElysium",
				},
			},
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearMiniBossEncounters = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredMinEncountersThisRun = {
				Count = 5,
				Names = {
					-- Tartarus
					"MiniBossGrenadier",
					"MiniBossWretchAssassin",
					"MiniBossHeavyRangedSplitter",
					-- Asphodel
					-- "WrappingAsphodel",
					"MiniBossHitAndRun",
					"MiniBossSpreadShot",
					-- Elysium
					"MiniBossNakedSpawners",
					"MiniBossNakedSpawners",
					"MiniBossMinotaur",
					-- Styx
					"MiniBossRatThug",
					"MiniBossMineLayer",
					"MiniBossSatyr",
					"MiniBossHeavyRangedForked",
					"MiniBossCrawler",
				},
			},
			RequiredActiveMetaUpgrade = "MinibossCountShrineUpgrade",
		},
	},
	-- Calls don't exist in Hades II
	-- ClearWeaponsFiredWrath = {
	-- 	InheritFrom = { "DefaultMessage" },
	-- 	GameStateRequirements = {
	-- 		RequiredWeaponsFiredThisRun = {
	-- 			Count = 50,
	-- 			Names = {
	-- 				"AresSurgeWeapon",
	-- 				"PoseidonSurfWeapon",
	-- 				"AthenaShoutWeapon",
	-- 				--"LightningStrikeX",
	-- 				--"DionysusShoutWeapon",
	-- 				"AphroditeSuperCharm",
	-- 				"AphroditeMaxSuperCharm",
	-- 				"ArtemisShoutWeapon",
	-- 				"ArtemisMaxShoutWeapon",
	-- 				"DemeterSuper",
	-- 				"DemeterMaxSuper",
	-- 			},
	-- 		},
	-- 	},
	-- },
	-- The bow doesn't exist in Hades II
	-- ClearWeaponsFiredRanged = {
	-- 	InheritFrom = { "DefaultMessage" },
	-- 	GameStateRequirements = {
	-- 		RequiredWeaponsFiredThisRun =
	-- 		{
	-- 			Count = 1000,
	-- 			Names =
	-- 			{
	-- 				"RangedWeapon",
	-- 			},
	-- 		},
	-- 	},
	-- },
	-- Fishing is different in Hades II
	-- ClearFishCaught = {
	-- 	InheritFrom = { "DefaultMessage" },
	-- 	GameStateRequirements = {
	-- 		RequiredMinCaughtFishThisRun = 4,
	-- 		RequiredAnyCaughtFishTypesThisRun = { "Fish_Tartarus_Legendary_01", "Fish_Asphodel_Legendary_01", "Fish_Elysium_Legendary_01", "Fish_Styx_Legendary_01", "Fish_Chaos_Legendary_01" },
	-- 	},
	-- },
	ModsNikkelMHadesBiomes_RunClear_ClearConsecutiveHigh = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredConsecutiveClears = 10,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearHealItems = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredConsumablesThisRun = {
				Count = 65,
				Names = {
					"RoomRewardHealDrop",
					"HealDropRange",
					"HealDropMinor",
					"HealDropSuperMinor",
					"HealDropMajor",
					"HealBigDrop",
				},
			}
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearStackUpgrades = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			MinRequiredRunLootPickups = {
				Count = 11,
				Name = "StackUpgrade",
			}
		},
	},
	-- Gift drops don't work like this in Hades II
	-- ClearGiftDrops = {
	-- 	InheritFrom = { "DefaultMessage" },
	-- 	GameStateRequirements = {
	-- 		RequiredConsumablesThisRun = {
	-- 			Count = 7,
	-- 			Names = {
	-- 				"GiftDrop",
	-- 				"GiftDropRunProgress",
	-- 				"SuperGiftDrop",
	-- 			},
	-- 		}
	-- 	},
	-- },
	-- Keys don't exist in Hades II
	-- ClearLockKeyDrops = {
	-- 	InheritFrom = { "DefaultMessage" },
	-- 	GameStateRequirements = {
	-- 		RequiredConsumablesThisRun = {
	-- 			Count = 7,
	-- 			Names =
	-- 			{
	-- 				"LockKeyDrop",
	-- 				"LockKeyDropRunProgress",
	-- 			},
	-- 		}
	-- 	},
	-- },
	ModsNikkelMHadesBiomes_RunClear_ClearConsolationPrizes = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredConsumablesThisRun = {
				Count = 2,
				Names = {
					"RoomRewardConsolationPrize",
				},
			}
		},
	},
	-- Custom requirements
	ModsNikkelMHadesBiomes_RunClear_ClearManyLastStands = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredMinLastStandsUsed = 9,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearShutDownThanatos = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredAnyEncountersThisRun = { "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium", "ThanatosElysiumIntro" },
			RequiredMaxThanatosKillsThisRun = 0,
		},
	},
	ModsNikkelMHadesBiomes_RunClear_ClearManyTraitsSold = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			RequiredMinTraitsSold = 5,
		},
	},
	-- #endregion
	-- #region HADES II MESSAGES
	-- Below are all taken from Hades II, meaning they keep the original name and text
	ClearHighMaxMana = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "MaxMana" },
				Comparison = ">=",
				Value = 550,
			},
		},
	},
	ClearHighArmor = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "HealthBuffer" },
				Comparison = ">=",
				Value = 100,
			},
		},
	},
	ClearRequiredTraitsHera = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "AllElementalBoon" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = {
					"HeraWeaponBoon",
					"HeraSpecialBoon",
					"HeraCastBoon",
					"HeraSprintBoon",
					"HeraManaBoon",
					"DamageShareRetaliateBoon",
					"LinkedDeathDamageBoon",
					"BoonDecayBoon",
					"DamageSharePotencyBoon",
					"SpawnCastDamageBoon",
					"CommonGlobalDamageBoon",
					"OmegaHeraProjectileBoon",
				},
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ClearRequiredTraitsApollo = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "DoubleExManaBoon" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = {
					"ApolloWeaponBoon",
					"ApolloSpecialBoon",
					"ApolloCastBoon",
					"ApolloExCastBoon",
					"ApolloSprintBoon",
					"ApolloManaBoon",
					"ApolloRetaliateBoon",
					"PerfectDamageBonusBoon",
					"BlindChanceBoon",
					"ApolloBlindBoon",
					"ApolloCastAreaBoon",
					"DoubleStrikeChanceBoon",
				},
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ClearRequiredTraitsHephaestus = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "WeaponUpgradeBoon" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = {
					"HephaestusWeaponBoon",
					"HephaestusSpecialBoon",
					"HephaestusCastBoon",
					"HephaestusSprintBoon",
					"HephaestusManaBoon",
					"MassiveDamageBoon",
					"AntiArmorBoon",
					"HeavyArmorBoon",
					"ArmorBoon",
					"EncounterStartDefenseBuffBoon",
					"ManaToHealthBoon",
					"MassiveKnockupBoon",
				},
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ClearRequiredTraitsHestia = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "BurnSprintBoon" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = {
					"HestiaWeaponBoon",
					"HestiaSpecialBoon",
					"HestiaCastBoon",
					"HestiaSprintBoon",
					"HestiaManaBoon",
					"SacrificeBoon",
					"OmegaZeroBurnBoon",
					"CastProjectileBoon",
					"FireballManaSpecialBoon",
					"BurnExplodeBoon",
					"BurnArmorBoon",
					"BurnStackBoon",
				},
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ClearElementalTraits = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary", },
				CountOf = game.GameData.AllElementalBoons,
				Comparison = ">=",
				Value = 7,
			},
		},
	},
	ClearHighOlympianBoons = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "UniqueGodCount" },
				Comparison = ">=",
				Value = 9,
			},
		},
	},
	ClearHighSacrificeBoons = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "SacrificeTraitCount" },
				Comparison = ">=",
				Value = 6,
			},
		},
	},
	ClearHighHammerCount = {
		InheritFrom = { "DefaultMessage" },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "HammerCount" },
				Comparison = ">=",
				Value = 5,
			},
		},
	},
	-- #endregion
}

game.ProcessDataStore(game.GameData.ModsNikkelMHadesBiomesRunClearMessageData)
