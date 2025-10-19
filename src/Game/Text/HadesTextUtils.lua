function mod.ModifyHadesHelpTextEntries(inputHelpTextTable)
	local hadesHelpTextCopiedEntries = {}
	for _, entry in ipairs(inputHelpTextTable.Texts) do
		if mod.HadesHelpTextCopyKeys[entry.Id] ~= nil then
			if mod.EnemyNameMappings[entry.Id] or mod.HadesHelpTextCopyKeys[entry.Id] ~= true then
				entry.Id = mod.EnemyNameMappings[entry.Id] or mod.HadesHelpTextCopyKeys[entry.Id]
			end
			if entry.DisplayName then
				entry.DisplayName = string.gsub(entry.DisplayName, "{!Icons.ReRoll_Small}", "{!Icons.ReRoll}")
				-- Replace the first and second occurrence of RunClearStar with RunClearDotsLeft and RunClearDotsRight for run clear messages
				local starCount = 0
				entry.DisplayName = string.gsub(entry.DisplayName, "{!Icons.RunClearStar}", function()
					starCount = starCount + 1
					if starCount == 1 then
						return "{!Icons.RunClearDotsLeft}"
					else
						return "{!Icons.RunClearDotsRight}"
					end
				end)
			end
			if entry.Description then
				entry.Description = string.gsub(entry.Description, "{#PreviousFormat}", "{#Prev}")
				entry.Description = string.gsub(entry.Description, "{!Icons.Currency_Small}", "{!Icons.Currency}")
				entry.Description = string.gsub(entry.Description, " \\Column 380", "")
			end
			table.insert(hadesHelpTextCopiedEntries, entry)
		end
	end

	for aliasId, aliasInheritFrom in pairs(mod.HadesHelpTextAliases) do
		table.insert(hadesHelpTextCopiedEntries, {
			Id = aliasId,
			InheritFrom = aliasInheritFrom,
		})
	end
	return hadesHelpTextCopiedEntries
end

function mod.ModifyCodexTextEntries(inputCodexTextTable)
	-- Remove unneeded keys from the CodexText file
	for i = #inputCodexTextTable.Texts, 1, -1 do
		local codexEntry = inputCodexTextTable.Texts[i]
		if mod.ShouldRemoveEntry(codexEntry.Id, mod.HadesCodexTextKeyRemovals) then
			table.remove(inputCodexTextTable.Texts, i)
		else
			if codexEntry.DisplayName then
				-- Don't bold the last entry sections, we need more space
				codexEntry.DisplayName = string.gsub(codexEntry.DisplayName, "{#CodexBoldFormat}", "")
				codexEntry.DisplayName = string.gsub(codexEntry.DisplayName, "{#PreviousFormat}", "{#Prev}")
			end
		end
	end

	-- Rename duplicate codex entries
	for oldName, newName in pairs(mod.HadesCodexTextNameMappings) do
		mod.UpdateField(inputCodexTextTable.Texts, oldName, newName, { "Id" }, "CodexText.sjson")
	end

	return inputCodexTextTable
end
