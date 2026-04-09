modutil.mod.Path.Wrap("EffectApplyPresentation", function(base, victim, effectData, args)
	if effectData == nil then
		return base(victim, effectData, args)
	elseif game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim.ModsNikkelMHadesBiomesIsModdedEnemy and not victim.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy then
		if effectData.Vfx then
			effectData.Vfx = mod.EffectVfxMappings[effectData.Vfx] or effectData.Vfx
		end
	end

	return base(victim, effectData, args)
end)

mod.ModdedRootPresentationIds = {}

modutil.mod.Path.Wrap("RootApplyPresentation", function(base, victim, victimId)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim and victim.ModsNikkelMHadesBiomesIsModdedEnemy and not victim.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy then
		local id = victimId or victim.ObjectId
		mod.ModdedRootPresentationIds[id] = true
		if victim.TetherIds ~= nil then
			for _, tetherId in ipairs(victim.TetherIds) do
				mod.ModdedRootPresentationIds[tetherId] = true
			end
		end
	end

	return base(victim, victimId)
end)

modutil.mod.Path.Wrap("DoRootApplyPresentation", function(base, ids)
	base(ids)

	mod.ModdedRootPresentationIds = {}
end)
