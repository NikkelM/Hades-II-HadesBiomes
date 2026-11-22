-- #region New Mod Familiars
-- #region SnakeFamiliar/Ophis
-- #region Familiar definition
local snakeFamiliarData = {
	-- Ophis
	ModsNikkelMHadesBiomesSnakeFamiliar = {
		InheritFrom = { "BaseFamiliar", },
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "FamiliarsUnlocked", "ModsNikkelMHadesBiomesSnakeFamiliar" },
			},
		},

		-- AI
		AIOptions = { _PLUGIN.guid .. "." .. "SnakeFamiliarAI", },
		InitialAttackDelay = 0.5,
		AttackMinDuration = 7.5,
		AttackMaxDuration = 8.5,
		DartCount = 3,
		ProjectileInterval = 0.25,
		OutgoingDamageModifiers = {
			{
				PlayerMultiplier = 0,
			},
		},
		StopAIOnRunClear = true,
		TargetSearchDistance = 1800,
		TargetDistanceMin = 450,
		TargetDistancePreferred = 650,
		TargetDistanceMax = 850,
		HeroDistanceMin = 200,
		HeroDistanceMax = 900,
		TargetRetryInterval = 0.2,
		PreAttackDuration = 0.33,
		FireDuration = 0.77,
		PostAttackDuration = 1.25,
		PostAttackBurrowDelayMin = 3.0,
		PostAttackBurrowDelayMax = 6.0,
		BurrowDuration = 0.34,
		UnburrowDuration = 0.42,
		PostUnburrowDurationMin = 0.55,
		PostUnburrowDurationMax = 0.65,

		-- Animations
		IdleAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",
		HappyAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",
		PetAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_Pet",
		FleeAnimation = "Enemy_DragonBurrower_Burrow",
		StartNewRunAnimation = "Enemy_DragonBurrower_Burrow",
		HiddenAnimation = "Enemy_DragonBurrower_Hidden",
		BurrowAnimation = "Enemy_DragonBurrower_Burrow",
		UnburrowAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_Unburrow",
		PreAttackAnimation = "Enemy_DragonBurrower_RangedPreFire",
		TripleFireAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_RangedFire_Triple",
		PostAttackAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_RangedPostFire",
		VictoryAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_VictoryRecovery",
		VictoryRecoveryDuration = 1.6,

		-- Equipping
		KitAngle = 235,
		ModsNikkelMHadesBiomes_CrossroadsKit = {
			SpawnArgs = {
				Name = "FamiliarKit",
				Group = "Terrain_01_Decor02",
				LocationX = 4251,
				LocationY = 6473,
			},
			Decorations = {
				{
					SpawnArgs = {
						Name = "CrossroadsTerrainDecorativeCircle01",
						Group = "Terrain_01_Decor01",
						LocationX = 4255,
						LocationY = 6475,
					},
					Scale = 0.147,
					Color = { 145, 117, 189, 255 },
					HSV = { 0.007, -0.097, 0 },
					Ambient = 1.0,
				},
				{
					SpawnArgs = {
						Name = "CrossroadsTerrainMoonFull01",
						Group = "Terrain_01_Decor01",
						LocationX = 4251,
						LocationY = 6475,
					},
					Scale = 0.188,
				},
			},
		},

		-- Events
		EncounterEndEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarVictoryPresentation",
				Threaded = true,
			},
		},
		LeaveEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarRoomExitPresentation",
				Threaded = true,
			},
		},

		-- Functions
		ActivatePresentationFunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarSpawnPresentation",
		MoveFunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarMoveToLocation",
		StopAIFunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarStopAI",
		TurnInPlaceAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",

		-- Gifting / Recruiting / Costuming
		DefaultCostume = "ModsNikkelMHadesBiomes_FamiliarCostume_SnakeDefault",
		FamiliarScreenAnimationName = "ModsNikkelMHadesBiomes_FamiliarScreenSnakeIn",
		FamiliarScreenAnimationOutName = "ModsNikkelMHadesBiomes_FamiliarScreenSnakeOut",
		GiftFunctionName = "FamiliarRecruitPresentation",
		GiftFunctionArgs = {
			Text = "ModsNikkelMHadesBiomesSnakeFamiliar",
			-- TODO: Replace with proper icon
			Icon = "FamiliarIcon_Frog",
			UnlockStartAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_Pet",
			UnlockEndAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_VictoryRecovery",
			UnlockExitAnimation = "Enemy_DragonBurrower_Burrow",
		},
		GiftGameStateRequirements = {
			{
				PathTrue = { "GameState", "SpecialInteractRecord", "ModsNikkelMHadesBiomesSnakeFamiliar" },
			},
		},
		SetupEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarSetupCostume",
				GameStateRequirements = {
					{
						PathFalse = { "MapState", "CosmeticPresentationActive" },
					},
				},
			},
			{
				-- Ophis not fully upgraded
				FunctionName = "OverwriteSelf",
				Args = {
					GiftFunctionName = "GiftFamiliarUpgrade",
					UseTextGift = "FamiliarUseTextGift",
					UseTextGiftAndSpecial = "RavenFamiliarUseTextGiftAndSpecial",
					GiftGameStateRequirements = {
						{
							PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeFamiliarUpgradeSystem" },
						},
					},
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "FamiliarsUnlocked", "ModsNikkelMHadesBiomesSnakeFamiliar" },
					},
					NamedRequirementsFalse = { "ModsNikkelMHadesBiomes_HasAllSnakeUpgrades" },
				},
			},
			{
				-- Ophis fully upgraded
				FunctionName = "OverwriteSelf",
				Args = {
					ReceiveGiftFunctionName = "GiftFamiliarCostume",
					UseTextGift = "RavenFamiliarUseTextCostume",
					UseTextTalkAndGift = "RavenFamiliarUseTextTalkAndCostume",
					UseTextGiftAndSpecial = "RavenFamiliarUseTextCostumeAndSpecial",
					UseTextTalkGiftAndSpecial = "RavenFamiliarUseTextTalkCostumeAndSpecial",
					GiftGameStateRequirements = {
						{
							PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeFamiliarCostumeSystem" },
						},
					},
				},
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "FamiliarsUnlocked", "ModsNikkelMHadesBiomesSnakeFamiliar" },
					},
					NamedRequirements = { "ModsNikkelMHadesBiomes_HasAllSnakeUpgrades" },
				},
			},
		},

		-- Interaction
		InteractVoiceLines = {
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				PlayOnce = true,
				PlayOnceContext = "ModsNikkelMHadesBiomes_SnakeFirstApproach",
				GameStateRequirements = {
					{
						PathFalse = { "CurrentRun", "Hero", "IsDead" },
					},
				},
				{ Cue = "/VO/Melinoe_3865", Text = "You're an unusual fellow.", },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				GameStateRequirements = {
					{
						PathFalse = { "CurrentRun", "Hero", "IsDead" },
					},
				},
				{ Cue = "/VO/Melinoe_1961", Text = "{#Emph}Huh..." },
				{ Cue = "/VO/Melinoe_0578", Text = "{#Emph}Hrm." },
				{ Cue = "/VO/Melinoe_3865", Text = "You're an unusual fellow.", },
				{ Cue = "/VO/Melinoe_3866", Text = "You're always here..." },
				{ Cue = "/VO/Melinoe_3966", Text = "Feeling feisty, are we...?" },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				GameStateRequirements = {
					{
						PathTrue = { "CurrentRun", "Hero", "IsDead" },
					},
				},
				{ Cue = "/VO/Melinoe_3400", Text = "Hey..." },
				{ Cue = "/VO/Melinoe_3402", Text = "{#Emph}<Chuckle>" },
				{ Cue = "/VO/Melinoe_3787", Text = "It's going to be all right." },
				{ Cue = "/VO/Melinoe_3779", Text = "You're all right." },
				{ Cue = "/VO/Melinoe_3965", Text = "Thanks for watching out for me." },
				{ Cue = "/VO/Melinoe_3966", Text = "Feeling feisty, are we...?" },
				{ Cue = "/VO/Melinoe_3967", Text = "Up for another journey?" },
			},
		},

		-- TODO:
		-- Map Marker
		-- MarkerIdleAnimation = "FrogMarkerIdle",
		-- MarkerJumpAnimation = "FrogMarkerJump",
		-- MarkerModel = "FrogMarker_Mesh",
		-- MarkerMoveAnimation = "FrogMarkerMove",

		-- Sounds
		BurrowSound = "/SFX/Enemy Sounds/RangedBurrower/DraconSubmerge",

		-- Teleport VFX
		SkipFleeTeleportVfx = true,
		BurrowFx = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxOut",
		BurrowPersistentFx = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxPersistent",

		-- Text
		AlwaysShowDefaultUseText = true,
		UseTextGift = "RavenFamiliarUseTextGift_First",
		UseTextGiftAndSpecial = "RavenFamiliarUseTextGiftAndSpecial_First",
		UseTextSpecial = "RavenFamiliarUseTextSpecial",
		UseTextTalkAndGift = "FamiliarUseTextTalkAndGift",
		UseTextTalkAndSpecial = "RavenFamiliarUseTextTalkAndSpecial",
		UseTextTalkGiftAndSpecial = "RavenFamiliarUseTextTalkGiftAndSpecial",

		-- Traits
		TraitNames = {
			"ModsNikkelMHadesBiomesSnakeDamageResistanceBonus",
			"ModsNikkelMHadesBiomesSnakeGoldBonus",
			"ModsNikkelMHadesBiomesSnakePoisonStacks",
		},

		-- Usings
		Using = {
			Projectile = "ModsNikkelMHadesBiomesSnakeDart",
			GrannyModel = { "Dracon_Mesh", },
		},
	},
}
game.OverwriteTableKeys(game.FamiliarData, snakeFamiliarData)
game.OverwriteTableKeys(game.EnemyData, snakeFamiliarData)
table.insert(game.FamiliarOrderData, "ModsNikkelMHadesBiomesSnakeFamiliar")
-- #endregion

-- #region SnakeFamiliar Traits
game.OverwriteTableKeys(game.TraitData, {
	ModsNikkelMHadesBiomesSnakeDamageResistanceBonus = {
		InheritFrom = { "FamiliarTrait", },
		-- TODO: Replace with proper icon
		Icon = "FamiliarIcon_Frog",
		-- TODO: Test
		CirceBonusStacks = 2,
		AddIncomingDamageModifiers = {
			HealthOnly = true,
			NonTrapDamageTakenMultiplier = {
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				AbsoluteStackValues = {
					[1] = 0.99,
				},
			},
			ReportValues = { ReportedDamageResistance = "NonTrapDamageTakenMultiplier" },
		},
		ExtractValues = {
			{
				Key = "ReportedDamageResistance",
				ExtractAs = "DamageResistance",
				Format = "NegativePercentDelta",
			},
		},
	},
	ModsNikkelMHadesBiomesSnakeGoldBonus = {
		Hidden = true,
		MoneyMultiplier = {
			BaseValue = 1.02,
			SourceIsMultiplier = true,
			AbsoluteStackValues = {
				[1] = 1.01,
			},
		},
		ExtractValues = {
			{
				Key = "MoneyMultiplier",
				ExtractAs = "MoneyRewardIncrease",
				Format = "PercentDelta",
			},
		},
	},
	ModsNikkelMHadesBiomesSnakePoisonStacks = {
		Hidden = true,
		ModsNikkelMHadesBiomesSnakeVenomStacksPerHit = {
			BaseValue = 1,
			AbsoluteStackValues = {
				[1] = 1,
				[2] = 1,
				[3] = 1,
			},
			AsInt = true,
		},
		ModsNikkelMHadesBiomesSnakeVenomDuration = {
			BaseValue = 4,
			AbsoluteStackValues = {
				[1] = 2,
				[2] = 2,
				[3] = 2,
			},
		},
		ExtractValues = {
			{
				Key = "ModsNikkelMHadesBiomesSnakeVenomStacksPerHit",
				ExtractAs = "VenomStacksPerHit",
			},
			{
				Key = "ModsNikkelMHadesBiomesSnakeVenomDuration",
				ExtractAs = "VenomDuration",
			},
		},
	},
})
-- #endregion

-- #region SnakeFamiliar Upgrades
game.GameData.AllSnakeFamiliarUpgrades = {
	"ModsNikkelMHadesBiomesSnakeBloodBond",
	"ModsNikkelMHadesBiomesSnakeBloodBond2",
	"ModsNikkelMHadesBiomesSnakeBloodBond3",
	"ModsNikkelMHadesBiomesSnakeProsperousBond",
	"ModsNikkelMHadesBiomesSnakeProsperousBond2",
	"ModsNikkelMHadesBiomesSnakeProsperousBond3",
	"ModsNikkelMHadesBiomesSnakeToxicBond",
	"ModsNikkelMHadesBiomesSnakeToxicBond2",
	"ModsNikkelMHadesBiomesSnakeToxicBond3",
}

game.OverwriteTableKeys(game.FamiliarShopItemData, {
	ModsNikkelMHadesBiomesBaseSnakeUpgrade = {
		DebugOnly = true,
		FamiliarName = "ModsNikkelMHadesBiomesSnakeFamiliar",
	},
	-- Damage Resistance
	ModsNikkelMHadesBiomesSnakeBloodBond = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseSnakeUpgrade" },
		Icon = "ModsNikkelMHadesBiomes_FamiliarShopIcon_SnakeBloodBond",
		ShowLastInGroup = "ModsNikkelMHadesBiomesSnakeBloodBond",
		IncreaseTraitLevel = "ModsNikkelMHadesBiomesSnakeDamageResistanceBonus",
	},
	ModsNikkelMHadesBiomesSnakeBloodBond2 = {
		InheritFrom = { "ModsNikkelMHadesBiomesSnakeBloodBond" },
		RarityLevel = 2,
		GameStateRequirements = {
			{ PathTrue = { "GameState", "FamiliarUpgrades", "ModsNikkelMHadesBiomesSnakeBloodBond" } },
		},
	},
	ModsNikkelMHadesBiomesSnakeBloodBond3 = {
		InheritFrom = { "ModsNikkelMHadesBiomesSnakeBloodBond" },
		RarityLevel = 3,
		GameStateRequirements = {
			{ PathTrue = { "GameState", "FamiliarUpgrades", "ModsNikkelMHadesBiomesSnakeBloodBond2" } },
		},
	},
	-- Bonus Gold
	ModsNikkelMHadesBiomesSnakeProsperousBond = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseSnakeUpgrade" },
		Icon = "ModsNikkelMHadesBiomes_FamiliarShopIcon_SnakeProsperousBond",
		ShowLastInGroup = "ModsNikkelMHadesBiomesSnakeProsperousBond",
		IncreaseTraitLevel = "ModsNikkelMHadesBiomesSnakeGoldBonus",
	},
	ModsNikkelMHadesBiomesSnakeProsperousBond2 = {
		InheritFrom = { "ModsNikkelMHadesBiomesSnakeProsperousBond" },
		RarityLevel = 2,
		GameStateRequirements = {
			{ PathTrue = { "GameState", "FamiliarUpgrades", "ModsNikkelMHadesBiomesSnakeProsperousBond" } },
		},
	},
	ModsNikkelMHadesBiomesSnakeProsperousBond3 = {
		InheritFrom = { "ModsNikkelMHadesBiomesSnakeProsperousBond" },
		RarityLevel = 3,
		GameStateRequirements = {
			{ PathTrue = { "GameState", "FamiliarUpgrades", "ModsNikkelMHadesBiomesSnakeProsperousBond2" } },
		},
	},
	-- Poison/Slow Stacks
	ModsNikkelMHadesBiomesSnakeToxicBond = {
		InheritFrom = { "ModsNikkelMHadesBiomesBaseSnakeUpgrade" },
		Icon = "ModsNikkelMHadesBiomes_FamiliarShopIcon_SnakeToxicBond",
		ShowLastInGroup = "ModsNikkelMHadesBiomesSnakeToxicBond",
		IncreaseTraitLevel = "ModsNikkelMHadesBiomesSnakePoisonStacks",
	},
	ModsNikkelMHadesBiomesSnakeToxicBond2 = {
		InheritFrom = { "ModsNikkelMHadesBiomesSnakeToxicBond" },
		RarityLevel = 2,
		GameStateRequirements = {
			{ PathTrue = { "GameState", "FamiliarUpgrades", "ModsNikkelMHadesBiomesSnakeToxicBond" } },
		},
	},
	ModsNikkelMHadesBiomesSnakeToxicBond3 = {
		InheritFrom = { "ModsNikkelMHadesBiomesSnakeToxicBond" },
		RarityLevel = 3,
		GameStateRequirements = {
			{ PathTrue = { "GameState", "FamiliarUpgrades", "ModsNikkelMHadesBiomesSnakeToxicBond2" } },
		},
	},
})
game.ConcatTableValuesIPairs(game.ScreenData.FamiliarShop.ItemOrder, game.GameData.AllSnakeFamiliarUpgrades)
-- #endregion
-- #endregion
-- #endregion

-- #region Frinos
-- #region InteractVoiceLines in the tent
local frinosPetVoiceLines = game.FamiliarData.FrogFamiliar.InteractVoiceLines
mod.ReplaceVoiceLineRequirements(frinosPetVoiceLines, "/VO/Melinoe_5201", {
	{
		PathTrue = { "GameState", "ReachedTrueEnding" },
	},
	{
		Path = { "CurrentRun", "RoomsEntered" },
		HasNone = { "D_Boss01" },
	},
})
mod.ReplaceVoiceLineRequirements(frinosPetVoiceLines, "/VO/Melinoe_5202", {
	{
		PathTrue = { "GameState", "ReachedTrueEnding" },
	},
	{
		Path = { "CurrentRun", "RoomsEntered" },
		HasNone = { "D_Boss01" },
	},
})
mod.ReplaceVoiceLineRequirements(frinosPetVoiceLines, "/VO/Melinoe_2847", {
	{
		Path = { "CurrentRun", "RoomsEntered" },
		HasAny = { "I_Boss01", "D_Boss01" },
	},
})
mod.ReplaceVoiceLineRequirements(frinosPetVoiceLines, "/VO/Melinoe_2849", {
	{
		Path = { "CurrentRun", "RoomsEntered" },
		HasAny = { "I_Boss01", "D_Boss01" },
	},
})
mod.ReplaceVoiceLineRequirements(frinosPetVoiceLines, "/VO/Melinoe_0090", {
	{
		Path = { "CurrentRun", "CurrentRoom", "Name", },
		IsNone = { "F_Boss01", "F_Boss02" },
	},
	{
		Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName", },
		IsNone = { "A_Boss01", "A_Boss02", "A_Boss03", "X_Boss01", "X_Boss02" },
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "H", "I", "N", "Tartarus", "Asphodel" },
	},
	{
		Path = { "CurrentRun" },
		HasNone = { "Cleared", "BountyCleared" }
	},
})
-- #endregion
-- #endregion
