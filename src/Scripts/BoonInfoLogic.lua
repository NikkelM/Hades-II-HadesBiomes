modutil.mod.Path.Wrap("CreateTraitRequirements", function(base, screen, traitName)
	local traitData = game.TraitData[traitName]
	local moddedRequirementText = traitData and traitData.ModsNikkelMHadesBiomesCustomCodexRequirementsText

	-- We only run our custom logic if we have a custom requirement text to show
	-- Our wrap only allows for a single custom requirement text, which is met/unmet depending on if the GameStateRequirements of the trait are met or not
	-- We also assume that if we have a custom requirement text, we *don't* have any vanilla requirements to show
	-- If we do need this at some point, this function wrap will be a little more complicated
	if moddedRequirementText == nil then
		return base(screen, traitName)
	end

	traitData.GameStateRequirements = traitData.GameStateRequirements or {}

	local requirementMet = game.IsGameStateEligible(traitData, traitData.GameStateRequirements)
	local startY = game.ScreenData.BoonInfo.RequirementsStartY

	local listRequirementHeaderFormat = game.ShallowCopyTable(game.ScreenData.BoonInfo.ListRequirementHeaderFormat)
	listRequirementHeaderFormat.Id = screen.Components.RequirementsText.Id
	-- "Requires the Following:"
	listRequirementHeaderFormat.Text = "ModsNikkelMHadesBiomes_BoonInfoRequirements_CustomHeader"
	listRequirementHeaderFormat.Color = requirementMet and game.Color.BoonInfoAcquired or game.Color.White
	listRequirementHeaderFormat.OffsetY = startY
	game.CreateTextBox(listRequirementHeaderFormat)
	startY = startY + game.ScreenData.BoonInfo.ListRequirementHeaderSpacingY

	local listRequirementFormat = game.ShallowCopyTable(requirementMet and
		game.ScreenData.BoonInfo.ListRequirementAcquiredFormat or screen.ListRequirementUnacquiredFormat)
	listRequirementFormat.Id = screen.Components.RequirementsText.Id
	listRequirementFormat.Text = moddedRequirementText
	listRequirementFormat.OffsetY = startY
	listRequirementFormat.Width = 480
	listRequirementFormat.VerticalJustification = "Top"
	game.CreateTextBox(listRequirementFormat)
end)
