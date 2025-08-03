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
		Description = "Receive a gift of {#UpgradeFormat}+{$TooltipData.ExtractData.HealDropAmount}{#Prev}{!Icons.HealthRestore} Healing",
	},
	{
		Id = "SisyphusMetapoints",
		DisplayName = "Crushed Dreams",
		Description = "Receive a gift of {#UpgradeFormat}+{$TraitData.SisyphusMetapoints.AcquireFunctionArgs.LootOptions.[1].Overrides.AddResources.MetaCurrency}{#Prev}{!Icons.MetaCurrencyIconAlt} Bones",
	},
	{
		Id = "SisyphusMoney",
		DisplayName = "Spare Change",
		Description = "Receive a gift of {#MoneyFormatBold}+{$TraitData.SisyphusMoney.AcquireFunctionArgs.LootOptions.[1].Amount}{#Prev}{!Icons.Currency} Gold Crowns",
	},
}

sjson.hook(traitTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
