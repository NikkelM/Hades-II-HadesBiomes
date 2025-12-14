modutil.mod.Path.Wrap("ShieldBlock", function(base, triggerArgs, functionArgs)
	triggerArgs = triggerArgs or {}

	-- To block Boiling Blood from being applied when the projectile is blocked with the Black Coat/WeaponSuit
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and triggerArgs.BlockedProjectileName == "HadesCast" then
		AddEffectBlock({ Id = game.CurrentRun.Hero.ObjectId, Name = "ModsNikkelMHadesBiomesHadesCastBlock" })
		game.thread(game.RemoveEffectBlockOnDelay, game.CurrentRun.Hero.ObjectId, 0.25,
			"ModsNikkelMHadesBiomesHadesCastBlock")
	end

	return base(triggerArgs, functionArgs)
end)
