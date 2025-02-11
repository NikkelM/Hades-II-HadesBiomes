-- Defines animation names that already exist in Hades II and should therefore be skipped when the Hades Portrait animations are imported

-- The destination filename, used in a couple of places in the mod, therefore defined centrally
mod.HadesCharacterAnimationsNPCsDestinationFilename =
"Game\\Animations\\Z_ModsNikkelmHadesBiomesCharacterAnimationsNPCs.sjson"

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
