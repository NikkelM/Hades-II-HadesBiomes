modutil.mod.Path.Wrap("MarketScreenMouseOverItem", function(base, button)
	base(button)

	local screen = button.Screen
	if screen.SelectedItem and screen.SelectedItem.Category and screen.SelectedItem.Category.Name == mod.NewBrokerBossTradeCategory.Name then
		if screen.SelectedItem.Data ~= nil and screen.SelectedItem.Data.Cost ~= nil then
			local costTable = screen.SelectedItem.Data.Cost
			local resourceKey, amount = next(costTable)
			local resourceData = game.ResourceData[resourceKey]
			SetAnimation({
				DestinationId = screen.Components.BasicResourceButton.Id,
				Name = resourceData.TextIconPath or resourceData.IconPath or resourceData.Icon
			})
			ModifyTextBox({ Id = screen.Components.BasicResourceButton.Id, Text = game.GameState.Resources[resourceKey] or 0 })
		end
	end
end)

modutil.mod.Path.Wrap("MarketScreenMouseOffItem", function(base, button)
	local screen = button.Screen

	if screen.SelectedItem and screen.SelectedItem.Category and screen.SelectedItem.Category.Name == mod.NewBrokerBossTradeCategory.Name then
		local resourceKey = mod.NewBrokerBossTradeCategory.CurrencyResourceName
		local resourceData = game.ResourceData[resourceKey]
		SetAnimation({
			DestinationId = screen.Components.BasicResourceButton.Id,
			Name = resourceData.TextIconPath or resourceData.IconPath or resourceData.Icon
		})
		-- ??? since there is no amount of the dummy resource
		ModifyTextBox({ Id = screen.Components.BasicResourceButton.Id, Text = "???" })
	end

	return base(button)
end)

