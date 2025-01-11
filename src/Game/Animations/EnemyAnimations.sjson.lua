-- Adds non-character enemy animations from Hades to Hades II

local hadesEnemyAnimationsFile = rom.path.combine(mod.hadesGameFolder,
	"Content\\Game\\Animations\\EnemyAnimations.sjson")
local hadesEnemyAnimationsTable = sjson.decode_file(hadesEnemyAnimationsFile)

-- These animations depend on some animations in various other files, so we hook into our own FX file, which is loaded last due to the Z_ prefix
local hadesTwoEnemyAnimationsFile = rom.path.combine(rom.paths.Content(), mod.HadesFxDestinationFilename)

-- Modifications
-- These animations already exist in Hades II and may crash the game if added again
local animationsToRemove = {
	"BlastCubeIdle",
	"BlastCubeLit",
	"BlastCubeFusedRegeneratingExplode",
	"TrapsDartPadPressedSmoke",
	"GasTrapIdle",
	"GasTrapActivated",
	"GasTrapPoisonIdle",
	"GasTrapPoisonActivated",
	"TrapFissureDisabled",
	"WallSegmentIdle",
	"WallSegmentNarrow01Idle",
	"HadesTombstoneSpawn",
	"HadesTombstoneExplode",
	"HadesStunTotemFlame",
	"HadesStunTotemFlameSpawn",
	"HadesStunTotemStatic",
	"BreakableAsphodelIdle",
	"BreakableDeathAnim",
	"BreakableDeathA",
	"BreakableDeathA_End",
	"BreakableDeathB",
	"BreakableDeathB_End",
	"UrnFragments",
	"UrnFragment01",
	"UrnFragment02",
	"UrnFragment03",
	"UrnFragment04",
	"UrnFragment05",
	"BreakableIdle1",
	"BreakableIdle2",
	"BreakableIdle3",
	-- Would be a duplicate, but is renamed
	-- "SpikeTrapIdle",
	-- "SpikeTrapPressed",
	-- "SpikeTrapPreFire",
	-- "SpikeTrapDeactivated"
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
		mod.DebugPrint("Removed animation: " .. animation.Name .. " from EnemyAnimations.sjson")
	end
end

-- Modifications/overrides to the animations
local hadesEnemyAnimationsModifications = {}

-- Rename duplicate animation names using mod.EnemyAnimationMappings
mod.RenameSjsonEntries(hadesEnemyAnimationsTable.Animations, mod.EnemyAnimationMappings, "Name", "EnemyAnimations.sjson")
for oldName, newName in pairs(mod.EnemyAnimationMappings) do
	mod.UpdateField(hadesEnemyAnimationsTable.Animations, oldName, newName, { "InheritFrom" }, "EnemyAnimations.sjson")
end

mod.ApplyNestedSjsonModifications(hadesEnemyAnimationsTable.Animations, hadesEnemyAnimationsModifications)

sjson.hook(hadesTwoEnemyAnimationsFile, function(data)
	mod.AddTableKeysSkipDupes(data.Animations, hadesEnemyAnimationsTable.Animations, "Name")
end)
