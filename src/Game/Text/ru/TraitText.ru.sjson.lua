local traitTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/ru/TraitText.ru.sjson")

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
	"Description",
	"OverwriteLocalization",
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
	-- 	"Receive a gift of {#UpgradeFormat}+{$TraitData.ModsNikkelMHadesBiomesSisyphusMetapoints.AcquireFunctionArgs.LootOptions.[1].Overrides.AddResources.MetaCurrency}{#Prev}{!Icons.MetaCurrencyIconAlt} Bones {#ItalicFormat}(that can be transformed by {#Prev}{$Keywords.ModsNikkelMHadesBiomesMetaToRunUpgrade}{#ItalicFormat}){#Prev}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesSisyphusMoney",
	-- 	DisplayName = "Spare Change",
	-- 	Description =
	-- 	"Receive a gift of {#MoneyFormatBold}+{$TooltipData.ExtractData.TooltipMoneyAmount}{#Prev}{!Icons.Currency}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesSisyphusPomSlices",
	-- 	DisplayName = "Midnight Snack",
	-- 	Description =
	-- 	"Receive a gift of {#UpgradeFormat}+{$TraitData.ModsNikkelMHadesBiomesSisyphusPomSlices.AcquireFunctionArgs.LootOptions.[1].Amount}{#Prev}{!Icons.RandomPom} Pom Slices.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesSisyphusCentaurSoul",
	-- 	DisplayName = "Heart to Heart",
	-- 	Description =
	-- 	"Receive a gift of {#UpgradeFormat}+{$TooltipData.ExtractData.TooltipMaxHealth}{#Prev}{!Icons.HealthUpAlt} {#ItalicFormat}(without restoring {!Icons.Health}){#Prev}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesSisyphusMaxMana",
	-- 	DisplayName = "Focused Thoughts",
	-- 	Description =
	-- 	"Receive a gift of {#UpgradeFormat}+{$TooltipData.ExtractData.TooltipMaxMana}{#Prev}{!Icons.ManaUp}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesSisyphusTalentDrop",
	-- 	DisplayName = "Moonlit Inspiration",
	-- 	Description =
	-- 	"Receive a gift of a {$Keywords.TalentPoint} that grants {#UpgradeFormat}+{$TooltipData.ExtractData.TooltipTalentPoints} {#Prev}upgrades for your {$Keywords.Spell}.",
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
		"Все предметы продаются со скидкой {#UpgradeFormat}-{$TooltipData.ExtractData.TooltipDiscount}% {!Icons.Currency}{#Prev} {#ItalicFormat}(во время этой попытки побега){#Prev}."
	},
	-- #endregion

	-- #region Orpheus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusChaosThemeBoon",
	-- 	InheritFrom = "MusicMusicPlayerChaosThemeMusicPlayer",
	-- 	Description =
	-- 	"Ensure {$Keywords.HealthGatePlural} spawn ahead as soon as possible. {#Emph}All {#Prev}{$Keywords.HealthGatePlural} cost {#UpgradeFormat}0{#Prev}{!Icons.Health} to enter this night.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusChaosThemeBoonChaosGatesStatDisplay",
	-- 	InheritFrom = "BaseStatLine",
	-- 	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Forced {$Keywords.HealthGatePlural}:",
	-- 	Description = "{#UpgradeFormat}{$TraitData.ModsNikkelMHadesBiomesOrpheusChaosThemeBoon.RemainingUses}{#Prev}",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusChaosTheme_EntryCostSubBoon",
	-- 	InheritFrom = "MusicMusicPlayerChaosThemeMusicPlayer",
	-- 	Description =
	-- 	"{#Emph}All {#Prev}{$Keywords.HealthGatePlural} cost {#UpgradeFormat}0{#Prev}{!Icons.Health} to enter this night.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusBossFightMusicBoon",
	-- 	InheritFrom = "MusicMusicPlayerBossFightMusicMusicPlayer",
	-- 	Description =
	-- 	"Most foes you slay have a chance to return to fight for you, up to once per {$Keywords.EncounterAlt}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusBossFightMusicBoonResurrectStatDisplay",
	-- 	InheritFrom = "BaseStatLine",
	-- 	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Resurrection Chance:",
	-- 	Description = "{#UpgradeFormat}{$TooltipData.ExtractData.SummonChance}%{#Prev}",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusChaosThemeBoonRaiseDeadActivated",
	-- 	DisplayName =
	-- 	"{#CombatTextHighlightFormat}{$TraitData.ModsNikkelMHadesBiomesOrpheusBossFightMusicBoon.Name}{#Prev}!",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon",
	-- 	InheritFrom = "MusicMusicPlayerOrpheusSong1MusicPlayer",
	-- 	Description =
	-- 	"After you take damage, inflict {$Keywords.Root} on {#BoldFormat}ALL {#Prev}foes. After {#BoldFormatGraft}{$TooltipData.ExtractData.Cooldown} Sec. {#Prev}and once the foe that damaged you has been slain, this can repeat.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon",
	-- 	InheritFrom = "MusicMusicPlayerOrpheusSong2MusicPlayer",
	-- 	Description =
	-- 	"Once this night, when you fall to {#PenaltyFormat}0{#Prev}{!Icons.Health} without any {$Keywords.ExtraChanceMisc} remaining, instead loose all {$Keywords.ModsNikkelMHadesBiomesCoreBoonPlural} and restore {#BoldFormat}{$TooltipData.ExtractData.LastStandHeal}%{#Prev}{!Icons.Health} and {!Icons.Mana}. This boon does not deactivate {$Keywords.ModsNikkelMHadesBiomesLowHealthBonus}.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusCharonShopThemeBoon",
	-- 	InheritFrom = "MusicMusicPlayerCharonShopThemeMusicPlayer",
	-- 	Description =
	-- 	"All items sold by {$Keywords.CharCharon} cost less.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusCharonShopThemeBoonDiscountStatDisplay",
	-- 	InheritFrom = "BaseStatLine",
	--  DisplayName = "{!Icons.Bullet}{#PropertyFormat}Random Discount:",
	--  Description = "{#UpgradeFormat}{$TooltipData.ExtractData.TooltipMinDiscount}-{$TooltipData.ExtractData.TooltipMaxDiscount}%{#Prev}",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusEurydiceSong1Boon",
	-- 	InheritFrom = "MusicMusicPlayerEurydiceSong1MusicPlayer",
	-- 	Description =
	-- 	"You gain {#UpgradeFormat}{$TooltipData.StatDisplay1}{#Prev}{!Icons.ReRollAlt}, and can alter {#BoldFormat}Location Rewards{#Prev}. This does not break {$Keywords.Random}.",
	-- },
	-- #endregion

	-- #region WellShops
	{
		Id = "ModsNikkelMHadesBiomes_TemporaryBlockExplodingChariotsTrait",
		DisplayName = "Освобождение пылающих колёс",
		Description =
		"Определённые враги ({$TooltipData.BlockedEnemyTypes[1]}) больше не будут появляться в {$Keywords.EncounterPlural}.",
	},
	-- #endregion

	-- #region Old Grudge Dream Run text
	{
		Id = "ModsNikkelMHadesBiomes_HadesPreDamageBoon_DreamRun",
		DisplayName = "Старые распри",
		Description = "При столкновении с [Кроносом]{$Keywords.CharChronos}, [Тифоном]{$Keywords.CharTyphon} или [Аидом]{$Keywords.CharHades} они получат сильный урон через {#BoldFormatGraft}{$TraitData.HadesPreDamageBoon.EncounterPreDamage.Delay} сек. после начала боя.",
	},
	{
		Id = "ModsNikkelMHadesBiomes_ChronosDamageStatDisplay_DreamRun",
		InheritFrom = "BaseStatLine",
		DisplayName = "{!Icons.Bullet}{#PropertyFormat}Урон [Кроносу]{$Keywords.CharChronos}, [Тифону]{$Keywords.CharTyphon} или [Аиду]{$Keywords.CharHades}:",
		Description = "{#UpgradeFormat}–{$TooltipData.StatDisplay1}{!Icons.EnemyHealth}",
	},
	-- #endregion
}

sjson.hook(traitTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
