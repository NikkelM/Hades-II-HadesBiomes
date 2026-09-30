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
		ActiveSlotOffsetIndex = 1,
		FrameRarities = {
			Common = "Frame_Keepsake_Rank1",
		},
		KeepsakeRarityGameStateRequirements = {
			{},
		},
		ChamberThresholds = mod.NilValue,
		RecordCacheOnEquip = mod.NilValue,
		CustomRarityLevels = {
			"LegendaryKeepsake_Level_1",
		},
		RarityLevels = {
			Common = {
				Multiplier = 1,
			},
		},
	},
	FuryAssistTrait = {
		InheritFrom = { "AssistTrait" },
		InRackTitle = "FuryAssistTrait_Rack",
		InRackIcon = "Keepsake_Meg_Plush_Menu",
		Icon = "Keepsake_Meg_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeMegLegendary",
		SpeakerNames = { "MegaeraField" },
		PreEquipWeapons = { "NPC_FurySister_01_Assist" },
		AddAssist = {
			WeaponName = "NPC_FurySister_01_Assist",
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
		AssistDamage = 2500,
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
		SpeakerNames = { "Modsnikkelmhadesbiomesachilles", "Patroclus" },
		PreEquipWeapons = { "NPC_Achilles_01_Assist", "NPC_Patroclus_01_Assist" },
		AddAssist = {
			FunctionName = _PLUGIN.guid .. "." .. "AchillesPatroclusAssist",
			AssistWeapons = { "NPC_Achilles_01_Assist", "NPC_Patroclus_01_Assist" },
			Range = 1500,
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
		AssistDamage = 1500,
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
		SpeakerNames = { "Thanatos", "ThanatosField" },
		PreEquipWeapons = { "NPC_Thanatos_01_Assist" },
		AddAssist = {
			WeaponName = "NPC_Thanatos_01_Assist",
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
		AssistDamage = 3500,
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
			ForceMin = 200,
			ForceMax = 350,
			ForceToValidLocation = true,
			KeepCollision = true,
			GameStateRequirements = {},
			AssistPresentationPortrait = "Portrait_Sisyphus_Default_01",
			AssistPresentationColor = { 110, 255, 0, 255 },
			AssistPresentationPortraitOffsetY = 35,
		},
		AssistDamage = 1000,
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
}

mod.AddTableKeysSkipDupes(game.TraitData, newTraitData)
