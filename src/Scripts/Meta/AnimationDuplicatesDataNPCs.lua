-- Defines animation names that already exist in Hades II and should therefore be skipped when the Hades NPC Character animations are imported

-- The path relative to the Hell2Modding-SJSON/ data directory
mod.HadesCharacterAnimationsNPCsSjsonDataPath = "Animations\\Z_ModsNikkelmHadesBiomesCharacterAnimationsNPCs.sjson"

-- Duplicate Fx animation, saved here due to the animations not being hooked, but copied directly
mod.HadesCharacterAnimationsNPCsDuplicates = {
	["BouldyIdle"] = true,
	["3DGhostIdleRandomHeadTurn"] = true,
	["AsphodelGhostIdle"] = true,
	["BartenderGhostIdle"] = true,
	["AdminGhostIdle"] = true,
	["WorkerGhostIdle"] = true,
	["BigGhostIdle"] = true,
	["BrokerGhostIdle"] = true,
	["ElysiumGhostIdle"] = true,
	["SmallGhostIdle"] = true,
	["TallGhostIdle"] = true,
	["Critter_MouseBounce"] = true,
	["Critter_MouseScurry"] = true,
}

mod.HadesCharacterAnimationsNPCsAdditions = {
	-- #region Assists
	{
		Name = "ModsNikkelMHadesBiomesEnemyActivationFadeInDusaContainer",
		InheritFrom = "EnemyActivationFadeInContainer",
		ChildAnimation = "ModsNikkelMHadesBiomesEnemyActivationFadeInDusa",
		EndFrame = 1,
		StartFrame = 1,
	},
	{
		Name = "ModsNikkelMHadesBiomesEnemyActivationFadeInDusa",
		InheritFrom = "EnemyActivationFadeIn",
		ChainTo = "ModsNikkelMHadesBiomesEnemyActivationDusaFade",
		EndFrame = 1,
		StartFrame = 1,
	},
	{
		Name = "ModsNikkelMHadesBiomesEnemyActivationDusaFade",
		InheritFrom = "NPCDusaIdle",
		ChainTo = "ModsNikkelMHadesBiomesEnemyActivationDusaFlash",
		EndAlpha = 1.0,
		DurationFrames = 24,
		EndFrame = 1,
		Loop = false,
		LoopFramesOnly = true,
		StartFrame = 1,
		Color = { Red = 0.0, Green = 0.0, Blue = 0.0 },
	},
	{
		Name = "ModsNikkelMHadesBiomesEnemyActivationDusaFlash",
		InheritFrom = "NPCDusaIdle",
		AddColor = true,
		StartBlue = 1.0,
		StartGreen = 1.0,
		StartRed = 1.0,
		DurationFrames = 8,
		EaseIn = 0.9,
		EaseOut = 1.0,
		EndFrame = 1,
		HoldLastFrame = true,
		Loop = false,
		LoopFramesOnly = true,
		StartFrame = 1,
	},
	-- #endregion
}
