-- For reference, modded resource names:
--[[
	"ModsNikkelMHadesBiomes_PlantTartarus",
	"ModsNikkelMHadesBiomes_CropTartarus",
	"ModsNikkelMHadesBiomes_OreTartarus",
	"ModsNikkelMHadesBiomes_BossResourceTartarus",

	"ModsNikkelMHadesBiomes_PlantAsphodel",
	"ModsNikkelMHadesBiomes_CropAsphodel",
	"ModsNikkelMHadesBiomes_OreAsphodel",
	"ModsNikkelMHadesBiomes_BossResourceAsphodel",

	"ModsNikkelMHadesBiomes_PlantElysium",
	"ModsNikkelMHadesBiomes_CropElysium",
	"ModsNikkelMHadesBiomes_OreElysium",
	"ModsNikkelMHadesBiomes_BossResourceElysium",

	"ModsNikkelMHadesBiomes_PlantStyx",
	"ModsNikkelMHadesBiomes_CropStyx",
	"ModsNikkelMHadesBiomes_OreStyx",
	"ModsNikkelMHadesBiomes_BossResourceStyx",
]] --

-- CosmeticsShop_Tent
local tentCosmetics = {
	-- #region Fan Posters/Cosmetic_FanPoster01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_FanPoster_Theseus",
		Name = {
			en = "Wall-Scroll, Theseus",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
		},
		FlavorText = {
			en =
			"Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
		},
		CosmeticsGroup = "Cosmetic_FanPoster01",
		InsertAfterCosmetic = "Cosmetic_FanPoster01b",
		ShopCategory = "CosmeticsShop_Tent",
		ActivateIds = { 738471 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\FanPoster_Theseus_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\FanPoster_Theseus",
		AnimationScale = 2.1,
		AnimationOffsetY = 150,
		GameStateRequirements = {
			{
				Path = { "GameState", "RoomsEntered", "Y_Boss01" },
				Comparison = ">=",
				Value = 3,
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_PlantElysium = 3,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0419", Text = "Didn't know he was your type, but believe me I get it.", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs, },
			},
			{
				PreLineWait = 0.35,
				UsePlayerSource = true,
				{ Cue = "/VO/Melinoe_3668", Text = "This is only so that I can better study my opponent." },
			},
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_FanPoster_Aphrodite",
		Name = {
			en = "Wall-Scroll, Aphrodite",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
		},
		FlavorText = {
			en =
			"Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
		},
		CosmeticsGroup = "Cosmetic_FanPoster01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_FanPoster_Theseus",
		ShopCategory = "CosmeticsShop_Tent",
		ActivateIds = { 738471 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\FanPoster_Aphrodite_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\FanPoster_Aphrodite",
		AnimationScale = 2.1,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "AphroditeGift04" },
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_CropElysium = 3,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
		},
	},
	-- #endregion
	-- #region Table/Cosmetic_TentTable01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentTable_Hellish",
		Name = {
			en = "Table, Hellish",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
		},
		FlavorText = {
			en =
			"Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
		},
		CosmeticsGroup = "Cosmetic_TentTable01",
		InsertAfterCosmetic = "Cosmetic_TentTable01c",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566758, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Table_Hellish",
		IconScale = 0.33,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Table_Hellish",
		AnimationScale = 2.1,
		GameStateRequirements = {
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_OreStyx = 5,
			ModsNikkelMHadesBiomes_CropStyx = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentTable_Serpentine",
		Name = {
			en = "Table, Serpentine",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
		},
		FlavorText = {
			en =
			"At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
		},
		CosmeticsGroup = "Cosmetic_TentTable01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TentTable_Hellish",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566758, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Table_Serpentine",
		IconScale = 0.33,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Table_Serpentine",
		AnimationScale = 2.1,
		GameStateRequirements = {
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
		},
	},
	-- #endregion
	-- #region Candle/Cosmetic_TentCandle01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentCandle_Elysian",
		Name = {
			en = "Candle, Elysian",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
		},
		FlavorText = {
			en =
			"Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
		},
		CosmeticsGroup = "Cosmetic_TentCandle01",
		InsertAfterCosmetic = "Cosmetic_TentCandle01",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566716, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Candle_Elysian",
		IconScale = 0.27,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Candle_Elysian",
		AnimationScale = 1.8,
		GameStateRequirements = {
			NamedRequirements = { "T1Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 150,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
			ModsNikkelMHadesBiomes_PlantStyx = 2,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0412", Text = "Now this is a real top-of-the-line candle, Mel.", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs, },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	-- #endregion
	-- #region Bed/Blanket/Cosmetic_TentBlanket01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Chthonic",
		Name = {
			en = "Bedding, Chthonic",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
		},
		FlavorText = {
			en =
			"Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
		},
		CosmeticsGroup = "Cosmetic_TentBlanket01",
		InsertAfterCosmetic = "Cosmetic_TentBlanket01c",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566738 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Blanket_Chthonic",
		IconScale = 0.15,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Blanket_Chthonic",
		AnimationScale = 2.1,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			NamedRequirements = { "T1Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
			ModsNikkelMHadesBiomes_CropStyx = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Infernal",
		Name = {
			en = "Bedding, Infernal",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
		},
		FlavorText = {
			en =
			"When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
		},
		CosmeticsGroup = "Cosmetic_TentBlanket01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Chthonic",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566738 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Blanket_Infernal",
		IconScale = 0.15,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Blanket_Infernal",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 6,
			},
			NamedRequirements = { "T1Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 2,
			ModsNikkelMHadesBiomes_CropAsphodel = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Olympic",
		Name = {
			en = "Bedding, Olympic",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
		},
		FlavorText = {
			en =
			"Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
		},
		CosmeticsGroup = "Cosmetic_TentBlanket01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Infernal",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566738 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Blanket_Olympic",
		IconScale = 0.15,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Blanket_Olympic",
		AnimationScale = 2.05,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 4,
			},
			NamedRequirements = { "T1Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
		},
	},
	-- #endregion
	-- #region Shelving/Cosmetic_TentShelf01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentShelf_Brooding",
		Name = {
			en = "Shelving, Brooding",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
		},
		FlavorText = {
			en =
			"The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
		},
		CosmeticsGroup = "Cosmetic_TentShelf01",
		InsertAfterCosmetic = "Cosmetic_TentShelf01b",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566827 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Shelf_Brooding",
		IconScale = 0.35,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Shelf_Brooding",
		AnimationScale = 3.5,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 5,
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_BossResourceStyx = 2,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_CropElysium = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentShelf_Royal",
		Name = {
			en = "Shelving, Royal",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
		},
		FlavorText = {
			en =
			"To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
		},
		CosmeticsGroup = "Cosmetic_TentShelf01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TentShelf_Brooding",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566827 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Shelf_Royal",
		IconScale = 0.35,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Shelf_Royal",
		AnimationScale = 3.5,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 6,
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_OreAsphodel = 5,
			ModsNikkelMHadesBiomes_CropTartarus = 2,
		},
	},
	-- #endregion
}
for _, cosmeticData in ipairs(tentCosmetics) do
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end

-- CosmeticsShop_Main
local mainHubAreaCosmetics = {
	-- #region Banners/Cosmetic_HecateKey
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Infernal",
		Name = {
			en = "Banner, Infernal",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
		},
		FlavorText = {
			en =
			"Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
		},
		CosmeticsGroup = "Cosmetic_HecateKey",
		InsertAfterCosmetic = "Cosmetic_HecateKey",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 780487 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Banner_Infernal",
		IconScale = 0.3,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Banner_Infernal",
		AnimationScale = 3.57,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "Cosmetic_HecateKey" },
			},
			-- Beaten EM4 Hades
			{
				PathTrue = { "GameState", "TextLinesRecord", "LordHadesExtremeMeasuresDefeat01" },
			},
			NamedRequirements = { "T5Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 800,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Divine",
		Name = {
			en = "Banner, Divine",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
		},
		FlavorText = {
			en =
			"Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
		},
		CosmeticsGroup = "Cosmetic_HecateKey",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Infernal",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 780487 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Banner_Divine",
		IconScale = 0.3,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Banner_Divine",
		AnimationScale = 3.57,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "Cosmetic_HecateKey" },
			},
			-- Cleared Elysium
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_PostBoss01" },
			},
			NamedRequirements = { "T5Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 800,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
		},
	},
	-- #endregion
	-- #region Pillars/Cosmetic_CauldronPillars01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Divine",
		Name = {
			en = "Pillars, Divine",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			en =
			"So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = "Cosmetic_CauldronPillars01c",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Divine",
		IconScale = 0.1,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Divine",
		AnimationScale = 1.9,
		GameStateRequirements = {
			-- Met Patroclus
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_Story01" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_CropElysium = 1,
			ModsNikkelMHadesBiomes_OreElysium = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Gilded",
		Name = {
			en = "Pillars, Gilded",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			en =
			"Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Divine",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Gilded",
		IconScale = 0.1,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Gilded",
		AnimationScale = 1.9,
		GameStateRequirements = {
			-- Entered Styx Hub
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Hub" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_CropElysium = 1,
			ModsNikkelMHadesBiomes_OreStyx = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Serpentine",
		Name = {
			en = "Pillars, Serpentine",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Rustic monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			en =
			"Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Gilded",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Serpentine",
		IconScale = 0.1,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Serpentine",
		AnimationScale = 1.9,
		GameStateRequirements = {
			-- Met Megaera
			{
				PathTrue = { "GameState", "RoomsEntered", "A_Boss01" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_CropTartarus = 1,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
		},
	},
	-- #endregion
	-- #region Rugs/Cosmetic_OdysseusRug
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Rug_Ancient",
		Name = {
			en = "Rug, Ancient",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
		},
		FlavorText = {
			en =
			"This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
		},
		CosmeticsGroup = "Cosmetic_OdysseusRug",
		InsertAfterCosmetic = "Cosmetic_OdysseusRug",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 591259 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Rug_Ancient",
		IconScale = 0.2,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Rug_Ancient",
		AnimationScale = 2.35,
		GameStateRequirements = {
			-- Met Sisyphus
			{
				PathTrue = { "GameState", "RoomsEntered", "A_Story01" },
			},
		},
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_PlantAsphodel = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Rug_Heroic",
		Name = {
			en = "Rug, Heroic",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
		},
		FlavorText = {
			en =
			"This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
		},
		CosmeticsGroup = "Cosmetic_OdysseusRug",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Rug_Ancient",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 591259 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Rug_Heroic",
		IconScale = 0.18,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Rug_Heroic",
		AnimationScale = 2.3,
		GameStateRequirements = {
			-- Beaten both Asterius solo and the Champions both
			{
				PathTrue = { "GameState", "EncountersCompletedCache", "MiniBossMinotaur" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_PostBoss01" },
			},
		},
		Cost = {
			CosmeticsPoints = 300,
			ModsNikkelMHadesBiomes_PlantElysium = 3,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
		},
	},
	-- #endregion
	-- #region War Table/Cosmetic_OdysseusTable01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_War_Table_Heroic",
		Name = {
			en = "War Table, Heroic",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
		},
		FlavorText = {
			en =
			"Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
		},
		CosmeticsGroup = "Cosmetic_OdysseusTable01",
		InsertAfterCosmetic = "Cosmetic_OdysseusTable01",
		ShopCategory = "CosmeticsShop_Main",
		SetAnimationIds = { 561464 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\War_Table_Heroic",
		IconScale = 0.2,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\War_Table_Heroic",
		AnimationScale = 2,
		GameStateRequirements = {
			-- Beaten the Champions on Extreme Measures
			{
				PathTrue = { "GameState", "EnemyKills", "Theseus2" },
			},
			{
				PathTrue = { "GameState", "EnemyKills", "Minotaur2" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 700,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
		},
	},
	-- #endregion
	-- #region Crossroads Lanterns/CosmeticIcon_MainLanterns01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Lantern_Infernal",
		Name = {
			en = "Lanterns, Infernal",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
		},
		FlavorText = {
			en =
			"Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
		},
		CosmeticsGroup = "Cosmetic_MainLanterns01",
		InsertAfterCosmetic = "Cosmetic_MainLanterns01b",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 561185,
		SetAnimationIds = { 576309, 585190, 561185, 561184, 588785, 742460, 742260, 742474, 742472 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Lantern_Infernal",
		IconScale = 0.6,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Lantern_Infernal",
		AnimationScale = 1.9,
		GameStateRequirements = {
			{
				Path = { "GameState", "EnemyKills", "HadesSwarmer" },
				Comparison = ">=",
				Value = 100,
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 300,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 1,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0484", Text = "{#Emph}A pittance of a light within the infinite dark of existence!", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraScaryAppearArgs },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	-- #endregion
	-- #region Cauldron/Cosmetic_Cauldron01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Cauldron_Infernal",
		Name = {
			en = "Cauldron, Infernal",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
		},
		FlavorText = {
			en =
			"Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
		},
		CosmeticsGroup = "Cosmetic_Cauldron01",
		InsertAfterCosmetic = "Cosmetic_Cauldron01b",
		ShopCategory = "CosmeticsShop_Main",
		SetAnimationIds = { 558175 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Cauldron_Infernal",
		IconScale = 0.18,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Cauldron_Infernal",
		AnimationScale = 2,
		AnimationOffsetY = -25,
		IsCauldron = true,
		CauldronLidAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Cauldron_Infernal_Lid",
		-- For the bubbling water animation
		AnimationInheritFrom = "CriticalItemWorldObject01",
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 2200,
			ModsNikkelMHadesBiomes_OreAsphodel = 9,
			ModsNikkelMHadesBiomes_OreElysium = 6,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{
					Cue = "/VO/Dora_0442",
					Text = "Bet you can cook up some {#Emph}real {#Prev}nasty curses in this baby.",
					PreLineFunctionName = "GenericPresentation",
					PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs
				},
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Cauldron_Infinite",
		Name = {
			en = "Cauldron, Infinite",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
		},
		FlavorText = {
			en =
			"Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
		},
		CosmeticsGroup = "Cosmetic_Cauldron01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Cauldron_Infernal",
		ShopCategory = "CosmeticsShop_Main",
		SetAnimationIds = { 558175 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Cauldron_Infinite",
		IconScale = 0.18,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Cauldron_Infinite",
		AnimationScale = 2,
		IsCauldron = true,
		CauldronLidAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Cauldron_Infinite_Lid",
		-- For the bubbling water animation
		AnimationInheritFrom = "CriticalItemWorldObject01",
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 5,
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 2200,
			ModsNikkelMHadesBiomes_CropTartarus = 4,
			ModsNikkelMHadesBiomes_OreElysium = 5,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 3,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{
					Cue = "/VO/Dora_0442",
					Text = "Bet you can cook up some {#Emph}real {#Prev}nasty curses in this baby.",
					PreLineFunctionName = "GenericPresentation",
					PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs
				},
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	-- #endregion
}
for _, cosmeticData in ipairs(mainHubAreaCosmetics) do
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end

-- CosmeticsShop_Taverna
local tavernaCosmetics = {

}
for _, cosmeticData in ipairs(tavernaCosmetics) do
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end

-- CosmeticsShop_PreRun
local preRunCosmetics = {
	-- #region Exit Charms/Cosmetic_ExitCharm
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Achilles",
		Name = {
			en = "Charm, Antos",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = "Cosmetic_ExitCharm05",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Achilles",
		IconScale = 0.6,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Achilles",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Patroclus bond forged
				PathTrue = { "GameState", "TextLinesRecord", "PatroclusGift08_A" }
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 600,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
			ModsNikkelMHadesBiomes_OreElysium = 4,
			ModsNikkelMHadesBiomes_CropElysium = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Dusa",
		Name = {
			en = "Charm, Fidi",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Achilles",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Dusa",
		IconScale = 0.6,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Dusa",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Dora's quest completed
				PathTrue = { "GameState", "TextLinesRecord", "DoraAboutMemories05" },
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 600,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
			ModsNikkelMHadesBiomes_OreAsphodel = 4,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Megaera",
		Name = {
			en = "Charm, Battie",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Dusa",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Megaera",
		IconScale = 0.6,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Megaera",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				Path = { "GameState", "EnemyKills", },
				SumOf = { "Harpy", "Harpy2", "Harpy3", },
				Comparison = ">=",
				Value = 5,
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 600,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 2,
			ModsNikkelMHadesBiomes_CropTartarus = 2,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Sisyphus",
		Name = {
			en = "Charm, Shady",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Megaera",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Sisyphus",
		IconScale = 0.6,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Sisyphus",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Sisyphus has given you his companion
				PathTrue = { "GameState", "TextLinesRecord", "SisyphusGift07_A" }
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 600,
			ModsNikkelMHadesBiomes_OreTartarus = 5,
			ModsNikkelMHadesBiomes_OreAsphodel = 5,
			ModsNikkelMHadesBiomes_OreElysium = 5,
			ModsNikkelMHadesBiomes_OreStyx = 5,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Skelly",
		Name = {
			en = "Charm, Rib",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Sisyphus",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Skelly",
		IconScale = 0.6,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Skelly",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Completed Skelly's Augmentation of Bone Density quest
				PathTrue = { "GameState", "ObjectivesCompleted", "KillSkelly" },
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 600,
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
			ModsNikkelMHadesBiomes_PlantStyx = 2,
			ModsNikkelMHadesBiomes_CropStyx = 1,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.8,
				ObjectType = "NPC_Skelly_01",
				Queue = "Always",
				{ Cue = "/VO/Skelly_0384", Text = "Pretty nice, {#Emph}huh?", },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
		CosmeticRemovedVoiceLines = {
			{ GlobalVoiceLines = "CosmeticChangeVoiceLines" },
			{
				PreLineWait = 0.75,
				RandomRemaining = true,
				BreakIfPlayed = true,
				ObjectType = "NPC_Skelly_01",
				Queue = "Always",
				{ Cue = "/VO/Skelly_0459", Text = "{#Emph}...Dammit." },
				{ Cue = "/VO/Skelly_0467", Text = "Seriously?" },
				{ Cue = "/VO/Skelly_0021", Text = "I shall return..." },
			},
		},
		CosmeticReAddedVoiceLines = {
			{ GlobalVoiceLines = "CosmeticChangeVoiceLines" },
			{
				PreLineWait = 0.75,
				RandomRemaining = true,
				BreakIfPlayed = true,
				ObjectType = "NPC_Skelly_01",
				Queue = "Always",
				{ Cue = "/VO/Skelly_0016", Text = "A fine choice." },
				{ Cue = "/VO/Skelly_0129", Text = "A fine selection!" },
				{ Cue = "/VO/Skelly_0130", Text = "A fine selection." },
				{ Cue = "/VO/Skelly_0063", Text = "Excellent!" },
				{ Cue = "/VO/Skelly_0384", Text = "Pretty nice, {#Emph}huh?", },
			},
		}
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Thanatos",
		Name = {
			en = "Charm, Mort",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Skelly",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Thanatos",
		IconScale = 0.6,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Thanatos",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Thanatos has given you his companion
				PathTrue = { "GameState", "TextLinesRecord", "ThanatosGift07_A" }
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 600,
			ModsNikkelMHadesBiomes_CropAsphodel = 4,
			ModsNikkelMHadesBiomes_CropElysium = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Cerberus",
		Name = {
			en = "Charm, Solo",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Thanatos",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Cerberus",
		IconScale = 0.6,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Cerberus",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- "Beaten" Cerberus enough times
				Path = { "GameState", "RoomsEntered", "D_Boss01" },
				Comparison = ">=",
				Value = 7,
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 800,
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 2,
			ModsNikkelMHadesBiomes_CropAsphodel = 2,
		},
	},
	-- #endregion
}
for _, cosmeticData in ipairs(preRunCosmetics) do
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end
