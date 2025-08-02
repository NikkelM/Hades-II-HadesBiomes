local hadesMiscTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\pl\\MiscText.pl.sjson")
local hadesMiscTextTable = sjson.decode_file(hadesMiscTextFile)

local miscTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\pl\\MiscText.pl.sjson')

sjson.hook(miscTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, hadesMiscTextTable.Texts, "Id")
end)
