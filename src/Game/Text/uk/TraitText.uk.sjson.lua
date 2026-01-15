local traitTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/uk/TraitText.uk.sjson")

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- #region Sisyphus
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
	-- #endregion

	-- #region Eurydice
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffSlottedBoonRarity",
	-- 	DisplayName = "Ambrosia Delight",
	-- 	Description =
	-- 	"Loved by the gods; up to {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}random {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}of yours are upgraded to the next {$Keywords.Rarity}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffMegaPom",
	-- 	DisplayName = "Pom Porridge",
	-- 	Description =
	-- 	"An Underworld delicacy; up to {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}random {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}of yours gain {#AltUpgradeFormat}+{$TooltipData.ExtractData.NumStacks} Lv{#Prev}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
	-- 	DisplayName = "Refreshing Nectar",
	-- 	Description =
	-- 	"A rare and fragrant beverage; the next {#AltUpgradeFormat}{$TooltipData.RemainingUses} {#Prev}{#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}you find have upgraded {$Keywords.Rarity}.",
	-- },
	-- #endregion

	-- #region Patroclus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
	-- 	DisplayName = "Cyclops Jerky Select",
	-- 	Description =
	-- 	"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
	-- 	InheritFrom = "TemporaryDoorHealTrait",
	-- 	DisplayName = "HydraLite Gold",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffExtraChance",
	-- 	DisplayName = "Kiss of Styx Premium",
	-- 	Description =
	-- 	"Replenish {#UpgradeFormat}all {#Prev}uses of {#BoldFormatGraft}{$Keywords.ExtraChance} {#Prev}with ones that restore {#AltUpgradeFormat}{$TooltipData.ExtractData.TooltipInitialHeal}%{#Prev}{!Icons.Health} and {!Icons.Mana}.",
	-- },
	-- Mix of the Centaur Heart and Soul Tonic shop item names, with the larger gain being the second part
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesGainMaxHealthMinMana",
	-- 	DisplayName = "Soul Heart",
	-- 	Description =
	-- 	"Gain {#UpgradeFormat}+{$TooltipData.ExtractData.TooltipMaxHealth}{#Prev}{!Icons.HealthUp} and {#UpgradeFormat}+{$TooltipData.ExtractData.TooltipMaxMana}{#Prev}{!Icons.ManaUp}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesGainMinHealthMaxMana",
	-- 	InheritFrom = "ModsNikkelMHadesBiomesGainMaxHealthMinMana",
	-- 	DisplayName = "Centaur Tonic",
	-- },
	-- #endregion

	-- #region Bouldy
	-- {
	-- 	Id = "BouldyBlessing_Armor",
	-- 	DisplayName = "Heart of Stone",
	-- 	Description =
	-- 	"You believe in Bouldy, and Bouldy believes in you. \n {!Icons.Bullet}{#PropertyFormat}Damage Reduction: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageReduction:F}{#Prev}"
	-- },
	-- {
	-- 	Id = "BouldyBlessing_Attack",
	-- 	DisplayName = "Heart of Stone",
	-- 	Description =
	-- 	"You believe in Bouldy, and Bouldy believes in you. \n {!Icons.Bullet}{#PropertyFormat}{$Keywords.AttackSet} Damage Bonus: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	-- },
	-- {
	-- 	Id = "BouldyBlessing_Special",
	-- 	DisplayName = "Heart of Stone",
	-- 	Description =
	-- 	"You believe in Bouldy, and Bouldy believes in you. \n {!Icons.Bullet}{#PropertyFormat}{$Keywords.SpecialSet} Damage Bonus: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	-- },
	-- {
	-- 	Id = "BouldyBlessing_Ranged",
	-- 	DisplayName = "Heart of Stone",
	-- 	Description =
	-- 	"You believe in Bouldy, and Bouldy believes in you. \n {!Icons.Bullet}{#PropertyFormat}{$Keywords.CastSet} Damage Bonus: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	-- },
	-- {
	-- 	Id = "BouldyBlessing_Speed",
	-- 	DisplayName = "Heart of Stone",
	-- 	Description =
	-- 	"You believe in Bouldy, and Bouldy believes in you. \n {!Icons.Bullet}{#PropertyFormat}Move Speed Bonus: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipSpeed:P}{#Prev}"
	-- },
	-- {
	-- 	Id = "BouldyBlessing_Money",
	-- 	DisplayName = "Heart of Stone",
	-- 	Description =
	-- 	"You believe in Bouldy, and Bouldy believes in you. \n {!Icons.Bullet}{#PropertyFormat}{!Icons.Currency} Bonus: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipMoneyRewardIncrease:P}{#Prev}"
	-- },
	-- #endregion

	-- #region Charon
	-- {
	-- 	Id = "DiscountTrait",
	-- 	DisplayName = "Valued Customer",
	-- 	Description =
	-- 	"All items can be purchased for {#UpgradeFormat}-{$TooltipData.ExtractData.TooltipDiscount}% {!Icons.Currency}{#Prev} {#ItalicFormat}(this escape attempt){#Prev}.",
	-- },
	-- #endregion
}

sjson.hook(traitTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
