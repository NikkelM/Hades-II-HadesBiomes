local hadesCodexTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\it\\CodexText.it.sjson")
local hadesCodexTextTable = mod.DecodeSjsonFile(hadesCodexTextFile)

-- Hooking into our own file, as it is very large
-- The H2 CodexText file is not large enough to handle the hook
local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\it\\HelpTextHades.it.sjson')
sjson.hook(screenTextFile, function(data)
	data.Texts = game.MergeTables(data.Texts, hadesCodexTextTable.Texts)
end)
