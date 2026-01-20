modutil.mod.Path.Wrap("GardenHarvestEndPresentation", function(base, source, args, user)
	base(source, args, user)
	game.thread(game.CheckQuestStatus)
end)
