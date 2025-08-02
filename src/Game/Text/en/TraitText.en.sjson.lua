local traitTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/TraitText.en.sjson')

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
	"Description",
	"OverwriteLocalization"
}

local newData = {
	{
		Id = "SisyphusHealing",
		DisplayName = "Warm Embrace",
		Description = "Receive some {!Icons.HealthRestore} Healing",
	},
	{
		Id = "SisyphusMetapoints",
		DisplayName = "Exhumed Remains",
		Description = "Receive some {!Icons.MetaCurrency} Bones",
	},
	{
		Id = "SisyphusMoney",
		DisplayName = "Spare Change",
		Description = "Receive some {!Icons.Currency} Gold Crowns",
	},
	-- {
	-- 	Id = "ChoiceText_BuffExtraChance",
	-- 	DisplayName =
	-- 	"{#ChoiceBracketFormat}\\[ {#ChoiceFormat} {!Icons.BuffExtraChance} Kiss of Styx Premium {#ChoiceBracketFormat}\\]",
	-- 	Description = "",
	-- },
	-- {
	-- 	Id = "ChoiceText_BuffExtraChanceReplenish",
	-- 	DisplayName =
	-- 	"{#ChoiceBracketFormat}\\[ {#ChoiceFormat} {!Icons.BuffExtraChanceAlt} Touch of Styx Dark {#ChoiceBracketFormat}\\]",
	-- 	Description = "",
	-- },
	-- {
	-- 	Id = "ChoiceText_BuffHealing",
	-- 	DisplayName =
	-- 	"{#ChoiceBracketFormat}\\[ {#ChoiceFormat} {!Icons.BuffHealing} HydraLite Gold {#ChoiceBracketFormat}\\]",
	-- 	Description = "",
	-- },
	-- {
	-- 	Id = "ChoiceText_BuffWeapon",
	-- 	DisplayName =
	-- 	"{#ChoiceBracketFormat}\\[ {#ChoiceFormat} {!Icons.BuffWeapon} Cyclops Jerky Select {#ChoiceBracketFormat}\\]",
	-- 	Description = "",
	-- },
	-- {
	-- 	Id = "ChoiceText_BuffSlottedBoonRarity",
	-- 	DisplayName =
	-- 	"{#ChoiceBracketFormat}\\[ {#ChoiceFormat} {!Icons.BuffSlottedBoonRarity} Ambrosia Delight {#ChoiceBracketFormat}\\]",
	-- 	Description = "",
	-- },
	-- {
	-- 	Id = "ChoiceText_BuffMegaPom",
	-- 	DisplayName = "{#ChoiceBracketFormat}\\[ {#ChoiceFormat} {!Icons.BuffMegaPom} Pom Porridge {#ChoiceBracketFormat}\\]",
	-- 	Description = "",
	-- },
	-- {
	-- 	Id = "ChoiceText_BuffFutureBoonRarity",
	-- 	DisplayName =
	-- 	"{#ChoiceBracketFormat}\\[ {#ChoiceFormat} {!Icons.BuffFutureBoonRarity} Refreshing Nectar {#ChoiceBracketFormat}\\]",
	-- 	Description = "",
	-- },
}

sjson.hook(traitTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
