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
		Id = "ModsNikkelMHadesBiomesSisyphusHealing",
		DisplayName = "Warm Embrace",
		Description =
		"Receive a gift of {#UpgradeFormat}+{$TooltipData.ExtractData.HealDropAmount}{#Prev}{!Icons.HealthRestore} Healing.",
	},
	{
		Id = "ModsNikkelMHadesBiomesSisyphusMetapoints",
		DisplayName = "Crushed Dreams",
		Description =
		"Receive a gift of {#UpgradeFormat}+{$TraitData.ModsNikkelMHadesBiomesSisyphusMetapoints.AcquireFunctionArgs.LootOptions.[1].Overrides.AddResources.MetaCurrency}{#Prev}{!Icons.MetaCurrencyIconAlt} Bones.",
	},
	{
		Id = "ModsNikkelMHadesBiomesSisyphusMoney",
		-- TODO: InheritFrom FallbackMoneyDrop in Hades for DisplayName
		DisplayName = "Spare Change",
		Description =
		"Receive a gift of {#MoneyFormatBold}+{$TooltipData.ExtractData.TooltipMoneyAmount}{#Prev}{!Icons.Currency}.",
	},
	-- Eurydice
	{
		Id = "ModsNikkelMHadesBiomesBuffSlottedBoonRarity",
		DisplayName = "Ambrosia Delight",
		Description =
		"Loved by the gods; up to {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}random {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}of yours are upgraded to the next {$Keywords.Rarity}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffMegaPom",
		DisplayName = "Pom Porridge",
		Description =
		"An Underworld delicacy; up to {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}random {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}of yours gain {#AltUpgradeFormat}+{$TooltipData.ExtractData.NumStacks} Lv{#Prev}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
		DisplayName = "Refreshing Nectar",
		Description =
		"A rare and fragrant beverage; the next {#AltUpgradeFormat}{$TooltipData.RemainingUses} {#Prev}{#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}you find have upgraded {$Keywords.Rarity}.",
	},
	-- Patroclus
	{
		Id = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
		DisplayName = "Cyclops Jerky Select",
		Description =
		"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	},
	{
		Id = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
		InheritFrom = "TemporaryDoorHealTrait",
		DisplayName = "HydraLite Gold",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffExtraChance",
		DisplayName = "Kiss of Styx Premium",
		Description =
		"Replenish {#UpgradeFormat}all {#Prev}uses of {#BoldFormatGraft}{$Keywords.ExtraChance} {#Prev}with ones that restore {#AltUpgradeFormat}{$TooltipData.ExtractData.TooltipInitialHeal}%{#Prev}{!Icons.Health} and {!Icons.Mana}.",
	},
	-- Mix of the Centaur Heart and Soul Tonic shop item names, with the larger gain being the second part
	{
		Id = "ModsNikkelMHadesBiomesGainMaxHealthMinMana",
		DisplayName = "Soul Heart",
		Description =
		"Gain {#UpgradeFormat}+{$TooltipData.ExtractData.TooltipMaxHealth}{#Prev}{!Icons.HealthUp} and {#UpgradeFormat}+{$TooltipData.ExtractData.TooltipMaxMana}{#Prev}{!Icons.ManaUp}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesGainMinHealthMaxMana",
		InheritFrom = "ModsNikkelMHadesBiomesGainMaxHealthMinMana",
		DisplayName = "Centaur Tonic",
	}
}

sjson.hook(traitTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
