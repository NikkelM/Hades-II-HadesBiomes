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
