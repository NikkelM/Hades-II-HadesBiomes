-- Handles translation of GameStateRequirements to the Hades II format

---Maps any GameStateRequirements in the Hades format to the Hades II in the path, using the given context.
---@param base table The table containing the table for which to map the requirements, under the requirementsPath.
---@param requirementsPath table The path within base to where the original requirement(s) are located that should be mapped.
---@param requirementsContext string The context of the requirement, e.g. a room, encounter or enemy. Decides how the base will be interpreted during the actual mapping operation.
function mod.MapGameStateRequirements(base, requirementsPath, requirementsContext)
	---Maps a Hades requirement to a Hades II GameStateRequirement.
	---@param hadesBaseTable any The requirements in Hades. Can have a number of different formats.
	---@param context string The context of the requirement, e.g. a room, encounter or enemy.
	---@return table GameStateRequirements A table containing the requirements in the Hades II format, to be assigned to GameStateRequirements = { ... }.
	local function mapSpecificRequirements(hadesBaseTable, context)
		local hades2Requirements = {}

		if context == "TartarusBossRoom" then
			-- Voicelines played before entering the conversation, depends on if there are supporting bosses
			if hadesBaseTable.RequiredSupportAINames then
				hades2Requirements.Path = { "CurrentRun", "SupportAINames" }
				hades2Requirements.Value = hadesBaseTable.RequiredSupportAINames
				hades2Requirements.Comparison = "=="
				hadesBaseTable.RequiredSupportAINames = nil
			end
		end

		return hades2Requirements
	end

	if #requirementsPath == 0 then
		-- We can and want to only map requirements if the object we are looking at is a table
		if type(base) == "table" then
			base.GameStateRequirements = base.GameStateRequirements or {}
			local mappedRequirements = mapSpecificRequirements(base, requirementsContext)
			if next(mappedRequirements) then
				table.insert(base.GameStateRequirements, mappedRequirements)
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
				base[k] = mod.MapGameStateRequirements(v, { table.unpack(requirementsPath) }, requirementsContext)
			end
		elseif base ~= nil and base[key] then
			base[key] = mod.MapGameStateRequirements(base[key], requirementsPath, requirementsContext)
		end
		return base
	end
end
