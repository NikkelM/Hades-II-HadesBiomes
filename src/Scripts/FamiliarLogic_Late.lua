modutil.mod.Path.Context.Wrap.Static("AssignFamiliarKits", function()
	modutil.mod.Path.Wrap("GetClosest", function(base, args)
		-- For Ophis, prevent him spawning on the stairs
		if args.Id == 40012 and args.DestinationName == "SpawnPoints" and game.GameState.EquippedFamiliar == "ModsNikkelMHadesBiomesSnakeFamiliar" then
			return 589707
		end

		return base(args)
	end)

	modutil.mod.Path.Wrap("LoadPackages", function(base, args)
		if args.Names == game.FamiliarOrderData then
			-- Vanilla has already collected and sorted its kit IDs
			local kitIds = game.MapState.FamiliarKitIds
			for index, familiarName in ipairs(game.FamiliarOrderData) do
				local kit = game.FamiliarData[familiarName].ModsNikkelMHadesBiomes_CrossroadsKit
				if kit ~= nil then
					for _, decoration in ipairs(kit.Decorations or {}) do
						if decoration.GameStateRequirements == nil or game.IsGameStateEligible(decoration, decoration.GameStateRequirements) then
							local id = SpawnObstacle(decoration.SpawnArgs)
							if decoration.Scale ~= nil then
								SetScale({ Id = id, Fraction = decoration.Scale })
							end
							if decoration.Color ~= nil then
								SetColor({ Id = id, Color = decoration.Color })
							end
							if decoration.HSV ~= nil then
								SetHSV({ Id = id, HSV = decoration.HSV, ValueChangeType = "Absolute" })
							end
							if decoration.Ambient ~= nil then
								SetThingProperty({ DestinationId = id, Property = "Ambient", Value = decoration.Ambient })
							end
						end
					end
					table.insert(kitIds, index, SpawnObstacle(kit.SpawnArgs))
				end
			end
		end

		return base(args)
	end)
end)
