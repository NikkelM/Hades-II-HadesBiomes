function game.BossIntroElysium(eventSource, args)
	local shrineLevel = game.GetNumShrineUpgrades(eventSource.ShrineMetaUpgradeName)
	game.ModsNikkelMHadesBiomesBossIntro(eventSource, args[shrineLevel])
end
