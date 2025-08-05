local traitTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/fr/TraitText.fr.sjson')

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
		DisplayName = "Délice d’Ambroisie",
		Description =
		"Adoré des dieux ; jusqu’à {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}de vos {#BoldFormatGraft}[Bienfaits]{$Keywords.GodBoonPlural} {#Prev} sont choisis aléatoirement pour passer à la [Qualité]{$Keywords.Rarity} supérieure.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffMegaPom",
		DisplayName = "Bouillie de Grenades",
		Description =
		"Spécialité des Enfers ; jusqu’à {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}de vos {#BoldFormatGraft}[Bienfaits]{$Keywords.GodBoonPlural} {#Prev}sont choisis aléatoirement pour gagner {#AltUpgradeFormat}+{$TooltipData.ExtractData.NumStacks} Niv{#Prev}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
		DisplayName = "Nectar Rafraîchissant",
		Description =
		"Boisson rare et parfumée ; les {#AltUpgradeFormat}{$TooltipData.RemainingUses} {#Prev} prochains {#BoldFormatGraft}[Bienfaits]{$Keywords.GodBoonPlural} {#Prev}que vous trouvez seront de [Qualité]{$Keywords.Rarity} supérieure.",
	},
	-- Patroclus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
	-- 	DisplayName = "Émincé de Cyclope de Choix",
	-- 	Description =
	-- 	"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	-- },
	{
		Id = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
		InheritFrom = "TemporaryDoorHealTrait",
		DisplayName = "HydraCola Premium",
	},
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffExtraChance",
	-- 	DisplayName = "Baiser du Styx Prestige",
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
