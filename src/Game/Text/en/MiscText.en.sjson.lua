local hadesMiscTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\en\\MiscText.en.sjson")
local hadesMiscTextTable = sjson.decode_file(hadesMiscTextFile)

local miscTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\en\\MiscText.en.sjson')

sjson.hook(miscTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, hadesMiscTextTable.Texts, "Id")
end)
