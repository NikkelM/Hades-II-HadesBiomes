local hadesCodexTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\ja\\CodexText.ja.sjson")
local hadesCodexTextTable = mod.DecodeSjsonFile(hadesCodexTextFile)

hadesCodexTextTable = mod.ModifyCodexTextEntries(hadesCodexTextTable)

-- The Hades II CodexText file is not large enough to handle the hook
local helpTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\ja\\HelpText.ja.sjson")
sjson.hook(helpTextFile, function(data)
	-- Shouldn't be finding any duplicates, as we are not hooking into the Hades II Codex file
	mod.AddTableKeysSkipDupes(data.Texts, hadesCodexTextTable.Texts, "Id")
end)
