modutil.mod.Path.Context.Wrap.Static("CreateDoorRewardPreview",
	function(origExitDoor, origChosenRewardType, origChosenLootName, origIndex, origArgs)
		modutil.mod.Path.Wrap("SpawnObstacle", function(base, args)
			local exitDoor = modutil.mod.Locals.Stacked(3).exitDoor
			local chosenRewardType = modutil.mod.Locals.Stacked(3).chosenRewardType
			if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and mod.HadesExitDoorObstacleNames[exitDoor.Name] and not args.ReUseIds and chosenRewardType == "Devotion" then
				-- In modded runs, the Devotion previews are scaled down, so we also move them closer towards each other
				local doorIconOffsetX = modutil.mod.Locals.Stacked(3).doorIconOffsetX
				local doorIconIsometricShiftX = modutil.mod.Locals.Stacked(3).doorIconIsometricShiftX
				-- Determine if we are on LootA or LootB
				if doorIconOffsetX + doorIconIsometricShiftX < args.OffsetX then
					-- We are on LootA, which is on the lower left
					args.OffsetX = args.OffsetX - 3
					args.OffsetY = args.OffsetY + 9
				else
					-- We are on LootB, which is on the upper right
					args.OffsetX = args.OffsetX + 3
					args.OffsetY = args.OffsetY - 9
				end
			end

			return base(args)
		end)

		modutil.mod.Path.Wrap("SetScale", function(base, args)
			local exitDoor = modutil.mod.Locals.Stacked(3).exitDoor
			local chosenRewardType = modutil.mod.Locals.Stacked(3).chosenRewardType
			if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and mod.HadesExitDoorObstacleNames[exitDoor.Name] and not args.ReUseIds and chosenRewardType == "Devotion" then
				-- In modded runs, the Devotion previews are too large for the door frames
				args.Fraction = args.Fraction - 0.15
			end

			return base(args)
		end)
	end)
