-- Handles translation of GameStateRequirements to the Hades II format

---Maps any GameStateRequirements in the Hades format to the Hades II in the path, using the given context.
---@param base table The table containing the table for which to map the requirements, under the requirementsPath.
---@param requirementsPath table The path within base to where the original requirement(s) are located that should be mapped.
function mod.MapGameStateRequirements(base, requirementsPath)
	---Maps a Hades requirement to a Hades II GameStateRequirement.
	---@param hadesBaseTable any The requirements in Hades. Can have a number of different formats.
	---@return table GameStateRequirements A table containing the requirements in the Hades II format, to be assigned to GameStateRequirements = { ... }.
	local function mapSpecificRequirements(hadesBaseTable)
		local hades2Requirements = {}

		if hadesBaseTable.RequiredSupportAINames then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "SupportAINames" },
				Value = hadesBaseTable.RequiredSupportAINames,
				Comparison = "=="
			})
			hadesBaseTable.RequiredSupportAINames = nil
		end
		if hadesBaseTable.RequiredMaxSupportAINames then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "SupportAINames" },
				Value = hadesBaseTable.RequiredMaxSupportAINames,
				Comparison = "<=",
				UseLength = true
			})
			hadesBaseTable.RequiredMaxSupportAINames = nil
		end
		if hadesBaseTable.RequiredMinActiveMetaUpgradeLevel then
			table.insert(hades2Requirements, {
				Path = { "GameState", "ShrineUpgrades", hadesBaseTable.RequiredMinActiveMetaUpgradeLevel.Name },
				Value = hadesBaseTable.RequiredMinActiveMetaUpgradeLevel.Count,
				Comparison = ">="
			})
			hadesBaseTable.RequiredMinActiveMetaUpgradeLevel = nil
		end
		if hadesBaseTable.RequiredRoom then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				Value = hadesBaseTable.RequiredRoom,
				Comparison = "=="
			})
			hadesBaseTable.RequiredRoom = nil
		end

		return hades2Requirements
	end

	if #requirementsPath == 0 then
		-- We can and want to only map requirements if the object we are looking at is a table
		if type(base) == "table" then
			base.GameStateRequirements = base.GameStateRequirements or {}
			local mappedRequirements = mapSpecificRequirements(base)
			if next(mappedRequirements) then
				base.GameStateRequirements = mappedRequirements
			end
			if next(base.GameStateRequirements) == nil then
				base.GameStateRequirements = nil
			end
		end
		return base
	else
		-- Go one level deeper
		local key = table.remove(requirementsPath, 1)
		if key == '*' and type(base) == "table" then
			for k, v in pairs(base) do
				base[k] = mod.MapGameStateRequirements(v, { table.unpack(requirementsPath) })
			end
		elseif base ~= nil and base[key] then
			base[key] = mod.MapGameStateRequirements(base[key], requirementsPath)
		end
		return base
	end
end
