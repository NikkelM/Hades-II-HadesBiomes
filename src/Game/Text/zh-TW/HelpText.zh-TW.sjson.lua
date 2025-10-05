local helpTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/zh-TW/HelpText.zh-TW.sjson")

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
		DisplayName = "塔爾塔羅斯 （夢魘）",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel",
		DisplayName = "水仙花平原 （夢魘）",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",
		DisplayName = "至福樂土 （夢魘）",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Styx",
		DisplayName = "冥河 （夢魘）",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Surface",
		DisplayName = "地表 （夢魘）",
	},
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_NPC_Bouldy_01",
	-- 	DisplayName = "Bouldy",
	-- 	Description = "",
	-- },
}

sjson.hook(helpTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
