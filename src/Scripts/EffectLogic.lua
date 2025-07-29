-- TODO: Test for Theseus
modutil.mod.Path.Wrap("CharmApply", function(base, triggerArgs)
	base(triggerArgs)

	local victim = triggerArgs.TriggeredByTable
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and not triggerArgs.Reapplied and victim then
		print("Modded CharmApply for " .. victim.Name)
		game.FinishTargetMarker(victim)
		if victim.OnCharmedVoiceLines ~= nil then
			game.thread(game.PlayVoiceLines, victim.OnCharmedVoiceLines, nil, victim)
		end
		if victim.CharmStartSound then
			PlaySound({ Name = victim.CharmStartSound, Id = victim.ObjectId })
		end
	end
end)
