modutil.mod.Path.Wrap("ShowQuestProgress", function(base, screen, questData, requirements)
	-- If custom strings should be shown for each requirement that wouldn't show with vanilla logic (E.g. Value requirements that should not show x/y)
	-- The logic at the top and bottom is the same as in the base function, only the middle part is changed to show custom strings
	if questData.ModsNikkelMHadesBiomesCustomCompleteRequirementsDisplayStrings ~= nil then
		requirements = requirements or questData.DisplayedCompleteGameStateRequirements or
				questData.CompleteGameStateRequirements

		local index = 0
		local visibleIndex = 1
		local spacing = questData.Spacing or screen.RequirementRowSpacing
		local baseOffsetY = game.GetLocalizedValue(0, screen.CompleteRequirementsOffsetY)
		local offsetY = baseOffsetY

		local maxEntriesPerColumn = questData.MaxEntriesPerColumn or screen.RequirementEntriesPerColumn
		local currentColumn = 1
		local columnWidth = screen.RequirementColumnSpacing

		local completeColor = screen.RequirementCompleteColor
		local incompleteColor = screen.RequirementIncompleteColor

		local customStrings = questData.ModsNikkelMHadesBiomesCustomCompleteRequirementsDisplayStrings

		local maxVisibleRequirements = screen.RequirementEntriesPerColumn * screen.RequirementEntriesMaxColumns
		local firstVisibleIndex = 1 + (screen.ProgressPageOffset * screen.RequirementEntriesPerColumn)
		local maxVisibleIndex = (firstVisibleIndex + maxVisibleRequirements) - 1

		-- This is where the custom logic starts
		for i, requirement in ipairs(requirements) do
			local complete = game.IsGameStateEligible(questData, { requirement })
			index = index + 1
			if index >= firstVisibleIndex and index <= maxVisibleIndex then
				local bulletPointFormat = game.ShallowCopyTable(screen.BulletPointFormat)
				bulletPointFormat.Id = screen.Components.DescriptionBox.Id
				bulletPointFormat.Text = complete and "QuestLog_QuestProgressComplete" or "QuestLog_QuestProgressIncomplete"
				bulletPointFormat.OffsetX = (currentColumn - 1) * columnWidth
				bulletPointFormat.OffsetY = offsetY
				CreateTextBox(bulletPointFormat)

				local completionRequirementFormat = game.ShallowCopyTable(screen.CompletionRequirementFormat)
				completionRequirementFormat.Id = screen.Components.DescriptionBox.Id
				completionRequirementFormat.Text = customStrings[i]
				completionRequirementFormat.OffsetX = screen.CompleteRequirementsOffsetX + ((currentColumn - 1) * columnWidth)
				completionRequirementFormat.OffsetY = offsetY
				completionRequirementFormat.Color = complete and completeColor or incompleteColor
				completionRequirementFormat.TextSymbolScale = questData.CompletionRequirementTextSymbolScale or
						completionRequirementFormat.TextSymbolScale
				CreateTextBox(completionRequirementFormat)

				visibleIndex = visibleIndex + 1
				offsetY = offsetY + spacing
			end
			if visibleIndex > maxEntriesPerColumn * currentColumn then
				currentColumn = currentColumn + 1
				offsetY = baseOffsetY
			end
		end
		-- This is where the custom logic ends

		screen.NumRequirements = index
		screen.NumRequirementsColumns = math.ceil(screen.NumRequirements / screen.RequirementEntriesPerColumn)
		if screen.ProgressPageOffset >= 1 then
			SetAlpha({ Id = screen.Components.ScrollLeft.Id, Fraction = 1.0, Duration = 0.2 })
		else
			game.QuestLogHideScrollButtons(screen, { HideLeft = true })
		end
		if screen.ProgressPageOffset <= (screen.NumRequirementsColumns - screen.RequirementEntriesMaxColumns) - 1 then
			SetAlpha({ Id = screen.Components.ScrollRight.Id, Fraction = 1.0, Duration = 0.2 })
			if not screen.Components.ScrollRight.Visible then
				screen.Components.ScrollRight.Visible = true
				if not screen.ViewedQuestProgress[questData.Name] then
					game.thread(game.PulseContextActionPresentation, screen.Components.ScrollRight,
						{ ThreadName = "QuestLogPulse" })
				end
			end
		else
			game.QuestLogHideScrollButtons(screen, { HideRight = true })
		end
	else
		return base(screen, questData, requirements)
	end
end)
