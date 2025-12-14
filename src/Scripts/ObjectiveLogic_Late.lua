modutil.mod.Path.Context.Wrap.Static("AddResource", function(name, amount, source, args)
	modutil.mod.Path.Wrap("CheckObjectiveSet", function(base, objectiveSetName, checkTrigger, extraDelay)
		if objectiveSetName == "OpenInventory" then
			game.CheckObjectiveSet("ModsNikkelMHadesBiomesOpenInventory", checkTrigger, extraDelay)
		end

		return base(objectiveSetName, checkTrigger, extraDelay)
	end)
end)
