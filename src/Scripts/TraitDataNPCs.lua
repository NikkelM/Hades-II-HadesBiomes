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
			BoonRarity = true,
		},
	},
	BuffMegaPom = {
		InheritFrom = { "BuffSlottedBoonRarity", },
		Icon = "Boon_Circe_08",
		AcquireFunctionArgs = {
			StackTraits = true,
		},
	},
	BuffFutureBoonRarity = {
		BlockStacking = true,
		BlockInRunRarify = true,
		Icon = "Boon_Circe_06",
		RarityBonus = {
			RareBonus = 1,
			EpicBonus = 0.25,
			LegendaryBonus = 0.1,
		},
		RemainingUses = 3,
	},
	-- #endregion
}

game.OverwriteTableKeys(game.TraitData, newTraitData)
