game.EffectData.StyxPoison = {
	InheritFrom = { "MedeaPoison" },
	EffectName = "StyxPoison",
	OnApplyFunctionName = _PLUGIN.guid .. "." .. "StyxPoisonApply",
	OnClearFunctionName = _PLUGIN.guid .. "." .. "StyxPoisonClear",
}

local snakeVenomData = game.DeepCopyTable(game.EffectData.StyxPoison)
snakeVenomData.EffectName = "ModsNikkelMHadesBiomesSnakeVenom"
snakeVenomData.OnApplyFunctionName = "nil"
snakeVenomData.OnClearFunctionName = "nil"
snakeVenomData.CancelUnitHitFlash = true
game.EffectData[snakeVenomData.EffectName] = snakeVenomData

game.WeaponEffectData.ModsNikkelMHadesBiomesAttackSuperLowGrip = {
	EffectName = "ModsNikkelMHadesBiomesAttackSuperLowGrip",
	DataProperties = {
		Type = "GRIP",
		Duration = 0.3,
		Modifier = 0.001,
		HaltOnEnd = true,
	},
}
