local animationsFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Model\\Enemy_DragonBurrower_Animation.sjson")

local addAnimations = {
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",
		InheritFrom = "Enemy_DragonBurrower_Idle",
		GrannyAnimationSpeed = 0.75,
		Blends = {
			{
				BlendTransitionFrom = "ModsNikkelMHadesBiomesSnakeFamiliar_RangedPostFire",
				Duration = 8,
			},
			{
				BlendTransitionFrom = "ModsNikkelMHadesBiomesSnakeFamiliar_VictoryRecovery",
				Duration = 8,
			},
			{
				BlendTransitionFrom = "ModsNikkelMHadesBiomesSnakeFamiliar_Pet",
				Duration = 40,
			},
		},
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_VictoryRecovery",
		InheritFrom = "EnemyDragonBurrowerBaseAnimation",
		GrannyAnimation = "BoneDracon_Base_AttackRange_C_00",
		GrannyAnimationSpeed = 0.7,
		ChainTo = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",
		Sound = "/SFX/Enemy Sounds/RangedBurrower/EmoteAttacking",
		-- Start at the forward pose, then play the complete pullback to idle
		Frames = {
			{ Frame = 0,  FrameSpeed = 0 },
			{ Frame = 50, FrameSpeed = 1 },
		},
		Blends = {
			{
				BlendTransitionFrom = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",
				Duration = 8,
			},
			{
				BlendTransitionFrom = "BlendTransitionFromAll",
				Duration = 8,
			},
		},
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_RangedPostFire",
		InheritFrom = "Enemy_DragonBurrower_RangedPostFire",
		ChainTo = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_RangedFire_Triple",
		InheritFrom = "EnemyDragonBurrowerBaseAnimation",
		GrannyAnimation = "BoneDracon_Base_AttackRange_C_00",
		ChainTo = "ModsNikkelMHadesBiomesSnakeFamiliar_RangedPostFire",
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
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_Pet",
		InheritFrom = "EnemyDragonBurrowerBaseAnimation",
		GrannyAnimation = "BoneDracon_Base_AttackRange_C_00",
		GrannyAnimationSpeed = 0.15,
		ChainTo = "ModsNikkelMHadesBiomesSnakeFamiliar_Idle",
		Frames = {
			{ Frame = 0,  FrameSpeed = 0 },
			{ Frame = 4,  FrameSpeed = 1 },
			{ Frame = 18, FrameSpeed = 0 },
		},
		Blends = {
			{
				BlendTransitionFrom = "BlendTransitionFromAll",
				Duration = 24,
			},
		},
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_Unburrow",
		InheritFrom = "Enemy_DragonBurrower_Unburrow",
		CreateAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxIn",
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_Unburrow_NoDecal",
		InheritFrom = "Enemy_DragonBurrower_Unburrow",
		CreateAnimation = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxIn_NoDecal",
	},
}

sjson.hook(animationsFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Enemy_DragonBurrower_Animation"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
