local hadesMiscTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\ru\\MiscText.ru.sjson")
local hadesMiscTextTable = mod.DecodeSjsonFile(hadesMiscTextFile)

local miscTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\ru\\MiscText.ru.sjson")

sjson.hook(miscTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, hadesMiscTextTable.Texts, "Id")
end)
