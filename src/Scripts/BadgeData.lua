game.ModsNikkelMHadesBiomesBadgeData = {
	ModsNikkelMHadesBiomesBaseBadge = {
		PanDuration = 2,
		DoVerticalPan = true,
		UseUnlockText = true,
		UnlockTextId = "BadgePurchased",
		PreActivationHoldDuration = 1.0,
		PostActivationHoldDuration = 1.5,
		SetPlayerAnimation = "Melinoe_Witchcraft_Start",
		EndPlayerAnimation = "Melinoe_Witchcraft_End",
		RevealVoiceLines = {
			{ GlobalVoiceLines = "ModsNikkelMHadesBiomes_BadgeUpgradedVoiceLines" },
		},
	},

	Tier1Badge = {
		BadgeIconScale = 0.42,
		BadgeIconOffsetX = 27,
		BadgeIconOffsetY = 8,
	},

	Tier2Badge = {
		BadgeIconScale = 0.45,
		BadgeIconOffsetX = 14,
		BadgeIconOffsetY = 12,
	},

	Tier3Badge = {
		BadgeIconScale = 0.45,
		BadgeIconOffsetX = 14,
		BadgeIconOffsetY = 12,
	},

	Tier4Badge = {
		BadgeIconScale = 0.40,
		BadgeIconOffsetX = 2,
		BadgeIconOffsetY = 12,
	},

	Tier5Badge = {
		BadgeIconScale = 0.4,
		BadgeIconOffsetX = 20,
		BadgeIconOffsetY = 14,
	},

	-- #region Warden
	ModsNikkelMHadesBiomesBadge_Rank01_Tier01 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier1Badge" },
		ResourceCost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 1,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Warden_Alpha",
	},
	ModsNikkelMHadesBiomesBadge_Rank01_Tier02 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier2Badge" },
		ResourceCost = {
			CosmeticsPoints = 1100,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 1,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Warden_Delta",
	},
	ModsNikkelMHadesBiomesBadge_Rank01_Tier03 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier3Badge" },
		ResourceCost = {
			CosmeticsPoints = 1200,
			WeaponPointsRare = 1,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 1,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Warden_Gamma",
	},
	ModsNikkelMHadesBiomesBadge_Rank01_Tier04 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier4Badge" },
		ResourceCost = {
			CosmeticsPoints = 1300,
			ModsNikkelMHadesBiomes_PlantStyx = 2,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Warden_Sigma",
	},
	ModsNikkelMHadesBiomesBadge_Rank01_Tier05 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			CosmeticsPoints = 1400,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Warden_Unseen",
	},
	-- #endregion

	-- #region Fixer
	ModsNikkelMHadesBiomesBadge_Rank02_Tier01 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier1Badge" },
		ResourceCost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_CropAsphodel = 3,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 2,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Fixer_Alpha",
	},
	ModsNikkelMHadesBiomesBadge_Rank02_Tier02 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier2Badge" },
		ResourceCost = {
			CosmeticsPoints = 1150,
			ModsNikkelMHadesBiomes_CropTartarus = 3,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Fixer_Delta",
	},
	ModsNikkelMHadesBiomesBadge_Rank02_Tier03 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier3Badge" },
		ResourceCost = {
			CosmeticsPoints = 1300,
			WeaponPointsRare = 2,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Fixer_Gamma",
	},
	ModsNikkelMHadesBiomesBadge_Rank02_Tier04 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier4Badge" },
		ResourceCost = {
			CosmeticsPoints = 1450,
			ModsNikkelMHadesBiomes_CropStyx = 3,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Fixer_Sigma",
	},
	ModsNikkelMHadesBiomesBadge_Rank02_Tier05 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			CosmeticsPoints = 1600,
			ModsNikkelMHadesBiomes_CropElysium = 3,
			ModsNikkelMHadesBiomes_BossResourceStyx = 2,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Fixer_Unseen",
	},
	-- #endregion

	-- #region Agent
	ModsNikkelMHadesBiomesBadge_Rank03_Tier01 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier1Badge" },
		ResourceCost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_OreAsphodel = 6,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 2,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Agent_Alpha",
	},
	ModsNikkelMHadesBiomesBadge_Rank03_Tier02 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier2Badge" },
		ResourceCost = {
			CosmeticsPoints = 1200,
			ModsNikkelMHadesBiomes_OreTartarus = 6,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Agent_Delta",
	},
	ModsNikkelMHadesBiomesBadge_Rank03_Tier03 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier3Badge" },
		ResourceCost = {
			CosmeticsPoints = 1400,
			WeaponPointsRare = 2,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Agent_Gamma",
	},
	ModsNikkelMHadesBiomesBadge_Rank03_Tier04 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier4Badge" },
		ResourceCost = {
			CosmeticsPoints = 1600,
			ModsNikkelMHadesBiomes_OreStyx = 6,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Agent_Sigma",
	},
	ModsNikkelMHadesBiomesBadge_Rank03_Tier05 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			ModsNikkelMHadesBiomes_OreElysium = 6,
			ModsNikkelMHadesBiomes_BossResourceStyx = 2,
			CosmeticsPoints = 1800,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Agent_Unseen",
	},
	-- #endregion

	-- #region Cleaner
	ModsNikkelMHadesBiomesBadge_Rank04_Tier01 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier1Badge" },
		ResourceCost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_PlantAsphodel = 4,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 3,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Cleaner_Alpha",
	},
	ModsNikkelMHadesBiomesBadge_Rank04_Tier02 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier2Badge" },
		ResourceCost = {
			CosmeticsPoints = 1250,
			ModsNikkelMHadesBiomes_PlantTartarus = 4,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 3,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Cleaner_Delta",
	},
	ModsNikkelMHadesBiomesBadge_Rank04_Tier03 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier3Badge" },
		ResourceCost = {
			CosmeticsPoints = 1500,
			WeaponPointsRare = 2,
			ModsNikkelMHadesBiomes_BossResourceStyx = 2,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Cleaner_Gamma",
	},
	ModsNikkelMHadesBiomesBadge_Rank04_Tier04 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier4Badge" },
		ResourceCost = {
			CosmeticsPoints = 1750,
			ModsNikkelMHadesBiomes_PlantStyx = 4,
			ModsNikkelMHadesBiomes_BossResourceElysium = 3,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Cleaner_Sigma",
	},
	ModsNikkelMHadesBiomesBadge_Rank04_Tier05 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			CosmeticsPoints = 2000,
			ModsNikkelMHadesBiomes_PlantElysium = 4,
			ModsNikkelMHadesBiomes_BossResourceStyx = 3,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Cleaner_Unseen",
	},
	-- #endregion

	-- #region Shadow
	ModsNikkelMHadesBiomesBadge_Rank05_Tier01 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier1Badge" },
		ResourceCost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_CropAsphodel = 5,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 3,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Shadow_Alpha",
	},
	ModsNikkelMHadesBiomesBadge_Rank05_Tier02 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier2Badge" },
		ResourceCost = {
			CosmeticsPoints = 1300,
			ModsNikkelMHadesBiomes_CropTartarus = 5,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 3,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Shadow_Delta",
	},
	ModsNikkelMHadesBiomesBadge_Rank05_Tier03 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier3Badge" },
		ResourceCost = {
			CosmeticsPoints = 1600,
			WeaponPointsRare = 3,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 3,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Shadow_Gamma",
	},
	ModsNikkelMHadesBiomesBadge_Rank05_Tier04 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			CosmeticsPoints = 1900,
			ModsNikkelMHadesBiomes_CropStyx = 5,
			ModsNikkelMHadesBiomes_BossResourceElysium = 3,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Shadow_Sigma",
	},
	ModsNikkelMHadesBiomesBadge_Rank05_Tier05 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			CosmeticsPoints = 2100,
			ModsNikkelMHadesBiomes_CropElysium = 5,
			ModsNikkelMHadesBiomes_BossResourceStyx = 3,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Shadow_Unseen",
	},
	-- #endregion

	-- #region Dusk
	ModsNikkelMHadesBiomesBadge_Rank06_Tier01 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier1Badge" },
		ResourceCost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_OreAsphodel = 9,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 4,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Dusk_Alpha",
	},
	ModsNikkelMHadesBiomesBadge_Rank06_Tier02 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier2Badge" },
		ResourceCost = {
			CosmeticsPoints = 1400,
			ModsNikkelMHadesBiomes_OreTartarus = 9,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 4,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Dusk_Delta",
	},
	ModsNikkelMHadesBiomesBadge_Rank06_Tier03 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier3Badge" },
		ResourceCost = {
			CosmeticsPoints = 1800,
			WeaponPointsRare = 3,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 3,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Dusk_Gamma",
	},
	ModsNikkelMHadesBiomesBadge_Rank06_Tier04 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier4Badge" },
		ResourceCost = {
			CosmeticsPoints = 2200,
			ModsNikkelMHadesBiomes_OreStyx = 9,
			ModsNikkelMHadesBiomes_BossResourceElysium = 4,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Dusk_Sigma",
	},
	ModsNikkelMHadesBiomesBadge_Rank06_Tier05 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			CosmeticsPoints = 2600,
			ModsNikkelMHadesBiomes_OreElysium = 9,
			ModsNikkelMHadesBiomes_BossResourceStyx = 4,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Dusk_Unseen",
	},
	-- #endregion

	-- #region Wraith
	ModsNikkelMHadesBiomesBadge_Rank07_Tier01 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier1Badge" },
		ResourceCost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_PlantAsphodel = 5,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 4,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Wraith_Alpha",
	},
	ModsNikkelMHadesBiomesBadge_Rank07_Tier02 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier2Badge" },
		ResourceCost = {
			CosmeticsPoints = 1500,
			ModsNikkelMHadesBiomes_PlantTartarus = 5,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 4,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Wraith_Delta",
	},
	ModsNikkelMHadesBiomesBadge_Rank07_Tier03 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier3Badge" },
		ResourceCost = {
			CosmeticsPoints = 2000,
			WeaponPointsRare = 4,
			ModsNikkelMHadesBiomes_BossResourceElysium = 4,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Wraith_Gamma",
	},
	ModsNikkelMHadesBiomesBadge_Rank07_Tier04 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier4Badge" },
		ResourceCost = {
			CosmeticsPoints = 2500,
			ModsNikkelMHadesBiomes_PlantStyx = 5,
			ModsNikkelMHadesBiomes_BossResourceElysium = 4,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Wraith_Sigma",
	},
	ModsNikkelMHadesBiomesBadge_Rank07_Tier05 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			CosmeticsPoints = 3000,
			ModsNikkelMHadesBiomes_PlantElysium = 5,
			ModsNikkelMHadesBiomes_BossResourceStyx = 4,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Wraith_Unseen",
	},
	-- #endregion

	-- #region Overseer
	ModsNikkelMHadesBiomesBadge_Rank08_Tier01 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier1Badge" },
		ResourceCost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_CropAsphodel = 6,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 5,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Overseer_Alpha",
	},
	ModsNikkelMHadesBiomesBadge_Rank08_Tier02 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier2Badge" },
		ResourceCost = {
			CosmeticsPoints = 1600,
			ModsNikkelMHadesBiomes_CropTartarus = 6,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 5,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Overseer_Delta",
	},
	ModsNikkelMHadesBiomesBadge_Rank08_Tier03 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier3Badge" },
		ResourceCost = {
			CosmeticsPoints = 2200,
			WeaponPointsRare = 4,
			ModsNikkelMHadesBiomes_BossResourceStyx = 4,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Overseer_Gamma",
	},
	ModsNikkelMHadesBiomesBadge_Rank08_Tier04 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier4Badge" },
		ResourceCost = {
			CosmeticsPoints = 2800,
			ModsNikkelMHadesBiomes_CropStyx = 6,
			ModsNikkelMHadesBiomes_BossResourceElysium = 5,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Overseer_Sigma",
	},
	ModsNikkelMHadesBiomesBadge_Rank08_Tier05 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			CosmeticsPoints = 3400,
			ModsNikkelMHadesBiomes_CropElysium = 6,
			ModsNikkelMHadesBiomes_BossResourceStyx = 5,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Overseer_Unseen",
	},
	-- #endregion

	-- #region Specter
	ModsNikkelMHadesBiomesBadge_Rank09_Tier01 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier1Badge" },
		ResourceCost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_OreAsphodel = 12,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 5,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Specter_Alpha",
	},
	ModsNikkelMHadesBiomesBadge_Rank09_Tier02 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier2Badge" },
		ResourceCost = {
			CosmeticsPoints = 1650,
			ModsNikkelMHadesBiomes_OreTartarus = 12,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 5,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Specter_Delta",
	},
	ModsNikkelMHadesBiomesBadge_Rank09_Tier03 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier3Badge" },
		ResourceCost = {
			CosmeticsPoints = 2300,
			WeaponPointsRare = 5,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 5,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Specter_Gamma",
	},
	ModsNikkelMHadesBiomesBadge_Rank09_Tier04 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier4Badge" },
		ResourceCost = {
			CosmeticsPoints = 2950,
			ModsNikkelMHadesBiomes_OreStyx = 12,
			ModsNikkelMHadesBiomes_BossResourceElysium = 5,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Specter_Sigma",
	},
	ModsNikkelMHadesBiomesBadge_Rank09_Tier05 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			CosmeticsPoints = 3600,
			ModsNikkelMHadesBiomes_OreElysium = 12,
			ModsNikkelMHadesBiomes_BossResourceStyx = 5,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_Specter_Unseen",
	},
	-- #endregion

	-- #region One
	ModsNikkelMHadesBiomesBadge_Rank10_Tier01 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier1Badge" },
		ResourceCost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_PlantTartarus = 6,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 6,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_One_Alpha",
	},
	ModsNikkelMHadesBiomesBadge_Rank10_Tier02 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier2Badge" },
		ResourceCost = {
			CosmeticsPoints = 1750,
			ModsNikkelMHadesBiomes_CropAsphodel = 6,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 6,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_One_Delta",
	},
	ModsNikkelMHadesBiomesBadge_Rank10_Tier03 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier3Badge" },
		ResourceCost = {
			CosmeticsPoints = 2500,
			WeaponPointsRare = 6,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 6,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_One_Gamma",
	},
	ModsNikkelMHadesBiomesBadge_Rank10_Tier04 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier4Badge" },
		ResourceCost = {
			CosmeticsPoints = 3250,
			ModsNikkelMHadesBiomes_OreElysium = 15,
			ModsNikkelMHadesBiomes_BossResourceElysium = 6,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_One_Sigma",
	},
	ModsNikkelMHadesBiomesBadge_Rank10_Tier05 = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseBadge", "Tier5Badge" },
		ResourceCost = {
			CosmeticsPoints = 4000,
			ModsNikkelMHadesBiomes_PlantStyx = 6,
			ModsNikkelMHadesBiomes_BossResourceStyx = 6,
		},
		Icon = "GUI\\HUD\\Badges\\UI_PlayerBadge_One_Unseen",
	},
	-- #endregion
}
for name, data in pairs(game.ModsNikkelMHadesBiomesBadgeData) do
	data.Name = name
	ProcessDataInheritance(data, game.ModsNikkelMHadesBiomesBadgeData)
end

game.ModsNikkelMHadesBiomesBadgeOrderData = {
	"ModsNikkelMHadesBiomesBadge_Rank01_Tier01",
	"ModsNikkelMHadesBiomesBadge_Rank01_Tier02",
	"ModsNikkelMHadesBiomesBadge_Rank01_Tier03",
	"ModsNikkelMHadesBiomesBadge_Rank01_Tier04",
	"ModsNikkelMHadesBiomesBadge_Rank01_Tier05",

	"ModsNikkelMHadesBiomesBadge_Rank02_Tier01",
	"ModsNikkelMHadesBiomesBadge_Rank02_Tier02",
	"ModsNikkelMHadesBiomesBadge_Rank02_Tier03",
	"ModsNikkelMHadesBiomesBadge_Rank02_Tier04",
	"ModsNikkelMHadesBiomesBadge_Rank02_Tier05",

	"ModsNikkelMHadesBiomesBadge_Rank03_Tier01",
	"ModsNikkelMHadesBiomesBadge_Rank03_Tier02",
	"ModsNikkelMHadesBiomesBadge_Rank03_Tier03",
	"ModsNikkelMHadesBiomesBadge_Rank03_Tier04",
	"ModsNikkelMHadesBiomesBadge_Rank03_Tier05",

	"ModsNikkelMHadesBiomesBadge_Rank04_Tier01",
	"ModsNikkelMHadesBiomesBadge_Rank04_Tier02",
	"ModsNikkelMHadesBiomesBadge_Rank04_Tier03",
	"ModsNikkelMHadesBiomesBadge_Rank04_Tier04",
	"ModsNikkelMHadesBiomesBadge_Rank04_Tier05",

	"ModsNikkelMHadesBiomesBadge_Rank05_Tier01",
	"ModsNikkelMHadesBiomesBadge_Rank05_Tier02",
	"ModsNikkelMHadesBiomesBadge_Rank05_Tier03",
	"ModsNikkelMHadesBiomesBadge_Rank05_Tier04",
	"ModsNikkelMHadesBiomesBadge_Rank05_Tier05",

	"ModsNikkelMHadesBiomesBadge_Rank06_Tier01",
	"ModsNikkelMHadesBiomesBadge_Rank06_Tier02",
	"ModsNikkelMHadesBiomesBadge_Rank06_Tier03",
	"ModsNikkelMHadesBiomesBadge_Rank06_Tier04",
	"ModsNikkelMHadesBiomesBadge_Rank06_Tier05",

	"ModsNikkelMHadesBiomesBadge_Rank07_Tier01",
	"ModsNikkelMHadesBiomesBadge_Rank07_Tier02",
	"ModsNikkelMHadesBiomesBadge_Rank07_Tier03",
	"ModsNikkelMHadesBiomesBadge_Rank07_Tier04",
	"ModsNikkelMHadesBiomesBadge_Rank07_Tier05",

	"ModsNikkelMHadesBiomesBadge_Rank08_Tier01",
	"ModsNikkelMHadesBiomesBadge_Rank08_Tier02",
	"ModsNikkelMHadesBiomesBadge_Rank08_Tier03",
	"ModsNikkelMHadesBiomesBadge_Rank08_Tier04",
	"ModsNikkelMHadesBiomesBadge_Rank08_Tier05",

	"ModsNikkelMHadesBiomesBadge_Rank09_Tier01",
	"ModsNikkelMHadesBiomesBadge_Rank09_Tier02",
	"ModsNikkelMHadesBiomesBadge_Rank09_Tier03",
	"ModsNikkelMHadesBiomesBadge_Rank09_Tier04",
	"ModsNikkelMHadesBiomesBadge_Rank09_Tier05",

	"ModsNikkelMHadesBiomesBadge_Rank10_Tier01",
	"ModsNikkelMHadesBiomesBadge_Rank10_Tier02",
	"ModsNikkelMHadesBiomesBadge_Rank10_Tier03",
	"ModsNikkelMHadesBiomesBadge_Rank10_Tier04",
	"ModsNikkelMHadesBiomesBadge_Rank10_Tier05",
}
