-- Contains the upgrade choices the player can choose from NPCs like Sisyphus
local newTraitData = {
	SisyphusHealing = {
		BlockStacking = true,
		BlockInRunRarify = true,
		-- TODO
		Icon = "Boon_Narcissus_01",
		AcquireFunctionName = "GiveRandomConsumables",
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
					Name = "RoomRewardHealDrop",
				},
			}
		},
	},
	SisyphusMoney =
	{
		InheritFrom = { "SisyphusHealing", },
	},
	SisyphusMetapoints =
	{
		InheritFrom = { "SisyphusHealing", },
	},
}

game.OverwriteTableKeys(game.TraitData, newTraitData)
