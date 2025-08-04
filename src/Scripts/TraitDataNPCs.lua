-- Contains the upgrade choices the player can choose from NPCs like Sisyphus
local newTraitData = {
	-- #region Sisyphus
	SisyphusMoney = {
		BlockStacking = true,
		BlockInRunRarify = true,
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
	SisyphusHealing = {
		InheritFrom = { "SisyphusMoney", },
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
	SisyphusMetapoints = {
		InheritFrom = { "SisyphusMoney", },
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
	BuffSlottedBoonRarity = {
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
	BuffMegaPom = {
		InheritFrom = { "BuffSlottedBoonRarity", },
		Icon = "Boon_Circe_08",
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
	BuffFutureBoonRarity = {
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
	TemporaryDoorHealTrait_Patroclus = {
		InheritFrom = { "TemporaryDoorHealTrait" },
		BlockStacking = true,
		BlockInRunRarify = true,
		NoFrame = false,
		Icon = "Boon_Circe_06",
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
	TemporaryImprovedWeaponTrait_Patroclus = {
		InheritFrom = { "ShopTrait" },
		BlockStacking = true,
		BlockInRunRarify = true,
		NoFrame = false,
		AcquireFunctionName = "PatroclusBuff",
		Icon = "Boon_Circe_06",
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
	-- #endregion
}

game.OverwriteTableKeys(game.TraitData, newTraitData)
