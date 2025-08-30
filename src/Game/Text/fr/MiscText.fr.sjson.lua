local hadesMiscTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\fr\\MiscText.fr.sjson")
local hadesMiscTextTable = mod.DecodeSjsonFile(hadesMiscTextFile)

local miscTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\fr\\MiscText.fr.sjson")

sjson.hook(miscTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, hadesMiscTextTable.Texts, "Id")
end)
