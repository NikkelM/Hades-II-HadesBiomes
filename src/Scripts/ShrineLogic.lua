modutil.mod.Path.Wrap("ShrineScreenUpdateSkellyText", function(base, screen)
	base(screen)

	local components = screen.Components

	-- When all vanilla thresholds are met, the base game's for-loop falls through without setting goals
	-- Show both Surface and Underworld as complete with strikethrough (only on first call of ShrineScreenUpdateSkellyText())
	if components.SkellyQuestSurface ~= nil and screen.NextSurfaceSkellyShrinePointGoal == nil then
		local lastIndex = #screen.UnderworldShrinePointThresholds
		screen.NextSurfaceSkellyShrinePointGoal = screen.SurfaceShrinePointThresholds[lastIndex]
		screen.NextUnderworldSkellyShrinePointGoal = screen.UnderworldShrinePointThresholds[lastIndex]

		SetAnimation({ DestinationId = components.SkellyQuestSurface.Id, Name = "GUI\\Screens\\Shrine\\SkellyComplete" })
		ModifyTextBox({ Id = components.SkellyQuestSurface.Id, Text = "ShrineScreen_SkellyStatueSurface_Complete", FadeTarget = 1.0 })
		SetAlpha({ Id = components.SkellyQuestSurfaceStrikethrough.Id, Fraction = 1.0, Duration = 0.2 })

		SetAnimation({ DestinationId = components.SkellyQuestUnderworld.Id, Name = "GUI\\Screens\\Shrine\\SkellyComplete" })
		ModifyTextBox({ Id = components.SkellyQuestUnderworld.Id, Text = "ShrineScreen_SkellyStatueUnderworld_Complete", FadeTarget = 1.0 })
		SetAlpha({ Id = components.SkellyQuestUnderworldStrikethrough.Id, Fraction = 1.0, Duration = 0.2 })
	end

	-- Initialize modded threshold goal
	if components.SkellyQuestModsNikkelMHadesBiomesModdedRoute ~= nil and screen.NextModsNikkelMHadesBiomesModdedRouteSkellyShrinePointGoal == nil then
		local moddedShrinePointRecord = game.GameState.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache or 0

		for i = 1, #screen.ModsNikkelMHadesBiomesShrinePointThresholds do
			local moddedThreshold = screen.ModsNikkelMHadesBiomesShrinePointThresholds[i]
			if moddedShrinePointRecord >= moddedThreshold then
				-- Threshold met, advance to next (or fall through if last)
			else
				screen.NextModsNikkelMHadesBiomesModdedRouteSkellyShrinePointGoal = moddedThreshold
				break
			end
		end

		-- If goal is still nil, all thresholds are met — show last one as complete
		if screen.NextModsNikkelMHadesBiomesModdedRouteSkellyShrinePointGoal == nil then
			local lastThreshold = screen.ModsNikkelMHadesBiomesShrinePointThresholds[#screen.ModsNikkelMHadesBiomesShrinePointThresholds]
			screen.NextModsNikkelMHadesBiomesModdedRouteSkellyShrinePointGoal = lastThreshold
			SetAnimation({ DestinationId = components.SkellyQuestModsNikkelMHadesBiomesModdedRoute.Id, Name = "GUI\\Screens\\Shrine\\SkellyComplete" })
			ModifyTextBox({ Id = components.SkellyQuestModsNikkelMHadesBiomesModdedRoute.Id, Text = "ShrineScreen_SkellyStatueModsNikkelMHadesBiomesModdedRun_Complete", FadeTarget = 1.0 })
			SetAlpha({ Id = components.SkellyQuestModsNikkelMHadesBiomesModdedRouteStrikethrough.Id, Fraction = 1.0, Duration = 0.2 })
		end
	end

	-- Update modded text based on current vow points (runs every call of ShrineScreenUpdateSkellyText())
	if components.SkellyQuestModsNikkelMHadesBiomesModdedRoute ~= nil and screen.NextModsNikkelMHadesBiomesModdedRouteSkellyShrinePointGoal ~= nil then
		if (game.GameState.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache or 0) < screen.NextModsNikkelMHadesBiomesModdedRouteSkellyShrinePointGoal then
			if game.GameState.SpentShrinePointsCache < screen.NextModsNikkelMHadesBiomesModdedRouteSkellyShrinePointGoal then
				ModifyTextBox({ Id = components.SkellyQuestModsNikkelMHadesBiomesModdedRoute.Id, Text = "ShrineScreen_SkellyStatueModsNikkelMHadesBiomesModdedRun_Insufficient", FadeTarget = 1.0 })
			else
				ModifyTextBox({ Id = components.SkellyQuestModsNikkelMHadesBiomesModdedRoute.Id, Text = "ShrineScreen_SkellyStatueModsNikkelMHadesBiomesModdedRun_Incomplete", FadeTarget = 1.0 })
			end
		end
	end
end)
