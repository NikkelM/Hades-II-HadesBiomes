modutil.mod.Path.Context.Wrap.Static("OpenRunClearScreen", function()
	modutil.mod.Path.Wrap("OpenTraitTrayScreen", function(base, args)
		-- Interjecting at this point to add the modded badges, doesn't have anything to do with OpenTraitTrayScreen
		-- But, we do want this to run after the wait(0.3) call to allow the "Victory" VFX to subside, which would overlap this
		if game.GameState.ModsNikkelMHadesBiomesBadgeRank ~= nil then
			local screen = modutil.mod.Locals.Stacked(3).screen
			local components = screen.Components
			local badgeData = game.ModsNikkelMHadesBiomesBadgeData
					[game.ModsNikkelMHadesBiomesBadgeOrderData[game.GameState.ModsNikkelMHadesBiomesBadgeRank]]

			if badgeData ~= nil then
				SetAnimation({ DestinationId = components.ModsNikkelMHadesBiomesBadgeRankIcon.Id, Name = badgeData.Icon })
				SetAnimation({
					DestinationId = components.ModsNikkelMHadesBiomesBadgeRankNameplate.Id,
					Name = "ModsNikkelMHadesBiomes_BadgeNamePlate01"
				})
				CreateTextBox({
					Id = components.ModsNikkelMHadesBiomesBadgeRankNameplate.Id,
					Text = badgeData.Name,
					FontSize = 20,
					OffsetX = 0,
					OffsetY = 10,
					Color = { 255, 235, 118, 255 },
					Font = "P22UndergroundSCLight",
					ShadowBlur = 0,
					ShadowColor = { 0, 0, 0, 1 },
					ShadowOffset = { 0, 2 },
					Justification = "Center",
					OutlineThickness = 2,
					OutlineColor = { 0, 0, 0, 1 },
				})
			end
		end

		return base(args)
	end)
end)
