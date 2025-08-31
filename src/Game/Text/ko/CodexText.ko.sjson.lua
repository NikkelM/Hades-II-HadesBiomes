local hadesCodexTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\ko\\CodexText.ko.sjson")
local hadesCodexTextTable = mod.DecodeSjsonFile(hadesCodexTextFile)

-- Remove unneeded keys from the CodexText file
for i = #hadesCodexTextTable.Texts, 1, -1 do
	local codexEntry = hadesCodexTextTable.Texts[i]
	if mod.ShouldRemoveEntry(codexEntry.Id, mod.HadesCodexTextKeyRemovals) then
		table.remove(hadesCodexTextTable.Texts, i)
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
	mod.UpdateField(hadesCodexTextTable.Texts, oldName, newName, { "Id" }, "CodexText.ko.sjson")
end

-- The Hades II CodexText file is not large enough to handle the hook
local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\ko\\HelpText.ko.sjson")
sjson.hook(screenTextFile, function(data)
	-- Shouldn't be finding any duplicates, as we are not hooking into the Hades II Codex file
	mod.AddTableKeysSkipDupes(data.Texts, hadesCodexTextTable.Texts, "Id")
end)
