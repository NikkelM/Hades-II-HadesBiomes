local hadesHelpTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\ru\\HelpText.ru.sjson")
local hadesHelpTextTable = mod.DecodeSjsonFile(hadesHelpTextFile)

local hadesTwoHelpTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/ru/HelpText.ru.sjson")

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText",
	-- 	DisplayName = "{I} {#UseTextPreReqFormat}Descend into Nightmare",
	-- },
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Tartarus",
		DisplayName = "ТАРТАР (Кошмар)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel",
		DisplayName = "АСФОДЕЛЬ (Кошмар)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",
		DisplayName = "ЭЛИЗИУМ (Кошмар)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Styx",
		DisplayName = "СТИКС (Кошмар)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Surface",
		DisplayName = "ГРЕЦИЯ (Кошмар)",
	},
	{
		Id = "CharProtag",
		DisplayName = "Загрей",
		Description = "Принц Подземного мира",
	},
}

local hadesHelpTextCopiedEntries = {}
for _, entry in ipairs(hadesHelpTextTable.Texts) do
	if mod.HadesHelpTextCopyKeys[entry.Id] then
		if mod.EnemyNameMappings[entry.Id] then
			entry.Id = mod.EnemyNameMappings[entry.Id]
		end
		if entry.DisplayName then
			-- Fix icons
			entry.DisplayName = string.gsub(entry.DisplayName, "{!Icons.ReRoll_Small}", "{!Icons.ReRoll}")
		end
		table.insert(hadesHelpTextCopiedEntries, entry)
	end
end

for aliasId, aliasInheritFrom in pairs(mod.HadesHelpTextAliases) do
	table.insert(hadesHelpTextCopiedEntries, {
		Id = aliasId,
		InheritFrom = aliasInheritFrom,
	})
end

sjson.hook(hadesTwoHelpTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
	for _, newValue in ipairs(hadesHelpTextCopiedEntries) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
