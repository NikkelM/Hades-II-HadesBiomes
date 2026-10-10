local hadesTwoEnemyBaseVFXFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\Enemy_1Base_VFX.sjson")

local hadesTwoEnemyBaseVFXModifications = {
	HadesLaser = {
		-- The sound is way too loud if played through sjson, we play it through the FireFunctionName instead
		Sound = "null",
	},
}

local addAnimations = {
	{
		Name = "ModsNikkelMHadesBiomesInvincibubbleFury",
		InheritFrom = "Invincibubble",
		ChainTo = "ModsNikkelMHadesBiomesInvincibubbleOutFury",
		ChildAnimation = "ModsNikkelMHadesBiomesInvincibubbleLoopFury",
		CreateAnimation = "ModsNikkelMHadesBiomesQuickFlashInvincibleFury",
		OffsetZ = 200,
		CreateAnimations = {
			{ Name = "ModsNikkelMHadesBiomesInvincibubbleDarkFury" },
		},
	},
	{
		Name = "ModsNikkelMHadesBiomesInvincibubbleDarkFury",
		InheritFrom = "InvincibubbleDark",
		OffsetZ = 200,
	},
	{
		Name = "ModsNikkelMHadesBiomesInvincibubbleLoopFury",
		InheritFrom = "InvincibubbleLoop",
		OffsetZ = 200,
	},
	{
		Name = "ModsNikkelMHadesBiomesInvincibubbleOutFury",
		InheritFrom = "InvincibubbleOut",
		OffsetZ = 200,
	},
	{
		Name = "ModsNikkelMHadesBiomesQuickFlashInvincibleFury",
		InheritFrom = "QuickFlashInvincible",
		OffsetZ = 200,
	},
}

sjson.hook(hadesTwoEnemyBaseVFXFile, function(data)
	mod.RunInstallStep("Enemy_1Base_VFX")

	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Enemy_1Base_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoEnemyBaseVFXModifications)
end)
