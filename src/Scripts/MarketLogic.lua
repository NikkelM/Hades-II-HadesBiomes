modutil.mod.Path.Context.Wrap("OpenMarketScreen", function(marketScreenArgs)
	modutil.mod.Path.Wrap("ModifyTextBox", function(base, args)
		local currencyResourceName = modutil.mod.Locals.Stacked(2).currencyResourceName
		if currencyResourceName == "ModsNikkelMHadesBiomes_BrokerResource" then
			local screen = modutil.mod.Locals.Stacked(2).screen
			-- If we are showing the amount we have of the dummy modded resource, display an empty string
			if args.Id == screen.Components.BasicResourceButton.Id then
				args.Text = " "
			end
		end
		base(args)
	end)
end)
