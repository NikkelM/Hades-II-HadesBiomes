game.EffectData.StyxPoison = {
	InheritFrom = { "MedeaPoison" },
	EffectName = "StyxPoison",
	OnApplyFunctionName = _PLUGIN.guid .. "." .. "StyxPoisonApply",
	OnClearFunctionName = _PLUGIN.guid .. "." .. "StyxPoisonClear",
}
game.WeaponEffectData.ModsNikkelMHadesBiomesAttackSuperLowGrip = {
	EffectName = "ModsNikkelMHadesBiomesAttackSuperLowGrip",
	DataProperties = {
		Type = "GRIP",
		Duration = 0.3,
		Modifier = 0.001,
		HaltOnEnd = true,
	},
}
