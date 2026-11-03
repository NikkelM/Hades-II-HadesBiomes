function mod.CheckLocationUnlock(eventSource, args)
	game.CurrentRun.BiomesReached = game.CurrentRun.BiomesReached or {}
	game.CurrentRun.BiomesReached[args.Biome] = true
	game.CheckCodexUnlock(mod.CodexChapterName, args.Biome)
end

modutil.mod.Path.Wrap("InitKillCountText", function(base, screen, entryData)
	if entryData.ModsNikkelMHadesBiomesSkipShowKillCount == true then
		return
	end

	return base(screen, entryData)
end)

function mod.CalcNumModdedCodexEntriesUnlocked()
	local unlockCount = 0
	for entryName, entryData in pairs(game.CodexData[mod.CodexChapterName].Entries) do
		if game.CodexStatus[mod.CodexChapterName] ~= nil and game.CodexStatus[mod.CodexChapterName][entryName] ~= nil and game.CodexStatus[mod.CodexChapterName][entryName][1] ~= nil and game.CodexStatus[mod.CodexChapterName][entryName][1].Unlocked then
			unlockCount = unlockCount + 1
		end
	end
	return unlockCount
end

-- Pre-select the Achilles entry after Achilles grants the H1 Codex category
function mod.EnableAchillesCodex()
	game.SelectCodexEntry("ModsNikkelMHadesBiomes_NPC_Achilles_01")
	game.wait(0.25)
	game.DisplayInfoToast(nil, {
		Title = "ThingUnlocked",
		Text = "ModsNikkelMHadesBiomes_Codex_Unlocked_Subtitle",
	})
	game.wait(0.25)
	game.thread(game.ShowCodexUpdate)
end

modutil.mod.Path.Wrap("HasUnlockedEntries", function(base, chapterName)
	if game.SessionState.CodexDebugUnlocked then
		return true
	end

	-- Mod chapter only unlocks after Achilles grants the Codex
	if chapterName == mod.CodexChapterName and not game.GameState.TextLinesRecord.AchillesGrantsCodex then
		return false
	end

	return base(chapterName)
end)

modutil.mod.Path.Wrap("CalcNumCodexEntriesUnlocked", function(base)
	game.GameState.ModsNikkelMHadesBiomesCodexEntriesUnlockedCache = mod.CalcNumModdedCodexEntriesUnlocked()

	return base()
end)

modutil.mod.Path.Wrap("CodexCloseEntry", function(base, screen, entryName)
	SetAlpha({
		Id = screen.Components.ModsNikkelMHadesBiomesAssistHelpText.Id,
		Fraction = 0,
		Duration = 0.06,
		EaseIn = 0,
		EaseOut = 1,
	})

	return base(screen, entryName)
end)

modutil.mod.Path.Wrap("CodexOpenEntry", function(base, screen, button, args)
	base(screen, button, args)

	-- The Hades codex entries are sometimes too long for the Hades II font size, so we scale the text box down for entries in our custom chapter
	if button and button.ChapterName == mod.CodexChapterName then
		ModifyTextBox({ Id = screen.Components.EntryText.Id, ScaleTarget = 0.9, ScaleDuration = 0 })
		local traitData = game.TraitData[button.EntryName]
		if traitData ~= nil and traitData.Slot == "Assist" then
			ModifyTextBox({
				Id = screen.Components.ModsNikkelMHadesBiomesAssistHelpText.Id,
				Text = "Assist",
				UseDescription = true,
			})
			SetAlpha({
				Id = screen.Components.ModsNikkelMHadesBiomesAssistHelpText.Id,
				Fraction = 1,
				Duration = 0.2,
			})
		end
	else
		ModifyTextBox({ Id = screen.Components.EntryText.Id, ScaleTarget = 1.0, ScaleDuration = 0 })
	end
end)
