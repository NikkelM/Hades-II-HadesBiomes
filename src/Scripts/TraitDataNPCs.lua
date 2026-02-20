-- Contains the upgrade choices the player can choose from NPCs like Sisyphus
local depthDamageMultiplier = 0.0
local duplicateMultiplier = -0.60
local duplicateStrongMultiplier = -0.40
local duplicateVeryStrongMultiplier = -0.20

local newTraitData = {
	-- #region Sisyphus
	ModsNikkelMHadesBiomesSisyphusMoney = {
		BlockStacking = true,
		BlockInRunRarify = true,
		Hidden = true,
		Icon = "Boon_Sisyphus_02",
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSisyphusBuff",
		AcquireFunctionArgs = {
			Delay = 0.5,
			FunctionName = "GiveRandomConsumables",
			MultiplyMoney = true,
			DropFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSisyphusDropPresentation",
			Currency = {
				BaseMin = 101,
				BaseMax = 115,
				AsInt = true,
			},
			ReportValues = {
				ReportedCurrency = "Currency",
			},
		},
		ExtractValues = {
			{
				Key = "ReportedCurrency",
				Format = "MoneyAmount",
				ExtractAs = "TooltipMoneyAmount",
			},
		},
	},
	ModsNikkelMHadesBiomesSisyphusHealing = {
		BlockStacking = true,
		BlockInRunRarify = true,
		Hidden = true,
		Icon = "Boon_Sisyphus_01",
		AcquireFunctionName = "GiveRandomConsumables",
		AcquireFunctionArgs = {
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = true,
			DestinationId = 370001,
			Range = 0,
			Force = 500,
			UpwardForce = 700,
			Angle = -20,
			DropFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSisyphusDropPresentation",
			LootOptions = {
				{
					Name = "HealDropMajor",
				},
			},
		},
		ExtractValues = {
			{
				External = true,
				BaseType = "ConsumableData",
				BaseName = "HealDropMajor",
				Format = "FlatHeal",
				BaseProperty = "HealFixed",
				ExtractAs = "HealDropAmount"
			},
		},
		CustomStatLinesWithShrineUpgrade = {
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			StatLines = {
				"HealingReductionNotice",
			},
		},
	},
	ModsNikkelMHadesBiomesSisyphusMetapoints = {
		BlockStacking = true,
		BlockInRunRarify = true,
		Hidden = true,
		Icon = "Boon_Sisyphus_03",
		AcquireFunctionName = "GiveRandomConsumables",
		AcquireFunctionArgs = {
			Delay = 0.5,
			DropFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSisyphusDropPresentation",
			NotRequiredPickup = false,
			ForceToValidLocation = true,
			RunProgressUpgradeEligible = true,
			DestinationId = 370001,
			Range = 0,
			Force = 350,
			UpwardForce = 600,
			Angle = -20,
			LootOptions = {
				{
					Name = "MetaCurrencyDrop",
					Overrides = {
						AddResources = {
							MetaCurrency = 120,
						},
					},
				},
			},
		},
		ExtractValues = {
			{
				Key = "MetaCurrency",
				Format = "ResourceAmount",
				ExtractAs = "TotalMetaCurrency",
			},
		},
	},
	-- #endregion

	-- #region Eurydice
	ModsNikkelMHadesBiomesBuffSlottedBoonRarity = {
		BlockStacking = true,
		BlockInRunRarify = true,
		Hidden = true,
		Icon = "Boon_Eurydice_01",
		-- At least one upgradeable boon available (not counting Heroic -> Perfect)
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "GodBoonRarities" },
				SumOf = { "Common", "Rare", "Epic" },
				Comparison = ">=",
				Value = 1,
			},
		},
		-- Otherwises crashes the boon info screen as it doesn't have any logic to properly parse SumOf
		BoonInfoIgnoreRequirements = true,
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesEurydiceBuff",
		AcquireFunctionArgs = {
			FunctionName = "AddRarityToTraits",
			NumTraits = 2,
			ReportValues = {
				ReportedNumTraits = "NumTraits",
			},
		},
		ExtractValues = {
			{
				Key = "ReportedNumTraits",
				ExtractAs = "NumTraits",
			},
		},
	},
	ModsNikkelMHadesBiomesBuffMegaPom = {
		InheritFrom = { "ModsNikkelMHadesBiomesBuffSlottedBoonRarity", },
		Icon = "Boon_Eurydice_02",
		GameStateRequirements = {
			NamedRequirements = { "StackUpgradeLegal", },
		},
		AcquireFunctionArgs = {
			FunctionName = "AddStackToTraits",
			NumTraits = 4,
			NumStacks = 1,
			ReportValues = {
				ReportedNumTraits = "NumTraits",
				ReportedNumStacks = "NumStacks",
			},
		},
		ExtractValues = {
			{
				Key = "ReportedNumTraits",
				ExtractAs = "NumTraits",
			},
			{
				Key = "ReportedNumStacks",
				ExtractAs = "NumStacks",
			}
		},
	},
	ModsNikkelMHadesBiomesBuffFutureBoonRarity = {
		BlockStacking = true,
		BlockInRunRarify = true,
		Icon = "Boon_Eurydice_03",
		RarityBonus = {
			Rare = 1,
			Epic = 0.25,
			Legendary = 0.1,
		},
		RemainingUses = 3,
	},
	-- #endregion

	-- #region Patroclus
	ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus = {
		InheritFrom = { "TemporaryDoorHealTrait" },
		BlockStacking = true,
		BlockInRunRarify = true,
		NoFrame = false,
		Icon = "Boon_Patroclus_02",
		RemainingUses = 5,
		DoorHeal = 0.3,
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesPatroclusBuff",
		CustomStatLinesWithShrineUpgrade = {
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			StatLines = {
				"HealingReductionNotice",
			},
		},
	},
	ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus = {
		InheritFrom = { "ShopTrait" },
		BlockStacking = true,
		BlockInRunRarify = true,
		NoFrame = false,
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesPatroclusBuff",
		Icon = "Boon_Patroclus_01",
		RemainingUses = 10,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers = {
			ValidWeaponMultiplier = 1.6,
			ValidWeapons = game.WeaponSets.HeroPrimarySecondaryWeapons,
			ReportValues = { ReportedMultiplier = "ValidWeaponMultiplier" },
		},
		ExtractValues = {
			{
				Key = "ReportedMultiplier",
				ExtractAs = "TooltipDamageBonus",
				Format = "PercentDelta",
			},
		},
		StatLines = {
			"StoreUsesRemainingDisplay1",
		},
	},
	ModsNikkelMHadesBiomesBuffExtraChance = {
		-- Adapted from EchoDeathDefianceRefill
		Icon = "Boon_Patroclus_03",
		Hidden = true,
		GameStateRequirements = {
			NamedRequirements = { "MissingLastStand", },
		},
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesPatroclusBuff",
		AcquireFunctionArgs = {
			FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesPatroclusRefillLastStands",
			HealFraction = 0.5,
			ReportValues = {
				ReportedHealFraction = "HealFraction"
			},
		},
		ExtractValues = {
			{
				Key = "ReportedHealFraction",
				ExtractAs = "TooltipInitialHeal",
				Format = "Percent"
			},
			{
				External = true,
				BaseType = "HeroData",
				BaseName = "LastStandData",
				BaseProperty = "Heal",
				Format = "Percent",
				ExtractAs = "LastStandHeal",
				SkipAutoExtract = true,
			},
		}
	},
	-- More Max Health than Mana
	ModsNikkelMHadesBiomesGainMaxHealthMinMana = {
		BlockStacking = true,
		BlockInRunRarify = true,
		Icon = "Boon_Patroclus_04",
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesPatroclusBuff",
		AcquireFunctionArgs = {
			FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesPatroclusAddMaxHealthMana",
			AddMaxHealth = 50,
			AddMaxMana = 30,
			ReportValues = {
				ReportedMaxHealth = "AddMaxHealth",
				ReportedMaxMana = "AddMaxMana",
			},
		},
		ExtractValues = {
			{
				Key = "ReportedMaxHealth",
				ExtractAs = "TooltipMaxHealth",
			},
			{
				Key = "ReportedMaxMana",
				ExtractAs = "TooltipMaxMana",
			},
		},
	},
	-- More Max Mana than Health
	ModsNikkelMHadesBiomesGainMinHealthMaxMana = {
		InheritFrom = { "ModsNikkelMHadesBiomesGainMaxHealthMinMana", },
		Icon = "Boon_Patroclus_05",
		AcquireFunctionArgs = {
			FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesPatroclusAddMaxHealthMana",
			AddMaxHealth = 30,
			AddMaxMana = 50,
			ReportValues = {
				ReportedMaxHealth = "AddMaxHealth",
				ReportedMaxMana = "AddMaxMana",
			},
		},
	},
	-- #endregion

	-- #region Bouldy
	BouldyBlessing = {
		Icon = "Boon_Bouldy_01",
		BlockInRunRarify = true,
		BlockStacking = true,
	},
	BouldyBlessing_Armor = {
		InheritFrom = { "BouldyBlessing" },
		AddIncomingDamageModifiers = {
			NonTrapDamageTakenMultiplier = {
				BaseMin = 0.95,
				BaseMax = 0.99,
				SourceIsMultiplier = true,
				IdenticalMultiplier = {
					Value = duplicateMultiplier,
				},
			},
			ReportValues = {
				ReportedMultiplier = "NonTrapDamageTakenMultiplier"
			},
		},
		ExtractValues = {
			{
				Key = "ReportedMultiplier",
				ExtractAs = "TooltipDamageReduction",
				Format = "NegativePercentDelta",
			},
		},
	},
	BouldyBlessing_Attack = {
		InheritFrom = { "BouldyBlessing" },
		AddOutgoingDamageModifiers = {
			ValidWeaponMultiplier = {
				BaseMin = 1.01,
				BaseMax = 1.05,
				SourceIsMultiplier = true,
				IdenticalMultiplier = {
					Value = duplicateMultiplier,
				},
			},
			ReportValues = {
				ReportedMultiplier = "ValidWeaponMultiplier"
			},
			ValidWeapons = game.WeaponSets.HeroPrimaryWeapons,
		},
		ExtractValues = {
			{
				Key = "ReportedMultiplier",
				ExtractAs = "TooltipDamage",
				Format = "PercentDelta",
			},
		},
	},
	BouldyBlessing_Special = {
		InheritFrom = { "BouldyBlessing" },
		AddOutgoingDamageModifiers = {
			ValidWeaponMultiplier = {
				BaseMin = 1.01,
				BaseMax = 1.05,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = duplicateMultiplier,
				},
			},
			ReportValues = {
				ReportedMultiplier = "ValidWeaponMultiplier"
			},
			ValidWeapons = game.WeaponSets.HeroSecondaryWeapons,
		},
		ExtractValues = {
			{
				Key = "ReportedMultiplier",
				ExtractAs = "TooltipDamage",
				Format = "PercentDelta",
			},
		},
	},
	BouldyBlessing_Ranged = {
		InheritFrom = { "BouldyBlessing" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseMin = 1.01,
				BaseMax = 1.10,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = duplicateMultiplier,
				},
			},
			ReportValues = {
				ReportedMultiplier = "ValidWeaponMultiplier"
			},
			ValidWeapons = game.WeaponSets.HeroRangedWeapons,
			ValidProjectiles = game.WeaponSets.CastProjectileNames,
			WeaponOrProjectileRequirement = true,
		},
		ExtractValues = {
			{
				Key = "ReportedMultiplier",
				ExtractAs = "TooltipDamage",
				Format = "PercentDelta",
			},
		}
	},
	BouldyBlessing_Speed = {
		InheritFrom = { "BouldyBlessing" },
		PropertyChanges = {
			{
				UnitProperty = "Speed",
				BaseMin = 1.01,
				BaseMax = 1.1,
				ChangeType = "Multiply",
				ReportValues = { ReportedBaseSpeed = "ChangeValue" },
			},
		},
		ExtractValues = {
			{
				Key = "ReportedBaseSpeed",
				ExtractAs = "TooltipSpeed",
				Format = "PercentDelta",
			},
		},
	},
	BouldyBlessing_Money = {
		InheritFrom = { "BouldyBlessing" },
		MoneyMultiplier = {
			BaseMin = 1.01,
			BaseMax = 1.10,
			ToNearest = 0.01,
			SourceIsMultiplier = true,
		},
		ExtractValues = {
			{
				Key = "MoneyMultiplier",
				ExtractAs = "TooltipMoneyRewardIncrease",
				Format = "PercentDelta",
			},
		},
	},
	BouldyBlessing_None = {
		InheritFrom = { "BouldyBlessing" },
	},
	-- #endregion

	-- #region Charon
	-- His reward card, when beating him in his boss fight/BossCharon
	DiscountTrait = {
		BlockStacking = true,
		BlockInRunRarify = true,
		Icon = "Membership_Card_Large",
		StoreCostMultiplier = 0.8,
		ExtractValues = {
			{
				Key = "StoreCostMultiplier",
				ExtractAs = "TooltipDiscount",
				Format = "NegativePercentDelta",
				HideSigns = true,
			},
		},
	},
	-- #endregion

	-- #region Orpheus
	-- Primordial Chaos
	ModsNikkelMHadesBiomesOrpheusChaosThemeBoon = {
		BlockStacking = true,
		BlockInRunRarify = true,
		-- TODO:
		Icon = "Boon_Eurydice_01",
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "ChaosFirstPickUp" },
			},
		},
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesOrpheusBuff",
		AcquireFunctionArgs = {
			TrackName = "{2c8f3fd6-6c6c-4146-a750-20be93cd8ca8}",
			AddAdditionalTraits = {
				"ModsNikkelMHadesBiomesOrpheusChaosTheme_EntryCostSubBoon",
			},
		},

		ForceSecretDoor = true,
		RemainingUses = 1,
	},
	ModsNikkelMHadesBiomesOrpheusChaosTheme_EntryCostSubBoon = {
		BlockStacking = true,
		BlockInRunRarify = true,
		-- TODO:
		Icon = "Boon_Eurydice_01",
		SecretDoorCostMultiplier = {
			BaseMin = 0,
			BaseMax = 0,
		},
	},
	-- God of the Dead
	ModsNikkelMHadesBiomesOrpheusBossFightMusicBoon = {
		BlockStacking = true,
		BlockInRunRarify = true,
		-- TODO:
		Icon = "Boon_Eurydice_02",
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesOrpheusBuff",
		AcquireFunctionArgs = {
			TrackName = "{fc71b797-75db-43af-8cc0-f50fdacb5dbc}",
		},

		OnEnemyDeathFunction = {
			Name = _PLUGIN.guid .. "." .. "OrpheusRaiseKilledEnemy",
			FunctionArgs = {
				SummonChance = 0.1,
				MaxHealthMultiplier = 2,
				SpeedMultiplier = 1.2,
				ScaleMultiplier = 1.1,
				DamageMultiplier = 1.2,
				ReportValues = {
					SummonChance = "SummonChance",
				},
				UsingEffectName = "Charm"
			}
		},
		ExtractValues = {
			{
				Key = "SummonChance",
				ExtractAs = "SummonChance",
				Format = "Percent",
			},
		},
	},
	-- Lament of Orpheus
	-- TODO: Force this boon as the only option for the OrpheusSingsAgain_01 voicelines
	ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon = {
		BlockStacking = true,
		BlockInRunRarify = true,
		ShowInHUD = true,
		-- TODO:
		Icon = "Boon_Eurydice_03",
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements = {
			NamedRequirements = { "ModsNikkelMHadesBiomesOrpheusSingsAgainRoomStart", },
		},
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesOrpheusBuff",
		AcquireFunctionArgs = {
			TrackName = "{01bdb2dd-ba29-44eb-b533-d759a6869a6a}",
		},

		SetupFunction = {
			Name = _PLUGIN.guid .. "." .. "OrpheusRetaliateRootSetup",
		},
		OnSelfDamagedFunction = {
			Name = _PLUGIN.guid .. "." .. "OrpheusApplyRoot",
			FunctionArgs = {
				EffectName = "ChillEffect",
				Cooldown = 10,
				ReportValues = {
					Cooldown = "Cooldown",
				},
			},
		},
		ExtractValues = {
			{
				Key = "Cooldown",
				ExtractAs = "Cooldown",
				Format = "Duration",
			},
			{
				Key = "ReportedWeaponMultiplier",
				ExtractAs = "TooltipDamageBonus",
				Format = "PercentDelta",
			},
			{
				ExtractAs = "ChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "ChillEffect",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "ChillActiveDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "EffectData",
				BaseName = "ChillEffect",
				BaseProperty = "ActiveDuration",
			},
		},
	},
	-- Hymn to Zagreus
	-- TODO: Force this boon as the only option for OrpheusSingsAgain_02
	ModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon = {
		BlockStacking = true,
		BlockInRunRarify = true,
		ShowInHUD = true,
		-- TODO:
		Icon = "Boon_Eurydice_03",
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "OrpheusSingsAgain_02" },
			},
		},
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesOrpheusBuff",
		AcquireFunctionArgs = {
			TrackName = "{e044c3d0-8cf0-44ac-9d8e-75eda8c80501}",
		},

		ModsNikkelMHadesBiomesOrpheusLastStandHealFraction = { BaseValue = 0.1, },
		ExtractValues = {
			{
				Key = "ModsNikkelMHadesBiomesOrpheusLastStandHealFraction",
				ExtractAs = "LastStandHeal",
				Format = "Percent",
			},
		},
		RemainingUses = 1,
	},
	-- #endregion
}

game.OverwriteTableKeys(game.TraitData, newTraitData)
