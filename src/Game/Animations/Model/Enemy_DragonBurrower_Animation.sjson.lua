local animationsFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Model\\Enemy_DragonBurrower_Animation.sjson")

local addAnimations = {
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",
		InheritFrom = "Enemy_DragonBurrower_Idle",
		GrannyAnimationSpeed = 0.75,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_RangedFire_Triple",
		InheritFrom = "EnemyDragonBurrowerBaseAnimation",
		GrannyAnimation = "BoneDracon_Base_AttackRange_C_00",
		ChainTo = "Enemy_DragonBurrower_RangedPostFire",
		Sound = "/SFX/Enemy Sounds/RangedBurrower/EmoteAttacking",
		-- Match the familiar's 0.25-second dart interval at 60 frames per second
		Frames = {
			{ Frame = 0,  FrameSpeed = 0 },
			{ Frame = 4,  FrameSpeed = 1 },
			{ Frame = 15, Sound = "/SFX/Enemy Sounds/RangedBurrower/EmoteAttacking" },
			{ Frame = 30, Sound = "/SFX/Enemy Sounds/RangedBurrower/EmoteAttacking" },
			{ Frame = 50, FrameSpeed = 0 },
		},
	},
}

sjson.hook(animationsFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Enemy_DragonBurrower_Animation"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
