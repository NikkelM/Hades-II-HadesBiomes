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

	-- #region Megaera
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
	-- #endregion

	-- #region Sisyphus
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
	-- #endregion
}

mod.AddTableKeysSkipDupes(game.TraitData, newTraitData)
