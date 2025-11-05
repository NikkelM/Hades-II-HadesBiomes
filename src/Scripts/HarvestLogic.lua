modutil.mod.Path.Context.Wrap("SetupHarvestPoints", function(currentRoom, harvestPointArgs)
	-- Only use different logic if we are in a modded run, but not in Chaos, as that has proper harvest point placements
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.RoomSetName ~= "Secrets" then
		-- To replace which Ids get used to place the current harvest point
		modutil.mod.Path.Wrap("GetInactiveIdsByType", function(base, args)
			if args.Name == "PickaxePoint" or args.Name == "ExorcismPoint" then
				-- Using Breakables to place the pickaxe and exorcism points in the corners and along walls instead of in the middle of the room
				return GetIdsByType({ Names = {"Breakable", "BreakableAsphodel", "BreakableElysium", "BreakableStyx", } })
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
				-- Additionally, if we are placed on a Breakable ID, we need to break that breakable and those in close proximity to prevent any clipping
				if obstacle.ModsNikkelMHadesBiomesBreakBreakablesOnPlace then
					local nearbyBreakables = GetClosestIds({
						Id = obstacle.ObjectId,
						DestinationIds = GetIdsByType({
							Names = { "Breakable", "BlastCubeFused", "BlastCubeFusedRegenerating", },
						}),
						Distance = 70,
					})
					-- Destroy the nearest breakables silently to avoid clipping
					Destroy({ Ids = nearbyBreakables, Silent = true })
				end

				obstacle.ObjectId = SpawnObstacle({
					Name = obstacle.Name,
					DestinationId = obstacle.ObjectId,
					Group = "Standing",
				})
			end

			return base(obstacle)
		end)
	end
end)
