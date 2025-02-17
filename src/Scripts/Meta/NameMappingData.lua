-- Some names or Ids from Hades are reused in Hades II for something similar or different
-- These names need to be changed in order to avoid conflicts and to use both versions alongside each other

-- Enemies that exist in both games
mod.EnemyNameMappings = {
	BaseVulnerableEnemy = "HadesBaseVulnerableEnemy",

	LightRanged = "HadesLightRanged",
	Swarmer = "HadesSwarmer",
	ThiefMineLayer = "HadesThiefMineLayer",
}

mod.EnemyProjectileMappings = {
	-- Not currently used by Hades II
	-- LightRangedWeapon = "HadesLightRangedWeapon",
	-- The two versions have different PressedIn/Out animations
	SpikeTrapWeapon = "HadesSpikeTrapWeapon",
	SwarmerMelee = "HadesSwarmerMelee",
}

mod.EnemyWeaponMappings = {
	-- The two versions have different PressedIn/Out animations
	SpikeTrapWeapon = "HadesSpikeTrapWeapon",
	SwarmerMelee = "HadesSwarmerMelee",
}

mod.EnemyAnimationMappings = {
	SpikeTrapIdle = "HadesSpikeTrapIdle",
	SpikeTrapPressed = "HadesSpikeTrapPressed",
	SpikeTrapPreFire = "HadesSpikeTrapPreFire",
	SpikeTrapDeactivated = "HadesSpikeTrapDeactivated"
}

mod.FxAnimationMappings = {
	SpikeTrapPressedIn = "HadesSpikeTrapPressedIn",
	SpikeTrapPressedOut = "HadesSpikeTrapPressedOut",

	DoorLocked = "HadesDoorLocked",
	DoorUnlocked = "HadesDoorUnlocked",

	EnemyProjectile = "HadesEnemyProjectile",
	EnemyProjectileIn = "HadesEnemyProjectileIn",
	EnemyProjectileLight = "HadesEnemyProjectileLight",
}
mod.GUIAnimationMappings = {
	ExitPreview = "HadesExitPreview",
}
mod.PortraitAnimationMappings = {
	Portrait_Base_01 = "HadesPortrait_Base_01",
	Portrait_Base_01_Exit = "HadesPortrait_Base_01_Exit",
}
mod.CharacterAnimationsNPCsMappings = {}
