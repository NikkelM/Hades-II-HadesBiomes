-- Adds enemy animations from Hades to Hades II

local hadesEnemyAnimationsFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\CharacterAnimationsEnemies.sjson")
local hadesEnemyAnimationsTable = sjson.decode_file(hadesEnemyAnimationsFile)

-- This is the largest file, so we don't run into issues with the hooking
local hadesTwoEnemyAnimationsFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\Enemy_Olympus_VFX.sjson")

-- Modifications
-- These animations already exist in Hades II and crash the game if added again
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
	-- These try to inherit from EnemyBoneDracon_Idle, which comes from CharacterAnim_Enemies_BoneDracon.sjson
	-- Even when trying to copy that file over to Hades, it still crashes - EDIT: Sometimes it works? Maybe with the specific naming of the file?
	-- "EnemyActivationBoneDraconFade",
	-- "EnemyActivationBoneDraconFlash",
}

local function shouldRemoveAnimation(name)
	for _, removeName in ipairs(animationsToRemove) do
		if name == removeName then
			return true
		end
	end
	return false
end

for i = #hadesEnemyAnimationsTable.Animations, 1, -1 do
	local animation = hadesEnemyAnimationsTable.Animations[i]
	if shouldRemoveAnimation(animation.Name) then
		table.remove(hadesEnemyAnimationsTable.Animations, i)
	end
end

sjson.hook(hadesTwoEnemyAnimationsFile, function(data)
	mod.AddTableKeysSkipDupes(data.Animations, hadesEnemyAnimationsTable.Animations, "Name")
end)
