-- Contains the upgrade choices the player can choose from NPCs like Sisyphus
local newTraitData = {
	-- #region Sisyphus
	ModsNikkelMHadesBiomesSisyphusMoney = {
		BlockStacking = true,
		BlockInRunRarify = true,
		Hidden = true,
		Icon = "Boon_Sisyphus_02",
		AcquireFunctionName = "ModsNikkelMHadesBiomesSisyphusBuff",
		AcquireFunctionArgs = {
			Delay = 0.5,
			FunctionName = "GiveRandomConsumables",
			DropFunctionName = "ModsNikkelMHadesBiomesSisyphusDropPresentation",
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
			Force = 350,
			UpwardForce = 600,
			Angle = -20,
			DropFunctionName = "ModsNikkelMHadesBiomesSisyphusDropPresentation",
			LootOptions = {
				{
					Name = "HealDrop",
				},
			},
		},
		ExtractValues = {
			{
				External = true,
				BaseType = "ConsumableData",
				BaseName = "HealDrop",
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
			DropFunctionName = "ModsNikkelMHadesBiomesSisyphusDropPresentation",
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
		AcquireFunctionName = "ModsNikkelMHadesBiomesEurydiceBuff",
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
		AcquireFunctionName = "ModsNikkelMHadesBiomesPatroclusBuff",
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
		AcquireFunctionName = "ModsNikkelMHadesBiomesPatroclusBuff",
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
		AcquireFunctionName = "ModsNikkelMHadesBiomesPatroclusBuff",
		AcquireFunctionArgs = {
			FunctionName = "ModsNikkelMHadesBiomesPatroclusRefillLastStands",
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
		AcquireFunctionName = "ModsNikkelMHadesBiomesPatroclusBuff",
		AcquireFunctionArgs = {
			FunctionName = "ModsNikkelMHadesBiomesPatroclusAddMaxHealthMana",
			AddMaxHealth = 30,
			AddMaxMana = 15,
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
			FunctionName = "ModsNikkelMHadesBiomesPatroclusAddMaxHealthMana",
			AddMaxHealth = 15,
			AddMaxMana = 30,
			ReportValues = {
				ReportedMaxHealth = "AddMaxHealth",
				ReportedMaxMana = "AddMaxMana",
			},
		},
	},
	-- #endregion
}

game.OverwriteTableKeys(game.TraitData, newTraitData)
