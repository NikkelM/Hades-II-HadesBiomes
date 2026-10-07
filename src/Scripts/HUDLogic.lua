modutil.mod.Path.Wrap("TraitUIAdd", function(base, trait, args)
	-- To ensure the Companion is created to the right of the Keepsake when it is being equipped, and doesn't overlap with a potential Hex during the run
	if game.HUDScreen ~= nil and trait.Slot == "Assist" and game.TableLength(game.HUDScreen.ActiveTraitComponents) == 0 then
		trait.ActiveSlotOffsetIndex = 1
		local result = base(trait, args)
		trait.ActiveSlotOffsetIndex = nil

		return result
	end

	return base(trait, args)
end)
