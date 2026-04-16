modutil.mod.Path.Context.Wrap.Static("OpenInventoryScreen", function(origArgs)
	-- Show the modded badges in the inventory (left and right of the vanilla badge)
	modutil.mod.Path.Wrap("CreateScreenFromData", function(base, screen, componentData, args)
		base(screen, componentData, args)

		local components = screen.Components
		if game.GameState.ModsNikkelMHadesBiomesBadgeRank ~= nil then
			local badgeData = game.ModsNikkelMHadesBiomesBadgeData
					[game.ModsNikkelMHadesBiomesBadgeOrderData[game.GameState.ModsNikkelMHadesBiomesBadgeRank]]
			if badgeData ~= nil then
				SetAnimation({ DestinationId = components.ModsNikkelMHadesBiomesBadgeRankIconLeft.Id, Name = badgeData.Icon })
				SetAnimation({ DestinationId = components.ModsNikkelMHadesBiomesBadgeRankIconRight.Id, Name = badgeData.Icon })
			end
		end
	end)
end)
