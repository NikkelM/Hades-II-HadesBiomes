-- Contains the upgrade choices the player can choose from NPCs like Sisyphus
local newTraitData = {
	-- #region Sisyphus
	ModsNikkelMHadesBiomesSisyphusMoney = {
		BlockStacking = true,
		BlockInRunRarify = true,
		Hidden = true,
		Icon = "Boon_No_Choice_Money",
		AcquireFunctionName = "GiveRandomConsumables",
		AcquireFunctionArgs = {
			Delay = 0.5,
			DropFunctionName = "SisyphusDropPresentation",
			LootOptions = {
				{
					Name = "Currency",
					Amount = 110,
				},
			}
		},
	},
	ModsNikkelMHadesBiomesSisyphusHealing = {
		InheritFrom = { "ModsNikkelMHadesBiomesSisyphusMoney", },
		Icon = "Boon_Narcissus_01",
		AcquireFunctionArgs = {
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = true,
			DestinationId = 370001,
			Range = 0,
			Force = 350,
			UpwardForce = 600,
			Angle = -20,
			DropFunctionName = "SisyphusDropPresentation",
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
		InheritFrom = { "ModsNikkelMHadesBiomesSisyphusMoney", },
		Icon = "Boon_Narcissus_03",
		AcquireFunctionArgs = {
			Delay = 0.5,
			NotRequiredPickup = true,
			ForceToValidLocation = true,
			RunProgressUpgradeEligible = true,
			DestinationId = 370001,
			Range = 0,
			Force = 350,
			UpwardForce = 600,
			Angle = -20,
			DropFunctionName = "SisyphusDropPresentation",
			LootOptions = {
				{
					Name = "MetaCurrencyDrop",
					Overrides = {
						AddResources = {
							MetaCurrency = 30,
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
		Icon = "Boon_Circe_05",
		AcquireFunctionName = "EurydiceBuff",
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
		Icon = "Boon_Circe_08",
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
		Icon = "Boon_Circe_06",
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
		Icon = "Boon_Medea_06",
		RemainingUses = 5,
		DoorHeal = 0.3,
		AcquireFunctionName = "PatroclusBuff",
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
		AcquireFunctionName = "PatroclusBuff",
		Icon = "Boon_Medea_08",
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
		Icon = "Boon_Medea_02",
		Hidden = true,
		GameStateRequirements = {
			NamedRequirements = { "MissingLastStand", },
		},
		AcquireFunctionName = "PatroclusRefillLastStands",
		AcquireFunctionArgs = {
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
	-- #endregion
}

game.OverwriteTableKeys(game.TraitData, newTraitData)
