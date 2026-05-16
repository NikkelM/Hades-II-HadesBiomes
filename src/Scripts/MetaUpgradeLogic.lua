modutil.mod.Path.Wrap("CastProjectileCleanup", function(base, projectileData, triggerArgs)
	base(projectileData, triggerArgs)

	if game.SessionMapState.ModsNikkelMHadesBiomesCastAttachTargets and triggerArgs and triggerArgs.ProjectileId then
		game.SessionMapState.ModsNikkelMHadesBiomesCastAttachTargets[triggerArgs.ProjectileId] = nil
	end
end)
