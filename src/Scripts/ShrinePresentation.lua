modutil.mod.Path.Context.Wrap("UpdateShrineRunDoorArrow", function(source, args)
	modutil.mod.Path.Wrap("FlipVertical", function(base, flipArgs)
		-- Only flip vertically if the active bounty is not modded
		if not game.Contains(mod.ModdedShrineBountyNames, game.GameState.ActiveShrineBounty) then
			return base(flipArgs)
		end
	end)
end)
