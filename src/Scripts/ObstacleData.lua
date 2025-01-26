game.ObstacleData.TartarusDoor03b.UnlockedAnimation = "HadesDoorUnlocked"
game.ObstacleData.TartarusDoor03b.UnlockedAnimationMetaReward = "DoorUnlocked_MetaReward"
game.ObstacleData.TartarusDoor03b.LockedAnimation = "HadesDoorLocked"
game.ObstacleData.TartarusDoor03b.MetaRewardAnimation = "DoorLocked_MetaReward"

game.ObstacleData.Breakable = {
	InheritFrom = { "BaseBreakable" },
	DeathSound = "/SFX/CeramicPotSmash",
	DeathFx = "BreakableDeathAnim",
	SetupEvents = {
		{
			FunctionName = "RandomizeObject",
			Args = {
				RandomizeSets = {
					{
						Animation = { "BreakableIdle1" },
					},
					{
						Animation = { "BreakableIdle2" },
					},
					{
						Animation = { "BreakableIdle3" },
					},
				},
			},
		},
	},
}
