local hadesMiscTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\zh-CN\\MiscText.zh-CN.sjson")
local hadesMiscTextTable = sjson.decode_file(hadesMiscTextFile)

local miscTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\zh-CN\\MiscText.zh-CN.sjson')

sjson.hook(miscTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, hadesMiscTextTable.Texts, "Id")
end)
