-- Don't allow buying the "spawn a Chaos gate as soon as possible" shop item in Styx, as Chaos Gates can't spawn there
table.insert(game.TraitData.TemporaryForcedSecretDoorTrait.GameStateRequirements, {
	Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
	IsNone = { "Styx" },
})
