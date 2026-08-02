-- Re-implementation of the H1 version of PatrolPath, as the H2 version doesn't work with pre-placed ghosts
function mod.PatrolPath(source, args)
	local numPatrols = 0
	while args.MaxPatrols == nil or numPatrols < args.MaxPatrols do
		local availableIds = GetIds({ Name = args.GroupName })
		if game.IsEmpty(availableIds) then
			return
		end
		game.wait(args.SendPatrolInterval, game.RoomThreadName)
		local moverId = game.RemoveRandomValue(availableIds)
		if args.RemoveFromGroup then
			RemoveFromGroup({ Id = moverId, Name = args.GroupName })
		end
		if args.AddToGroup then
			AddToGroup({ Id = moverId, Name = args.NewGroupName })
		end

		local mover = game.MapState.ActiveObstacles[moverId]
		if mover ~= nil then
			local mapAngle = GetAngle({ Id = mover.ObjectId })
			SetAngle({ Id = mover.ObjectId, Angle = 0, Duration = 0.0 })
			SetGoalAngle({ Id = mover.ObjectId, Angle = mapAngle, Duration = 0.0 })

			mover.Speed = game.RandomFloat(args.SpeedMin, args.SpeedMax)
			game.thread(game.FollowPath, mover, args.Path, { Loop = args.Loop ~= false })
			numPatrols = numPatrols + 1
		end
	end
end
