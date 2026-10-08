modutil.mod.Path.Wrap("HadesSpeakingPresentation", function(base, eventSource, args)
	args = args or {}
	if game.CurrentRun ~= nil and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and args.OverlayAnim == nil and (args.LineHistoryName == "Hades" or eventSource.LineHistoryName == "Hades") then
		args = game.ShallowCopyTable(args)
		args.OverlayAnim = "ModsNikkelMHadesBiomesHadesOverlay"
	end

	return base(eventSource, args)
end)
