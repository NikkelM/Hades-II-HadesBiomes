local traitTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/ja/TraitText.ja.sjson")

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
		DisplayName = "アンブロシア・ディライト",
		Description =
		"神々の好物。取得済みの{#BoldFormatGraft}{$Keywords.GodBoonPlural}{#Prev}のうち、\nランダムで選ばれた最大{#UpgradeFormat}{$TooltipData.ExtractData.NumTraits}{#Prev}個の{$Keywords.Rarity}が一段階上がる。",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffMegaPom",
		DisplayName = "石榴がゆ",
		Description =
		"冥界の珍味。取得済みの{#BoldFormatGraft}{$Keywords.GodBoonPlural}{#Prev}のうち、\nランダムで選ばれた最大{#UpgradeFormat}{$TooltipData.ExtractData.NumTraits}{#Prev}個のLv.が{#AltUpgradeFormat}{$TooltipData.ExtractData.NumStacks}{#Prev}\n上がる。",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
		DisplayName = "フレッシュ・ネクタル",
		Description =
		"きわめて希少な、香りのよい飲料。\nこの先発見する{#BoldFormatGraft}{$Keywords.GodBoonPlural}{#Prev}{#AltUpgradeFormat}{$TooltipData.RemainingUses}{#Prev}つの{$Keywords.Rarity}が\n上がる。",
	},
	-- #endregion

	-- #region Patroclus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
	-- 	DisplayName = "サイクロプスの高級干し肉",
	-- 	Description =
	-- 	"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	-- },
	{
		Id = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
		InheritFrom = "TemporaryDoorHealTrait",
		DisplayName = "ヒュドラライト・ゴールド",
	},
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffExtraChance",
	-- 	DisplayName = "気高きステュクスの口づけ",
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
		DisplayName = "石の心",
		Description =
		"イワコフを信ずれば、イワコフもまた、汝を信ず。\n {!Icons.Bullet}{#PropertyFormat}ダメージ軽減： {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageReduction:F}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Attack",
		DisplayName = "石の心",
		Description =
		"イワコフを信ずれば、イワコフもまた、汝を信ず。\n {!Icons.Bullet}{#PropertyFormat}{$Keywords.AttackSet}ダメージボーナス： {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Special",
		DisplayName = "石の心",
		Description =
		"イワコフを信ずれば、イワコフもまた、汝を信ず。\n {!Icons.Bullet}{#PropertyFormat}{$Keywords.SpecialSet}ダメージボーナス： {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Ranged",
		DisplayName = "石の心",
		Description =
		"イワコフを信ずれば、イワコフもまた、汝を信ず。\n {!Icons.Bullet}{#PropertyFormat}{$Keywords.CastSet}ダメージボーナス： {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Speed",
		DisplayName = "石の心",
		Description =
		"イワコフを信ずれば、イワコフもまた、汝を信ず。\n {!Icons.Bullet}{#PropertyFormat}移動速度ボーナス： {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipSpeed:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Money",
		DisplayName = "石の心",
		Description =
		"イワコフを信ずれば、イワコフもまた、汝を信ず。\n {!Icons.Bullet}{#PropertyFormat}{!Icons.Currency}ボーナス： {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipMoneyRewardIncrease:P}{#Prev}"
	},
	-- #endregion
}

sjson.hook(traitTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id")
end)
