modutil.mod.Path.Context.Wrap("SetupHarvestPoints", function(currentRoom, harvestPointArgs)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- To replace which Ids get used to place the current harvest point
		modutil.mod.Path.Wrap("GetInactiveIdsByType", function(base, args)
			if args.Name == "PickaxePoint" then
				return GetIdsByType({ Name = "EnemyPoint" })
			end

			return base(args)
		end)

		-- For our modded harvest points, we need to spawn a new obstacle, as we don't use the preset Ids 
		modutil.mod.Path.Wrap("SetupObstacle", function(base, obstacle)
			local moddedResourceNames = {
				"ModsNikkelMHadesBiomes_OreTartarus",
				"ModsNikkelMHadesBiomes_OreAsphodel",
				"ModsNikkelMHadesBiomes_OreElysium",
				"ModsNikkelMHadesBiomes_OreStyx",
			}

			if game.Contains(moddedResourceNames, obstacle.ResourceName) then
				obstacle.ObjectId = SpawnObstacle({
					Name = obstacle.Name,
					DestinationId = obstacle.ObjectId,
					Group = "Standing"
				})
			end

			return base(obstacle)
		end)
	end
end)
