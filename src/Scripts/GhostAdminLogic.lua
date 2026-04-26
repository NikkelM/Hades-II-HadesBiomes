-- To ensure the originating category does not stay selected if we need to skip over an ineligible one
local function deselectCategoryTab(screen)
	local components = screen.Components
	local prevButton = components["Category" .. screen.ActiveCategoryIndex]
	if prevButton ~= nil then
		SetAlpha({ Id = prevButton.ActiveOverlayId, Fraction = 0.0, Duration = 0.1 })
		SetAnimation({ DestinationId = prevButton.Id, Name = prevButton.Animations.Default })
		local previousShift = not game.IsEmpty(prevButton.IconShiftRequests)
		prevButton.IconShiftRequests.Open = nil
		if previousShift and game.IsEmpty(prevButton.IconShiftRequests) then
			Move({
				Id = prevButton.IconId,
				Angle = 270,
				Distance = screen.CategoryIconMouseOverShiftDistance,
				Speed = screen.CategoryIconMouseOverShiftSpeed,
				SmoothStep = true,
				Additive = true
			})
		end
	end
end

-- Fix crash trying to navigate to Zagreus' Journey cauldron tab on controller/keyboard when Alchemy is not unlocked yet
modutil.mod.Path.Wrap("GhostAdminNextCategory", function(base, screen, button)
	local total = #screen.ItemCategories
	local nextIndex = screen.ActiveCategoryIndex + 1
	if nextIndex > total then
		nextIndex = 1
	end

	if screen.Components["Category" .. nextIndex] == nil and nextIndex ~= screen.ActiveCategoryIndex then
		deselectCategoryTab(screen)
		screen.ActiveCategoryIndex = nextIndex
		return base(screen, button)
	end

	return base(screen, button)
end)

modutil.mod.Path.Wrap("GhostAdminPrevCategory", function(base, screen, button)
	local total = #screen.ItemCategories
	local prevIndex = screen.ActiveCategoryIndex - 1
	if prevIndex < 1 then
		prevIndex = total
	end

	if screen.Components["Category" .. prevIndex] == nil and prevIndex ~= screen.ActiveCategoryIndex then
		deselectCategoryTab(screen)
		screen.ActiveCategoryIndex = prevIndex
		return base(screen, button)
	end

	return base(screen, button)
end)
