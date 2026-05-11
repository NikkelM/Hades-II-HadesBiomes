modutil.mod.Path.Context.Wrap.Static("RequiredMinExits", function(origSource, origArgs)
	modutil.mod.Path.Wrap("CollapseTableOrdered", function(base, tableArg)
		local collapsed = base(tableArg)

		for index, exitDoor in ipairs(collapsed) do
			-- Exclude Erebus Gates from the exit door count used for Devotion/Family Dispute eligibility
			if exitDoor.Name == "ShrinePointDoor" then
				game.RemoveIndexAndCollapse(collapsed, index)
				break
			end
		end

		return collapsed
	end)
end)
