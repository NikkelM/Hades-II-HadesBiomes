local newMiscConsumables = {
	CerberusKey = {
		BlockExitText = "ExitBlockedByHeal",
		CanDuplicate = false,
		UsePromptOffsetX = 65,
		UsePromptOffsetY = 30,
		PlayInteract = true,
		HideWorldText = true,
	}
}
mod.AddTableKeysSkipDupes(game.ConsumableData, newMiscConsumables)

local newBossDrops = {
	ModsNikkelMHadesBiomes_BossResourceTartarusDrop = {
		InheritFrom = { "BaseSuperResource", },
		AddResources = {
			ModsNikkelMHadesBiomes_BossResourceTartarus = 1,
		},
		UseText = "UseResourcePickup",
		SpawnSound = "/SFX/KeyDrop",
		ConsumeSound = "/SFX/KeyPickup",
	},
	ModsNikkelMHadesBiomes_BossResourceAsphodelDrop = {
		InheritFrom = { "BaseSuperResource", },
		AddResources = {
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 1,
		},
		UseText = "UseResourcePickup",
		SpawnSound = "/SFX/SuperGemDropSFX",
		ConsumeSound = "/SFX/SuperGemPickup",
	},
	ModsNikkelMHadesBiomes_BossResourceElysiumDrop = {
		InheritFrom = { "BaseSuperResource", },
		AddResources = {
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
		},
		UseText = "UseResourcePickup",
		SpawnSound = "/SFX/EntropyDropSFX",
		ConsumeSound = "/SFX/EntropyPickup",
	},
	ModsNikkelMHadesBiomes_BossResourceStyxDrop = {
		InheritFrom = { "BaseSuperResource", },
		AddResources = {
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
		},
		UseText = "UseResourcePickup",
		SpawnSound = "/SFX/TitanBloodDropSFX",
		ConsumeSound = "/SFX/TitanBloodPickupSFX",
	},
}
mod.AddTableKeysSkipDupes(game.ConsumableData, newBossDrops)
