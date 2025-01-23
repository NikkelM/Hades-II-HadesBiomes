-- Some names or Ids from Hades are reused in Hades II for something similar or different
-- These names need to be changed in order to avoid conflicts and to use both versions alongside each other

-- Enemies that exist in both games
mod.EnemyNameMappings = {
	LightRanged = "HadesLightRanged",
	-- In Hades II, this is LightRanged_Elite
	-- LightRangedElite = "HadesLightRangedElite",
	-- Doesn't exist at all in Hades II
	-- LightRangedSuperElite = "HadesLightRangedSuperElite",
	-- Not tested yet - is this needed?
	-- SpreadShotUnit = "HadesSpreadShotUnit",

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

}
