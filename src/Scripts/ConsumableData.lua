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

		ConsumedVoiceLines = {
			{
				PreLineWait = 0.55,
				BreakIfPlayed = true,
				PlayOnce = true,
				PlayOnceContext = "ModsNikkelMHadesBiomes_CharonStoreDiscountFirstUse",
				{ Cue = "/VO/Melinoe_1819", Text = "Oh, I won't tell a soul." },
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.55,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/MelinoeField_4295", Text = "My entitlement.", },
			{ Cue = "/VO/MelinoeField_4294", Text = "I earned this." },
			{ Cue = "/VO/Melinoe_0554",      Text = "I'll take it.", },
			{ Cue = "/VO/Melinoe_1819",      Text = "Oh, I won't tell a soul." },
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
