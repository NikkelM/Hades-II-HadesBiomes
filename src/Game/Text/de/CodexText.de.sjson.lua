local hadesCodexTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\de\\CodexText.de.sjson")
local hadesCodexTextTable = mod.DecodeSjsonFile(hadesCodexTextFile)

-- Remove unneeded keys from the CodexText file
for i = #hadesCodexTextTable.Texts, 1, -1 do
	local codexEntry = hadesCodexTextTable.Texts[i]
	if mod.ShouldRemoveEntry(codexEntry.Id, mod.HadesCodexTextKeyRemovals) then
		table.remove(hadesCodexTextTable.Texts, i)
	end
end

-- Rename duplicate codex entries
for oldName, newName in pairs(mod.HadesCodexTextNameMappings) do
	mod.UpdateField(hadesCodexTextTable.Texts, oldName, newName, { "Id" }, "CodexText.de.sjson")
end

-- The Hades II CodexText file is not large enough to handle the hook
local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\de\\HelpText.de.sjson')
sjson.hook(screenTextFile, function(data)
	-- Shouldn't be finding any duplicates, as we are not hooking into the Hades II Codex file
	mod.AddTableKeysSkipDupes(data.Texts, hadesCodexTextTable.Texts, "Id")
end)
