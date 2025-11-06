modutil.mod.Path.Context.Wrap("SetupHarvestPoints", function(currentRoom, harvestPointArgs)
	-- Only use different logic if we are in a modded run, but not in Chaos, as that has proper harvest point placements
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.RoomSetName ~= "Secrets" then
		-- To replace which Ids get used to place the current harvest point
		modutil.mod.Path.Wrap("GetInactiveIdsByType", function(base, args)
			if args.Name == "PickaxePoint" or args.Name == "ExorcismPoint" then
				-- Using Breakables to place the pickaxe and exorcism points in the corners and along walls instead of in the middle of the room
				local eligibleIds = GetIdsByType({ Names = { "Breakable", "BreakableAsphodel", "BreakableElysium", "BreakableStyx" } }) or
						-- Otherwise, fallback to enemy, points, giving priority to those more likely on the sides of the map
						GetIdsByType({ Names = { "EnemyPointRanged", "EnemyPointSupport" } }) or
						GetIdsByType({ Names = { "EnemyPoint", "EnemyPointMelee" } }) or
						-- If none are found, fallback to Ghost spawn points
						GetIdsByType({ Names = { "TartarusGhost01", "AsphodelGhost01" } }) or {}
				if args.Name == "ExorcismPoint" then
					-- If we already chose PickaxePoints, remove those Ids from the eligible ExorcismPoint Ids to not overlap
					if currentRoom.PickaxePointChoices then
						local usedIds = {}
						for _, usedId in ipairs(currentRoom.PickaxePointChoices) do
							usedIds[usedId] = true
						end

						for i = #eligibleIds, 1, -1 do
							local id = eligibleIds[i]
							if usedIds[id] then
								table.remove(eligibleIds, i)
							end
						end
					end
				end
				return eligibleIds
			elseif args.Name == "HarvestPoint" or args.Name == "ShovelPoint" then
				local eligibleIds = GetIdsByType({ Names = { "EnemyPoint", "EnemyPointMelee", "EnemyPointRanged", "EnemyPointSupport", } }) or
						GetIdsByType({ Names = { "Breakable", "BreakableAsphodel", "BreakableElysium", "BreakableStyx" } }) or {}
				if args.Name == "ShovelPoint" then
					-- If we already chose HarvestPoints, remove those Ids from the eligible ShovelPoint Ids to not overlap
					if currentRoom.HarvestPointChoicesIds then
						local usedIds = {}
						for _, usedId in ipairs(currentRoom.HarvestPointChoicesIds) do
							usedIds[usedId] = true
						end

						for i = #eligibleIds, 1, -1 do
							local id = eligibleIds[i]
							if usedIds[id] then
								table.remove(eligibleIds, i)
							end
						end
					end
				end
				return eligibleIds
			end

			return base(args)
		end)

		-- For our modded harvest points, we need to spawn a new obstacle, as we don't use the preset Ids
		modutil.mod.Path.Wrap("SetupObstacle", function(base, obstacle)
			if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.RoomSetName ~= "Secrets" then
				local moddedResourceAnimations = {
					-- Plants
					"HarvestPoint_ModsNikkelMHadesBiomes_PlantTartarus",
					"HarvestPoint_ModsNikkelMHadesBiomes_PlantAsphodel",
					"HarvestPoint_ModsNikkelMHadesBiomes_PlantElysium",
					"HarvestPoint_ModsNikkelMHadesBiomes_PlantStyx",
					-- Ore
					"PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus",
					"PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel",
					"PickaxePoint_ModsNikkelMHadesBiomes_OreElysium",
					"PickaxePoint_ModsNikkelMHadesBiomes_OreStyx",
				}
				local staticBasePlants = {
					"HarvestPoint_ModsNikkelMHadesBiomes_PlantTartarus",
					"HarvestPoint_ModsNikkelMHadesBiomes_PlantAsphodel",
					"HarvestPoint_ModsNikkelMHadesBiomes_PlantStyx",
				}

				if game.Contains(moddedResourceAnimations, obstacle.Animation) or obstacle.Name == "ExorcismPoint" then
					if obstacle.ModsNikkelMHadesBiomesOccupySpawnPointId then
						obstacle.OccupyingSpawnPointId = obstacle.ObjectId
					end

					-- Use a presentation function that doesn't flip the base obstacle
					if game.Contains(staticBasePlants, obstacle.Animation) then
						obstacle.OnUsedFunctionArgs = {
							PresentationFunctionName = _PLUGIN.guid ..
									"." .. "ModsNikkelMHadesBiomes_StaticBase_UsedHarvestPointPresentation",
						}
					end

					-- Additionally, if we are placed on a Breakable ID, we need to break that breakable and those in close proximity to prevent any clipping
					if obstacle.ModsNikkelMHadesBiomesBreakBreakablesOnPlace then
						local nearbyBreakables = GetClosestIds({
							Id = obstacle.ObjectId,
							DestinationIds = GetIdsByType({
								Names = { "Breakable", "BreakableAsphodel", "BreakableElysium", "BreakableStyx", "BlastCubeFused", "BlastCubeFusedRegenerating", "TartarusGhost01", "AsphodelGhost01", "ElysiumGhost01" },
							}),
							Distance = 65,
						})
						-- Destroy the nearest breakables silently to avoid clipping
						Destroy({ Ids = nearbyBreakables, Silent = true })
					end

					obstacle.ObjectId = SpawnObstacle({
						Name = obstacle.Name,
						DestinationId = obstacle.ObjectId,
						Group = "Standing",
					})

					-- Scale down ExorcismPoint ghosts
					if obstacle.ModsNikkelMHadesBiomesScaleFactors and obstacle.ModsNikkelMHadesBiomesScaleFactors[obstacle.Animation] then
						SetScale({
							Id = obstacle.ObjectId,
							Fraction = obstacle.ModsNikkelMHadesBiomesScaleFactors[obstacle.Animation]
						})
					end

					-- If it is an ExorcismPoint, angle the ghost towards the nearest spawn point
					if obstacle.Name == "ExorcismPoint" then
						local nearestSpawnPoint = GetClosest({ Id = obstacle.ObjectId, DestinationNames = "SpawnPoints" }) or
								game.CurrentRun.Hero.ObjectId
						AngleTowardTarget({ Id = obstacle.ObjectId, DestinationId = nearestSpawnPoint })
					end
				end
			end

			return base(obstacle)
		end)
	end
end)
