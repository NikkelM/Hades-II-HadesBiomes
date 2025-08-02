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
		DisplayName = "Crushed Dreams",
		Description = "Receive some {!Icons.MetaCurrency} Bones",
	},
	{
		Id = "SisyphusMoney",
		DisplayName = "Spare Change",
		Description = "Receive some {!Icons.Currency} Gold Crowns",
	},
}

sjson.hook(traitTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
