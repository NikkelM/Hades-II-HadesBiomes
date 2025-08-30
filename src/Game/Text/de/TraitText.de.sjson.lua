local traitTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/de/TraitText.de.sjson")

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
		DisplayName = "Ambrosia-Traum",
		Description =
		"Beliebt bei den Göttern. Bis zu {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}beliebige deiner {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}werden auf die nächste {$Keywords.Rarity} höhergestuft.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffMegaPom",
		DisplayName = "Apfelbrei",
		Description =
		"Eine Unterwelt-Delikatesse. Bis zu {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}beliebige deiner {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}erhalten {#AltUpgradeFormat}+{$TooltipData.ExtractData.NumStacks} Lvl{#Prev}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
		DisplayName = "Erfrischender Nektar",
		Description =
		"Ein seltener und aromatischer Trank. Die nächsten {#AltUpgradeFormat}{$TooltipData.RemainingUses} {#Prev}{#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}, die du findest, haben eine höhere {$Keywords.Rarity}.",
	},
	-- Patroclus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
	-- 	DisplayName = "Kyklopen-Happen Extra",
	-- 	Description =
	-- 	"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	-- },
	{
		Id = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
		InheritFrom = "TemporaryDoorHealTrait",
		DisplayName = "HydraLite Gold",
	},
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffExtraChance",
	-- 	DisplayName = "Kuss des Styx Extra",
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
