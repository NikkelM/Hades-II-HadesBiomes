local hadesMiscTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\es\\MiscText.es.sjson")
local hadesMiscTextTable = sjson.decode_file(hadesMiscTextFile)

local miscTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\es\\MiscText.es.sjson')

sjson.hook(miscTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, hadesMiscTextTable.Texts, "Id")
end)
