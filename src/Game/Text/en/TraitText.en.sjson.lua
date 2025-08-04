local traitTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/en/TraitText.en.sjson')

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
	"Description",
	"OverwriteLocalization"
}

local newData = {
	-- Sisyphus
	{
		Id = "SisyphusHealing",
		DisplayName = "Warm Embrace",
		Description =
		"Receive a gift of {#UpgradeFormat}+{$TooltipData.ExtractData.HealDropAmount}{#Prev}{!Icons.HealthRestore} Healing",
	},
	{
		Id = "SisyphusMetapoints",
		DisplayName = "Crushed Dreams",
		Description =
		"Receive a gift of {#UpgradeFormat}+{$TraitData.SisyphusMetapoints.AcquireFunctionArgs.LootOptions.[1].Overrides.AddResources.MetaCurrency}{#Prev}{!Icons.MetaCurrencyIconAlt} Bones",
	},
	{
		Id = "SisyphusMoney",
		DisplayName = "Spare Change",
		Description =
		"Receive a gift of {#MoneyFormatBold}+{$TraitData.SisyphusMoney.AcquireFunctionArgs.LootOptions.[1].Amount}{#Prev}{!Icons.Currency} Gold Crowns",
	},
	-- Eurydice
	-- TODO: Get from Helptext for other languages?
	{
		Id = "BuffSlottedBoonRarity",
		DisplayName = "Ambrosia Delight",
		Description =
		"Loved by the gods; up to {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}random {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}of yours are upgraded to the next {$Keywords.Rarity}.",
	},
	{
		Id = "BuffMegaPom",
		DisplayName = "Pom Porridge",
		Description =
		"An Underworld delicacy; up to {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}random {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}of yours gain {#AltUpgradeFormat}+{$TooltipData.ExtractData.NumStacks} Lv{#Prev}.",
	},
	{
		Id = "BuffFutureBoonRarity",
		DisplayName = "Refreshing Nectar",
		Description =
		"A rare and fragrant beverage; the next {#AltUpgradeFormat}{$TooltipData.RemainingUses} {#Prev}{#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}you find have upgraded {$Keywords.Rarity}.",
	},
	-- Patroclus
	-- Some of them are in the HelpText files
	{
		Id = "TemporaryImprovedWeaponTrait_Patroclus",
		DisplayName = "Cyclops Jerky Select",
		Description =
		"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deals {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	},
	{
		Id = "TemporaryDoorHealTrait_Patroclus",
		InheritFrom = "TemporaryDoorHealTrait",
		DisplayName = "HydraLite Gold",
	},
	{
		Id = "BuffExtraChance",
		DisplayName = "Kiss of Styx Premium",
		Description = "Replenish {#UpgradeFormat}all {#Prev}uses of {#BoldFormatGraft}{$Keywords.ExtraChance} {#Prev}with ones that restore {#AltUpgradeFormat}{$TooltipData.ExtractData.TooltipInitialHeal}%{#Prev}{!Icons.Health} and {!Icons.Mana}.",
	},
}

sjson.hook(traitTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
