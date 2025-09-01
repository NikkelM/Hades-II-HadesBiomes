local hadesCodexTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\pl\\CodexText.pl.sjson")
local hadesCodexTextTable = mod.DecodeSjsonFile(hadesCodexTextFile)

hadesCodexTextTable = mod.ModifyCodexTextEntries(hadesCodexTextTable)

-- The Hades II CodexText file is not large enough to handle the hook
local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\pl\\HelpText.pl.sjson")
sjson.hook(screenTextFile, function(data)
	-- Shouldn't be finding any duplicates, as we are not hooking into the Hades II Codex file
	mod.AddTableKeysSkipDupes(data.Texts, hadesCodexTextTable.Texts, "Id")
end)
