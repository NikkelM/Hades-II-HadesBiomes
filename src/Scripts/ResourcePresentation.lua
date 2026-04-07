modutil.mod.Path.Wrap("RoomRewardSpawnPresentation", function(base, reward, args)
	-- For the Chaos boon on the first modded run, force the conversation to play
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.Reward and game.CurrentRun.CurrentRoom.Reward.ModsNikkelMHadesBiomesDisableGoldConversionEligible then
		reward.GoldConversionEligible = false
	end

	return base(reward, args)
end)
