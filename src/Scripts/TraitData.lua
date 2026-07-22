-- Don't allow buying the "Spawn a Chaos gate as soon as possible" shop item (Spark of Ixion) in Styx or the Elysium Y_PostBoss01 room, as Chaos Gates can't spawn in Styx
table.insert(game.TraitData.TemporaryForcedSecretDoorTrait.GameStateRequirements, {
	Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
	IsNone = { "Styx" },
})
table.insert(game.TraitData.TemporaryForcedSecretDoorTrait.GameStateRequirements, {
	Path = { "CurrentRun", "CurrentRoom", "Name" },
	IsNone = { "Y_PostBoss01" },
})

-- Enable Hades' final boss damage boon in modded runs
table.insert(game.TraitData.HadesPreDamageBoon.EncounterPreDamage.ValidRooms, "D_Boss01")
-- Point Dream Run text to modded versions that include Hades as a valid target
if not config.z_ExcludeFromDreamDives then
	game.TraitData.HadesPreDamageBoon.CustomNameWithRequirements.Name =
	"ModsNikkelMHadesBiomes_HadesPreDamageBoon_DreamRun"
	game.TraitData.HadesPreDamageBoon.DreamRunStatLines = { "ModsNikkelMHadesBiomes_ChronosDamageStatDisplay_DreamRun" }
	game.TraitData.HadesChronosDebuffBoon.CustomNameWithRequirements.Name =
	"ModsNikkelMHadesBiomes_HadesChronosDebuffBoon_DreamRun"
	game.TraitData.HadesChronosDebuffBoon.DreamRunStatLines = { "ModsNikkelMHadesBiomes_ChronosDebuffStatDisplay_DreamRun" }
end

-- Hidden trait to scale the player model during modded biomes
-- Uses the SetupFunction mechanism so it re-applies on every room start and save reload, matching Circe's pattern
game.TraitData.ModsNikkelMHadesBiomesPlayerScaleTrait = {
	InheritFrom = { "BaseTrait" },
	Hidden = true,
	SetupFunction = {
		Name = _PLUGIN.guid .. "." .. "ApplyModdedPlayerScale",
		Args = { ScaleMultiplier = mod.ModdedPlayerScaleMultiplier },
		RunOnce = false,
	},
}

-- Indicator boon shown in the trait tray while Goddess Mode is active during a modded run
-- Mirrors vanilla's God Mode indicator (GodModeTrait), it has no gameplay effect of its own, the health/armour scaling is disabled in RoomLogic
game.TraitData.ModsNikkelMHadesBiomesGoddessModeTrait = {
	Icon = "GodMode",
	HideInRunHistory = true,
}
