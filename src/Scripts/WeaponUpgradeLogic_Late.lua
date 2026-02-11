modutil.mod.Path.Context.Wrap.Static("OpenWeaponUpgradeScreen", function(originalArgs)
	modutil.mod.Path.Wrap("WeaponUpgradeScreenGetStats", function(base, screen, weaponName)
		-- Gather the stats for modded runs
		local traitNames = {}
		for _, itemName in ipairs(screen.DisplayOrder[weaponName]) do
			table.insert(traitNames, itemName)
			local dummyName = game.ScreenData.GameStats.WeaponBaseAspectMapping[itemName]
			if dummyName ~= nil then
				table.insert(traitNames, dummyName)
			end
		end

		local moddedClearStats = {}
		for _, traitName in ipairs(traitNames) do
			local traitStat = game.GameState.LifetimeTraitStats[traitName]
			if traitStat ~= nil then
				if traitStat.ModsNikkelMHadesBiomesFastestTime ~= nil and traitStat.ModsNikkelMHadesBiomesFastestTime < (moddedClearStats.ModsNikkelMHadesBiomesFastestTime or 999999) then
					moddedClearStats.ModsNikkelMHadesBiomesFastestTime = traitStat.ModsNikkelMHadesBiomesFastestTime
				end
				if traitStat.ModsNikkelMHadesBiomesHighestShrinePoints ~= nil and traitStat.ModsNikkelMHadesBiomesHighestShrinePoints > (moddedClearStats.ModsNikkelMHadesBiomesHighestShrinePoints or 0) then
					moddedClearStats.ModsNikkelMHadesBiomesHighestShrinePoints = traitStat
							.ModsNikkelMHadesBiomesHighestShrinePoints
				end
			end
		end

		-- Now also add them to the screen, which is done in OpenWeaponUpgradeScreen after this call for the vanilla routes
		if moddedClearStats ~= nil then
			local components = screen.Components
			if moddedClearStats.ModsNikkelMHadesBiomesFastestTime ~= nil then
				ModifyTextBox({
					Id = components.ModsNikkelMHadesBiomesFastestTimeRecordValue.Id,
					Text = game.GetTimerString(moddedClearStats.ModsNikkelMHadesBiomesFastestTime, 2)
				})
			end
			if moddedClearStats.ModsNikkelMHadesBiomesHighestShrinePoints ~= nil then
				ModifyTextBox({
					Id = components.ModsNikkelMHadesBiomesHighestShrinePointsRecordValue.Id,
					Text = moddedClearStats.ModsNikkelMHadesBiomesHighestShrinePoints
				})
			end
		end

		return base(screen, weaponName)
	end)
end)
