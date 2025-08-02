local hadesMiscTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\ja\\MiscText.ja.sjson")
local hadesMiscTextTable = sjson.decode_file(hadesMiscTextFile)

local miscTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\ja\\MiscText.ja.sjson')

sjson.hook(miscTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, hadesMiscTextTable.Texts, "Id")
end)
