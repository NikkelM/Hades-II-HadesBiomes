-- Red and blue reward preview backing
game.ObstacleData.TartarusDoor03b.LockedAnimation = "HadesDoorLocked"
game.ObstacleData.TartarusDoor03b.UnlockedAnimation = "DoorLocked_MetaReward"

-- Rubble that falls when hitting destructible pillars
game.ObstacleData.TartarusRubble02 = game.DeepCopyTable(game.ObstacleData.CWTartarusRubble01)
game.ObstacleData.TartarusRubble02.OnTouchdown.ProjectileName = "ModsNikkelMHadesBiomesRubbleFall"
game.ObstacleData.TartarusRubble02b = game.DeepCopyTable(game.ObstacleData.CWTartarusRubble01)
game.ObstacleData.TartarusRubble02b.OnTouchdown.ProjectileName = "ModsNikkelMHadesBiomesRubbleFall"
game.ObstacleData.TartarusRubble02c = game.DeepCopyTable(game.ObstacleData.CWTartarusRubble01)
game.ObstacleData.TartarusRubble02c.OnTouchdown.ProjectileName = "ModsNikkelMHadesBiomesRubbleFall"

game.ObstacleData.TartarusHalfPillarBase04 = {
	Material = "Stone",
	OnHitShake = { Distance = 3, Speed = 300, Duration = 0.15 },
	ImpactReaction = {
		Animation = "Tilesets\\Tartarus\\Tartarus_HalfPillarBase_04A",
		RequiredHitsForImpactReaction = 3,
		SpawnOffsetXMin = 50,
		SpawnOffsetXMax = 150,
		SpawnOffsetYMin = 50,
		SpawnOffsetYMax = 130,
		SpawnOffsetZ = 1000,
		FallForce = 1500,
		SpawnScaleMin = 0.2,
		SpawnScaleMax = 0.4,
		SwapData = "TartarusHalfPillarBase04A",
	},
}
game.ObstacleData.TartarusHalfPillarBase04A = {
	Material = "Stone",
	OnHitShake = { Distance = 3, Speed = 300, Duration = 0.15 },
	ImpactReaction = {
		Animation = "Tilesets\\Tartarus\\Tartarus_HalfPillarBase_04B",
		RequiredHitsForImpactReaction = 5,
		SpawnAmount = 2,
		SpawnOffsetXMin = 50,
		SpawnOffsetXMax = 150,
		SpawnOffsetYMin = 50,
		SpawnOffsetYMax = 130,
		SpawnOffsetZ = 2000,
		FallForce = 3000,
		SpawnScaleMin = 0.2,
		SpawnScaleMax = 0.4,
		SwapData = "TartarusHalfPillarBase04B",
		GlobalVoiceLines = "BreakingStuffVoiceLines",
	},
}
game.ObstacleData.TartarusHalfPillarBase04B = {
	Material = "Stone",
	OnHitShake = { Distance = 3, Speed = 300, Duration = 0.15 },
	ImpactReaction = {
		Animation = "Tilesets\\Tartarus\\Tartarus_HalfPillarBase_04C",
		RequiredHitsForImpactReaction = 7,
		SpawnRandomObstacle = { "TartarusRubble02", "TartarusRubble02b", "TartarusRubble02c", },
		ForceSpawnToValidLocation = true,
		SpawnAmount = 4,
		SpawnOffsetXMin = 50,
		SpawnOffsetXMax = 150,
		SpawnOffsetYMin = 50,
		SpawnOffsetYMax = 130,
		SpawnOffsetZ = 1000,
		FallForce = 3000,
		SpawnScaleMin = 0.2,
		SpawnScaleMax = 0.4,
		SwapData = "TartarusHalfPillarBase04C",
	},
}
game.ObstacleData.TartarusHalfPillarBase04C = {
	Material = "Stone",
	SpawnPropertyChanges = {
		{
			ThingProperty = "StopsProjectiles",
			ChangeValue = false,
		},
		{
			ThingProperty = "DrawVfxOnTop",
			ChangeValue = true,
		},
	},
}

game.ObstacleData.MultiFuryMegaeraIntro = { ExitAnimation = "MegaeraMultiFuryTakeOff", }
game.ObstacleData.MultiFuryAlectoIntro = { ExitAnimation = "AlectoMultiFuryTakeOff", }
game.ObstacleData.MultiFuryTisiphoneIntro = { ExitAnimation = "TisiphoneMultiFuryTakeOff", }
