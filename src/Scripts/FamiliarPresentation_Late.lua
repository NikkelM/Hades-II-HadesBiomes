modutil.mod.Path.Context.Wrap.Static("FamiliarRecruitPresentation", function()
	-- To ensure the burrow decal plays correctly
	modutil.mod.Path.Wrap("SetAnimation", function(base, args)
		local familiar = game.ActiveEnemies[args.DestinationId]
		if familiar ~= nil and familiar.Name == "ModsNikkelMHadesBiomesSnakeFamiliar" and args.Name == familiar.BurrowAnimation then
			mod.SnakeFamiliarBurrowEffects(familiar, true)
		end

		return base(args)
	end)
end)
