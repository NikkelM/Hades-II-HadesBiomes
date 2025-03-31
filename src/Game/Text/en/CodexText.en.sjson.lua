local hadesCodexTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\en\\CodexText.en.sjson")
local hadesCodexTextTable = sjson.decode_file(hadesCodexTextFile)

-- Hooking into our own file, as it is very large
-- The H2 CodexText file is not large enough to handle the hook
local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\en\\HelpTextHades.en.sjson')
sjson.hook(screenTextFile, function(data)
	data.Texts = game.MergeTables(data.Texts, hadesCodexTextTable.Texts)
end)
