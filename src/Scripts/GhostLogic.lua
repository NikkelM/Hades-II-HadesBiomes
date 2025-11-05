-- For exorcised ghosts
modutil.mod.Path.Context.Wrap("GhostRecruitsPreRun", function(source, args)
	modutil.mod.Path.Wrap("SetupObstacle", function(base, obstacle)
		-- Load package with the correct texture
		if obstacle.ModsNikkelMHadesBiomesLoadPackages and obstacle.ModsNikkelMHadesBiomesLoadPackages[obstacle.Animation] then
			LoadPackages({ Name = obstacle.ModsNikkelMHadesBiomesLoadPackages[obstacle.Animation] })
		end

		-- Scale down modded ghosts
		if obstacle.ModsNikkelMHadesBiomesScaleFactors and obstacle.ModsNikkelMHadesBiomesScaleFactors[obstacle.Animation] then
			SetScale({
				Id = obstacle.ObjectId,
				Fraction = obstacle.ModsNikkelMHadesBiomesScaleFactors[obstacle.Animation]
			})
		end

		return base(obstacle)
	end)
end)
