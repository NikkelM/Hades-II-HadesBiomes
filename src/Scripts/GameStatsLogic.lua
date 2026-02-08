modutil.mod.Path.Override("ShowTraitStats", function(screen)
	Destroy({ Ids = screen.IconIds })

	local components = screen.Components
	local category = screen.TraitFilters[screen.ActiveCategoryIndex]
	ModifyTextBox({ Id = screen.Components.CategoryTitleText.Id, Text = category.Name })
	ModifyTextBox({ Id = components["Category" .. screen.CurrentFilter].Id, Color = game.Color.White })

	if screen.PrevCategoryName ~= category.Name then
		if screen.PrevCategoryName ~= nil then
			local prevCategoryButton = screen.Components["Category" .. screen.PrevCategoryName]
			if prevCategoryButton ~= nil then
				SetAlpha({ Id = prevCategoryButton.ActiveOverlayId, Fraction = 0.0, Duration = 0.1 })
				local previousShift = not game.IsEmpty(prevCategoryButton.IconShiftRequests)
				prevCategoryButton.IconShiftRequests.Open = nil
				if previousShift and game.IsEmpty(prevCategoryButton.IconShiftRequests) then
					Move({
						Id = prevCategoryButton.IconId,
						Angle = 270,
						Distance = screen.TabIconMouseOverShiftDistance,
						Speed = screen.TabIconMouseOverShiftSpeed,
						SmoothStep = true,
						Additive = true
					})
				end
			end
		end

		-- Highlight new category
		local newCategoryButton = components["Category" .. category.Name]
		SetAlpha({ Id = newCategoryButton.ActiveOverlayId, Fraction = 1.0, Duration = 0.1 })
		SetAlpha({ Id = screen.Components.CategoryTitleText.Id, Fraction = 1.0, Duration = 0.1 })
		local previousShift = not game.IsEmpty(newCategoryButton.IconShiftRequests)
		newCategoryButton.IconShiftRequests.Open = true
		if not previousShift then
			Move({
				Id = newCategoryButton.IconId,
				Angle = 90,
				Distance = screen.TabIconMouseOverShiftDistance,
				Speed = screen.TabIconMouseOverShiftSpeed,
				SmoothStep = true,
				Additive = true
			})
		end
		screen.PrevCategoryName = category.Name
	end

	screen.IconIds = {}
	screen.NumItems = 0

	local locationY = screen.RowStartY
	local columnHeaders = screen.WeaponColumnHeaders

	-- Compile the set of all eligible traits for the active filter
	local eligibleTraitStats = {}
	for traitName, traitStat in pairs(game.GameState.LifetimeTraitStats) do
		if game.PassesTraitFilter(screen.CurrentFilter, traitName) then
			eligibleTraitStats[traitName] = traitStat
		end
	end

	-- De-dupe dummy weapons and Aspects of Melinoe
	for aspectName, dummyName in pairs(screen.WeaponBaseAspectMapping) do
		local aspectStat = game.ShallowCopyTable(eligibleTraitStats[aspectName])
		local dummyStat = eligibleTraitStats[dummyName]

		if aspectStat ~= nil and dummyStat ~= nil then
			if aspectStat.UseCount ~= nil or dummyStat.UseCount ~= nil then
				aspectStat.UseCount = (aspectStat.UseCount or 0) + (dummyStat.UseCount or 0)
			end
			if aspectStat.ClearCount ~= nil or dummyStat.ClearCount ~= nil then
				aspectStat.ClearCount = (aspectStat.ClearCount or 0) + (dummyStat.ClearCount or 0)
			end
			if aspectStat.FastestTimeUnderworld ~= nil or dummyStat.FastestTimeUnderworld ~= nil then
				aspectStat.FastestTimeUnderworld = math.min(aspectStat.FastestTimeUnderworld or 999999,
					dummyStat.FastestTimeUnderworld or 999999)
			end
			if aspectStat.FastestTimeSurface ~= nil or dummyStat.FastestTimeSurface ~= nil then
				aspectStat.FastestTimeSurface = math.min(aspectStat.FastestTimeSurface or 999999,
					dummyStat.FastestTimeSurface or 999999)
			end
			if aspectStat.HighestShrinePointsUnderworld ~= nil or dummyStat.HighestShrinePointsUnderworld ~= nil then
				aspectStat.HighestShrinePointsUnderworld = math.max(aspectStat.HighestShrinePointsUnderworld or 0,
					dummyStat.HighestShrinePointsUnderworld or 0)
			end
			if aspectStat.HighestShrinePointsSurface ~= nil or dummyStat.HighestShrinePointsSurface ~= nil then
				aspectStat.HighestShrinePointsSurface = math.max(aspectStat.HighestShrinePointsSurface or 0,
					dummyStat.HighestShrinePointsSurface or 0)
			end
			-- CUSTOM START
			if aspectStat.ModsNikkelMHadesBiomesFastestTime ~= nil or dummyStat.ModsNikkelMHadesBiomesFastestTime ~= nil then
				aspectStat.ModsNikkelMHadesBiomesFastestTime = math.min(aspectStat.ModsNikkelMHadesBiomesFastestTime or 999999,
					dummyStat.ModsNikkelMHadesBiomesFastestTime or 999999)
			end
			if aspectStat.ModsNikkelMHadesBiomesHighestShrinePoints ~= nil or dummyStat.ModsNikkelMHadesBiomesHighestShrinePoints ~= nil then
				aspectStat.ModsNikkelMHadesBiomesHighestShrinePoints = math.max(
					aspectStat.ModsNikkelMHadesBiomesHighestShrinePoints or 0,
					dummyStat.ModsNikkelMHadesBiomesHighestShrinePoints or 0)
			end
			-- CUSTOM END
			eligibleTraitStats[aspectName] = aspectStat
			eligibleTraitStats[dummyName] = nil
		end
	end

	local highestUseCount = 0
	local highestClearCount = 0
	local fastestTimeUnderworld = 999999
	local fastestTimeSurface = 999999
	local highestShrinePointsUnderworld = 0
	local highestShrinePointsSurface = 0
	-- CUSTOM START
	local fastestTimeModded = 999999
	local highestShrinePointsModded = 0
	-- CUSTOM END
	for traitName, traitStat in pairs(eligibleTraitStats) do
		highestUseCount = math.max(highestUseCount, traitStat.UseCount or 0)
		highestClearCount = math.max(highestClearCount, traitStat.ClearCount or 0)
		fastestTimeUnderworld = math.min(fastestTimeUnderworld, traitStat.FastestTimeUnderworld or 999999)
		highestShrinePointsUnderworld = math.max(highestShrinePointsUnderworld, traitStat.HighestShrinePointsUnderworld or 0)
		fastestTimeSurface = math.min(fastestTimeSurface, traitStat.FastestTimeSurface or 999999)
		highestShrinePointsSurface = math.max(highestShrinePointsSurface, traitStat.HighestShrinePointsSurface or 0)
		-- CUSTOM START
		fastestTimeModded = math.min(fastestTimeModded, traitStat.ModsNikkelMHadesBiomesFastestTime or 999999)
		highestShrinePointsModded = math.max(highestShrinePointsModded,
			traitStat.ModsNikkelMHadesBiomesHighestShrinePoints or 0)
		-- CUSTOM END
	end

	local sortedTraits = {}
	for traitName, traitStat in pairs(eligibleTraitStats) do
		local displayName = traitName
		if game.TraitData[traitName].Slot == "Aspect" then
			displayName = game.GetKey(game.ScreenData.WeaponUpgradeScreen.FreeUnlocks, traitName) or
					game.TraitData[traitName].CustomName or traitName
		end
		local sortableTrait = {
			Name = traitName,
			DisplayName = GetDisplayName({ Text = displayName }),
			Value = traitStat[screen.SortKeys[game.GameState.RunHistoryGameStatsSortMode]]
		}
		if sortableTrait.Value ~= nil and screen.SortInReverse[screen.SortKeys[game.GameState.RunHistoryGameStatsSortMode]] then
			sortableTrait.Value = sortableTrait.Value * -1 -- negate this so smaller time == better
		end
		table.insert(sortedTraits, sortableTrait)
	end
	table.sort(sortedTraits, game.GameStatsScreenSort)

	for i, sortedTrait in ipairs(sortedTraits) do
		screen.NumItems = screen.NumItems + 1
		local columnNum = 1
		if screen.NumItems > screen.ScrollOffset and screen.NumItems <= screen.ScrollOffset + screen.ItemsPerPage then
			local traitName = sortedTrait.Name
			local traitStat = eligibleTraitStats[traitName]
			local positionData = { LoopIndex = i, LocationY = locationY }

			-- Name
			game.GameStatsCreateEntryTextbox(screen, positionData, { ColumnIndex = 1, Text = sortedTrait.DisplayName })

			-- Icon
			local columnData = columnHeaders[2]
			local component = CreateScreenComponent({
				Name = "BlankObstacle",
				Group = screen.ComponentData.DefaultGroup,
				X = columnData.X,
				Y = locationY,
				Scale = screen.IconScaleTraits
			})
			components[columnData.ColumnName .. i] = component
			SetAnimation({ DestinationId = component.Id, Name = game.TraitData[traitName].Icon })
			table.insert(screen.IconIds, component.Id)

			-- UseCount
			game.GameStatsCreateEntryTextbox(screen, positionData,
				{ ColumnIndex = 3, Text = traitStat.UseCount, IsRecord = (highestUseCount == traitStat.UseCount) })

			-- BarGraph
			local columnData = columnHeaders[4]
			local component = CreateScreenComponent({
				Name = "BlankObstacle",
				Group = screen.ComponentData.DefaultGroup,
				X = columnData.X,
				Y = locationY
			})
			components[columnData.ColumnName .. i] = component
			SetAnimation({ DestinationId = component.Id, Name = "BarGraphBar" }) --nopkg
			local usageRate = traitStat.UseCount / highestUseCount
			SetScaleX({ Id = component.Id, Fraction = usageRate, Duration = 0.0 })
			table.insert(screen.IconIds, component.Id)

			-- ClearCount (Underworld + Surface)
			game.GameStatsCreateEntryTextbox(screen, positionData,
				{ ColumnIndex = 5, Text = traitStat.ClearCount, IsRecord = (highestClearCount == traitStat.ClearCount) })

			-- ClearRecordTime (Underworld)
			game.GameStatsCreateEntryTextbox(screen, positionData,
				{ ColumnIndex = 6, Text = traitStat.FastestTimeUnderworld, IsTimeValue = true, IsRecord = (fastestTimeUnderworld == traitStat.FastestTimeUnderworld) })

			-- ClearRecordShrinePoints (Underworld)
			game.GameStatsCreateEntryTextbox(screen, positionData,
				{ ColumnIndex = 7, Text = traitStat.HighestShrinePointsUnderworld, IsRecord = (highestShrinePointsUnderworld == traitStat.HighestShrinePointsUnderworld) })

			-- ClearRecordTime (Surface)
			game.GameStatsCreateEntryTextbox(screen, positionData,
				{ ColumnIndex = 8, Text = traitStat.FastestTimeSurface, IsTimeValue = true, IsRecord = (fastestTimeSurface == traitStat.FastestTimeSurface) })

			-- ClearRecordShrinePoints (Surface)
			game.GameStatsCreateEntryTextbox(screen, positionData,
				{ ColumnIndex = 9, Text = traitStat.HighestShrinePointsSurface, IsRecord = (highestShrinePointsSurface == traitStat.HighestShrinePointsSurface) })

			-- CUSTOM START
			-- ClearRecordTime (Zagreus' Journey)
			game.GameStatsCreateEntryTextbox(screen, positionData,
				{ ColumnIndex = 10, Text = traitStat.ModsNikkelMHadesBiomesFastestTime, IsTimeValue = true, IsRecord = (fastestTimeModded == traitStat.ModsNikkelMHadesBiomesFastestTime) })

			-- ClearRecordShrinePoints (Zagreus' Journey)
			game.GameStatsCreateEntryTextbox(screen, positionData,
				{ ColumnIndex = 11, Text = traitStat.ModsNikkelMHadesBiomesHighestShrinePoints, IsRecord = (highestShrinePointsModded == traitStat.ModsNikkelMHadesBiomesHighestShrinePoints) })
			-- CUSTOM END

			locationY = locationY + screen.RowSpacingTraits
		end
	end
end)
