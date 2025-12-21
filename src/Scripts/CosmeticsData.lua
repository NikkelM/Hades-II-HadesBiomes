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
	-- #region Benches/Cosmetic_TavernaChairs01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaChairs_Infernal",
		Name = {
			en = "Benches, Infernal",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			en =
			"Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
		},
		CosmeticsGroup = "Cosmetic_TavernaChairs01",
		InsertAfterCosmetic = "Cosmetic_TavernaChairs01c",
		ShopCategory = "CosmeticsShop_Taverna",
		SetAnimationIds = { 566374, 566377, 585764, 585753, 585756, 585760, 585763, 585759, 742136, 742137, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaChairs_Infernal",
		IconScale = 0.3,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaChairs_Infernal",
		AnimationScale = 2.2,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 3,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeTaverna" }
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 270,
			ModsNikkelMHadesBiomes_OreTartarus = 5,
			ModsNikkelMHadesBiomes_CropAsphodel = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaChairs_Springtime",
		Name = {
			en = "Benches, Springtime",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			en =
			"Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
		},
		CosmeticsGroup = "Cosmetic_TavernaChairs01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TavernaChairs_Infernal",
		ShopCategory = "CosmeticsShop_Taverna",
		SetAnimationIds = { 566374, 566377, 585764, 585753, 585756, 585760, 585763, 585759, 742136, 742137, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaChairs_Springtime",
		IconScale = 0.3,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaChairs_Springtime",
		AnimationScale = 2.2,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeTaverna" }
			},
			NamedRequirements = { "T1Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_CropElysium = 2,
			ModsNikkelMHadesBiomes_PlantStyx = 2,
			ModsNikkelMHadesBiomes_CropStyx = 1,
		},
	},
	-- #endregion
	-- #region Tables/Cosmetic_TavernaTables01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaTables_Infernal",
		Name = {
			en = "Tables, Infernal",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			en =
			"There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
		},
		CosmeticsGroup = "Cosmetic_TavernaTables01",
		InsertAfterCosmetic = "Cosmetic_TavernaTables01c",
		ShopCategory = "CosmeticsShop_Taverna",
		SetAnimationIds = { 585757, 585754, 585761, 566359, 742135, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaTables_Infernal",
		IconScale = 0.2,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaTables_Infernal",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 3,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeTaverna" }
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 750,
			ModsNikkelMHadesBiomes_OreElysium = 5,
			ModsNikkelMHadesBiomes_OreTartarus = 5,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaTables_Springtime",
		Name = {
			en = "Tables, Springtime",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			en =
			"In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
		},
		CosmeticsGroup = "Cosmetic_TavernaTables01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TavernaTables_Infernal",
		ShopCategory = "CosmeticsShop_Taverna",
		SetAnimationIds = { 585757, 585754, 585761, 566359, 742135, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaTables_Springtime",
		IconScale = 0.2,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaTables_Springtime",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeTaverna" }
			},
			NamedRequirements = { "T1Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 700,
			ModsNikkelMHadesBiomes_OreStyx = 5,
			ModsNikkelMHadesBiomes_OreAsphodel = 5,
		},
	},
	-- #endregion
	-- #region Cooking Pot/Cosmetic_TavernaCauldron01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaCauldron_Royal",
		Name = {
			en = "Cooking-Pot, Royal",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			en =
			"It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
		},
		CosmeticsGroup = "Cosmetic_TavernaCauldron01",
		InsertAfterCosmetic = "Cosmetic_TavernaCauldron02",
		ShopCategory = "CosmeticsShop_Taverna",
		SetAnimationIds = { 586614 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaCauldron_Royal",
		IconScale = 0.25,
		IconOffsetY = -10,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaCauldron_Royal",
		AnimationScale = 2.3,
		AnimationOffsetX = -50,
		AnimationOffsetY = -50,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 3,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeTaverna" }
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_CropElysium = 2,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
		},
	},
	-- #endregion
	-- #region Mosaic/Cosmetic_TavernaStarMosaic
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaStarMosaic_Furious",
		Name = {
			en = "Mosaic, Furious",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			en =
			"The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
		},
		CosmeticsGroup = "Cosmetic_TavernaStarMosaic",
		InsertAfterCosmetic = "Cosmetic_TavernaStarMosaic",
		ShopCategory = "CosmeticsShop_Taverna",
		ActivateIds = { 738509 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaStarMosaic_Furious",
		IconScale = 0.2,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaStarMosaic_Furious",
		AnimationScale = 2,
		AnimationOffsetY = -70,
		GameStateRequirements = {
			{
				Path = { "GameState", "EnemyKills" },
				SumOf = { "Harpy", "Harpy2", "Harpy3" },
				Comparison = ">=",
				Value = 5,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeTaverna" }
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_PlantTartarus = 3,
			ModsNikkelMHadesBiomes_CropTartarus = 2,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaStarMosaic_Royal",
		Name = {
			en = "Mosaic, Royal",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			en =
			"Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
		},
		CosmeticsGroup = "Cosmetic_TavernaStarMosaic",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TavernaStarMosaic_Furious",
		ShopCategory = "CosmeticsShop_Taverna",
		ActivateIds = { 738509 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaStarMosaic_Royal",
		IconScale = 0.2,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaStarMosaic_Royal",
		AnimationScale = 1.95,
		AnimationOffsetY = -55,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 4,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeTaverna" }
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_PlantStyx = 2,
			ModsNikkelMHadesBiomes_CropAsphodel = 3,
			ModsNikkelMHadesBiomes_OreStyx = 5,
		},
	},
	-- #endregion
	-- #region Tassels/Cosmetic_MainHangingTassles01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_MainHangingTassles_Deathly",
		Name = {
			en = "Tassels, Deathly",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
		},
		FlavorText = {
			en =
			"Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
		},
		CosmeticsGroup = "Cosmetic_MainHangingTassles01",
		InsertAfterCosmetic = "Cosmetic_MainHangingTassles01b",
		ShopCategory = "CosmeticsShop_Taverna",
		CameraFocusId = 576000,
		SetAnimationIds = { 576011, 576000, 576010, 575999, 585293 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\MainHangingTassles_Deathly",
		IconScale = 0.15,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\MainHangingTassles_Deathly",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Intro" },
			},
			NamedRequirements = { "T1Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_PlantStyx = 1,
			ModsNikkelMHadesBiomes_CropTartarus = 2,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0452", Text = "I'll get some Shades to hang those up for you.", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	-- #endregion
	-- #region Rope/Cosmetic_MainHangingRope01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Cosmetic_MainHangingRope_Deathly",
		Name = {
			en = "Rope, Deathly",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			en =
			"They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
		},
		CosmeticsGroup = "Cosmetic_MainHangingRope01",
		InsertAfterCosmetic = "Cosmetic_MainHangingRope01a",
		ShopCategory = "CosmeticsShop_Taverna",
		CameraFocusId = 567503,
		SetAnimationIds = { 567502, 567327, 576074, 567326, 567503, 589757, 576156, 589685, 589686, 567328, 589688, 589687, 586405, 589689, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\MainHangingRope_Deathly",
		IconScale = 0.12,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\MainHangingRope_Deathly",
		AnimationScale = 1.8,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Intro" },
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 280,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
			ModsNikkelMHadesBiomes_OreAsphodel = 3,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0455", Text = "Could always use more stuff hanging from the trees.", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	-- #endregion
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
	-- #region Skelly Dais/Cosmetic_SkellyFloor01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_SkellyFloor_Fancy",
		Name = {
			en = "Dais, Fancy",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
		},
		FlavorText = {
			en =
			"With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
		},
		CosmeticsGroup = "Cosmetic_SkellyFloor01",
		InsertAfterCosmetic = "Cosmetic_SkellyFloor01b",
		ShopCategory = "CosmeticsShop_PreRun",
		SetAnimationIds = { 587209 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\SkellyFloor_Fancy",
		IconScale = 0.15,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\SkellyFloor_Fancy",
		AnimationScale = 2,
		GameStateRequirements = {
			NamedRequirements = { "T1Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_OreElysium = 4,
			ModsNikkelMHadesBiomes_PlantStyx = 2,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Skelly_01",
				RequiredSourceValueFalse = "InPartnerConversation",
				{ Cue = "/VO/Skelly_0256", Text = "{#Emph}Ooh{#Prev}, scary..." },
			},
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0470", Text = "A more-imposing place for the good Commander to stand.", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs, },
			},
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_SkellyFloor_Olympian",
		Name = {
			en = "Dais, Fancy",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
		},
		FlavorText = {
			en =
			"What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
		},
		CosmeticsGroup = "Cosmetic_SkellyFloor01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_SkellyFloor_Fancy",
		ShopCategory = "CosmeticsShop_PreRun",
		SetAnimationIds = { 587209 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\SkellyFloor_Olympian",
		IconScale = 0.15,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\SkellyFloor_Olympian",
		AnimationScale = 2,
		GameStateRequirements = {
			NamedRequirements = { "T1Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_CropAsphodel = 2,
			ModsNikkelMHadesBiomes_CropStyx = 2,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Skelly_01",
				RequiredSourceValueFalse = "InPartnerConversation",
				{ Cue = "/VO/Skelly_0200", Text = "Oh dang!" },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	-- #endregion
	-- #region Effigies/Scarecrows/Cosmetic_TrainingDummy01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TrainingDummy_Scarecrow",
		Name = {
			en = "Effigies, Scary",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
		},
		FlavorText = {
			en =
			"Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
		},
		CosmeticsGroup = "Cosmetic_TrainingDummy01",
		InsertAfterCosmetic = "Cosmetic_TrainingDummy01b",
		ShopCategory = "CosmeticsShop_PreRun",
		CameraFocusId = 566610,
		SetAnimationIds = { 566610, 566612, 567196, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\TrainingDummy_Scarecrow",
		IconScale = 0.3,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\TrainingDummy_Scarecrow",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "SkellyGift04" },
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 1100,
			ModsNikkelMHadesBiomes_OreStyx = 5,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Skelly_01",
				RequiredSourceValueFalse = "InPartnerConversation",
				{ Cue = "/VO/Skelly_0157", Text = "Yeah!" },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	-- #endregion
}
for _, cosmeticData in ipairs(preRunCosmetics) do
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end
