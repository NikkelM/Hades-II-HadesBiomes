modutil.mod.Path.Wrap("PreDamageBoss", function(base, enemy, damageAmount, damageData)
	-- To prevent Hades from being invisible/invulnerable during this, reducing the delay
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and enemy ~= nil and enemy.Name == "Hades" then
		damageData.Delay = 2.2
	end

	return base(enemy, damageAmount, damageData)
end)

modutil.mod.Path.Wrap("AttachCastAtLocation", function(base, triggerArgs)
	-- To prevent the launched Cast from the Hades boon from sticking to CrusherUnit enemies
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and triggerArgs ~= nil and triggerArgs.TriggeredByTable ~= nil and game.GetGenusName(triggerArgs.TriggeredByTable) == "CrusherUnit" then
		local enemyLocation = GetLocation({ Id = triggerArgs.triggeredById }) or {}
		triggerArgs.LocationX = enemyLocation.X or triggerArgs.LocationX
		triggerArgs.LocationY = enemyLocation.Y or triggerArgs.LocationY
		triggerArgs.triggeredById = nil
		triggerArgs.TriggeredByTable = nil
	end

	return base(triggerArgs)
end)

modutil.mod.Path.Wrap("HadesInvisibility", function(base)
	-- Hades reaction voicelines
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.ModsNikkelMHadesBiomes_HadesInvisibilityReactionVoiceLines)

	return base()
end)
