mod.HadesEnemyAnimationsSjsonDataPath = "Animations\\Z_ModsNikkelMHadesBiomesEnemyAnimations.sjson"

-- These animations already exist in Hades II
mod.HadesEnemyAnimationsDuplicates = {
	["BlastCubeIdle"] = true,
	["BlastCubeLit"] = true,
	["BlastCubeFusedRegeneratingExplode"] = true,
	["TrapsDartPadPressedSmoke"] = true,
	["GasTrapIdle"] = true,
	["GasTrapActivated"] = true,
	["GasTrapPoisonIdle"] = true,
	["GasTrapPoisonActivated"] = true,
	["TrapFissureDisabled"] = true,
	["WallSegmentIdle"] = true,
	["WallSegmentNarrow01Idle"] = true,
	["HadesTombstoneExplode"] = true,
	["BreakableAsphodelIdle"] = true,
	["BreakableDeathAnim"] = true,
	["BreakableDeathA"] = true,
	["BreakableDeathA_End"] = true,
	["BreakableDeathB"] = true,
	["BreakableDeathB_End"] = true,
	["UrnFragments"] = true,
	["UrnFragment01"] = true,
	["UrnFragment02"] = true,
	["UrnFragment03"] = true,
	["UrnFragment04"] = true,
	["UrnFragment05"] = true,
	["BreakableIdle1"] = true,
	["BreakableIdle2"] = true,
	["BreakableIdle3"] = true,
	["AsphodelSkullDeathFx"] = true,
	-- These would be duplicates, but are renamed through mod.EnemyAnimationMappings instead
	-- ["HadesStunTotemStatic"] = true,
	-- ["HadesTombstoneSpawn"] = true,
	-- ["HadesStunTotemFlame"] = true,
	-- ["HadesStunTotemFlameSpawn"] = true,
	-- ["SpikeTrapIdle"] = true,
	-- ["SpikeTrapPressed"] = true,
	-- ["SpikeTrapPreFire"] = true,
	-- ["SpikeTrapDeactivated"] = true,
}

mod.HadesEnemyAnimationsModifications = {
	-- #region TARTARUS
	BaseThiefDeath = {
		SortMode = "Isometric",
	},
	-- #endregion
	-- #region STYX
	ModsNikkelMHadesBiomesHadesTombstoneSpawn = {
		FilePath =
		"NikkelM-HadesBiomesFxModded\\Fx\\ModsNikkelMHadesBiomesHadesStunTotemSpawn\\ModsNikkelMHadesBiomesHadesStunTotemSpawn",
		ChainTo = "ModsNikkelMHadesBiomesHadesStunTotemStatic",
		Scale = 1.4,
		Sound = "/SFX/Enemy Sounds/Zombie/ZombieEmerge",
		OriginX = 70.5,
		OriginY = 191,
	},
	ModsNikkelMHadesBiomesHadesStunTotemStatic = {
		FilePath = "Fx\\HadesStunTotemStatic\\Surface_Gravemarker_01Active",
		Scale = 0.35,
		OriginX = 212.5,
		OriginY = 650,
	},
	ModsNikkelMHadesBiomesHadesStunTotemFlame = {
		OffsetY = -150,
	},
	ModsNikkelMHadesBiomesHadesStunTotemFlameSpawn = {
		OffsetY = -150,
	},
	HadesStunTotemSpawnDecal = {
		OffsetZ = 85,
		OffsetX = -2,
	},
	-- #endregion
}
