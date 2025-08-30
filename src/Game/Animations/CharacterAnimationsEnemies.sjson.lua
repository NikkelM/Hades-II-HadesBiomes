-- Adds enemy animations from Hades to Hades II
local hadesEnemyAnimationsFile = rom.path.combine(mod.hadesGameFolder,
	"Content\\Game\\Animations\\CharacterAnimationsEnemies.sjson")
local hadesEnemyAnimationsTable = mod.DecodeSjsonFile(hadesEnemyAnimationsFile)

-- This is the largest file, so we don't run into issues with the hooking
local hadesTwoEnemyAnimationsFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\Enemy_Olympus_VFX.sjson")

-- Modifications
-- These animations already exist in Hades II and may crash the game if added again
local animationsToRemove = {
	"Projectile_BloodlessGrenadier",
	"Projectile_BloodlessGrenadierActivate",
	"Projectile_BloodlessGrenadierSpark",
	"Projectile_BloodlessGrenadierPitch",
	"Projectile_BloodlessGrenadierPitch_Fast",
	"GrenadePitchLines",
	"GrenadePitchLinesDark",
	"GrenadePitchLinesDarkCurveball",
	"GrenadePitchLinesCurveball",
	"GrenadePitchParticles",
	"GrenadePitchParticlesCurveball",
	"Hades_Idle",
}

for i = #hadesEnemyAnimationsTable.Animations, 1, -1 do
	local animation = hadesEnemyAnimationsTable.Animations[i]
	if mod.ShouldRemoveEntry(animation.Name, animationsToRemove) then
		table.remove(hadesEnemyAnimationsTable.Animations, i)
		mod.DebugPrint("Removed animation: " .. animation.Name .. " from CharacterAnimationsEnemies.sjson", 4)
	end
end

local modifications = {
	-- #region TARTARUS
	EnemyWretchSwarmerDeathVFX = {
		SortMode = "Isometric",
		Scale = 0.8,
	},
	SpawnerDeath = {
		SortMode = "Isometric",
		OffsetY = -50.0,
		Scale = 1.1,
	},
	EnemyWretchGluttonDeathVFX = {
		SortMode = "Isometric",
	},
	EnemyWretchCasterDeath = {
		SortMode = "Isometric",
		Scale = 0.8,
	},
	HeavyRangedCrystal1Shatter = {
		SortMode = "Isometric",
	},
	HeavyRangedCrystal4Shatter = {
		SortMode = "Isometric",
		OffsetY = -70,
	},
	-- #endregion

	-- #region ASPHODEL
	CrusherUnitDeathVFX = {
		SortMode = "Isometric",
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
	-- #endregion
}

local addAnimations = {
	SoulSpawnerDeathMiniboss = {
		Name = "SoulSpawnerDeathMiniboss",
		InheritFrom = "SoulSpawnerIdle",
		FilePath = "Animations\\SoulSpawner\\SoulSpawnerDeath\\SoulSpawnerDeath",
		Sound = "/SFX/Enemy Sounds/EnemyDeathExplode",
		NumFrames = 30,
		Loop = false,
		OffsetY = -100.0,
		Scale = 1.0
	},
}

mod.ApplyNestedSjsonModifications(hadesEnemyAnimationsTable.Animations, modifications)

sjson.hook(hadesTwoEnemyAnimationsFile, function(data)
	mod.AddTableKeysSkipDupes(data.Animations, hadesEnemyAnimationsTable.Animations, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
