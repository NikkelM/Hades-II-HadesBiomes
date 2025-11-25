modutil.mod.Path.Wrap("DisplayTextLine", function(base, screen, source, line, parentLine, nextLine, args)
	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if line.Speaker and (line.Speaker == "NPC_Zagreus_Past_01" or line.Speaker == "CharProtag") then
			mod.ModsNikkelMHadesBiomesToggleNarrativeFadeInColorForZagreus(source, { ToggleOn = true })
		end
	end

	local returnValue = base(screen, source, line, parentLine, nextLine, args)

	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if line.Speaker and (line.Speaker == "NPC_Zagreus_Past_01" or line.Speaker == "CharProtag") then
			mod.ModsNikkelMHadesBiomesToggleNarrativeFadeInColorForZagreus(source, { ToggleOn = false })
		end
	end
	return returnValue
end)

-- Change the player's NarrativeFadeInColor to ZagreusVoice when speaking as Zagreus_Past_01
mod.OriginalPlayerNarrativeFadeInColor = nil
function mod.ModsNikkelMHadesBiomesToggleNarrativeFadeInColorForZagreus(source, args)
	if args.ToggleOn then
		mod.OriginalPlayerNarrativeFadeInColor = source.NarrativeFadeInColor
		source.NarrativeFadeInColor = game.Color.ZagreusVoice
	else
		source.NarrativeFadeInColor = mod.OriginalPlayerNarrativeFadeInColor
	end
end