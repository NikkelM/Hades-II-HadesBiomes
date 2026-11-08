modutil.mod.Path.Context.Wrap.Static("CheckSprintPhasingCollision", function(origArgs)
	modutil.mod.Path.Wrap("GetClosestIds", function(base, args)
		-- Also check for collision with Hades Breakables
		local checkSprintPhasingCollisionArgs = modutil.mod.Locals.Stacked(3).args
		local id = GetClosestUnitOfType({
			Id = game.CurrentRun.Hero.ObjectId,
			DestinationNames = { "BaseBreakable", "Breakable", "BreakableAsphodel", "BreakableElysium", "BreakableStyx" },
			IgnoreHomingIneligible = true,
			Distance = checkSprintPhasingCollisionArgs.Range,
			ScaleY = checkSprintPhasingCollisionArgs.ScaleY
		})
		if id ~= nil and id ~= 0 then
			local breakable = game.ActiveEnemies[id]
			if breakable and breakable.ModsNikkelMHadesBiomesForceCollisionOnSprintPhase and not breakable.IgnoreDamage then
				if breakable ~= nil and breakable.CollisionReactions ~= nil then
					local playerVelocity = GetVelocity({ Id = game.CurrentRun.Hero.ObjectId })
					for _, collisionReaction in pairs(breakable.CollisionReactions) do
						if collisionReaction.MinVelocity == nil or playerVelocity >= collisionReaction.MinVelocity then
							if collisionReaction.KillSelf then
								game.Damage(breakable, {
									AttackerId = game.CurrentRun.Hero.ObjectId,
									AttackerTable = game.CurrentRun.Hero,
									DamageAmount = breakable.MaxHealth,
									IgnoreHealthBuffer = true,
									PureDamage = true,
								})
							else
								game.DoReaction(breakable, collisionReaction, { TriggeredByTable = game.CurrentRun.Hero })
							end
						end
					end
				end
			end
		end

		return base(args)
	end)
end)
