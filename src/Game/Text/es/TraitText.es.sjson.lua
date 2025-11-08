local traitTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/es/TraitText.es.sjson")

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
	{
		Id = "ModsNikkelMHadesBiomesBuffSlottedBoonRarity",
		DisplayName = "Delicia de ambrosía",
		Description =
		"Adorada por los dioses. Mejora hasta {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}{#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}aleatorias hasta el siguiente nivel de {$Keywords.Rarity}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffMegaPom",
		DisplayName = "Mermelada de granada",
		Description =
		"Este manjar del Inframundo hace que hasta {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}{#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}cualesquiera aumenten {#AltUpgradeFormat}{$TooltipData.ExtractData.NumStacks} nivel {#Prev}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
		DisplayName = "Néctar refrescante",
		Description =
		"Con esta aromática y excepcional bebida, las próximas {#AltUpgradeFormat}{$TooltipData.RemainingUses} {#Prev}{#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}que encuentres tendrán una {$Keywords.Rarity} mejorada.",
	},
	-- #endregion

	-- #region Patroclus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
	-- 	DisplayName = "Panceta de cíclope de gran calidad",
	-- 	Description =
	-- 	"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	-- },
	{
		Id = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
		InheritFrom = "TemporaryDoorHealTrait",
		DisplayName = "Hidralito Plus",
	},
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffExtraChance",
	-- 	DisplayName = "Beso sublime del Estigia",
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
	-- #endregion

	-- #region Bouldy
	{
		Id = "BouldyBlessing_Armor",
		DisplayName = "Corazón de Piedra",
		Description =
		"Tienes fe en Roquita. Y Roquita tiene fe en ti. \n {!Icons.Bullet}{#PropertyFormat}Reducción de daño: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageReduction:F}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Attack",
		DisplayName = "Corazón de Piedra",
		Description =
		"Tienes fe en Roquita. Y Roquita tiene fe en ti. \n {!Icons.Bullet}{#PropertyFormat}Bonif. de daño de ataque {$Keywords.AttackSet}: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Special",
		DisplayName = "Corazón de Piedra",
		Description =
		"Tienes fe en Roquita. Y Roquita tiene fe en ti. \n {!Icons.Bullet}{#PropertyFormat}Bonif. de daño de ataque {$Keywords.SpecialSet}: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Ranged",
		DisplayName = "Corazón de Piedra",
		Description =
		"Tienes fe en Roquita. Y Roquita tiene fe en ti. \n {!Icons.Bullet}{#PropertyFormat}Bonificación de daño de ataque {$Keywords.CastSet}: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Speed",
		DisplayName = "Corazón de Piedra",
		Description =
		"Tienes fe en Roquita. Y Roquita tiene fe en ti. \n {!Icons.Bullet}{#PropertyFormat}Bonificación de velocidad: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipSpeed:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Money",
		DisplayName = "Corazón de Piedra",
		Description =
		"Tienes fe en Roquita. Y Roquita tiene fe en ti. \n {!Icons.Bullet}{#PropertyFormat}Bonificación de {!Icons.Currency}: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipMoneyRewardIncrease:P}{#Prev}"
	},
	-- #endregion
}

sjson.hook(traitTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id")
end)
