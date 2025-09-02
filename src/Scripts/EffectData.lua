game.EffectData.StyxPoison = {
	InheritFrom = { "MedeaPoison" },
	EffectName = "StyxPoison",
	OnApplyFunctionName = _PLUGIN.guid .. "." .. "StyxPoisonApply",
	OnClearFunctionName = _PLUGIN.guid .. "." .. "StyxPoisonClear",
}
