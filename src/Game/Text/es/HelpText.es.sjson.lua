local hadesHelpTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\es\\HelpText.es.sjson")
local hadesHelpTextTable = mod.DecodeSjsonFile(hadesHelpTextFile)

local hadesTwoHelpTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/es/HelpText.es.sjson")

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
		DisplayName = "TÁRTARO (Pesadilla)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel",
		DisplayName = "ASFÓDELOS (Pesadilla)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",
		DisplayName = "ELÍSEO (Pesadilla)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Styx",
		DisplayName = "ESTIGIA (Pesadilla)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Surface",
		DisplayName = "GRECIA (Pesadilla)",
	},
	{
		Id = "CharProtag",
		DisplayName = "Zagreo",
		Description = "Príncipe del Inframundo",
	},
	{
		Id = "ModsNikkelMHadesBiomes_NPC_Bouldy_01",
		DisplayName = "Roquita",
		Description = "",
	},
}

local hadesHelpTextCopiedEntries = {}
for _, entry in ipairs(hadesHelpTextTable.Texts) do
	if mod.HadesHelpTextCopyKeys[entry.Id] then
		if mod.EnemyNameMappings[entry.Id] then
			entry.Id = mod.EnemyNameMappings[entry.Id]
		end
		if entry.DisplayName then
			entry.DisplayName = string.gsub(entry.DisplayName, "{!Icons.ReRoll_Small}", "{!Icons.ReRoll}")
		end
		if entry.Description then
			entry.Description = string.gsub(entry.Description, "{#PreviousFormat}", "{#Prev}")
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
