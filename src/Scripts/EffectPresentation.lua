modutil.mod.Path.Wrap("EffectApplyPresentation", function(base, victim, effectData, args)
	if effectData == nil then
		return base(victim, effectData, args)
	elseif game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim.ModsNikkelMHadesBiomesIsModdedEnemy and not victim.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy then
		if effectData.Vfx then
			effectData.Vfx = mod.EffectVfxMappings[effectData.Vfx] or effectData.Vfx
		end

		return base(victim, effectData, args)
	end
end)
