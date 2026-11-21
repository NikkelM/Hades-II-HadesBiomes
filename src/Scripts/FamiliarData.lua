-- #region New Mod Familiars
-- #region SnakeFamiliar/Ophis
-- #region Familiar definition
local snakeFamiliarData = {
	ModsNikkelMHadesBiomesSnakeFamiliar = {
		InheritFrom = { "BaseFamiliar", },
		GameStateRequirements = {
			Force = true,
		},

		AIOptions = { _PLUGIN.guid .. "." .. "SnakeFamiliarAI", },
		InitialAttackDelay = 0.5,
		AttackMinDuration = 7.5,
		AttackMaxDuration = 8.5,
		DartCount = 3,
		ProjectileInterval = 0.25,
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
		OutgoingDamageModifiers = {
			{
				PlayerMultiplier = 0,
			},
		},
		StopAIOnRunClear = true,

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

		ActivatePresentationFunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarSpawnPresentation",
		MoveFunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarMoveToLocation",
		StopAIFunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarStopAI",

		AlwaysShowDefaultUseText = true,
		CanReceiveGift = false,
		FamiliarScreenAnimationName = "Codex_Portrait_DragonBurrowerTyphon",
		FamiliarScreenAnimationOutName = "Blank",
		KitAngle = 235,
		ModsNikkelMHadesBiomes_CrossroadsKit = {
			SpawnArgs = {
				Name = "FamiliarKit",
				Group = "Terrain_01_Decor02",
				LocationX = 4253,
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
		TraitNames = {
			"ModsNikkelMHadesBiomesSnakeDamageResistanceBonus",
			"ModsNikkelMHadesBiomesSnakeGoldBonus",
			"ModsNikkelMHadesBiomesSnakePoisonStacks",
		},

		GrannyTexture = "ModsNikkelMHadesBiomesSnakeFamiliar/SnakeFamiliar_Color",
		IdleAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",
		HappyAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",
		FleeAnimation = "Enemy_DragonBurrower_Burrow",
		StartNewRunAnimation = "Enemy_DragonBurrower_Burrow",
		TurnInPlaceAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",

		HiddenAnimation = "Enemy_DragonBurrower_Hidden",
		BurrowAnimation = "Enemy_DragonBurrower_Burrow",
		UnburrowAnimation = "Enemy_DragonBurrower_Unburrow",
		PreAttackAnimation = "Enemy_DragonBurrower_RangedPreFire",
		VictoryAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_VictoryRecovery",
		VictoryRecoveryDuration = 1.6,
		TripleFireAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_RangedFire_Triple",
		PostAttackAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_RangedPostFire",
		BurrowFx = "DragonBurrowerBurrowFxOut",
		BurrowPersistentFx = "DragonBurrowerBurrowFxPersistent",
		BurrowSound = "/SFX/Enemy Sounds/RangedBurrower/DraconSubmerge",

		Using = {
			GrannyModel = { "Dracon_Mesh", },
			Projectile = "ModsNikkelMHadesBiomesSnakeDart",
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
		Icon = "Codex_Portrait_DragonBurrowerTyphon",
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
