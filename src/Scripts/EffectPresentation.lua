modutil.mod.Path.Wrap("EffectApplyPresentation", function(base, victim, effectData, args)
	if effectData == nil then
		base(victim, effectData, args)
	elseif game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim.ModsNikkelMHadesBiomesIsModdedEnemy and not victim.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy then
		if effectData.Vfx then
			effectData.Vfx = mod.EffectVfxMappings[effectData.Vfx] or effectData.Vfx
		end
	end

	base(victim, effectData, args)
end)
