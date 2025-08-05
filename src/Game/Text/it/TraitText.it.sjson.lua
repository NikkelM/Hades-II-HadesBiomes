local traitTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/it/TraitText.it.sjson')

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
	"Description",
	"OverwriteLocalization"
}

local newData = {
	-- Sisyphus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesSisyphusHealing",
	-- 	DisplayName = "Warm Embrace",
	-- 	Description =
	-- 	"Receive a gift of {#UpgradeFormat}+{$TooltipData.ExtractData.HealDropAmount}{#Prev}{!Icons.HealthRestore} Healing.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesSisyphusMetapoints",
	-- 	DisplayName = "Crushed Dreams",
	-- 	Description =
	-- 	"Receive a gift of {#UpgradeFormat}+{$TraitData.ModsNikkelMHadesBiomesSisyphusMetapoints.AcquireFunctionArgs.LootOptions.[1].Overrides.AddResources.MetaCurrency}{#Prev}{!Icons.MetaCurrencyIconAlt} Bones.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesSisyphusMoney",
	-- 	DisplayName = "Spare Change",
	-- 	Description =
	-- 	"Receive a gift of {#MoneyFormatBold}+{$TooltipData.ExtractData.TooltipMoneyAmount}{#Prev}{!Icons.Currency}.",
	-- },
	-- Eurydice
	{
		Id = "ModsNikkelMHadesBiomesBuffSlottedBoonRarity",
		DisplayName = "Delizia d'Ambrosia",
		Description =
		"Amato dagli dèi; fino a {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}a caso fra i tuoi {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}salgono al livello di {$Keywords.Rarity} successivo.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffMegaPom",
		DisplayName = "Pasticcio di Pomi",
		Description =
		"Una prelibatezza degli Inferi; fino a {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}{#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev} a caso ottengono {#AltUpgradeFormat}+{$TooltipData.ExtractData.NumStacks} Lv{#Prev}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
		DisplayName = "Nettare Rinfrescante",
		Description =
		"Una rara e fragrante libagione; i prossimi {#AltUpgradeFormat}{$TooltipData.RemainingUses} {#Prev}{#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}che ricevi avranno {$Keywords.Rarity} superiore.",
	},
	-- Patroclus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
	-- 	DisplayName = "Straccetti di Ciclope Deluxe",
	-- 	Description =
	-- 	"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	-- },
	{
		Id = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
		InheritFrom = "TemporaryDoorHealTrait",
		DisplayName = "Sangue dell'Idra Gran Riserva",
	},
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffExtraChance",
	-- 	DisplayName = "Bacio dello Stige Qualità Oro",
	-- 	Description =
	-- 	"Replenish {#UpgradeFormat}all {#Prev}uses of {#BoldFormatGraft}{$Keywords.ExtraChance} {#Prev}with ones that restore {#AltUpgradeFormat}{$TooltipData.ExtractData.TooltipInitialHeal}%{#Prev}{!Icons.Health} and {!Icons.Mana}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesGainMaxHealthMinMana",
	-- 	-- Mix of the Centaur Heart and Soul Tonic shop item names, with the larger gain being the second part
	-- 	DisplayName = "Soul Heart",
	-- 	Description =
	-- 	"Gain {#UpgradeFormat}+{$TooltipData.ExtractData.TooltipMaxHealth}{#Prev}{!Icons.HealthUp} and {#UpgradeFormat}+{$TooltipData.ExtractData.TooltipMaxMana}{#Prev}{!Icons.ManaUp}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesGainMinHealthMaxMana",
	-- 	InheritFrom = "ModsNikkelMHadesBiomesGainMaxHealthMinMana",
	-- 	DisplayName = "Centaur Tonic",
	-- }
}

sjson.hook(traitTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
