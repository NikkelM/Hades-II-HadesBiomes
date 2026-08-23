mod.HadesCharacterAnimationsEnemiesSjsonDataPath = "Animations\\Z_ModsNikkelMHadesBiomesCharacterAnimationsEnemies.sjson"

-- These animations already exist in Hades II
mod.HadesCharacterAnimationsEnemiesDuplicates = {
	["Projectile_BloodlessGrenadier"] = true,
	["Projectile_BloodlessGrenadierActivate"] = true,
	["Projectile_BloodlessGrenadierSpark"] = true,
	["Projectile_BloodlessGrenadierPitch"] = true,
	["Projectile_BloodlessGrenadierPitch_Fast"] = true,
	["GrenadePitchLines"] = true,
	["GrenadePitchLinesDark"] = true,
	["GrenadePitchLinesDarkCurveball"] = true,
	["GrenadePitchLinesCurveball"] = true,
	["GrenadePitchParticles"] = true,
	["GrenadePitchParticlesCurveball"] = true,
	["Hades_Idle"] = true,
}

mod.HadesCharacterAnimationsEnemiesModifications = {
	-- #region TARTARUS
	EnemyActivationWretchSwarmerFade = {
		ChainTo = "EnemyWretchSwarmerIdle",
	},
	EnemyWretchSwarmerDeathVFX = {
		SortMode = "Isometric",
		Scale = 0.8,
	},
	EnemyActivationLightSpawnerFade = {
		ChainTo = "SpawnerIdleAnim",
	},
	SpawnerDeath = {
		SortMode = "Isometric",
		OffsetY = -50.0,
		Scale = 1.1,
	},
	EnemyActivationWretchGluttonFade = {
		ChainTo = "EnemyWretchGluttonIdle",
	},
	EnemyWretchGluttonDeathVFX = {
		SortMode = "Isometric",
	},
	EnemyActivationWretchCasterFade = {
		ChainTo = "EnemyWretchCasterIdle",
	},
	EnemyWretchCasterDeath = {
		SortMode = "Isometric",
		Scale = 0.8,
	},
	EnemyActivationHeavyRangedFade = {
		ChainTo = "HeavyRangedCrystal4",
	},
	HeavyRangedCrystal1Shatter = {
		SortMode = "Isometric",
	},
	HeavyRangedCrystal4Shatter = {
		SortMode = "Isometric",
		OffsetY = -70,
	},
	EnemyActivationThiefMineLayerFade = {
		ChainTo = "EnemyWretchThiefIdle",
	},
	-- #endregion

	-- #region ASPHODEL
	EnemyActivationCrusherUnitFade = {
		OffsetY = -75.0,
	},
	CrusherUnitDeathVFX = {
		SortMode = "Isometric",
	},
	EnemyActivationHitAndRunUnitFade = {
		ChainTo = "EnemyMedusaHeadIdle",
		OffsetY = -110.0,
	},
	EnemyMedusaHeadDeath = {
		SortMode = "Isometric",
		BlockNewOwnerAnims = true,
		OwnerInvulnerable = true,
		OwnerUntargetable = true,
		OwnerHasNoCollision = true,
		OwnerImmobile = true,
	},
	HealRangedDeath = {
		SortMode = "Isometric",
		OffsetY = -40,
	},
	HealRangedCrystal1MiniBoss = {
		Name = "HealRangedCrystal1Miniboss"
	},
	HealRangedCrystal2MiniBoss = {
		Name = "HealRangedCrystal2Miniboss"
	},
	HealRangedCrystal3MiniBoss = {
		Name = "HealRangedCrystal3Miniboss"
	},
	-- #endregion

	-- #region ELYSIUM
	EnemyWretchCasterDeath_SplitShot = {
		SortMode = "Isometric",
	},
	SoulSpawnerDeath = {
		SortMode = "Isometric",
		OffsetY = -100.0,
	},
	-- #endregion

	-- #region STYX
	HeavyRangedForkedBurrow = {
		AngleFromOwner = "Ignore",
	},
	HeavyRangedForkedDeath = {
		SortMode = "Isometric",
		OffsetY = -70,
	},
	EnemyStyxThiefDeath = {
		SortMode = "Isometric",
	},
	-- #endregion
}

mod.HadesCharacterAnimationsEnemiesAdditions = {
	{
		Name = "SoulSpawnerDeathMiniboss",
		InheritFrom = "SoulSpawnerIdle",
		FilePath = "Animations\\SoulSpawner\\SoulSpawnerDeath\\SoulSpawnerDeath",
		Sound = "/SFX/Enemy Sounds/EnemyDeathExplode",
		NumFrames = 30,
		Loop = false,
		OffsetY = -100.0,
		Scale = 1.0
	},
	{
		Name = "HeavyRangedForkedMinibossDeath",
		InheritFrom = "HeavyRangedForkedDeath",
		Hue = 0.4,
		Saturation = -0.3,
	},
}
