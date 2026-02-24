local traitTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/pl/TraitText.pl.sjson")

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
		DisplayName = "Rozkosz Ambrozji",
		Description =
		"Uwielbiana przez bogów; {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}losowe {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev} zyskują większą {$Keywords.Rarity}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffMegaPom",
		DisplayName = "Kaszka z Granatem",
		Description =
		"Rarytas Podziemi; {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits} {#Prev}losowe {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev}zyskują {#AltUpgradeFormat}+{$TooltipData.ExtractData.NumStacks} poziom{#Prev}.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
		DisplayName = "Orzeźwiający Nektar",
		Description =
		"Rzadki i smakowity napój; następne {#AltUpgradeFormat}{$TooltipData.RemainingUses} {#Prev}{#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev} odnalezione przez ciebie mają podwyższoną {$Keywords.Rarity}.",
	},
	-- #endregion

	-- #region Patroclus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
	-- 	DisplayName = "Wyborny Bekon z Cyklopa",
	-- 	Description =
	-- 	"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	-- },
	{
		Id = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
		InheritFrom = "TemporaryDoorHealTrait",
		DisplayName = "Złota HydraLite",
	},
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffExtraChance",
	-- 	DisplayName = "Pocałunek Styksu Premium",
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
		DisplayName = "Serce z Kamienia",
		Description =
		"Wierzysz w Głazika, a Głazik wierzy w ciebie. \n {!Icons.Bullet}{#PropertyFormat}Redukcja obrażeń: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageReduction:F}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Attack",
		DisplayName = "Serce z Kamienia",
		Description =
		"Wierzysz w Głazika, a Głazik wierzy w ciebie. \n {!Icons.Bullet}{#PropertyFormat}{$Keywords.AttackSet} Bonusowe obrażenia: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Special",
		DisplayName = "Serce z Kamienia",
		Description =
		"Wierzysz w Głazika, a Głazik wierzy w ciebie. \n {!Icons.Bullet}{#PropertyFormat}{$Keywords.SpecialSet} Bonusowe obrażenia: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Ranged",
		DisplayName = "Serce z Kamienia",
		Description =
		"Wierzysz w Głazika, a Głazik wierzy w ciebie. \n {!Icons.Bullet}{#PropertyFormat}{$Keywords.CastSet} Bonusowe obrażenia: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Speed",
		DisplayName = "Serce z Kamienia",
		Description =
		"Wierzysz w Głazika, a Głazik wierzy w ciebie. \n {!Icons.Bullet}{#PropertyFormat}Bonusowa szybkość ruchu: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipSpeed:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Money",
		DisplayName = "Serce z Kamienia",
		Description =
		"Wierzysz w Głazika, a Głazik wierzy w ciebie. \n {!Icons.Bullet}{#PropertyFormat}{!Icons.Currency} Bonus: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipMoneyRewardIncrease:P}{#Prev}"
	},
	-- #endregion

	-- #region Charon
	{
		Id = "DiscountTrait",
		DisplayName = "Wartościowy Klient",
		Description =
		"Wszystkie przedmioty mogą zostać zakupione za {#UpgradeFormat}-{$TooltipData.ExtractData.TooltipDiscount}% {!Icons.Currency}{#Prev} {#ItalicFormat}(podczas tej próby ucieczki){#Prev}."
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
	-- 	"All items sold by {$Keywords.CharCharon} have a chance to cost less.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusCharonShopThemeBoonDiscountStatDisplay",
	-- 	InheritFrom = "BaseStatLine",
	-- 	DisplayName = "{!Icons.Bullet}{#PropertyFormat}Maximum Discount:",
	-- 	Description = "{#UpgradeFormat}-{$TooltipData.ExtractData.TooltipMaxDiscount}%{#Prev}",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesOrpheusEurydiceSong1Boon",
	-- 	InheritFrom = "MusicMusicPlayerEurydiceSong1MusicPlayer",
	-- 	Description =
	-- 	"You gain {#UpgradeFormat}{$TooltipData.StatDisplay1}{#Prev}{!Icons.ReRollAlt}, and can alter {#BoldFormat}Location Rewards{#Prev}. This does not break {$Keywords.Random}.",
	-- },
	-- #endregion
}

sjson.hook(traitTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
