modutil.mod.Path.Context.Wrap.Static("ChillApplyPresentation", function()
	modutil.mod.Path.Wrap("SetColor", function(base, args)
		local victim = modutil.mod.Locals.Stacked(3).victim
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim and victim.ModsNikkelMHadesBiomesIsModdedEnemy and not victim.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy then
			args.Color = { 170, 195, 255, 255 }
		end

		return base(args)
	end)

	modutil.mod.Path.Wrap("SetThingProperty", function(base, args)
		local victim = modutil.mod.Locals.Stacked(3).victim
		if args.Property == "AddColor" and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim and victim.ModsNikkelMHadesBiomesIsModdedEnemy and not victim.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy then
			return
		end

		return base(args)
	end)
end)

modutil.mod.Path.Context.Wrap.Static("DoRootApplyPresentation", function()
	modutil.mod.Path.Wrap("SetColor", function(base, args)
		if args.Ids then
			local normalIds, moddedIds = {}, {}
			for _, id in ipairs(args.Ids) do
				if mod.ModdedRootPresentationIds[id] then
					table.insert(moddedIds, id)
				else
					table.insert(normalIds, id)
				end
			end

			if #normalIds > 0 then
				base({ Ids = normalIds, Color = args.Color, Duration = args.Duration })
			end
			if #moddedIds > 0 then
				base({ Ids = moddedIds, Color = { 150, 180, 245, 255 }, Duration = args.Duration })
			end
		else
			return base(args)
		end
	end)

	modutil.mod.Path.Wrap("SetThingProperty", function(base, args)
		if args.Property == "AddColor" then
			local normalIds = {}
			for _, id in ipairs(args.DestinationId) do
				if not mod.ModdedRootPresentationIds[id] then
					table.insert(normalIds, id)
				end
			end
			args.DestinationId = normalIds

			return base(args)
		else
			return base(args)
		end
	end)
end)

modutil.mod.Path.Context.Wrap.Static("StasisPresentation", function()
	modutil.mod.Path.Wrap("SetColor", function(base, args)
		local victim = modutil.mod.Locals.Stacked(3).victim
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim and victim.ModsNikkelMHadesBiomesIsModdedEnemy and not victim.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy then
			args.Color = { 230, 210, 195, 255 }
		end

		return base(args)
	end)

	modutil.mod.Path.Wrap("SetThingProperty", function(base, args)
		local victim = modutil.mod.Locals.Stacked(3).victim
		if args.Property == "AddColor" and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim and victim.ModsNikkelMHadesBiomesIsModdedEnemy and not victim.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy then
			return
		end

		return base(args)
	end)
end)
