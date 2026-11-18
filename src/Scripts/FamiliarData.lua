-- #region New Mod Familiars
local snakeFamiliarData = {
	ModsNikkelMHadesBiomesSnakeFamiliar = {
		InheritFrom = { "BaseFamiliar", },
		GameStateRequirements = {
			Force = true,
		},

		AIOptions = { _PLUGIN.guid .. "." .. "SnakeFamiliarAI", },
		InitialAttackDelay = 0.5,
		PreAttackDuration = 0.33,
		FireDuration = 0.77,
		PostAttackDuration = 1.25,
		PostAttackBurrowDelayMin = 3.0,
		PostAttackBurrowDelayMax = 6.0,
		BurrowDuration = 0.34,
		HiddenDurationMin = 0.8,
		HiddenDurationMax = 1.8,
		UnburrowDuration = 0.42,
		PostUnburrowDurationMin = 0.55,
		PostUnburrowDurationMax = 0.65,

		ActivatePresentationFunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarSpawnPresentation",
		MoveFunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarMoveToLocation",
		StopAIFunctionName = _PLUGIN.guid .. "." .. "SnakeFamiliarStopAI",

		GrannyTexture = "GR2/DraconTyphon_Color",
		IdleAnimation = "Enemy_DragonBurrower_Idle",
		HappyAnimation = "Enemy_DragonBurrower_Idle",
		FleeAnimation = "Enemy_DragonBurrower_Burrow",
		StartNewRunAnimation = "Enemy_DragonBurrower_Burrow",
		TurnInPlaceAnimation = "Enemy_DragonBurrower_Idle",

		HiddenAnimation = "Enemy_DragonBurrower_Hidden",
		SpawnAnimation = "Enemy_DragonBurrower_Spawn",
		BurrowAnimation = "Enemy_DragonBurrower_Burrow",
		UnburrowAnimation = "Enemy_DragonBurrower_Unburrow",
		PreAttackAnimation = "Enemy_DragonBurrower_RangedPreFire",
		SingleFireAnimation = "Enemy_DragonBurrower_RangedFire_Single",
		TripleFireAnimation = "Enemy_DragonBurrower_RangedFire_Triple",
		PostAttackAnimation = "Enemy_DragonBurrower_RangedPostFire",
		OnHitAnimation = "Enemy_DragonBurrower_OnHit",
		OnHitHeavyAnimation = "Enemy_DragonBurrower_OnHit_Heavy",
		SpawnFx = "DragonBurrowerBurrowFxActivate",
		BurrowFx = "DragonBurrowerBurrowFxOut",
		BurrowPersistentFx = "DragonBurrowerBurrowFxPersistent",
		BurrowSound = "/SFX/Enemy Sounds/RangedBurrower/DraconSubmerge",

		Using = {
			GrannyModel = { "Dracon_Mesh", },
		},
	},
}
mod.AddTableKeysSkipDupes(game.FamiliarData, snakeFamiliarData)
mod.AddTableKeysSkipDupes(game.EnemyData, snakeFamiliarData)
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
