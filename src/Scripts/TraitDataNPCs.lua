-- Contains the upgrade choices the player can choose from NPCs like Sisyphus
local newTraitData = {
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
					MinAmount = 101,
					MaxAmount = 115,
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
					Name = "RoomRewardHealDrop",
				},
			}
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
			}
		},
	},
}

game.OverwriteTableKeys(game.TraitData, newTraitData)
