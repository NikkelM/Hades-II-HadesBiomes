local traitTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/ru/TraitText.ru.sjson")

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
	{
		Id = "ModsNikkelMHadesBiomesBuffSlottedBoonRarity",
		DisplayName = "Сладости из амброзии",
		Description =
		"Боги от них без ума; до {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}твоих случайных {#BoldFormatGraft}[даров]{$Keywords.GodBoonPlural} {#Prev}будут улучшены до следующего уровня [редкости]{$Keywords.Rarity}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffMegaPom",
		DisplayName = "Каша из граната",
		Description =
		"Деликатес Подземного мира; до {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}твоих случайных {#BoldFormatGraft}[даров]{$Keywords.GodBoonPlural} {#Prev}получат {#AltUpgradeFormat}+{$TooltipData.ExtractData.NumStacks} ур.{#Prev}",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
		DisplayName = "Освежающий нектар",
		Description =
		"Редкий и ароматный напиток; следующие {#AltUpgradeFormat}{$TooltipData.RemainingUses} {#Prev}{#BoldFormatGraft}[дара]{$Keywords.GodBoonPlural}{#Prev}, которые ты найдёшь, будут обладать улучшенной [редкостью]{$Keywords.Rarity}.",
	},
	-- #endregion

	-- #region Patroclus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
	-- 	DisplayName = "Отборное вяленое мясо циклопа",
	-- 	Description =
	-- 	"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	-- },
	{
		Id = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
		InheritFrom = "TemporaryDoorHealTrait",
		DisplayName = "Золотой ГидраЛайт",
	},
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffExtraChance",
	-- 	DisplayName = "Крепкий поцелуй Стикс",
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
		DisplayName = "Каменное сердце",
		Description =
		"Ты веришь в Валунка, а Валунок верит в тебя. \n {!Icons.Bullet}{#PropertyFormat}Снижение урона: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageReduction:F}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Attack",
		DisplayName = "Каменное сердце",
		Description =
		"Ты веришь в Валунка, а Валунок верит в тебя. \n {!Icons.Bullet}{#PropertyFormat}Бонус к урону от [атаки]{$Keywords.AttackSet}: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Special",
		DisplayName = "Каменное сердце",
		Description =
		"Ты веришь в Валунка, а Валунок верит в тебя. \n {!Icons.Bullet}{#PropertyFormat}Бонус к урону от [особые атаки]{$Keywords.SpecialSet}: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Ranged",
		DisplayName = "Каменное сердце",
		Description =
		"Ты веришь в Валунка, а Валунок верит в тебя. \n {!Icons.Bullet}{#PropertyFormat}Бонус к урону от [сигилы]{$Keywords.CastSet}: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Speed",
		DisplayName = "Каменное сердце",
		Description =
		"Ты веришь в Валунка, а Валунок верит в тебя. \n {!Icons.Bullet}{#PropertyFormat}Бонус к скорости передвижения: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipSpeed:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Money",
		DisplayName = "Каменное сердце",
		Description =
		"Ты веришь в Валунка, а Валунок верит в тебя. \n {!Icons.Bullet}{#PropertyFormat}Бонус к {!Icons.Currency}! {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipMoneyRewardIncrease:P}{#Prev}"
	},
	-- #endregion

	-- #region Charon
	{
		Id = "DiscountTrait",
		DisplayName = "Ценный клиент",
		Description =
		"Все предметы продаются со скидкой {#UpgradeFormat}-{$TooltipData.ExtractData.TooltipDiscount}% {!Icons.Currency}{#Prev}{#ItalicFormat}( во время этой попытки побега){#Prev}."
	},
	-- #endregion
}

sjson.hook(traitTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
