-- Adds enemy animations from Hades to Hades II

local function shouldRemoveAnimation(name, animationsToRemove)
	for _, removeName in ipairs(animationsToRemove) do
		if name == removeName then
			return true
		end
	end
	return false
end

local hadesEnemyAnimationsFile = rom.path.combine(mod.hadesGameFolder,
	"Content\\Game\\Animations\\CharacterAnimationsEnemies.sjson")
local hadesEnemyAnimationsTable = sjson.decode_file(hadesEnemyAnimationsFile)

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
	if shouldRemoveAnimation(animation.Name, animationsToRemove) then
		table.remove(hadesEnemyAnimationsTable.Animations, i)
		mod.DebugPrint("Removed animation: " .. animation.Name .. " from CharacterAnimationsEnemies.sjson", 4)
	end
end

local modifications = {
	EnemyMedusaHeadDeath = {
		OffsetY = 0.0,
		BlockNewOwnerAnims = true,
		OwnerInvulnerable = true,
		OwnerUntargetable = true,
		OwnerHasNoCollision = true,
		OwnerImmobile = true,
	},
}

mod.ApplyNestedSjsonModifications(hadesEnemyAnimationsTable.Animations, modifications)

sjson.hook(hadesTwoEnemyAnimationsFile, function(data)
	mod.AddTableKeysSkipDupes(data.Animations, hadesEnemyAnimationsTable.Animations, "Name")
end)
