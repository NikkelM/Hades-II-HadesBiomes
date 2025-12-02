modutil.mod.Path.Context.Wrap.Static("OpenMarketScreen", function(marketScreenArgs)
	modutil.mod.Path.Wrap("ModifyTextBox", function(base, args)
		local currencyResourceName = modutil.mod.Locals.Stacked(2).currencyResourceName
		if currencyResourceName == "ModsNikkelMHadesBiomes_BrokerResource" then
			local screen = modutil.mod.Locals.Stacked(2).screen
			-- If we are showing the amount we have of the dummy modded resource, display an empty string
			if args.Id == screen.Components.BasicResourceButton.Id then
				args.Text = " "
			end
		end

		return base(args)
	end)

	-- Workaround for cases where the new category isn't added for some reason, such as when the mod was just enabled while the items were already generated
	-- The new tab is still added in MarketData.lua, but if we don't have the generated items, opening it will crash the game
	modutil.mod.Path.Wrap("GenerateMarketItems", function(base, source, args)
		local marketItems = base(source, args)
		args = args or {}

		if not args.ModsNikkelMHadesBiomesRequestedRegeneration and game.CurrentRun.MarketItems ~= nil then
			-- Check if our new category is present already
			for _, category in ipairs(game.CurrentRun.MarketItems) do
				-- Does this category contain one of our new boss resources as a Cost? Then it's our custom category
				if game.ContainsAnyKey(category[1].Cost, game.GetAllKeys(mod.NewBossResourceData)) then
					return marketItems
				end
			end
			-- Since we're still here, we haven't found our custom categoy, add it by regenerating the items
			-- We'll be generous and just regenerate the whole shop - it's unlikely someone bought something, uninstalled the mod, loaded into a save, then reinstalled the mod and opened the shop again
			args.ModsNikkelMHadesBiomesRequestedRegeneration = true
			game.CurrentRun.MarketItems = nil
			-- Generate both the once-per-run and normal items
			args.RefreshOncePerRun = true
			marketItems = game.GenerateMarketItems(source, args) or {}
			args.RefreshOncePerRun = nil
			marketItems = game.ConcatTableValuesIPairs(marketItems, game.GenerateMarketItems(source, args)) or {}
		end

		return marketItems
	end)
end)
