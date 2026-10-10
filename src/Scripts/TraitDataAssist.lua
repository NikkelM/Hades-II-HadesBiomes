-- TODO: Add the owner voice banks through SpeakerNames on each future assist trait

local newTraitData = {
	AssistTrait = {
		InheritFrom = { "GiftTrait" },
		Slot = "Assist",
		Icon = "Keepsake_Unknown",
		ShowInHUD = true,
		HUDScale = 0.435,
		HideInRunHistory = true,
		NoFrame = true,
		SfxBankNames = { mod.AudioFileMappings.Sounds },
		ModsNikkelMHadesBiomesCabinetIconScale = 0.37,
		ActiveSlotOffsetIndex = "nil",
		FrameRarities = {
			Common = "Frame_Keepsake_Rank1",
			Rare = "Frame_Keepsake_Rank2",
			Epic = "Frame_Keepsake_Rank3",
			Heroic = "Frame_Keepsake_Rank4",
			Legendary = "ModsNikkelMHadesBiomesFrame_Keepsake_Rank5",
		},
		ChamberThresholds = mod.NilValue,
		RecordCacheOnEquip = mod.NilValue,
		CustomRarityLevels = {
			"LegendaryKeepsake_Level_1",
			"LegendaryKeepsake_Level_2",
			"LegendaryKeepsake_Level_3",
			"LegendaryKeepsake_Level_4",
			"LegendaryKeepsake_Level_5",
		},
		RarityLevels = {
			Common = {
				Multiplier = 1,
			},
			Rare = {
				Multiplier = 2,
			},
			Epic = {
				Multiplier = 3,
			},
			Heroic = {
				Multiplier = 4,
			},
			Legendary = {
				Multiplier = 5,
			},
		},
	},
	FuryAssistTrait = {
		InheritFrom = { "AssistTrait" },
		InRackTitle = "FuryAssistTrait_Rack",
		InRackIcon = "Keepsake_Meg_Plush_Menu",
		Icon = "Keepsake_Meg_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeMegLegendary",
		KeepsakeRarityGameStateRequirements = {
			{ AssistUpgradeLevel = { Name = "FuryAssistTrait", Level = 0, }, },
			{ AssistUpgradeLevel = { Name = "FuryAssistTrait", Level = 1, }, },
			{ AssistUpgradeLevel = { Name = "FuryAssistTrait", Level = 2, }, },
			{ AssistUpgradeLevel = { Name = "FuryAssistTrait", Level = 3, }, },
			{ AssistUpgradeLevel = { Name = "FuryAssistTrait", Level = 4, }, },
		},
		ModsNikkelMHadesBiomesUpgradeCosts = {
			{
				ModsNikkelMHadesBiomes_CropTartarus = 2,
				GiftPoints = 2
			},
			{
				ModsNikkelMHadesBiomes_CropElysium = 2,
				GiftPoints = 3
			},
			{
				ModsNikkelMHadesBiomes_CropStyx = 2,
				SuperGiftPoints = 1
			},
			{
				ModsNikkelMHadesBiomes_CropAsphodel = 2,
				ModsNikkelMHadesBiomes_BossResourceTartarus = 3,
				SuperGiftPoints = 2,
			},
		},
		SpeakerNames = { "MegaeraField" },
		PreEquipWeapons = { "NPC_FurySister_01_Assist" },
		AddAssist = {
			WeaponName = "NPC_FurySister_01_Assist",
			TargetRange = 2000,
			GameStateRequirements = {
				{
					PathFalse = { "CurrentRun", "CurrentRoom", "BlockHadesAssistTraits" },
				},
				{
					Path = { "CurrentRun", "CurrentRoom", "Name" },
					IsNone = { "A_Boss01", "A_Boss02", "A_Boss03" },
				},
			},
			AssistPresentationPortrait = "Portrait_FurySister01_Default_01",
			AssistPresentationPortraitOffsetY = 55,
			AssistPresentationColor = { 200, 0, 255, 255 },
			AssistPostWeaponSlowDuration = 0.1,
		},
		AssistDamage = 3000,
		RemainingUses = { BaseValue = 1 },
		DoesNotAutomaticallyExpire = true,
		ExtractValues = {
			{
				Key = "AssistDamage",
				ExtractAs = "TooltipDamage",
			},
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		SignOffData = {
			{
				GameStateRequirements = {
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAny = {
							"BecameCloseWithMegaera01Meg_GoToHer",
							"BecameCloseWithMegaera01_BMeg_GoToHer",
						},
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasNone = {
							"BecameCloseWithMegaera01Meg_BackOff",
							"BecameCloseWithMegaera01_BMeg_BackOff",
						},
					},
				},
				Text = "MegaeraSignoff_AssistMax_A",
			},
			{
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "MegaeraGift10" },
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasNone = {
							"BecameCloseWithMegaera01Meg_GoToHer",
							"BecameCloseWithMegaera01_BMeg_GoToHer",
						},
					},
				},
				Text = "MegaeraSignoff_AssistMax_B",
			},
			{
				Text = "MegaeraSignoff",
			},
		},
	},
	AchillesPatroclusAssistTrait = {
		InheritFrom = { "AssistTrait" },
		InRackTitle = "AchillesPatroclusAssistTrait_Rack",
		InRackIcon = "Keepsake_Achilles_Plush_Menu",
		Icon = "Keepsake_Achilles_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeAchillesLegendary",
		KeepsakeRarityGameStateRequirements = {
			{ AssistUpgradeLevel = { Name = "AchillesPatroclusAssistTrait", Level = 0, }, },
			{ AssistUpgradeLevel = { Name = "AchillesPatroclusAssistTrait", Level = 1, }, },
			{ AssistUpgradeLevel = { Name = "AchillesPatroclusAssistTrait", Level = 2, }, },
			{ AssistUpgradeLevel = { Name = "AchillesPatroclusAssistTrait", Level = 3, }, },
			{ AssistUpgradeLevel = { Name = "AchillesPatroclusAssistTrait", Level = 4, }, },
		},
		ModsNikkelMHadesBiomesUpgradeCosts = {
			{
				ModsNikkelMHadesBiomes_PlantAsphodel = 2,
				GiftPoints = 2
			},
			{
				ModsNikkelMHadesBiomes_PlantStyx = 2,
				GiftPoints = 3
			},
			{
				ModsNikkelMHadesBiomes_PlantElysium = 3,
				SuperGiftPoints = 1
			},
			{
				ModsNikkelMHadesBiomes_PlantTartarus = 3,
				ModsNikkelMHadesBiomes_BossResourceElysium = 3,
				SuperGiftPoints = 2,
			},
		},
		SpeakerNames = { "Modsnikkelmhadesbiomesachilles", "Patroclus" },
		PreEquipWeapons = { "NPC_Achilles_01_Assist", "NPC_Patroclus_01_Assist" },
		AddAssist = {
			FunctionName = _PLUGIN.guid .. "." .. "AchillesPatroclusAssist",
			AssistWeapons = { "NPC_Achilles_01_Assist", "NPC_Patroclus_01_Assist" },
			TargetRange = 2000,
			GameStateRequirements = {
				{
					PathFalse = { "CurrentRun", "CurrentRoom", "BlockHadesAssistTraits" },
				},
			},
			AssistPresentationPortrait = "Portrait_MaleGhost_Default_01",
			AssistPresentationPortraitOffsetX = 3,
			AssistPresentationPortraitOffsetY = 105,
			AssistPresentationPortrait2 = "Portrait_Patroclus_Neutral_01",
			AssistPresentationColor = { 140, 255, 200, 255 },
			AssistPostWeaponSlowDuration = 0.05,
		},
		AssistDamage = 2000,
		RemainingUses = { BaseValue = 1 },
		DoesNotAutomaticallyExpire = true,
		ExtractValues = {
			{
				Key = "AssistDamage",
				ExtractAs = "TooltipDamage",
			},
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		SignOffData = {
			{
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "AchillesGift09_A" },
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "PatroclusGift08_A" },
					},
				},
				Text = "AchillesPatroclusSignoff_AssistMax",
			},
			{
				Text = "AchillesPatroclusSignoff",
			},
		},
	},
	ThanatosAssistTrait = {
		InheritFrom = { "AssistTrait" },
		InRackTitle = "ThanatosAssistTrait_Rack",
		InRackIcon = "Keepsake_Thanatos_Plush_Menu",
		Icon = "Keepsake_Thanatos_Plush",
		ModsNikkelMHadesBiomesCabinetIconScale = 0.33,
		EquipSound = "/SFX/Menu Sounds/KeepsakeThanatosLegendary",
		KeepsakeRarityGameStateRequirements = {
			{ AssistUpgradeLevel = { Name = "ThanatosAssistTrait", Level = 0, }, },
			{ AssistUpgradeLevel = { Name = "ThanatosAssistTrait", Level = 1, }, },
			{ AssistUpgradeLevel = { Name = "ThanatosAssistTrait", Level = 2, }, },
			{ AssistUpgradeLevel = { Name = "ThanatosAssistTrait", Level = 3, }, },
			{ AssistUpgradeLevel = { Name = "ThanatosAssistTrait", Level = 4, }, },
		},
		ModsNikkelMHadesBiomesUpgradeCosts = {
			{
				ModsNikkelMHadesBiomes_CropAsphodel = 2,
				GiftPoints = 2
			},
			{
				ModsNikkelMHadesBiomes_CropStyx = 2,
				GiftPoints = 3
			},
			{
				ModsNikkelMHadesBiomes_CropElysium = 2,
				SuperGiftPoints = 1
			},
			{
				ModsNikkelMHadesBiomes_CropTartarus = 2,
				ModsNikkelMHadesBiomes_BossResourceAsphodel = 3,
				SuperGiftPoints = 2,
			},
		},
		SpeakerNames = { "Thanatos", "ThanatosField" },
		PreEquipWeapons = { "NPC_Thanatos_01_Assist" },
		AddAssist = {
			WeaponName = "NPC_Thanatos_01_Assist",
			TargetRange = 2000,
			GameStateRequirements = {
				{
					PathFalse = { "CurrentRun", "CurrentRoom", "BlockHadesAssistTraits" },
				},
				{
					Path = { "CurrentRun", "CurrentRoom", "Encounter", "Name" },
					IsNone = {
						"ThanatosTartarus",
						"ThanatosAsphodel",
						"ThanatosElysium",
						"ThanatosElysiumIntro",
					},
				},
			},
			AssistPresentationPortrait = "Portrait_Thanatos_Default_01",
			AssistPresentationPortraitOffsetY = 45,
			AssistPresentationColor = { 200, 0, 255, 255 },
		},
		AssistDamage = 4000,
		RemainingUses = { BaseValue = 1 },
		DoesNotAutomaticallyExpire = true,
		ExtractValues = {
			{
				Key = "AssistDamage",
				ExtractAs = "TooltipDamage",
			},
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		SignOffData = {
			{
				GameStateRequirements = {
					{
						Path = { "GameState", "TextLinesRecord" },
						HasAny = {
							"BecameCloseWithThanatos01Than_GoToHim",
							"BecameCloseWithThanatos01_BThan_GoToHim",
						},
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasNone = {
							"BecameCloseWithThanatos01Than_BackOff",
							"BecameCloseWithThanatos01_BThan_BackOff",
						},
					},
				},
				Text = "ThanatosSignoff_AssistMax_A",
			},
			{
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "ThanatosGift10" },
					},
					{
						Path = { "GameState", "TextLinesRecord" },
						HasNone = {
							"BecameCloseWithThanatos01Than_GoToHim",
							"BecameCloseWithThanatos01_BThan_GoToHim",
						},
					},
				},
				Text = "ThanatosSignoff_AssistMax_B",
			},
			{
				Text = "ThanatosSignoff",
			},
		},
	},
	SisyphusAssistTrait = {
		InheritFrom = { "AssistTrait" },
		InRackTitle = "SisyphusAssistTrait_Rack",
		InRackIcon = "Keepsake_Sisiyphus_Plush_Menu",
		Icon = "Keepsake_Sisiyphus_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSisyphusLegendary",
		KeepsakeRarityGameStateRequirements = {
			{ AssistUpgradeLevel = { Name = "SisyphusAssistTrait", Level = 0, }, },
			{ AssistUpgradeLevel = { Name = "SisyphusAssistTrait", Level = 1, }, },
			{ AssistUpgradeLevel = { Name = "SisyphusAssistTrait", Level = 2, }, },
			{ AssistUpgradeLevel = { Name = "SisyphusAssistTrait", Level = 3, }, },
			{ AssistUpgradeLevel = { Name = "SisyphusAssistTrait", Level = 4, }, },
		},
		ModsNikkelMHadesBiomesUpgradeCosts = {
			{
				ModsNikkelMHadesBiomes_OreTartarus = 3,
				GiftPoints = 2
			},
			{
				ModsNikkelMHadesBiomes_OreElysium = 3,
				GiftPoints = 3
			},
			{
				ModsNikkelMHadesBiomes_OreStyx = 5,
				SuperGiftPoints = 1
			},
			{
				ModsNikkelMHadesBiomes_OreAsphodel = 5,
				ModsNikkelMHadesBiomes_BossResourceTartarus = 3,
				SuperGiftPoints = 2,
			},
		},
		SpeakerNames = { "Sisyphus" },
		PreEquipWeapons = { "NPC_Sisyphus_01_Assist" },
		AddAssist = {
			FunctionName = _PLUGIN.guid .. "." .. "SisyphusLootSprinkle",
			SisyphusWeapon = "NPC_Sisyphus_01_Assist",
			LootOptions = {
				{
					Name = "RoomMoneySmallDrop",
					MinAmount = 1,
					MaxAmount = 1,
				},
				{
					Name = "HealDropMinor",
					MinAmount = 4,
					MaxAmount = 4,
				},
				{
					Name = "MetaCurrencyDrop",
					MinAmount = 1,
					MaxAmount = 1,
				},
			},
			Range = 80,
			TargetRange = 2000,
			ForceMin = 200,
			ForceMax = 350,
			ForceToValidLocation = true,
			KeepCollision = true,
			GameStateRequirements = {},
			AssistPresentationPortrait = "Portrait_Sisyphus_Default_01",
			AssistPresentationColor = { 110, 255, 0, 255 },
			AssistPresentationPortraitOffsetY = 35,
		},
		AssistDamage = 1300,
		RemainingUses = { BaseValue = 1 },
		DoesNotAutomaticallyExpire = true,
		ExtractValues = {
			{
				Key = "AssistDamage",
				ExtractAs = "TooltipDamage",
			},
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		SignOffData = {
			{
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "SisyphusGift09_A" },
					},
				},
				Text = "SisyphusBouldySignoff_AssistMax",
			},
			{
				Text = "SisyphusBouldySignoff",
			},
		},
	},
	SkellyAssistTrait = {
		InheritFrom = { "AssistTrait" },
		InRackTitle = "SkellyAssistTrait_Rack",
		InRackIcon = "Keepsake_Skelly_Plush_Menu",
		Icon = "Keepsake_Skelly_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSkellyLegendary",
		KeepsakeRarityGameStateRequirements = {
			{ AssistUpgradeLevel = { Name = "SkellyAssistTrait", Level = 0, }, },
			{ AssistUpgradeLevel = { Name = "SkellyAssistTrait", Level = 1, }, },
			{ AssistUpgradeLevel = { Name = "SkellyAssistTrait", Level = 2, }, },
			{ AssistUpgradeLevel = { Name = "SkellyAssistTrait", Level = 3, }, },
			{ AssistUpgradeLevel = { Name = "SkellyAssistTrait", Level = 4, }, },
		},
		ModsNikkelMHadesBiomesUpgradeCosts = {
			{
				ModsNikkelMHadesBiomes_OreAsphodel = 3,
				GiftPoints = 2
			},
			{
				ModsNikkelMHadesBiomes_OreStyx = 3,
				GiftPoints = 3
			},
			{
				ModsNikkelMHadesBiomes_OreElysium = 5,
				SuperGiftPoints = 1
			},
			{
				ModsNikkelMHadesBiomes_OreTartarus = 5,
				ModsNikkelMHadesBiomes_BossResourceStyx = 3,
				SuperGiftPoints = 2,
			},
		},
		SpeakerNames = { "Modsnikkelmhadesbiomesskelly" },
		AddAssist = {
			FunctionName = _PLUGIN.guid .. "." .. "SkellyAssist",
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "CurrentRoom", "Name" },
					IsNone = { "CharonFight01" },
				},
			},
			AssistPresentationPortrait = "ModsNikkelMHadesBiomes_Portrait_Skelly_Default_01",
			AssistPresentationColor = { 96, 64, 255, 255 },
			AssistPresentationPortraitOffsetY = 35,
		},
		RemainingUses = { BaseValue = 1 },
		DoesNotAutomaticallyExpire = true,
		ExtractHealth = 300,
		ExtractValues = {
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
			{
				Key = "ExtractHealth",
				ExtractAs = "TooltipHealth",
			},
		},
		SignOffData = {
			{
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "SkellyGift09" },
					},
				},
				Text = "SkellySignoff_AssistMax",
			},
			{
				Text = "SkellySignoff",
			},
		},
	},
	DusaAssistTrait = {
		InheritFrom = { "AssistTrait" },
		InRackTitle = "DusaAssistTrait_Rack",
		InRackIcon = "Keepsake_Dusa_Plush_Menu",
		Icon = "Keepsake_Dusa_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeDusaLegendary",
		KeepsakeRarityGameStateRequirements = {
			{ AssistUpgradeLevel = { Name = "DusaAssistTrait", Level = 0, }, },
			{ AssistUpgradeLevel = { Name = "DusaAssistTrait", Level = 1, }, },
			{ AssistUpgradeLevel = { Name = "DusaAssistTrait", Level = 2, }, },
			{ AssistUpgradeLevel = { Name = "DusaAssistTrait", Level = 3, }, },
			{ AssistUpgradeLevel = { Name = "DusaAssistTrait", Level = 4, }, },
		},
		ModsNikkelMHadesBiomesUpgradeCosts = {
			{
				ModsNikkelMHadesBiomes_PlantTartarus = 2,
				GiftPoints = 2
			},
			{
				ModsNikkelMHadesBiomes_PlantElysium = 2,
				GiftPoints = 3
			},
			{
				ModsNikkelMHadesBiomes_PlantStyx = 3,
				SuperGiftPoints = 1
			},
			{
				ModsNikkelMHadesBiomes_PlantAsphodel = 3,
				ModsNikkelMHadesBiomes_BossResourceElysium = 3,
				SuperGiftPoints = 2,
			},
		},
		AddAssist = {
			FunctionName = _PLUGIN.guid .. "." .. "DusaAssist",
			Duration = 30,
			GameStateRequirements = {
				{
					PathFalse = { "CurrentRun", "CurrentRoom", "BlockHadesAssistTraits" },
				},
			},
			AssistPresentationPortrait = "Portrait_Dusa_Confident_01",
			AssistPresentationColor = { 255, 50, 240, 255 },
		},
		RemainingUses = { BaseValue = 1 },
		DoesNotAutomaticallyExpire = true,
		AssistDuration = 30,
		ExtractValues = {
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
			{
				Key = "AssistDuration",
				ExtractAs = "TooltipDuration",
			},
		},
		SignOffData = {
			{
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "BecameCloseWithDusa01" },
					},
				},
				Text = "DusaSignoff_AssistMax",
			},
			{
				Text = "DusaSignoff",
			},
		},
	},
}

mod.AddTableKeysSkipDupes(game.TraitData, newTraitData)
