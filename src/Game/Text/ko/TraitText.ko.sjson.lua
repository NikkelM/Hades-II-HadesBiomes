local traitTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/ko/TraitText.ko.sjson")

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
		DisplayName = "암브로시아 딜라이트",
		Description =
		"신들의 사랑을 받는 음식입니다. 얻은 {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev} 중 무작위 {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits}{#Prev}개의 {$Keywords.Rarity}가 상승합니다.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffMegaPom",
		DisplayName = "석류죽",
		Description =
		"지하세계의 진미입니다. 얻은 {#BoldFormatGraft}{$Keywords.GodBoonPlural} {#Prev} 중 무작위 {#UpgradeFormat}{$TooltipData.ExtractData.NumTraits}{#Prev}개의 레벨이 {#AltUpgradeFormat}+{$TooltipData.ExtractData.NumStacks}{#Prev} 상승합니다.",
	},
	{
		Id = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
		DisplayName = "신선한 넥타르",
		Description =
		"희귀하고 향기로운 음료입니다. 이후 얻는 {#AltUpgradeFormat}{$TooltipData.RemainingUses}{#Prev}개의 {#BoldFormatGraft}{$Keywords.GodBoonPlural}{#Prev}의 {$Keywords.Rarity}가 상승합니다.",
	},
	-- #endregion

	-- #region Patroclus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
	-- 	DisplayName = "키클롭스 특선 육포",
	-- 	Description =
	-- 	"Your {$Keywords.AttackSet} and {$Keywords.SpecialSet} deal {#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageBonus:P} {#Prev}damage.",
	-- },
	{
		Id = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
		InheritFrom = "TemporaryDoorHealTrait",
		DisplayName = "히드라라이트 골드",
	},
	-- {
	-- 	Id = "ModsNikkelMHadesBiomesBuffExtraChance",
	-- 	DisplayName = "특급 스틱스의 입맞춤",
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
		DisplayName = "돌의 심장",
		Description =
		"당신은 돌덩이를 신뢰하고, 돌덩이도 당신을 신뢰합니다. \n {!Icons.Bullet}{#PropertyFormat}피해량 감소: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamageReduction:F}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Attack",
		DisplayName = "돌의 심장",
		Description =
		"당신은 돌덩이를 신뢰하고, 돌덩이도 당신을 신뢰합니다. \n {!Icons.Bullet}{#PropertyFormat}추가 {$Keywords.AttackSet} 피해: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Special",
		DisplayName = "돌의 심장",
		Description =
		"당신은 돌덩이를 신뢰하고, 돌덩이도 당신을 신뢰합니다. \n {!Icons.Bullet}{#PropertyFormat}추가 {$Keywords.SpecialSet} 피해: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Ranged",
		DisplayName = "돌의 심장",
		Description =
		"당신은 돌덩이를 신뢰하고, 돌덩이도 당신을 신뢰합니다. \n {!Icons.Bullet}{#PropertyFormat}추가 {$Keywords.CastSet} 피해: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipDamage:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Speed",
		DisplayName = "돌의 심장",
		Description =
		"당신은 돌덩이를 신뢰하고, 돌덩이도 당신을 신뢰합니다. \n {!Icons.Bullet}{#PropertyFormat}추가 이동 속도: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipSpeed:P}{#Prev}"
	},
	{
		Id = "BouldyBlessing_Money",
		DisplayName = "돌의 심장",
		Description =
		"당신은 돌덩이를 신뢰하고, 돌덩이도 당신을 신뢰합니다. \n {!Icons.Bullet}{#PropertyFormat}추가 {!Icons.Currency}: {#Prev}{#UpgradeFormat}{$TooltipData.ExtractData.TooltipMoneyRewardIncrease:P}{#Prev}"
	},
	-- #endregion

	-- #region Charon
	{
		Id = "DiscountTrait",
		DisplayName = "소중한 고객",
		Description =
		"모든 상품을 {#UpgradeFormat}-{$TooltipData.ExtractData.TooltipDiscount}% {!Icons.Currency}{#Prev} 할인된 가격으로 구매할 수 있습니다{#ItalicFormat}(현재 탈출 시도에서){#Prev}."
	},
	-- #endregion
}

sjson.hook(traitTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
