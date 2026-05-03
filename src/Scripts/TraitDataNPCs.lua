-- Contains the upgrade choices the player can choose from NPCs like Sisyphus
local depthDamageMultiplier = 0.0
local duplicateMultiplier = -0.60
local duplicateStrongMultiplier = -0.40
local duplicateVeryStrongMultiplier = -0.20

local newTraitData = {
	-- #region Sisyphus
	ModsNikkelMHadesBiomesBaseSisyphus = {
		InheritFrom = { "ForceCommonAppearanceTrait" },
		BlockStacking = true,
		BlockInRunRarify = true,
		Hidden = true,
	},
	ModsNikkelMHadesBiomesSisyphusMoney = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseSisyphus" },
		Icon = "Boon_Sisyphus_02",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1.25 },
			Epic = { Multiplier = 1.5 },
			Heroic = { Multiplier = 2 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "AcquireFunctionArgs", "Currency", "BaseMin" }, { "AcquireFunctionArgs", "Currency", "BaseMax" } },
			AsInt = true,
		},
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
		InheritFrom = { "ModsNikkelMHadesBiomesBaseSisyphus" },
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
		InheritFrom = { "ModsNikkelMHadesBiomesBaseSisyphus" },
		Icon = "Boon_Sisyphus_03",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1.25 },
			Epic = { Multiplier = 1.5 },
			Heroic = { Multiplier = 2 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "AcquireFunctionArgs", "LootOptions", 1, "Overrides", "AddResources", "MetaCurrency" } },
			AsInt = true,
		},
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
	ModsNikkelMHadesBiomesSisyphusPomSlices = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseSisyphus" },
		Icon = "Boon_Sisyphus_04",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1 },
			Epic = { Multiplier = 1.5 },
			Heroic = { Multiplier = 2 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "AcquireFunctionArgs", "LootOptions", 1, "Amount" } },
			AsInt = true,
		},
		GameStateRequirements = {
			NamedRequirements = { "StackUpgradeLegal", },
		},
		AcquireFunctionName = "GiveRandomConsumables",
		AcquireFunctionArgs = {
			Delay = 0.5,
			DropFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSisyphusDropPresentation",
			NotRequiredPickup = true,
			ForceToValidLocation = true,
			DestinationId = 370001,
			Range = 0,
			UpwardForceMin = 650,
			UpwardForceMax = 750,
			ForceMin = 350,
			ForceMax = 500,
			AngleMin = -20,
			AngleMax = 0,
			LootOptions = {
				{
					Name = "StoreRewardRandomStack",
					Amount = 2,
				},
			},
		},
	},
	ModsNikkelMHadesBiomesSisyphusCentaurSoul = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseSisyphus" },
		Icon = "Boon_Sisyphus_05",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1.25 },
			Epic = { Multiplier = 1.5 },
			Heroic = { Multiplier = 2 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "AcquireFunctionArgs", "LootOptions", 1, "Overrides", "AddMaxHealth" } },
			AsInt = true,
		},
		AcquireFunctionName = "GiveRandomConsumables",
		AcquireFunctionArgs = {
			Delay = 0.5,
			DropFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSisyphusDropPresentation",
			NotRequiredPickup = true,
			ForceToValidLocation = true,
			DestinationId = 370001,
			Range = 0,
			Force = 350,
			UpwardForce = 600,
			Angle = -20,
			LootOptions = {
				{
					Name = "EmptyMaxHealthSmallDrop",
					Overrides = {
						AddMaxHealth = 20,
						ReportValues = {
							ReportedMaxHealth = "AddMaxHealth",
						},
					},
				},
			},
		},
		ExtractValues = {
			{
				Key = "ReportedMaxHealth",
				Format = "MaxHealth",
				ExtractAs = "TooltipMaxHealth",
			},
		},
	},
	ModsNikkelMHadesBiomesSisyphusMaxMana = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseSisyphus" },
		Icon = "Boon_Sisyphus_06",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1.25 },
			Epic = { Multiplier = 1.5 },
			Heroic = { Multiplier = 2 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "AcquireFunctionArgs", "LootOptions", 1, "Overrides", "AddMaxMana" } },
			AsInt = true,
		},
		AcquireFunctionName = "GiveRandomConsumables",
		AcquireFunctionArgs = {
			Delay = 0.5,
			DropFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSisyphusDropPresentation",
			NotRequiredPickup = true,
			ForceToValidLocation = true,
			DestinationId = 370001,
			Range = 0,
			Force = 350,
			UpwardForce = 600,
			Angle = -20,
			LootOptions = {
				{
					Name = "MaxManaDrop",
					Overrides = {
						AddMaxMana = 20,
						ReportValues = {
							ReportedMaxMana = "AddMaxMana",
						},
					},
				},
			},
		},
		ExtractValues = {
			{
				Key = "ReportedMaxMana",
				Format = "MaxMana",
				ExtractAs = "TooltipMaxMana",
			},
		},
	},
	ModsNikkelMHadesBiomesSisyphusTalentDrop = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseSisyphus" },
		Icon = "Boon_Sisyphus_07",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1.5 },
			Epic = { Multiplier = 2 },
			Heroic = { Multiplier = 2 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "AcquireFunctionArgs", "LootOptions", 1, "Overrides", "AddTalentPoints" } },
			AsInt = true,
		},
		GameStateRequirements = {
			NamedRequirements = { "TalentLegal" },
		},
		AcquireFunctionName = "GiveRandomConsumables",
		AcquireFunctionArgs = {
			Delay = 0.5,
			DropFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSisyphusDropPresentation",
			NotRequiredPickup = true,
			ForceToValidLocation = true,
			DestinationId = 370001,
			Range = 0,
			Force = 350,
			UpwardForce = 600,
			Angle = -20,
			LootOptions = {
				{
					Name = "MinorTalentDrop",
					Overrides = {
						AddTalentPoints = 2,
						ReportValues = {
							ReportedTalentPoints = "AddTalentPoints",
						},
					},
				},
			},
		},
		ExtractValues = {
			{
				Key = "ReportedTalentPoints",
				ExtractAs = "TooltipTalentPoints",
			},
		},
	},
	-- #endregion

	-- #region Eurydice
	ModsNikkelMHadesBiomesBaseEurydice = {
		InheritFrom = { "ForceCommonAppearanceTrait" },
		BlockStacking = true,
		BlockInRunRarify = true,
		Hidden = true,
	},
	ModsNikkelMHadesBiomesBuffSlottedBoonRarity = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseEurydice" },
		Icon = "Boon_Eurydice_01",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1 },
			Epic = { Multiplier = 1.5 },
			Heroic = { Multiplier = 2 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "AcquireFunctionArgs", "NumTraits" } },
			AsInt = true,
		},
		-- At least one upgradeable boon available
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
		InheritFrom = { "ModsNikkelMHadesBiomesBaseEurydice", "ModsNikkelMHadesBiomesBuffSlottedBoonRarity" },
		Icon = "Boon_Eurydice_02",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1 },
			Epic = { Multiplier = 1.25 },
			Heroic = { Multiplier = 5/4 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "AcquireFunctionArgs", "NumTraits" } },
			AsInt = true,
		},
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
		InheritFrom = { "ModsNikkelMHadesBiomesBaseEurydice" },
		Hidden = false,
		Icon = "Boon_Eurydice_03",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1 },
			Epic = { Multiplier = 4/3 },
			Heroic = { Multiplier = 4/3 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "RemainingUses" } },
			AsInt = true,
		},
		RarityBonus = {
			Rare = 1,
			Epic = 0.25,
			Legendary = 0.1,
		},
		RemainingUses = 3,
	},
	-- #endregion

	-- #region Patroclus
	ModsNikkelMHadesBiomesBasePatroclus = {
		InheritFrom = { "ForceCommonAppearanceTrait" },
		BlockStacking = true,
		BlockInRunRarify = true,
	},
	ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus = {
		InheritFrom = { "ModsNikkelMHadesBiomesBasePatroclus", "TemporaryDoorHealTrait" },
		NoFrame = false,
		Icon = "Boon_Patroclus_02",
		RemainingUses = 5,
		DoorHeal = 0.3,
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesPatroclusBuff",
		CustomStatLinesWithShrineUpgrade = {
			ShrineUpgradeName = "HealingReductionShrineUpgrade",
			StatLines = {
				"StoreUsesRemainingDisplay2",
				"HealingReductionNotice",
			},
		},
		StatLines = {
			"StoreUsesRemainingDisplay2",
		},
	},
	ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus = {
		InheritFrom = { "ModsNikkelMHadesBiomesBasePatroclus", "ShopTrait" },
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
		InheritFrom = { "ModsNikkelMHadesBiomesBasePatroclus" },
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
		InheritFrom = { "ModsNikkelMHadesBiomesBasePatroclus" },
		Icon = "Boon_Patroclus_04",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1 },
			Epic = { Multiplier = 1 },
			Heroic = { Multiplier = 1.2 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "AcquireFunctionArgs", "AddMaxHealth" }, { "AcquireFunctionArgs", "AddMaxMana" } },
			AsInt = true,
		},
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
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "AcquireFunctionArgs", "AddMaxHealth" }, { "AcquireFunctionArgs", "AddMaxMana" } },
			AsInt = true,
		},
	},
	-- #endregion

	-- #region Bouldy
	BouldyBlessing = {
		InheritFrom = { "ForceCommonAppearanceTrait" },
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
	ModsNikkelMHadesBiomesBaseOrpheus = {
		InheritFrom = { "ForceCommonAppearanceTrait" },
		BlockStacking = true,
		BlockInRunRarify = true,
	},
	-- Primordial Chaos
	ModsNikkelMHadesBiomesOrpheusChaosThemeBoon = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseOrpheus" },
		Icon = "Boon_Orpheus_PrimordialChaos",
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

		StatLines = {
			"ModsNikkelMHadesBiomesOrpheusChaosThemeBoonChaosGatesStatDisplay",
		},
		ForceSecretDoor = true,
		RemainingUses = 2,
	},
	ModsNikkelMHadesBiomesOrpheusChaosTheme_EntryCostSubBoon = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseOrpheus" },
		Icon = "Boon_Orpheus_PrimordialChaos",
		SecretDoorCostMultiplier = {
			BaseMin = 0,
			BaseMax = 0,
		},
	},
	-- God of the Dead
	ModsNikkelMHadesBiomesOrpheusBossFightMusicBoon = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseOrpheus" },
		Icon = "Boon_Orpheus_GodOfTheDead",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1.2 },
			Epic = { Multiplier = 1.5 },
			Heroic = { Multiplier = 2 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = {
				{ "OnEnemyDeathFunction", "FunctionArgs", "DamageMultiplier" },
			},
			SourceIsMultiplier = true,
		},
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesOrpheusBuff",
		AcquireFunctionArgs = {
			TrackName = "{fc71b797-75db-43af-8cc0-f50fdacb5dbc}",
		},

		OnEnemyDeathFunction = {
			Name = _PLUGIN.guid .. "." .. "OrpheusRaiseKilledEnemy",
			FunctionArgs = {
				SummonChance = 0.1,
				MaxHealthMultiplier = 1.8,
				SpeedMultiplier = 1,
				ScaleMultiplier = 1.1,
				DamageMultiplier = 1.15,
				ReportValues = {
					SummonChance = "SummonChance",
					DamageMultiplier = "DamageMultiplier",
				},
				UsingEffectName = "Charm"
			}
		},
		StatLines = {
			"ModsNikkelMHadesBiomesOrpheusBossFightMusicBoonResurrectStatDisplay",
			"SummonStatDisplay1",
		},
		ExtractValues = {
			{
				Key = "DamageMultiplier",
				ExtractAs = "DamageBonus",
				Format = "PercentDelta",
			},
			{
				Key = "SummonChance",
				ExtractAs = "SummonChance",
				Format = "Percent",
			},
		},
	},
	-- Lament of Orpheus
	ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseOrpheus" },
		ShowInHUD = true,
		Icon = "Boon_Orpheus_LamentOfOrpheus",
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
	ModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseOrpheus" },
		ShowInHUD = true,
		Icon = "Boon_Orpheus_HymnToZagreus",
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

		ModsNikkelMHadesBiomesOrpheusLastStandHealFraction = 0.1,
		ExtractValues = {
			{
				Key = "ModsNikkelMHadesBiomesOrpheusLastStandHealFraction",
				ExtractAs = "LastStandHeal",
				Format = "Percent",
			},
		},
		RemainingUses = 1,
	},
	-- Final Expense
	ModsNikkelMHadesBiomesOrpheusCharonShopThemeBoon = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseOrpheus" },
		Icon = "Boon_Orpheus_FinalExpense",
		RarityLevels = {
			Common = { Multiplier = 1 },
			Rare = { Multiplier = 1.2 },
			Epic = { Multiplier = 1.4 },
			Heroic = { Multiplier = 25/15 },
		},
		ModsNikkelMHadesBiomesDreamRunScaling = {
			ScaleKeys = { { "ModsNikkelMHadesBiomesMaxStoreDiscount" } },
		},
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesOrpheusBuff",
		AcquireFunctionArgs = {
			TrackName = "{1d2d987b-853b-4a65-aa2d-a3e8c7e0e99b}",
		},

		ModsNikkelMHadesBiomesMinStoreDiscount = 0.05,
		ModsNikkelMHadesBiomesMaxStoreDiscount = 0.15,
		StatLines = {
			"ModsNikkelMHadesBiomesOrpheusCharonShopThemeBoonDiscountStatDisplay",
		},
		ExtractValues = {
			{
				Key = "ModsNikkelMHadesBiomesMinStoreDiscount",
				ExtractAs = "TooltipMinDiscount",
				Format = "Percent",
			},
			{
				Key = "ModsNikkelMHadesBiomesMaxStoreDiscount",
				ExtractAs = "TooltipMaxDiscount",
				Format = "Percent",
			},
		},
	},
	-- Good Riddance
	ModsNikkelMHadesBiomesOrpheusEurydiceSong1Boon = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseOrpheus" },
		Icon = "Boon_Orpheus_GoodRiddance",
		BoonInfoIgnoreRequirements = true,
		GameStateRequirements = {
			{
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "OrpheusSingsAgain03", "OrpheusSingsAgain03_B", },
			},
		},
		AcquireFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesOrpheusBuff",
		AcquireFunctionArgs = {
			TrackName = "{c105b668-488c-4359-b7ff-02ccbb3c9eb9}",
			FunctionName = "AddRerolls",
			FunctionArgs = {
				Amount = 5,
			},
		},

		-- Also change in FunctionArgs above when updated
		AddRerolls = 5,
		AllowDoorReroll = true,
		ExtractValues = {
			{
				Key = "AddRerolls",
				ExtractAs = "Rerolls",
				IncludeSigns = true,
			},
		},
	},
	-- #endregion
}

game.OverwriteTableKeys(game.TraitData, newTraitData)
