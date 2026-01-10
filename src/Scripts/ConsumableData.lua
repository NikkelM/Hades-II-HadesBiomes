local newMiscConsumables = {
	-- Satyr Sack in Styx
	CerberusKey = {
		BlockExitText = "ExitBlockedByHeal",
		CanDuplicate = false,
		UsePromptOffsetX = 65,
		UsePromptOffsetY = 30,
		PlayInteract = true,
		HideWorldText = true,
		LastRewardEligible = false,
	},
	-- Gold Sack in Mid-Shops to trigger Charon's boss fight
	ForbiddenShopItem = {
		InheritFrom = { "BaseConsumable", "Tier1Consumable" },
		Cost = 0,
		HideWorldText = true,
		DropMoney = 300,
		DropMoneyRadius = 10,
		UseText = "UseForbiddenItem",
		OnUsedFunctionName = _PLUGIN.guid .. "." .. "ForbiddenShopItemTaken",
		-- Custom properties
		DropMoneyPickupDelay = 0.3,
		CanDuplicate = false,
		LastRewardEligible = false,
		PlayInteract = true,
		ConsumeSound = "/SFX/GoldCoinRewardUse",
	},
	-- Charon Reward card after beating him
	CharonStoreDiscount = {
		InheritFrom = { "BaseConsumable" },
		Icon = "BoonIcon",
		Cost = 0,
		SpawnSound = "/SFX/CharonMembershipCardDrop",
		ConsumeSound = "/SFX/CharonMembershipCardPickup",
		UseText = "UseCharonStoreDiscount",
		UseFunctionNames = { "AddTraitToHero" },
		UseFunctionArgs = {
			{ TraitName = "DiscountTrait" },
		},
		UseThreadedFunctionNames = { _PLUGIN.guid .. "." .. "LeaveCharonFight" },
		UseThreadedFunctionArgs = {},
		HideWorldText = true,

		-- TODO:
		ConsumedVoiceLines = {
			PlayOnce = true,
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.55,

			-- I look forward to making use of this.
			{ Cue = "/VO/ZagreusField_3767", RequiredPlayed = { "/VO/ZagreusField_3770" }, },
			-- Appreciate your generosity.
			{ Cue = "/VO/ZagreusField_3768", RequiredPlayed = { "/VO/ZagreusField_3770" }, },
			-- Looks like I'm back in the club.
			{ Cue = "/VO/ZagreusField_3769", RequiredPlayed = { "/VO/ZagreusField_3770" }, },
			-- Look at these savings!
			{ Cue = "/VO/ZagreusField_3770" },
			-- What a deal, mate.
			{ Cue = "/VO/ZagreusField_3771", RequiredPlayed = { "/VO/ZagreusField_3770" }, },
			-- It's a deal!
			{ Cue = "/VO/ZagreusField_3772", RequiredPlayed = { "/VO/ZagreusField_3770" }, },
		},
		-- Custom
		PlayInteract = true,
		CanDuplicate = false,
		LastRewardEligible = false,
	},
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
