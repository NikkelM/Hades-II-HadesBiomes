modutil.mod.Path.Context.Wrap.Static("CodexOpenEntry", function(origScreen, origButton, origArgs)
	modutil.mod.Path.Wrap("GetDisplayName", function(base, args)
		if args.Text == "Codex_Custom_Story_Requirement" then
			local screen = modutil.mod.Locals.Stacked(3).screen
			local button = modutil.mod.Locals.Stacked(3).button

			local waitingOnCodexEntry = {}
			for index, unlockPortion in ipairs(button.EntryData.Entries) do
				local subEntryData = game.CodexData[button.ChapterName].Entries[button.EntryName].Entries[index]
				if not (game.SessionState.CodexDebugUnlocked or subEntryData.UnlockGameStateRequirements == nil or game.IsGameStateEligible(screen, subEntryData.UnlockGameStateRequirements)) then
					waitingOnCodexEntry = unlockPortion
					break
				end
			end

			if waitingOnCodexEntry.CustomUnlockText ~= nil then
				args.Text = waitingOnCodexEntry.CustomUnlockText
			end
		end

		return base(args)
	end)
end)
