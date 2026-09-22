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

-- In total, as of 2026-05-21: 56 cosmetics
-- Last added: Pillarets, Coned

-- #region CosmeticsShop_Tent
local tentCosmetics = {
	-- #region Fan Posters/Cosmetic_FanPoster01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_FanPoster_Theseus",
		Name = {
			-- The naming pattern each language uses for cosmetics in Hades II - follow this pattern when translating
			-- "<Type> (<Name>)", e.g. "Kerze (Blutrot)"
			-- de = "Wall-Scroll, Theseus",
			-- "<Type> <Name>", e.g. "Σκεπάσματα από μετάξι"
			-- el = "Wall-Scroll, Theseus",
			en = "Wall-Scroll, Theseus",
			-- "<Type> <Name>", e.g. "Vela escarlata"
			-- es = "Wall-Scroll, Theseus",
			fr = "Affiche de Thésée",
			-- "<Type> <Name>", e.g. "Cero Vermiglio"
			-- it = "Wall-Scroll, Theseus",
			-- "<Type>（<Name>）", e.g. "ろうそく（深紅）"
			-- ja = "Wall-Scroll, Theseus",
			-- "<Type>: <Name>", e.g. "양초: 진홍"
			-- ko = "Wall-Scroll, Theseus",
			-- "<Type> (<Name>)", e.g. "Świeca (szkarłatna)"
			-- pl = "Wall-Scroll, Theseus",
			-- "<Type> <Name>", e.g. "Vela escarlate"
			-- ["pt-BR"] = "Wall-Scroll, Theseus",
			-- "<Type> (<Name>)", e.g. "Свеча (алая)"
			-- ru = "Wall-Scroll, Theseus",
			-- "<Type>, <Name>", e.g. "Mum, Kızıl"
			-- tr = "Wall-Scroll, Theseus",
			-- "<Name> <Type>", e.g. "Багряна свічка"
			-- uk = "Wall-Scroll, Theseus",
			-- "<Name><Type>", e.g. "绯红蜡烛"
			-- ["zh-CN"] = "Wall-Scroll, Theseus",
			-- "<Name><Type>", e.g. "緋紅蠟燭"
			-- ["zh-TW"] = "Wall-Scroll, Theseus",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			en =
			"{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Représente le Champion de l'Élysée et l'ardent rival de votre frère.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Champion of Elysium and passionate rival of your brother.",
		},
		FlavorText = {
			-- de =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- el =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			en =
			"Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- es =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			fr =
			"Lié au Taureau de Minos Astérion, son ennemi devenu ami, il voit désormais les ombres de l'Élysée acclamer ses victoires, à l'exception d'une seule, qui a toujours soutenu votre frère.",
			-- it =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- ja =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- ko =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- pl =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- ["pt-BR"] =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- ru =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- tr =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- uk =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- ["zh-CN"] =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
			-- ["zh-TW"] =
			-- "Bonded with the Bull of Minos Asterius, his foe-turned-friend, the shades of Elysium now cheer for his victories, save one, who has always supported your brother.",
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
		AlwaysRevealImmediately = true,
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
			-- de = "Wall-Scroll, Aphrodite",
			-- el = "Wall-Scroll, Aphrodite",
			en = "Wall-Scroll, Aphrodite",
			-- es = "Wall-Scroll, Aphrodite",
			fr = "Affiche d'Aphrodite",
			-- it = "Wall-Scroll, Aphrodite",
			-- ja = "Wall-Scroll, Aphrodite",
			-- ko = "Wall-Scroll, Aphrodite",
			-- pl = "Wall-Scroll, Aphrodite",
			-- ["pt-BR"] = "Wall-Scroll, Aphrodite",
			-- ru = "Wall-Scroll, Aphrodite",
			-- tr = "Wall-Scroll, Aphrodite",
			-- uk = "Wall-Scroll, Aphrodite",
			-- ["zh-CN"] = "Wall-Scroll, Aphrodite",
			-- ["zh-TW"] = "Wall-Scroll, Aphrodite",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			en =
			"{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Représente la déesse de l'Amour, de la Beauté et, non des moindres, de la Passion.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Portrays the Goddess of Love, Beauty, and certainly not least of all, Passion.",
		},
		FlavorText = {
			-- de =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- el =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			en =
			"Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- es =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			fr =
			"Parmi les nombreuses épreuves qu'impose votre tâche, cette bannière rappelle que l'amour peut se trouver jusque dans les lieux les plus sombres.",
			-- it =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- ja =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- ko =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- pl =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- ["pt-BR"] =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- ru =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- tr =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- uk =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- ["zh-CN"] =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
			-- ["zh-TW"] =
			-- "Amongst the many hardships imposed by your task, this scroll serves as a reminder that love can be found even in the darkest of places.",
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
		AlwaysRevealImmediately = true,
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
			-- de = "Table, Hellish",
			-- el = "Table, Hellish",
			en = "Table, Hellish",
			-- es = "Table, Hellish",
			fr = "Table Infernale",
			-- it = "Table, Hellish",
			-- ja = "Table, Hellish",
			-- ko = "Table, Hellish",
			-- pl = "Table, Hellish",
			-- ["pt-BR"] = "Table, Hellish",
			-- ru = "Table, Hellish",
			-- tr = "Table, Hellish",
			-- uk = "Table, Hellish",
			-- ["zh-CN"] = "Table, Hellish",
			-- ["zh-TW"] = "Table, Hellish",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			en =
			"{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			fr =
			"{$Keywords.CosmeticSwap} : Surface tiède au toucher, parcourue d'un motif irrégulier serti dans un cadre rouge profond.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Warm to the touch surface, with an unsteady pattern set within a deep red frame.",
		},
		FlavorText = {
			-- de =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- el =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			en =
			"Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- es =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			fr =
			"Le lieu où se dressait jadis cette table s'est perdu dans le temps, mais le motif irrégulier gravé dans sa surface semble vouloir s'échapper de son cadre.",
			-- it =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- ja =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- ko =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- pl =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- ["pt-BR"] =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- ru =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- tr =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- uk =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- ["zh-CN"] =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
			-- ["zh-TW"] =
			-- "Where this table once stood has been lost to time, but the uneven pattern etched into its surface seems to want to break free from its confines.",
		},
		CosmeticsGroup = "Cosmetic_TentTable01",
		InsertAfterCosmetic = "Cosmetic_TentTable01c",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566758, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\Table_Hellish_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Table_Hellish",
		AnimationScale = 2.1,
		GameStateRequirements = {
			NamedRequirements = { "T3Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_OreStyx = 5,
			ModsNikkelMHadesBiomes_CropStyx = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentTable_Serpentine",
		Name = {
			-- de = "Table, Serpentine",
			-- el = "Table, Serpentine",
			en = "Table, Serpentine",
			-- es = "Table, Serpentine",
			fr = "Table Serpentine",
			-- it = "Table, Serpentine",
			-- ja = "Table, Serpentine",
			-- ko = "Table, Serpentine",
			-- pl = "Table, Serpentine",
			-- ["pt-BR"] = "Table, Serpentine",
			-- ru = "Table, Serpentine",
			-- tr = "Table, Serpentine",
			-- uk = "Table, Serpentine",
			-- ["zh-CN"] = "Table, Serpentine",
			-- ["zh-TW"] = "Table, Serpentine",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			en =
			"{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			fr =
			"{$Keywords.CosmeticSwap} : Enroulé sur lui-même, le motif de cette table semble se réagencer chaque fois que vous la regardez.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Coiled surface, the pattern on this table seems to re-arrange itself each time you look at it.",
		},
		FlavorText = {
			-- de =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- el =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			en =
			"At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- es =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			fr =
			"La nuit, quand la forêt alentour s'apaise, il semble parfois qu'un léger sifflement s'échappe de cette table.",
			-- it =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- ja =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- ko =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- pl =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- ["pt-BR"] =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- ru =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- tr =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- uk =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- ["zh-CN"] =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
			-- ["zh-TW"] =
			-- "At night, when the surrounding forest is still, it can sometimes seem as though a faint hissing can be heard from this table.",
		},
		CosmeticsGroup = "Cosmetic_TentTable01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TentTable_Hellish",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566758, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\Table_Serpentine_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Table_Serpentine",
		AnimationScale = 2.1,
		GameStateRequirements = {
			NamedRequirements = { "T3Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
		},
	},
	-- #endregion
	-- #region Candle/Cosmetic_TentCandle01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentCandle_Tartarus",
		Name = {
			-- de = "Candle, Tartarus",
			-- el = "Candle, Tartarus",
			en = "Candle, Tartarus",
			-- es = "Candle, Tartarus",
			fr = "Bougie Tartarienne",
			-- it = "Candle, Tartarus",
			-- ja = "Candle, Tartarus",
			-- ko = "Candle, Tartarus",
			-- pl = "Candle, Tartarus",
			-- ["pt-BR"] = "Candle, Tartarus",
			-- ru = "Candle, Tartarus",
			-- tr = "Candle, Tartarus",
			-- uk = "Candle, Tartarus",
			-- ["zh-CN"] = "Candle, Tartarus",
			-- ["zh-TW"] = "Candle, Tartarus",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			en =
			"{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			fr =
			"{$Keywords.CosmeticSwap} : Coulée dans une cire ancienne et fichée dans un support de pierre sombre et verdâtre.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Poured from aged wax and set within a holder of dark, green stone.",
		},
		FlavorText = {
			-- de =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- el =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			en =
			"Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- es =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			fr =
			"Avant que le Titan Chronos ne s'empare du Tartare, ses salles quasi infinies étaient éclairées par d'innombrables bougies comme celle-ci, répandant leur inquiétante lueur verte.",
			-- it =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- ja =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- ko =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- pl =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- ["pt-BR"] =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- ru =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- tr =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- uk =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- ["zh-CN"] =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
			-- ["zh-TW"] =
			-- "Before the Titan Chronos took hold of Tartarus, its sheer endless chambers were illuminated by countless candles such as this one, spreading their eerie green glow.",
		},
		CosmeticsGroup = "Cosmetic_TentCandle01",
		InsertAfterCosmetic = "Cosmetic_TentCandle01",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566716, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\Candle_Tartarus_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Candle_Tartarus",
		AnimationScale = 1.8,
		GameStateRequirements = {
			NamedRequirements = { "T1Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 150,
			ModsNikkelMHadesBiomes_OreTartarus = 3,
			ModsNikkelMHadesBiomes_CropTartarus = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentCandle_Elysian",
		Name = {
			-- de = "Candle, Elysian",
			-- el = "Candle, Elysian",
			en = "Candle, Elysian",
			-- es = "Candle, Elysian",
			fr = "Bougie Élyséenne",
			-- it = "Candle, Elysian",
			-- ja = "Candle, Elysian",
			-- ko = "Candle, Elysian",
			-- pl = "Candle, Elysian",
			-- ["pt-BR"] = "Candle, Elysian",
			-- ru = "Candle, Elysian",
			-- tr = "Candle, Elysian",
			-- uk = "Candle, Elysian",
			-- ["zh-CN"] = "Candle, Elysian",
			-- ["zh-TW"] = "Candle, Elysian",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			en =
			"{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			fr =
			"{$Keywords.CosmeticSwap} : Coulée dans la plus fine des cires et parfumée des senteurs les plus douces des jardins de l'Élysée.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Poured from the finest wax and scented with the sweetest fragrances of Elysium's gardens.",
		},
		FlavorText = {
			-- de =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- el =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			en =
			"Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- es =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			fr =
			"Énumérer toutes les fleurs et autres ingrédients ayant servi à la fabrication de cette bougie serait une tâche digne de rivaliser avec celle de la Princesse des Enfers.",
			-- it =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- ja =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- ko =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- pl =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- ["pt-BR"] =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- ru =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- tr =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- uk =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- ["zh-CN"] =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
			-- ["zh-TW"] =
			-- "Listing all the different flowers and other ingredients used in the making of this candle would be a task to rival that of the Princess of the Underworld's own.",
		},
		CosmeticsGroup = "Cosmetic_TentCandle01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TentCandle_Tartarus",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566716, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\Candle_Elysian_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Candle_Elysian",
		AnimationScale = 1.8,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_Boss01" },
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 150,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
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
			-- de = "Bedding, Chthonic",
			-- el = "Bedding, Chthonic",
			en = "Bedding, Chthonic",
			-- es = "Bedding, Chthonic",
			fr = "Couverture Chthonienne",
			-- it = "Bedding, Chthonic",
			-- ja = "Bedding, Chthonic",
			-- ko = "Bedding, Chthonic",
			-- pl = "Bedding, Chthonic",
			-- ["pt-BR"] = "Bedding, Chthonic",
			-- ru = "Bedding, Chthonic",
			-- tr = "Bedding, Chthonic",
			-- uk = "Bedding, Chthonic",
			-- ["zh-CN"] = "Bedding, Chthonic",
			-- ["zh-TW"] = "Bedding, Chthonic",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			en =
			"{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			fr =
			"{$Keywords.CosmeticSwap} : Ornée et moelleuse, dégageant une odeur familière et apaisante.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Ornate and cushioned, with a familiar and soothing smell.",
		},
		FlavorText = {
			-- de =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- el =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			en =
			"Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- es =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			fr =
			"Si le seigneur Hadès n'est guère réputé pour son sens du style, la reine Perséphone, elle, a le goût des belles choses.",
			-- it =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- ja =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- ko =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- pl =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- ["pt-BR"] =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- ru =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- tr =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- uk =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- ["zh-CN"] =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
			-- ["zh-TW"] =
			-- "Whilst the Lord Hades of the Underworld is not known for his sense of style, the Queen Persephone certainly has a taste for the finer things.",
		},
		CosmeticsGroup = "Cosmetic_TentBlanket01",
		InsertAfterCosmetic = "Cosmetic_TentBlanket01c",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566738 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\Blanket_Chthonic_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
			ModsNikkelMHadesBiomes_CropStyx = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Infernal",
		Name = {
			-- de = "Bedding, Infernal",
			-- el = "Bedding, Infernal",
			en = "Bedding, Infernal",
			-- es = "Bedding, Infernal",
			fr = "Couverture Infernale",
			-- it = "Bedding, Infernal",
			-- ja = "Bedding, Infernal",
			-- ko = "Bedding, Infernal",
			-- pl = "Bedding, Infernal",
			-- ["pt-BR"] = "Bedding, Infernal",
			-- ru = "Bedding, Infernal",
			-- tr = "Bedding, Infernal",
			-- uk = "Bedding, Infernal",
			-- ["zh-CN"] = "Bedding, Infernal",
			-- ["zh-TW"] = "Bedding, Infernal",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			en =
			"{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			fr =
			"{$Keywords.CosmeticSwap} : D'un rouge foncé et patiné, cette literie occupe une place particulière dans votre cœur.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Deep crimson and weathered, this bedding has a special place in your heart.",
		},
		FlavorText = {
			-- de =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- el =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			en =
			"When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- es =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			fr =
			"Allongée sous cette couverture, vous sentez le lien qui vous unit à votre frère, en des temps depuis longtemps révolus, se renforcer plus que jamais.",
			-- it =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- ja =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- ko =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- pl =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- ["pt-BR"] =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- ru =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- tr =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- uk =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- ["zh-CN"] =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
			-- ["zh-TW"] =
			-- "When lying under this blanket, you can feel the connection to your brother in a time long past grow stronger than ever.",
		},
		CosmeticsGroup = "Cosmetic_TentBlanket01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Chthonic",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566738 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\Blanket_Infernal_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 2,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Olympic",
		Name = {
			-- de = "Bedding, Olympic",
			-- el = "Bedding, Olympic",
			en = "Bedding, Olympic",
			-- es = "Bedding, Olympic",
			fr = "Couverture Olympienne",
			-- it = "Bedding, Olympic",
			-- ja = "Bedding, Olympic",
			-- ko = "Bedding, Olympic",
			-- pl = "Bedding, Olympic",
			-- ["pt-BR"] = "Bedding, Olympic",
			-- ru = "Bedding, Olympic",
			-- tr = "Bedding, Olympic",
			-- uk = "Bedding, Olympic",
			-- ["zh-CN"] = "Bedding, Olympic",
			-- ["zh-TW"] = "Bedding, Olympic",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			en =
			"{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			fr =
			"{$Keywords.CosmeticSwap} : Sobre et pourtant élégante, ornée de motifs discrets à l'effigie de votre famille éloignée.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Subdued and yet elegant, with subtle motifs of your extended family.",
		},
		FlavorText = {
			-- de =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- el =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			en =
			"Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- es =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			fr =
			"Même en temps de guerre, les dieux du mont Olympe savent trouver le moyen de se reposer et de reprendre des forces avec élégance.",
			-- it =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- ja =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- ko =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- pl =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- ["pt-BR"] =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- ru =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- tr =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- uk =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- ["zh-CN"] =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
			-- ["zh-TW"] =
			-- "Even in times of war, the Gods upon Mount Olympus can find ways to rest and gather their strength in style.",
		},
		CosmeticsGroup = "Cosmetic_TentBlanket01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Infernal",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566738 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\Blanket_Olympic_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Chariot",
		Name = {
			-- de = "Bedding, Racer",
			-- el = "Bedding, Racer",
			en = "Bedding, Racer",
			-- es = "Bedding, Racer",
			fr = "Couverture Char",
			-- it = "Bedding, Racer",
			-- ja = "Bedding, Racer",
			-- ko = "Bedding, Racer",
			-- pl = "Bedding, Racer",
			-- ["pt-BR"] = "Bedding, Racer",
			-- ru = "Bedding, Racer",
			-- tr = "Bedding, Racer",
			-- uk = "Bedding, Racer",
			-- ["zh-CN"] = "Bedding, Racer",
			-- ["zh-TW"] = "Bedding, Racer",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			en =
			"{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			fr =
			"{$Keywords.CosmeticSwap} : Robuste et véloce, largement inspirée d'un certain type d'ennemi.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Sturdy and swift, and heavily inspired by a particular type of foe.",
		},
		FlavorText = {
			-- de =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- el =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			en =
			"Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- es =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			fr =
			"La Maîtresse Hécate regrette amèrement le jour où elle a laissé la jeune Princesse se procurer cette pièce.",
			-- it =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- ja =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- ko =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- pl =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- ["pt-BR"] =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- ru =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- tr =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- uk =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- ["zh-CN"] =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
			-- ["zh-TW"] =
			-- "Headmistress Hecate deeply regrets the day she allowed the young Princess to procure this particular piece.",
		},
		CosmeticsGroup = "Cosmetic_TentBlanket01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TentBlanket_Olympic",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566738 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\Blanket_Chariot_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Blanket_Chariot",
		AnimationScale = 1.75,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 10,
			},
			-- Defeated 100 Chariots
			{
				Path = { "GameState", "EnemyKills" },
				SumOf = { "Chariot", "ChariotSuicide", "ChariotElite", "ChariotSuicideElite" },
				Comparison = ">=",
				Value = 100,
			},
			NamedRequirements = { "T5Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 666,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
			ModsNikkelMHadesBiomes_OreElysium = 5,
			ModsNikkelMHadesBiomes_CropElysium = 2,
		},
		PreRevealVoiceLines = {
			Queue = "Interrupt",
			{
				PreLineWait = 0.35,
				UsePlayerSource = true,
				{ Cue = "/VO/Melinoe_1401", Text = "Always wanted something like this in the tent..." },
			},
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0258", Text = "Guess it's OK...", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs, },
			},
		},
	},
	-- #endregion
	-- #region Shelving/Cosmetic_TentShelf01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentShelf_Brooding",
		Name = {
			-- de = "Shelving, Brooding",
			-- el = "Shelving, Brooding",
			en = "Shelving, Brooding",
			-- es = "Shelving, Brooding",
			fr = "Étagère Sombre",
			-- it = "Shelving, Brooding",
			-- ja = "Shelving, Brooding",
			-- ko = "Shelving, Brooding",
			-- pl = "Shelving, Brooding",
			-- ["pt-BR"] = "Shelving, Brooding",
			-- ru = "Shelving, Brooding",
			-- tr = "Shelving, Brooding",
			-- uk = "Shelving, Brooding",
			-- ["zh-CN"] = "Shelving, Brooding",
			-- ["zh-TW"] = "Shelving, Brooding",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			en =
			"{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			fr =
			"{$Keywords.CosmeticSwap} : Offrent un espace de rangement quasi infini, avec une touche de mélancolie.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Offers seemingly endless storage space with a moody touch.",
		},
		FlavorText = {
			-- de =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- el =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			en =
			"The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- es =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			fr =
			"L'avantage du choix limité, c'est qu'il permet de se concentrer sur l'essentiel. La Princesse des Enfers et son père font preuve du même pragmatisme à cet égard.",
			-- it =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- ja =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- ko =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- pl =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- ["pt-BR"] =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- ru =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- tr =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- uk =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- ["zh-CN"] =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
			-- ["zh-TW"] =
			-- "The benefit of limited choice is that one can focus on what truly matters. The Princess of the Underworld and her father are similarly pragmatic in this regard.",
		},
		CosmeticsGroup = "Cosmetic_TentShelf01",
		InsertAfterCosmetic = "Cosmetic_TentShelf01b",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566827 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\Shelf_Brooding_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Tent\\Shelf_Brooding",
		AnimationScale = 3.5,
		GameStateRequirements = {
			{
				-- Zagreus mentions Hades must have a storage cabinet full of capes to burn
				PathTrue = { "GameState", "TextLinesRecord", "LordHadesMiscEncounter05" },
			},
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_BossResourceStyx = 2,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_PlantElysium = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TentShelf_Royal",
		Name = {
			-- de = "Shelving, Royal",
			-- el = "Shelving, Royal",
			en = "Shelving, Royal",
			-- es = "Shelving, Royal",
			fr = "Étagère Royale",
			-- it = "Shelving, Royal",
			-- ja = "Shelving, Royal",
			-- ko = "Shelving, Royal",
			-- pl = "Shelving, Royal",
			-- ["pt-BR"] = "Shelving, Royal",
			-- ru = "Shelving, Royal",
			-- tr = "Shelving, Royal",
			-- uk = "Shelving, Royal",
			-- ["zh-CN"] = "Shelving, Royal",
			-- ["zh-TW"] = "Shelving, Royal",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			en =
			"{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			fr =
			"{$Keywords.CosmeticSwap} : Offrent un vaste espace de rangement, avec une touche intimidante.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Offers deep storage space with an intimidating touch.",
		},
		FlavorText = {
			-- de =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- el =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			en =
			"To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- es =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			fr =
			"Pour parfaire son art, il est primordial de se plonger dans la littérature. Les étagères de ce modèle se sont révélées idéales pour ranger les tomes qu'exige une telle quête.",
			-- it =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- ja =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- ko =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- pl =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- ["pt-BR"] =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- ru =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- tr =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- uk =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- ["zh-CN"] =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
			-- ["zh-TW"] =
			-- "To perfect one's craft, immersing oneself in literature is paramount. The shelves of this design have proven the optimal choice for storing the tomes required for such a pursuit.",
		},
		CosmeticsGroup = "Cosmetic_TentShelf01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TentShelf_Brooding",
		ShopCategory = "CosmeticsShop_Tent",
		SetAnimationIds = { 566827 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Tent\\Shelf_Royal_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 180,
			ModsNikkelMHadesBiomes_OreAsphodel = 5,
			ModsNikkelMHadesBiomes_CropTartarus = 2,
		},
	},
	-- #endregion
}
for _, cosmeticData in ipairs(tentCosmetics) do
	if cosmeticData.GameStateRequirements == nil then
		cosmeticData.GameStateRequirements = {}
	end
	table.insert(cosmeticData.GameStateRequirements, {
		PathTrue = { "GameState", "WorldUpgradesAdded", mod.UnlockCosmeticsIncantationName },
	})
	table.insert(mod.ModdedCosmeticIds, cosmeticData.Id)
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end
-- #endregion

-- #region CosmeticsShop_Main
local mainHubAreaCosmetics = {
	-- #region Banners/Cosmetic_HecateKey
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Infernal",
		Name = {
			-- de = "Banner, Infernal",
			-- el = "Banner, Infernal",
			en = "Banner, Infernal",
			-- es = "Banner, Infernal",
			fr = "Étendard Infernal",
			-- it = "Banner, Infernal",
			-- ja = "Banner, Infernal",
			-- ko = "Banner, Infernal",
			-- pl = "Banner, Infernal",
			-- ["pt-BR"] = "Banner, Infernal",
			-- ru = "Banner, Infernal",
			-- tr = "Banner, Infernal",
			-- uk = "Banner, Infernal",
			-- ["zh-CN"] = "Banner, Infernal",
			-- ["zh-TW"] = "Banner, Infernal",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			en =
			"{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un parchemin inspirant la crainte, dressé sur un étendard devant le grand {#BoldFormatGraftDark}Arbre de Vie{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- el =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			en =
			"Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- es =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			fr =
			"Rappelle étrangement le Pacte des Châtiments jadis proposé à votre frère, Zagreus, lorsqu'il cherchait à s'échapper des Enfers.",
			-- it =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- ja =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- ko =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- pl =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- ["pt-BR"] =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- ru =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- tr =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- uk =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- ["zh-CN"] =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
			-- ["zh-TW"] =
			-- "Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
		},
		CosmeticsGroup = "Cosmetic_HecateKey",
		InsertAfterCosmetic = "Cosmetic_HecateKey",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 780487 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Banner_Infernal_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 800,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Divine",
		Name = {
			-- de = "Banner, Divine",
			-- el = "Banner, Divine",
			en = "Banner, Divine",
			-- es = "Banner, Divine",
			fr = "Étendard Divin",
			-- it = "Banner, Divine",
			-- ja = "Banner, Divine",
			-- ko = "Banner, Divine",
			-- pl = "Banner, Divine",
			-- ["pt-BR"] = "Banner, Divine",
			-- ru = "Banner, Divine",
			-- tr = "Banner, Divine",
			-- uk = "Banner, Divine",
			-- ["zh-CN"] = "Banner, Divine",
			-- ["zh-TW"] = "Banner, Divine",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			en =
			"{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un présent des cieux, dressé sur un étendard devant le grand {#BoldFormatGraftDark}Arbre de Vie{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- el =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			en =
			"Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- es =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			fr =
			"Nombre des ombres ayant trouvé refuge à la Croisée ont été jugées indignes de l'accès à l'Élysée. Cette bannière est là pour leur redonner espoir.",
			-- it =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- ja =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- ko =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- pl =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- ["pt-BR"] =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- ru =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- tr =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- uk =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- ["zh-CN"] =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
			-- ["zh-TW"] =
			-- "Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
		},
		CosmeticsGroup = "Cosmetic_HecateKey",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Infernal",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 780487 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Banner_Divine_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 800,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Resistance",
		Name = {
			-- de = "Banner, Resistance",
			-- el = "Banner, Resistance",
			en = "Banner, Resistance",
			-- es = "Banner, Resistance",
			fr = "Étendard de la Résistance",
			-- it = "Banner, Resistance",
			-- ja = "Banner, Resistance",
			-- ko = "Banner, Resistance",
			-- pl = "Banner, Resistance",
			-- ["pt-BR"] = "Banner, Resistance",
			-- ru = "Banner, Resistance",
			-- tr = "Banner, Resistance",
			-- uk = "Banner, Resistance",
			-- ["zh-CN"] = "Banner, Resistance",
			-- ["zh-TW"] = "Banner, Resistance",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			en =
			"{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Une démonstration de force et de détermination, dressée sur un étendard devant le grand {#BoldFormatGraftDark}Arbre de Vie{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: A show of strength and determination, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- el =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			en =
			"To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- es =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			fr =
			"Pour savoir ce que l'on a à gagner, il faut savoir ce que l'on a perdu. La Princesse des Enfers ne le sait que trop bien.",
			-- it =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- ja =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- ko =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- pl =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- ["pt-BR"] =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- ru =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- tr =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- uk =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- ["zh-CN"] =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
			-- ["zh-TW"] =
			-- "To know what one has to gain, one must know what has been lost. The Princess of the Underworld understands this all too well.",
		},
		CosmeticsGroup = "Cosmetic_HecateKey",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Divine",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 780487 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Banner_Resistance_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Banner_Resistance",
		AnimationScale = 3.57,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "Cosmetic_HecateKey" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 3,
			},
			{
				Path = { "GameState", "ClearedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			NamedRequirements = { "T5Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 950,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
			ModsNikkelMHadesBiomes_CropStyx = 2,
			ModsNikkelMHadesBiomes_BossResourceStyx = 2,
		},
	},
	-- #endregion
	-- #region Pillars/Cosmetic_CauldronPillars01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Divine",
		Name = {
			-- de = "Pillars, Divine",
			-- el = "Pillars, Divine",
			en = "Pillars, Divine",
			-- es = "Pillars, Divine",
			fr = "Piliers Divins",
			-- it = "Pillars, Divine",
			-- ja = "Pillars, Divine",
			-- ko = "Pillars, Divine",
			-- pl = "Pillars, Divine",
			-- ["pt-BR"] = "Pillars, Divine",
			-- ru = "Pillars, Divine",
			-- tr = "Pillars, Divine",
			-- uk = "Pillars, Divine",
			-- ["zh-CN"] = "Pillars, Divine",
			-- ["zh-TW"] = "Pillars, Divine",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : Des monolithes impressionnants qui se dressent de part et d'autre du {#BoldFormatGraftDark}Chaudron{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- el =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			en =
			"So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- es =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			fr =
			"Les splendeurs de l'Élysée sont si nombreuses qu'il était inévitable qu'un peu de sa grandeur finisse par gagner la Croisée.",
			-- it =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- ja =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- ko =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- pl =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- ["pt-BR"] =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- ru =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- tr =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- uk =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- ["zh-CN"] =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
			-- ["zh-TW"] =
			-- "So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = "Cosmetic_CauldronPillars01c",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Pillars_Divine_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Divine",
		AnimationScale = 1.9,
		GameStateRequirements = {
			-- Met Patroclus
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_Story01" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_CropElysium = 1,
			ModsNikkelMHadesBiomes_OreElysium = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Gilded",
		Name = {
			-- de = "Pillars, Gilded",
			-- el = "Pillars, Gilded",
			en = "Pillars, Gilded",
			-- es = "Pillars, Gilded",
			fr = "Piliers Dorés",
			-- it = "Pillars, Gilded",
			-- ja = "Pillars, Gilded",
			-- ko = "Pillars, Gilded",
			-- pl = "Pillars, Gilded",
			-- ["pt-BR"] = "Pillars, Gilded",
			-- ru = "Pillars, Gilded",
			-- tr = "Pillars, Gilded",
			-- uk = "Pillars, Gilded",
			-- ["zh-CN"] = "Pillars, Gilded",
			-- ["zh-TW"] = "Pillars, Gilded",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : D'anciens monolithes qui se dressent de part et d'autre du {#BoldFormatGraftDark}Chaudron{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- el =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			en =
			"Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- es =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			fr =
			"Des piliers de ce genre soutiennent les grandes salles du Temple du Styx, hors de portée des mortels, dissimulées sous la surface.",
			-- it =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- ja =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- ko =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- pl =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- ["pt-BR"] =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- ru =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- tr =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- uk =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- ["zh-CN"] =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
			-- ["zh-TW"] =
			-- "Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Divine",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Pillars_Gilded_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Gilded",
		AnimationScale = 1.9,
		GameStateRequirements = {
			-- Entered Styx Hub
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Hub" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_PlantElysium = 1,
			ModsNikkelMHadesBiomes_OreStyx = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Serpentine",
		Name = {
			-- de = "Pillars, Serpentine",
			-- el = "Pillars, Serpentine",
			en = "Pillars, Serpentine",
			-- es = "Pillars, Serpentine",
			fr = "Piliers Serpentins",
			-- it = "Pillars, Serpentine",
			-- ja = "Pillars, Serpentine",
			-- ko = "Pillars, Serpentine",
			-- pl = "Pillars, Serpentine",
			-- ["pt-BR"] = "Pillars, Serpentine",
			-- ru = "Pillars, Serpentine",
			-- tr = "Pillars, Serpentine",
			-- uk = "Pillars, Serpentine",
			-- ["zh-CN"] = "Pillars, Serpentine",
			-- ["zh-TW"] = "Pillars, Serpentine",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : Des monolithes oppressants qui se dressent de part et d'autre du {#BoldFormatGraftDark}Chaudron{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Constraining monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- el =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			en =
			"Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- es =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			fr =
			"Vos familiers auront peut-être besoin d'être convaincus pour approcher ces piliers, mais ceux-ci vous rappellent votre foyer, d'une certaine manière.",
			-- it =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- ja =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- ko =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- pl =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- ["pt-BR"] =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- ru =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- tr =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- uk =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- ["zh-CN"] =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
			-- ["zh-TW"] =
			-- "Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Gilded",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Pillars_Serpentine_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Serpentine",
		AnimationScale = 1.9,
		GameStateRequirements = {
			-- Immediately available after the incantation
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_CropTartarus = 1,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Deathly",
		Name = {
			-- de = "Pillars, Deathly",
			-- el = "Pillars, Deathly",
			en = "Pillars, Deathly",
			-- es = "Pillars, Deathly",
			fr = "Piliers Mortuaires",
			-- it = "Pillars, Deathly",
			-- ja = "Pillars, Deathly",
			-- ko = "Pillars, Deathly",
			-- pl = "Pillars, Deathly",
			-- ["pt-BR"] = "Pillars, Deathly",
			-- ru = "Pillars, Deathly",
			-- tr = "Pillars, Deathly",
			-- uk = "Pillars, Deathly",
			-- ["zh-CN"] = "Pillars, Deathly",
			-- ["zh-TW"] = "Pillars, Deathly",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : Des monolithes improvisés qui se dressent de part et d'autre du {#BoldFormatGraftDark}Chaudron{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Improvised monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- el =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			en =
			"There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- es =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			fr =
			"Rien ne se perd aux Enfers, et même les matériaux les plus macabres peuvent être transformés en quelque chose d'utile, voire de beau.",
			-- it =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- ja =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- ko =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- pl =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- ["pt-BR"] =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- ru =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- tr =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- uk =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- ["zh-CN"] =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
			-- ["zh-TW"] =
			-- "There is no waste in the Underworld, and so even the most macabre of materials can be repurposed into something functional, and perhaps even beautiful.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Serpentine",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Pillars_Deathly_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Deathly",
		AnimationScale = 1.85,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Intro" },
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_OreElysium = 3,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 1,
			ModsNikkelMHadesBiomes_PlantTartarus = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Infinite",
		Name = {
			-- de = "Pillars, Infinite",
			-- el = "Pillars, Infinite",
			en = "Pillars, Infinite",
			-- es = "Pillars, Infinite",
			fr = "Piliers Infinis",
			-- it = "Pillars, Infinite",
			-- ja = "Pillars, Infinite",
			-- ko = "Pillars, Infinite",
			-- pl = "Pillars, Infinite",
			-- ["pt-BR"] = "Pillars, Infinite",
			-- ru = "Pillars, Infinite",
			-- tr = "Pillars, Infinite",
			-- uk = "Pillars, Infinite",
			-- ["zh-CN"] = "Pillars, Infinite",
			-- ["zh-TW"] = "Pillars, Infinite",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : D'impossibles monolithes qui se dressent de part et d'autre du {#BoldFormatGraftDark}Chaudron{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Impossible monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- el =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			en =
			"Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- es =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			fr =
			"Chaos agit à sa guise et, bien qu'il soit par essence le contraire de toute structure, ces piliers aux motifs sans fin semblent incarner les deux notions à la fois.",
			-- it =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- ja =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- ko =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- pl =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- ["pt-BR"] =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- ru =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- tr =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- uk =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- ["zh-CN"] =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
			-- ["zh-TW"] =
			-- "Chaos does as they please, and though they are in their essence the opposite of structure, these pillars with their endless patterns seem to embody both concepts at once.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Deathly",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Pillars_Infinite_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Pillars_Infinite",
		AnimationScale = 1.85,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 5,
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 700,
			ModsNikkelMHadesBiomes_OreAsphodel = 5,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
			ModsNikkelMHadesBiomes_PlantStyx = 4,
		},
	},
	-- #endregion
	-- #region Rugs/Cosmetic_OdysseusRug
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Rug_Ancient",
		Name = {
			-- de = "Rug, Ancient",
			-- el = "Rug, Ancient",
			en = "Rug, Ancient",
			-- es = "Rug, Ancient",
			fr = "Tapis Antique",
			-- it = "Rug, Ancient",
			-- ja = "Rug, Ancient",
			-- ko = "Rug, Ancient",
			-- pl = "Rug, Ancient",
			-- ["pt-BR"] = "Rug, Ancient",
			-- ru = "Rug, Ancient",
			-- tr = "Rug, Ancient",
			-- uk = "Rug, Ancient",
			-- ["zh-CN"] = "Rug, Ancient",
			-- ["zh-TW"] = "Rug, Ancient",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			en =
			"{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Une pièce usée par le temps, près de l'endroit où {$Keywords.CharOdysseus} se tient habituellement.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
		},
		FlavorText = {
			-- de =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- el =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			en =
			"This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- es =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			fr =
			"Ce tapis chargé d'histoire aurait jadis appartenu à Sisyphe, fondateur et roi de la cité d'Éphyre, depuis tombée en ruine par la main du Titan du Temps.",
			-- it =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- ja =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- ko =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- pl =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- ["pt-BR"] =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- ru =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- tr =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- uk =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- ["zh-CN"] =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
			-- ["zh-TW"] =
			-- "This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
		},
		CosmeticsGroup = "Cosmetic_OdysseusRug",
		InsertAfterCosmetic = "Cosmetic_OdysseusRug",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 591259 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Rug_Ancient_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Rug_Ancient",
		AnimationScale = 2.35,
		GameStateRequirements = {
			-- Immediately available after the incantation
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_PlantAsphodel = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Rug_Heroic",
		Name = {
			-- de = "Rug, Heroic",
			-- el = "Rug, Heroic",
			en = "Rug, Heroic",
			-- es = "Rug, Heroic",
			fr = "Tapis Héroïque",
			-- it = "Rug, Heroic",
			-- ja = "Rug, Heroic",
			-- ko = "Rug, Heroic",
			-- pl = "Rug, Heroic",
			-- ["pt-BR"] = "Rug, Heroic",
			-- ru = "Rug, Heroic",
			-- tr = "Rug, Heroic",
			-- uk = "Rug, Heroic",
			-- ["zh-CN"] = "Rug, Heroic",
			-- ["zh-TW"] = "Rug, Heroic",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			en =
			"{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Une pièce témoin de bien des exploits, près de l'endroit où {$Keywords.CharOdysseus} se tient habituellement.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
		},
		FlavorText = {
			-- de =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- el =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			en =
			"This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- es =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			fr =
			"Ce tapis dégage une aura de bravoure et de force, et ne permet qu'aux ombres les plus dignes de le fouler.",
			-- it =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- ja =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- ko =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- pl =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- ["pt-BR"] =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- ru =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- tr =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- uk =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- ["zh-CN"] =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
			-- ["zh-TW"] =
			-- "This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
		},
		CosmeticsGroup = "Cosmetic_OdysseusRug",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Rug_Ancient",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 591259 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Rug_Heroic_Icon",
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
		AlwaysRevealImmediately = true,
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
			-- de = "War Table, Heroic",
			-- el = "War Table, Heroic",
			en = "War Table, Heroic",
			-- es = "War Table, Heroic",
			fr = "Table de guerre Héroïque",
			-- it = "War Table, Heroic",
			-- ja = "War Table, Heroic",
			-- ko = "War Table, Heroic",
			-- pl = "War Table, Heroic",
			-- ["pt-BR"] = "War Table, Heroic",
			-- ru = "War Table, Heroic",
			-- tr = "War Table, Heroic",
			-- uk = "War Table, Heroic",
			-- ["zh-CN"] = "War Table, Heroic",
			-- ["zh-TW"] = "War Table, Heroic",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			en =
			"{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			fr =
			"{$Keywords.CosmeticSwap} : Pour inspirer les actes héroïques, près de l'endroit où {$Keywords.CharOdysseus} se tient habituellement.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
		},
		FlavorText = {
			-- de =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- el =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			en =
			"Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- es =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			fr =
			"Ulysse n'est pas étranger à la logistique de la guerre, et connaît bien la valeur d'une table solide sur laquelle planifier ses campagnes.",
			-- it =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- ja =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- ko =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- pl =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- ["pt-BR"] =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- ru =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- tr =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- uk =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- ["zh-CN"] =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
			-- ["zh-TW"] =
			-- "Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
		},
		CosmeticsGroup = "Cosmetic_OdysseusTable01",
		InsertAfterCosmetic = "Cosmetic_OdysseusTable01",
		ShopCategory = "CosmeticsShop_Main",
		SetAnimationIds = { 561464 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\War_Table_Heroic_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 700,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
		},
	},
	-- #endregion
	-- #region Lanterns/CosmeticIcon_MainLanterns01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Lantern_Infernal",
		Name = {
			-- de = "Lanterns, Infernal",
			-- el = "Lanterns, Infernal",
			en = "Lanterns, Infernal",
			-- es = "Lanterns, Infernal",
			fr = "Lanternes Infernales",
			-- it = "Lanterns, Infernal",
			-- ja = "Lanterns, Infernal",
			-- ko = "Lanterns, Infernal",
			-- pl = "Lanterns, Infernal",
			-- ["pt-BR"] = "Lanterns, Infernal",
			-- ru = "Lanterns, Infernal",
			-- tr = "Lanterns, Infernal",
			-- uk = "Lanterns, Infernal",
			-- ["zh-CN"] = "Lanterns, Infernal",
			-- ["zh-TW"] = "Lanterns, Infernal",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			en =
			"{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			fr =
			"{$Keywords.CosmeticSwap} : Des ombres en cage éclairent la Croisée d'une lumière née au Tartare.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Caged shades illuminate the Crossroads with a light born in Tartarus.",
		},
		FlavorText = {
			-- de =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- el =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			en =
			"Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- es =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			fr =
			"Certains crânes sont si vides qu'ils croient pouvoir s'échapper du Tartare. On ignore comment ceux-ci ont atterri à la Croisée.",
			-- it =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- ja =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- ko =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- pl =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- ["pt-BR"] =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- ru =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- tr =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- uk =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- ["zh-CN"] =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
			-- ["zh-TW"] =
			-- "Some skulls are so numb that they believe they can escape from Tartarus. It is unclear how these ones ended up in the Crossroads.",
		},
		CosmeticsGroup = "Cosmetic_MainLanterns01",
		InsertAfterCosmetic = "Cosmetic_MainLanterns01b",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 561185,
		SetAnimationIds = { 576309, 585190, 561185, 561184, 588785, 742460, 742260, 742474, 742472 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Lantern_Infernal_Icon",
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
		AlwaysRevealImmediately = true,
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
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Lantern_Gilded",
		Name = {
			-- de = "Lanterns, Gilded",
			-- el = "Lanterns, Gilded",
			en = "Lanterns, Gilded",
			-- es = "Lanterns, Gilded",
			fr = "Lanternes Dorées",
			-- it = "Lanterns, Gilded",
			-- ja = "Lanterns, Gilded",
			-- ko = "Lanterns, Gilded",
			-- pl = "Lanterns, Gilded",
			-- ["pt-BR"] = "Lanterns, Gilded",
			-- ru = "Lanterns, Gilded",
			-- tr = "Lanterns, Gilded",
			-- uk = "Lanterns, Gilded",
			-- ["zh-CN"] = "Lanterns, Gilded",
			-- ["zh-TW"] = "Lanterns, Gilded",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			en =
			"{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			fr =
			"{$Keywords.CosmeticSwap} : De fins tubes de verre éclairent la Croisée d'une lumière violacée et pulsante.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Slim glass tubes illuminate the Crossroads with a pulsing, purplish light.",
		},
		FlavorText = {
			-- de =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- el =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			en =
			"Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- es =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			fr =
			"Si les Enfers ne sont pas aussi dépourvus de lumière qu'on pourrait le croire, ces lanternes semblent exploiter une clarté sans pareille.",
			-- it =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- ja =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- ko =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- pl =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- ["pt-BR"] =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- ru =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- tr =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- uk =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- ["zh-CN"] =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
			-- ["zh-TW"] =
			-- "Though the Underworld is not as devoid of light as one might think, these lanterns seem to harness a light unlike any other.",
		},
		CosmeticsGroup = "Cosmetic_MainLanterns01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Lantern_Infernal",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 561185,
		SetAnimationIds = { 576309, 585190, 561185, 561184, 588785, 742460, 742260, 742474, 742472 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Lantern_Gilded_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Lantern_Gilded",
		AnimationScale = 1.2,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 3,
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 350,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 1,
			ModsNikkelMHadesBiomes_CropTartarus = 2,
		},
	},
	-- #endregion
	-- #region Cauldron/Cosmetic_Cauldron01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Cauldron_Infernal",
		Name = {
			-- de = "Cauldron, Infernal",
			-- el = "Cauldron, Infernal",
			en = "Cauldron, Infernal",
			-- es = "Cauldron, Infernal",
			fr = "Chaudron Infernal",
			-- it = "Cauldron, Infernal",
			-- ja = "Cauldron, Infernal",
			-- ko = "Cauldron, Infernal",
			-- pl = "Cauldron, Infernal",
			-- ["pt-BR"] = "Cauldron, Infernal",
			-- ru = "Cauldron, Infernal",
			-- tr = "Cauldron, Infernal",
			-- uk = "Cauldron, Infernal",
			-- ["zh-CN"] = "Cauldron, Infernal",
			-- ["zh-TW"] = "Cauldron, Infernal",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			en =
			"{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			fr =
			"{$Keywords.CosmeticSwap} : Forgé dans la chaleur brûlante de l'Asphodèle et orné de motifs mortuaires.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Forged within the searing heat of Asphodel, and adorned with deathly motifs.",
		},
		FlavorText = {
			-- de =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- el =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			en =
			"Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- es =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			fr =
			"Certaines incantations seraient plus puissantes lorsqu'elles sont prononcées en présence de métaux venus des plus profonds abîmes des Enfers.",
			-- it =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- ja =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- ko =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- pl =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- ["pt-BR"] =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- ru =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- tr =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- uk =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- ["zh-CN"] =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
			-- ["zh-TW"] =
			-- "Some incantations are said to be most powerful when uttered in the presence of metals originating from the deepest pits of the underworld.",
		},
		CosmeticsGroup = "Cosmetic_Cauldron01",
		InsertAfterCosmetic = "Cosmetic_Cauldron01b",
		ShopCategory = "CosmeticsShop_Main",
		SetAnimationIds = { 558175 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Cauldron_Infernal_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Cauldron_Infernal",
		AnimationScale = 2,
		AnimationOffsetY = -25,
		IsCauldron = true,
		CauldronLidAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\Cauldron_Infernal_Lid",
		-- For the bubbling water animation
		AnimationInheritFrom = "CriticalItemWorldObject01",
		GameStateRequirements = {
			-- Immediately available after the incantation
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 2200,
			ModsNikkelMHadesBiomes_OreAsphodel = 9,
			ModsNikkelMHadesBiomes_OreStyx = 6,
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
			-- de = "Cauldron, Infinite",
			-- el = "Cauldron, Infinite",
			en = "Cauldron, Infinite",
			-- es = "Cauldron, Infinite",
			fr = "Chaudron Infini",
			-- it = "Cauldron, Infinite",
			-- ja = "Cauldron, Infinite",
			-- ko = "Cauldron, Infinite",
			-- pl = "Cauldron, Infinite",
			-- ["pt-BR"] = "Cauldron, Infinite",
			-- ru = "Cauldron, Infinite",
			-- tr = "Cauldron, Infinite",
			-- uk = "Cauldron, Infinite",
			-- ["zh-CN"] = "Cauldron, Infinite",
			-- ["zh-TW"] = "Cauldron, Infinite",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			en =
			"{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			fr =
			"{$Keywords.CosmeticSwap} : Forgé par des puissances inconnues dans le vide profond de Chaos lui-même.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Forged by unknown powers in the deep void of Chaos itself.",
		},
		FlavorText = {
			-- de =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- el =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			en =
			"Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- es =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			fr =
			"Tout est né de Chaos, et tout y retournera. Ce chaudron incarnerait ce principe même.",
			-- it =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- ja =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- ko =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- pl =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- ["pt-BR"] =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- ru =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- tr =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- uk =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- ["zh-CN"] =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
			-- ["zh-TW"] =
			-- "Everything was born from Chaos, and to it everything shall return. This cauldron is said to embody that very principle.",
		},
		CosmeticsGroup = "Cosmetic_Cauldron01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Cauldron_Infernal",
		ShopCategory = "CosmeticsShop_Main",
		SetAnimationIds = { 558175 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\Cauldron_Infinite_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 2200,
			ModsNikkelMHadesBiomes_CropTartarus = 4,
			ModsNikkelMHadesBiomes_OreAsphodel = 5,
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
	-- #region Hypnos pillarets/Cosmetic_HypnosPedestal01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_HypnosPedestal_Coned",
		Name = {
			-- de = "Pillarets, Coned",
			-- el = "Pillarets, Coned",
			en = "Pillarets, Coned",
			-- es = "Pillarets, Coned",
			fr = "Petits Piliers Coniques",
			-- it = "Pillarets, Coned",
			-- ja = "Pillarets, Coned",
			-- ko = "Pillarets, Coned",
			-- pl = "Pillarets, Coned",
			-- ["pt-BR"] = "Pillarets, Coned",
			-- ru = "Pillarets, Coned",
			-- tr = "Pillarets, Coned",
			-- uk = "Pillarets, Coned",
			-- ["zh-CN"] = "Pillarets, Coned",
			-- ["zh-TW"] = "Pillarets, Coned",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			en =
			"{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			fr =
			"{$Keywords.CosmeticSwap} : De nombreuses colonnes imitant la nature encerclent l'endroit où {$Keywords.CharHypnos} se tient habituellement.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Numerous nature-imitating columns encircling where {$Keywords.CharHypnos} typically resides.",
		},
		FlavorText = {
			-- de =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- el =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			en =
			"Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- es =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			fr =
			"Les mortels associent souvent les arbres au sommeil et aux rêves, il est donc tout indiqué qu'un de leurs symboles monte la garde ici.",
			-- it =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- ja =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- ko =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- pl =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- ["pt-BR"] =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- ru =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- tr =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- uk =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- ["zh-CN"] =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
			-- ["zh-TW"] =
			-- "Trees are often associated with sleepiness and dreams by mortals, so it is only befitting that a symbol of theirs should stand watch here.",
		},
		CosmeticsGroup = "Cosmetic_HypnosPedestal01",
		InsertAfterCosmetic = "Cosmetic_HypnosPedestal01b",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 800742,
		SetAnimationIds = { 590946, 590943, 590944, 590945, 590218, 590219, 590954, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\HubMain\\HypnosPedestal_Coned_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\HubMain\\HypnosPedestal_Coned",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "HypnosGift01" }
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 400,
			ModsNikkelMHadesBiomes_OreStyx = 2,
		},
	},
	--#endregion
}
for _, cosmeticData in ipairs(mainHubAreaCosmetics) do
	if cosmeticData.GameStateRequirements == nil then
		cosmeticData.GameStateRequirements = {}
	end
	table.insert(cosmeticData.GameStateRequirements, {
		PathTrue = { "GameState", "WorldUpgradesAdded", mod.UnlockCosmeticsIncantationName },
	})
	table.insert(mod.ModdedCosmeticIds, cosmeticData.Id)
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end
-- #endregion

-- #region CosmeticsShop_Taverna
local tavernaCosmetics = {
	-- #region Benches/Cosmetic_TavernaChairs01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaChairs_Infernal",
		Name = {
			-- de = "Benches, Infernal",
			-- el = "Benches, Infernal",
			en = "Benches, Infernal",
			-- es = "Benches, Infernal",
			fr = "Banc Infernal",
			-- it = "Benches, Infernal",
			-- ja = "Benches, Infernal",
			-- ko = "Benches, Infernal",
			-- pl = "Benches, Infernal",
			-- ["pt-BR"] = "Benches, Infernal",
			-- ru = "Benches, Infernal",
			-- tr = "Benches, Infernal",
			-- uk = "Benches, Infernal",
			-- ["zh-CN"] = "Benches, Infernal",
			-- ["zh-TW"] = "Benches, Infernal",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : Des sièges légèrement rembourrés, pour tous ceux de la {#BoldFormatGraftDark}Taverne{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Lightly cushioned seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- el =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			en =
			"Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- es =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			fr =
			"Bien que les ombres résidant à la Croisée n'aient plus besoin de s'asseoir, certaines aiment se remémorer l'ancienne Maison d'Hadès en se détendant sur ces bancs.",
			-- it =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- ja =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- ko =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- pl =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- ["pt-BR"] =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- ru =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- tr =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- uk =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- ["zh-CN"] =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
			-- ["zh-TW"] =
			-- "Though the shades residing in the Crossroads don't need to sit anymore, some of them enjoy reminiscing of the old House of Hades when relaxing on these benches.",
		},
		CosmeticsGroup = "Cosmetic_TavernaChairs01",
		InsertAfterCosmetic = "Cosmetic_TavernaChairs01c",
		ShopCategory = "CosmeticsShop_Taverna",
		SetAnimationIds = { 566374, 566377, 585764, 585753, 585756, 585760, 585763, 585759, 742136, 742137, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\TavernaChairs_Infernal_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 270,
			ModsNikkelMHadesBiomes_OreTartarus = 5,
			ModsNikkelMHadesBiomes_CropAsphodel = 2,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaChairs_Springtime",
		Name = {
			-- de = "Benches, Springtime",
			-- el = "Benches, Springtime",
			en = "Benches, Springtime",
			-- es = "Benches, Springtime",
			fr = "Banc Printanier",
			-- it = "Benches, Springtime",
			-- ja = "Benches, Springtime",
			-- ko = "Benches, Springtime",
			-- pl = "Benches, Springtime",
			-- ["pt-BR"] = "Benches, Springtime",
			-- ru = "Benches, Springtime",
			-- tr = "Benches, Springtime",
			-- uk = "Benches, Springtime",
			-- ["zh-CN"] = "Benches, Springtime",
			-- ["zh-TW"] = "Benches, Springtime",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : Des sièges individuels soigneusement disposés, pour tous ceux de la {#BoldFormatGraftDark}Taverne{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Neatly arranged individual seating, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- el =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			en =
			"Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- es =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			fr =
			"Si les Enfers ne connaissent pas les saisons comme la Surface, la Croisée se trouve dans un entre-deux qui permet à ses habitants de profiter des senteurs fraîches qu'elles apportent.",
			-- it =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- ja =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- ko =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- pl =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- ["pt-BR"] =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- ru =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- tr =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- uk =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- ["zh-CN"] =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
			-- ["zh-TW"] =
			-- "Whilst the Underworld does not experience seasons as does the Surface, the Crossroads is in an inbetween state that allows those residing within them to enjoy the fresh smells it brings.",
		},
		CosmeticsGroup = "Cosmetic_TavernaChairs01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TavernaChairs_Infernal",
		ShopCategory = "CosmeticsShop_Taverna",
		SetAnimationIds = { 566374, 566377, 585764, 585753, 585756, 585760, 585763, 585759, 742136, 742137, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\TavernaChairs_Springtime_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
			ModsNikkelMHadesBiomes_PlantStyx = 2,
			ModsNikkelMHadesBiomes_CropStyx = 1,
		},
	},
	-- #endregion
	-- #region Tables/Cosmetic_TavernaTables01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaTables_Infernal",
		Name = {
			-- de = "Tables, Infernal",
			-- el = "Tables, Infernal",
			en = "Tables, Infernal",
			-- es = "Tables, Infernal",
			fr = "Tables Infernales",
			-- it = "Tables, Infernal",
			-- ja = "Tables, Infernal",
			-- ko = "Tables, Infernal",
			-- pl = "Tables, Infernal",
			-- ["pt-BR"] = "Tables, Infernal",
			-- ru = "Tables, Infernal",
			-- tr = "Tables, Infernal",
			-- uk = "Tables, Infernal",
			-- ["zh-CN"] = "Tables, Infernal",
			-- ["zh-TW"] = "Tables, Infernal",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : Taillées dans le marbre le plus pur et ornées de motifs mortuaires, pour tous ceux de la {#BoldFormatGraftDark}Taverne{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Hewn from purest marble and adorned with deathly motifs, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- el =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			en =
			"There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- es =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			fr =
			"La pierre, sous toutes ses formes, ne manque pas aux Enfers, et il n'est guère surprenant que le mobilier de la Maison d'Hadès ait été fait des plus belles matières.",
			-- it =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- ja =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- ko =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- pl =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- ["pt-BR"] =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- ru =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- tr =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- uk =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- ["zh-CN"] =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
			-- ["zh-TW"] =
			-- "There is no shortage of stone of any kind in the Underworld, and it is no surprise that furnishings from the House of Hades were made of the finest such materials.",
		},
		CosmeticsGroup = "Cosmetic_TavernaTables01",
		InsertAfterCosmetic = "Cosmetic_TavernaTables01c",
		ShopCategory = "CosmeticsShop_Taverna",
		SetAnimationIds = { 585757, 585754, 585761, 566359, 742135, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\TavernaTables_Infernal_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 750,
			ModsNikkelMHadesBiomes_OreAsphodel = 5,
			ModsNikkelMHadesBiomes_OreTartarus = 5,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaTables_Springtime",
		Name = {
			-- de = "Tables, Springtime",
			-- el = "Tables, Springtime",
			en = "Tables, Springtime",
			-- es = "Tables, Springtime",
			fr = "Tables Printanières",
			-- it = "Tables, Springtime",
			-- ja = "Tables, Springtime",
			-- ko = "Tables, Springtime",
			-- pl = "Tables, Springtime",
			-- ["pt-BR"] = "Tables, Springtime",
			-- ru = "Tables, Springtime",
			-- tr = "Tables, Springtime",
			-- uk = "Tables, Springtime",
			-- ["zh-CN"] = "Tables, Springtime",
			-- ["zh-TW"] = "Tables, Springtime",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : Décorées de motifs de fruits et de fleurs, pour tous ceux de la {#BoldFormatGraftDark}Taverne{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Decorated with imagery of fruits and flowers, for all in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- el =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			en =
			"In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- es =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			fr =
			"Dans l'atmosphère lugubre de la Croisée et de la tâche de la Princesse des Enfers, ces tables apportent une touche de clarté et de vie à ceux qui s'y rassemblent.",
			-- it =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- ja =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- ko =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- pl =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- ["pt-BR"] =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- ru =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- tr =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- uk =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- ["zh-CN"] =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
			-- ["zh-TW"] =
			-- "In the gloom atmosphere of the Crossroads and the Princess of the Underworld's task, these tables bring a touch of brightness and life to those who gather around them.",
		},
		CosmeticsGroup = "Cosmetic_TavernaTables01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TavernaTables_Infernal",
		ShopCategory = "CosmeticsShop_Taverna",
		SetAnimationIds = { 585757, 585754, 585761, 566359, 742135, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\TavernaTables_Springtime_Icon",
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
		AlwaysRevealImmediately = true,
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
			-- de = "Cooking-Pot, Royal",
			-- el = "Cooking-Pot, Royal",
			en = "Cooking-Pot, Royal",
			-- es = "Cooking-Pot, Royal",
			fr = "Marmite Royale",
			-- it = "Cooking-Pot, Royal",
			-- ja = "Cooking-Pot, Royal",
			-- ko = "Cooking-Pot, Royal",
			-- pl = "Cooking-Pot, Royal",
			-- ["pt-BR"] = "Cooking-Pot, Royal",
			-- ru = "Cooking-Pot, Royal",
			-- tr = "Cooking-Pot, Royal",
			-- uk = "Cooking-Pot, Royal",
			-- ["zh-CN"] = "Cooking-Pot, Royal",
			-- ["zh-TW"] = "Cooking-Pot, Royal",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : Un récipient conducteur de chaleur de belle facture, au centre de la {#BoldFormatGraftDark}Taverne{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Well-crafted heat-conducting receptacle, in the middle of the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- el =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			en =
			"It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- es =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			fr =
			"On raconte que cette marmite trônait jadis dans le salon de la Maison d'Hadès, où le chef cuisinier préparait les repas du seigneur Hadès, de sa famille et de ses invités.",
			-- it =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- ja =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- ko =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- pl =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- ["pt-BR"] =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- ru =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- tr =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- uk =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- ["zh-CN"] =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
			-- ["zh-TW"] =
			-- "It is said this pot once stood in the lounge of the House of Hades, used by it's head Chef to cook meals for Lord Hades and his family and guests.",
		},
		CosmeticsGroup = "Cosmetic_TavernaCauldron01",
		InsertAfterCosmetic = "Cosmetic_TavernaCauldron02",
		ShopCategory = "CosmeticsShop_Taverna",
		SetAnimationIds = { 586614 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\TavernaCauldron_Royal_Icon",
		IconOffsetX = -10,
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
		AlwaysRevealImmediately = true,
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
			-- de = "Mosaic, Furious",
			-- el = "Mosaic, Furious",
			en = "Mosaic, Furious",
			-- es = "Mosaic, Furious",
			fr = "Mosaïque Furieuse",
			-- it = "Mosaic, Furious",
			-- ja = "Mosaic, Furious",
			-- ko = "Mosaic, Furious",
			-- pl = "Mosaic, Furious",
			-- ["pt-BR"] = "Mosaic, Furious",
			-- ru = "Mosaic, Furious",
			-- tr = "Mosaic, Furious",
			-- uk = "Mosaic, Furious",
			-- ["zh-CN"] = "Mosaic, Furious",
			-- ["zh-TW"] = "Mosaic, Furious",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : De simples pierres naturelles serties d'incrustations de verre coloré composent ce sol central de la {#BoldFormatGraftDark}Taverne{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Simple natural stones with coloured glass inlays form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- el =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			en =
			"The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- es =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			fr =
			"Les trois Furies, Mégère, Alecto et Tisiphone, n'ont que faire des décors fastueux, mais savent apprécier le savoir-faire déployé dans cette mosaïque.",
			-- it =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- ja =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- ko =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- pl =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- ["pt-BR"] =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- ru =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- tr =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- uk =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- ["zh-CN"] =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
			-- ["zh-TW"] =
			-- "The three furies Megaera, Alecto and Tisiphone do not care for lavish designs and decorations, but can appreciate the craftsmanship that went into this mosaic.",
		},
		CosmeticsGroup = "Cosmetic_TavernaStarMosaic",
		InsertAfterCosmetic = "Cosmetic_TavernaStarMosaic",
		ShopCategory = "CosmeticsShop_Taverna",
		ActivateIds = { 738509 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\TavernaStarMosaic_Furious_Icon",
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
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 1000,
			ModsNikkelMHadesBiomes_PlantTartarus = 3,
			ModsNikkelMHadesBiomes_CropTartarus = 2,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaStarMosaic_Gilded",
		Name = {
			-- de = "Mosaic, Gilded",
			-- el = "Mosaic, Gilded",
			en = "Mosaic, Gilded",
			-- es = "Mosaic, Gilded",
			fr = "Mosaïque Dorée",
			-- it = "Mosaic, Gilded",
			-- ja = "Mosaic, Gilded",
			-- ko = "Mosaic, Gilded",
			-- pl = "Mosaic, Gilded",
			-- ["pt-BR"] = "Mosaic, Gilded",
			-- ru = "Mosaic, Gilded",
			-- tr = "Mosaic, Gilded",
			-- uk = "Mosaic, Gilded",
			-- ["zh-CN"] = "Mosaic, Gilded",
			-- ["zh-TW"] = "Mosaic, Gilded",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : D'étranges pierres en forme de pétales composent ce sol central de la {#BoldFormatGraftDark}Taverne{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Strange, petal-like stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- el =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			en =
			"The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- es =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			fr =
			"Les quatre coins de cette mosaïque indiqueraient les quatre fleuves des Enfers : le Styx, l'Achéron, le Léthé et le Phlégéthon.",
			-- it =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- ja =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- ko =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- pl =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- ["pt-BR"] =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- ru =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- tr =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- uk =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- ["zh-CN"] =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
			-- ["zh-TW"] =
			-- "The four corners of this mosaic are said to point towards the four rivers of the Underworld: Styx, Acheron, Lethe, and Phlegethon.",
		},
		CosmeticsGroup = "Cosmetic_TavernaStarMosaic",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TavernaStarMosaic_Furious",
		ShopCategory = "CosmeticsShop_Taverna",
		ActivateIds = { 738509 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\TavernaStarMosaic_Gilded_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\TavernaStarMosaic_Gilded",
		AnimationScale = 1.95,
		AnimationOffsetY = -55,
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeTaverna" }
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 900,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
			ModsNikkelMHadesBiomes_BossResourceTartarus = 1,
			ModsNikkelMHadesBiomes_OreElysium = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaStarMosaic_Royal",
		Name = {
			-- de = "Mosaic, Royal",
			-- el = "Mosaic, Royal",
			en = "Mosaic, Royal",
			-- es = "Mosaic, Royal",
			fr = "Mosaïque Royale",
			-- it = "Mosaic, Royal",
			-- ja = "Mosaic, Royal",
			-- ko = "Mosaic, Royal",
			-- pl = "Mosaic, Royal",
			-- ["pt-BR"] = "Mosaic, Royal",
			-- ru = "Mosaic, Royal",
			-- tr = "Mosaic, Royal",
			-- uk = "Mosaic, Royal",
			-- ["zh-CN"] = "Mosaic, Royal",
			-- ["zh-TW"] = "Mosaic, Royal",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : Des motifs dorés incrustés dans des pierres blanches composent ce sol central de la {#BoldFormatGraftDark}Taverne{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Gold patterns inset to white stones form this central flooring in the {#BoldFormatGraftDark}Taverna{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- el =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			en =
			"Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- es =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			fr =
			"Le seigneur Hadès n'est guère porté sur l'étalage de richesses, mais il n'a pas non plus ordonné le retrait de cette mosaïque lorsqu'il en a découvert l'existence.",
			-- it =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- ja =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- ko =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- pl =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- ["pt-BR"] =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- ru =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- tr =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- uk =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- ["zh-CN"] =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
			-- ["zh-TW"] =
			-- "Lord Hades of the Underworld is not known for any display of wealth, but also did not order this mosaic be removed once he discovered its existence.",
		},
		CosmeticsGroup = "Cosmetic_TavernaStarMosaic",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TavernaStarMosaic_Gilded",
		ShopCategory = "CosmeticsShop_Taverna",
		ActivateIds = { 738509 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\TavernaStarMosaic_Royal_Icon",
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
		AlwaysRevealImmediately = true,
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
			-- de = "Tassels, Deathly",
			-- el = "Tassels, Deathly",
			en = "Tassels, Deathly",
			-- es = "Tassels, Deathly",
			fr = "Guirlandes Mortuaires",
			-- it = "Tassels, Deathly",
			-- ja = "Tassels, Deathly",
			-- ko = "Tassels, Deathly",
			-- pl = "Tassels, Deathly",
			-- ["pt-BR"] = "Tassels, Deathly",
			-- ru = "Tassels, Deathly",
			-- tr = "Tassels, Deathly",
			-- uk = "Tassels, Deathly",
			-- ["zh-CN"] = "Tassels, Deathly",
			-- ["zh-TW"] = "Tassels, Deathly",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			en =
			"{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			fr =
			"{$Keywords.CosmeticSwap} : Des charmes protecteurs et décoratifs à l'aspect intimidant, près de la tente de la Princesse.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Protective and decorative intimidating charms near to the Princess' tent.",
		},
		FlavorText = {
			-- de =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- el =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			en =
			"Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- es =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			fr =
			"Certains oublient que si la plupart des êtres vivants entrent aux Enfers sous forme d'ombres, ils laissent aussi derrière eux, à la Surface, leur part mortelle.",
			-- it =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- ja =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- ko =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- pl =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- ["pt-BR"] =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- ru =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- tr =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- uk =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- ["zh-CN"] =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
			-- ["zh-TW"] =
			-- "Some forget that while most living beings enter the Underworld as shades, they also leave behind the mortal part of themselves on the Surface.",
		},
		CosmeticsGroup = "Cosmetic_MainHangingTassles01",
		InsertAfterCosmetic = "Cosmetic_MainHangingTassles01b",
		ShopCategory = "CosmeticsShop_Taverna",
		CameraFocusId = 576000,
		SetAnimationIds = { 576011, 576000, 576010, 575999, 585293 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\MainHangingTassles_Deathly_Icon",
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
		AlwaysRevealImmediately = true,
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
			-- de = "Rope, Deathly",
			-- el = "Rope, Deathly",
			en = "Rope, Deathly",
			-- es = "Rope, Deathly",
			fr = "Cordes Mortuaires",
			-- it = "Rope, Deathly",
			-- ja = "Rope, Deathly",
			-- ko = "Rope, Deathly",
			-- pl = "Rope, Deathly",
			-- ["pt-BR"] = "Rope, Deathly",
			-- ru = "Rope, Deathly",
			-- tr = "Rope, Deathly",
			-- uk = "Rope, Deathly",
			-- ["zh-CN"] = "Rope, Deathly",
			-- ["zh-TW"] = "Rope, Deathly",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			en =
			"{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			fr =
			"{$Keywords.CosmeticSwap} : Des souvenirs des morts liés ensemble, suspendus au-dessus du {#BoldFormatGraftDark}Chaudron{#Prev}.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Bound remembrances of the dead hanging above the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			-- de =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- el =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			en =
			"They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- es =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			fr =
			"Ils canalisent l'énergie des âmes qui quittent la Surface, afin d'accroître la puissance des concoctions de la Princesse.",
			-- it =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- ja =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- ko =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- pl =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- ["pt-BR"] =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- ru =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- tr =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- uk =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- ["zh-CN"] =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
			-- ["zh-TW"] =
			-- "They channel the energy of souls departing from the Surface, to enhance the potency of the Princess' concoctions.",
		},
		CosmeticsGroup = "Cosmetic_MainHangingRope01",
		InsertAfterCosmetic = "Cosmetic_MainHangingRope01a",
		ShopCategory = "CosmeticsShop_Taverna",
		CameraFocusId = 567503,
		SetAnimationIds = { 567502, 567327, 576074, 567326, 567503, 589757, 576156, 589685, 589686, 567328, 589688, 589687, 586405, 589689, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\MainHangingRope_Deathly_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\MainHangingRope_Deathly",
		AnimationScale = 1.8,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Intro" },
			},
			NamedRequirements = { "T2Cosmetic" },
		},
		AlwaysRevealImmediately = true,
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
	-- #region Music Maker stage/Cosmetic_TavernaMusicStage01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaMusicStage_Serpentine",
		Name = {
			-- de = "Stage, Serpentine",
			-- el = "Stage, Serpentine",
			en = "Stage, Serpentine",
			-- es = "Stage, Serpentine",
			fr = "Estrade Serpentine",
			-- it = "Stage, Serpentine",
			-- ja = "Stage, Serpentine",
			-- ko = "Stage, Serpentine",
			-- pl = "Stage, Serpentine",
			-- ["pt-BR"] = "Stage, Serpentine",
			-- ru = "Stage, Serpentine",
			-- tr = "Stage, Serpentine",
			-- uk = "Stage, Serpentine",
			-- ["zh-CN"] = "Stage, Serpentine",
			-- ["zh-TW"] = "Stage, Serpentine",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			en =
			"{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un sol froid et solide, directement sous {$Keywords.MusicPlayer}.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Cold and strong flooring directly beneath the {$Keywords.MusicPlayer}.",
		},
		FlavorText = {
			-- de =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- el =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			en =
			"Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- es =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			fr =
			"Les serpents ne sont pas ce qui vient d'abord à l'esprit quand on pense à la musique, mais le mouvement rythmé de leur corps et le balancement de leur cou peuvent envoûter tout aussi bien l'observateur imprudent.",
			-- it =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- ja =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- ko =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- pl =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- ["pt-BR"] =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- ru =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- tr =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- uk =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- ["zh-CN"] =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
			-- ["zh-TW"] =
			-- "Snakes are not commonly what comes to mind when one thinks of music, but the rhythmic movement of their bodies and swaying motion of their necks can enchant the unsuspecting observer just as well.",
		},
		CosmeticsGroup = "Cosmetic_TavernaMusicStage01",
		InsertAfterCosmetic = "Cosmetic_TavernaMusicStage02",
		ShopCategory = "CosmeticsShop_Taverna",
		ActivateIds = { 800654 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\Stage_Serpentine_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\Stage_Serpentine",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				Path = { "GameState", "WorldUpgrades" },
				CountOf = mod.HadesOstSongNames,
				Comparison = ">=",
				Value = 5,
			},
		},
		Cost = {
			CosmeticsPoints = 300,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
		},
		AlwaysRevealImmediately = true,
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				UsePlayerSource = true,
				{ Cue = "/VO/Melinoe_5387", Text = "Perhaps a more-suitable stage for your performance, Music Maker!", PostLineFunctionName = "MusicMakerReaction" },
			},
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0717", Text = "Should really help with the acoustics, whatever those are.", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs, },
			},
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TavernaMusicStage_Royal",
		Name = {
			-- de = "Stage, Royal",
			-- el = "Stage, Royal",
			en = "Stage, Royal",
			-- es = "Stage, Royal",
			fr = "Estrade Royale",
			-- it = "Stage, Royal",
			-- ja = "Stage, Royal",
			-- ko = "Stage, Royal",
			-- pl = "Stage, Royal",
			-- ["pt-BR"] = "Stage, Royal",
			-- ru = "Stage, Royal",
			-- tr = "Stage, Royal",
			-- uk = "Stage, Royal",
			-- ["zh-CN"] = "Stage, Royal",
			-- ["zh-TW"] = "Stage, Royal",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			en =
			"{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un sol imposant et majestueux, directement sous {$Keywords.MusicPlayer}.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Imposing and commanding flooring directly beneath the {$Keywords.MusicPlayer}.",
		},
		FlavorText = {
			-- de =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- el =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			en =
			"Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- es =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			fr =
			"La bonne musique sait capter sur celui qui la joue l'attention de foules entières, et cette estrade leur donnera aussi de quoi se rincer l'œil.",
			-- it =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- ja =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- ko =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- pl =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- ["pt-BR"] =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- ru =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- tr =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- uk =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- ["zh-CN"] =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
			-- ["zh-TW"] =
			-- "Good music is known to focus the attention of entire crowds on the one performing it, and this stage will give them something to feast their eyes on as well.",
		},
		CosmeticsGroup = "Cosmetic_TavernaMusicStage01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TavernaMusicStage_Serpentine",
		ShopCategory = "CosmeticsShop_Taverna",
		ActivateIds = { 800654 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Taverna\\Stage_Royal_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Taverna\\Stage_Royal",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				Path = { "GameState", "WorldUpgrades" },
				CountOf = mod.HadesOstSongNames,
				Comparison = ">=",
				Value = 15,
			},
		},
		Cost = {
			CosmeticsPoints = 350,
			ModsNikkelMHadesBiomes_OreStyx = 4,
			ModsNikkelMHadesBiomes_PlantElysium = 3,
		},
		AlwaysRevealImmediately = true,
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				UsePlayerSource = true,
				{ Cue = "/VO/Melinoe_5388", Text = "Here's a new spot from which to regale us, Music Maker!", PostLineFunctionName = "MusicMakerReaction" },
			},
			{ GlobalVoiceLines = "DoraCosmeticReactionVoiceLines" },
		},
	},
	-- #endregion
}
for _, cosmeticData in ipairs(tavernaCosmetics) do
	if cosmeticData.GameStateRequirements == nil then
		cosmeticData.GameStateRequirements = {}
	end
	table.insert(cosmeticData.GameStateRequirements, {
		PathTrue = { "GameState", "WorldUpgradesAdded", mod.UnlockCosmeticsIncantationName },
	})
	table.insert(mod.ModdedCosmeticIds, cosmeticData.Id)
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end
-- #endregion

-- #region CosmeticsShop_PreRun
local preRunCosmetics = {
	-- #region Exit Charms/Cosmetic_ExitCharm
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Achilles",
		Name = {
			-- de = "Charm, Antos",
			-- el = "Charm, Antos",
			en = "Charm, Antos",
			-- es = "Charm, Antos",
			fr = "Talismans d'Antos",
			-- it = "Charm, Antos",
			-- ja = "Charm, Antos",
			-- ko = "Charm, Antos",
			-- pl = "Charm, Antos",
			-- ["pt-BR"] = "Charm, Antos",
			-- ru = "Charm, Antos",
			-- tr = "Charm, Antos",
			-- uk = "Charm, Antos",
			-- ["zh-CN"] = "Charm, Antos",
			-- ["zh-TW"] = "Charm, Antos",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			en =
			"{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un ornement stratégique pour les portails protégés menant en haut comme en bas.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Strategic embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			-- de =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- el =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- es =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			fr =
			"Récupérée parmi les affaires de votre frère Zagreus dans sa chambre, cette breloque lui fut offerte par son mentor et ami Achille.",
			-- it =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- ja =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- ko =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- pl =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- ["pt-BR"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- ru =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- tr =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- uk =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- ["zh-CN"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
			-- ["zh-TW"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his mentor and friend Achilles.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = "Cosmetic_ExitCharm05",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\ExitCharm_Achilles_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Achilles",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Patroclus bond forged
				PathTrue = { "GameState", "TextLinesRecord", "PatroclusGift08_A" }
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 600,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
			ModsNikkelMHadesBiomes_OreElysium = 4,
			ModsNikkelMHadesBiomes_CropElysium = 2,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0788", Text = "Can't get these in Elysium anymore... but we have our ways.", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs, },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Dusa",
		Name = {
			-- de = "Charm, Fidi",
			-- el = "Charm, Fidi",
			en = "Charm, Fidi",
			-- es = "Charm, Fidi",
			fr = "Talismans de Fidi",
			-- it = "Charm, Fidi",
			-- ja = "Charm, Fidi",
			-- ko = "Charm, Fidi",
			-- pl = "Charm, Fidi",
			-- ["pt-BR"] = "Charm, Fidi",
			-- ru = "Charm, Fidi",
			-- tr = "Charm, Fidi",
			-- uk = "Charm, Fidi",
			-- ["zh-CN"] = "Charm, Fidi",
			-- ["zh-TW"] = "Charm, Fidi",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			en =
			"{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un ornement reptilien pour les portails protégés menant en haut comme en bas.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Reptilian embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			-- de =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- el =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- es =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			fr =
			"Récupérée parmi les affaires de votre frère Zagreus dans sa chambre, cette breloque lui fut offerte par sa servante et fidèle compagne Dusa.",
			-- it =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- ja =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- ko =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- pl =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- ["pt-BR"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- ru =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- tr =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- uk =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- ["zh-CN"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
			-- ["zh-TW"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his servant and trusted companion Dusa.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Achilles",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\ExitCharm_Dusa_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Dusa",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Dora's quest completed
				PathTrue = { "GameState", "TextLinesRecord", "DoraAboutMemories05" },
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		AlwaysRevealImmediately = true,
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
			-- de = "Charm, Battie",
			-- el = "Charm, Battie",
			en = "Charm, Battie",
			-- es = "Charm, Battie",
			fr = "Talismans de Battie",
			-- it = "Charm, Battie",
			-- ja = "Charm, Battie",
			-- ko = "Charm, Battie",
			-- pl = "Charm, Battie",
			-- ["pt-BR"] = "Charm, Battie",
			-- ru = "Charm, Battie",
			-- tr = "Charm, Battie",
			-- uk = "Charm, Battie",
			-- ["zh-CN"] = "Charm, Battie",
			-- ["zh-TW"] = "Charm, Battie",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			en =
			"{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un ornement furieux pour les portails protégés menant en haut comme en bas.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Furious embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			-- de =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- el =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- es =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			fr =
			"Récupérée parmi les affaires de votre frère Zagreus dans sa chambre, cette breloque lui fut offerte par la Furie Mégère elle-même, en gage de sa complexe affection.",
			-- it =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- ja =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- ko =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- pl =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- ["pt-BR"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- ru =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- tr =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- uk =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- ["zh-CN"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
			-- ["zh-TW"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the Fury Megaera herself, as a token of her complex affections.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Dusa",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\ExitCharm_Megaera_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Megaera",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Megaera has given you her companion
				PathTrue = { "GameState", "TextLinesRecord", "MegaeraGift07" }
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		AlwaysRevealImmediately = true,
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
			-- de = "Charm, Shady",
			-- el = "Charm, Shady",
			en = "Charm, Shady",
			-- es = "Charm, Shady",
			fr = "Talismans de Shady",
			-- it = "Charm, Shady",
			-- ja = "Charm, Shady",
			-- ko = "Charm, Shady",
			-- pl = "Charm, Shady",
			-- ["pt-BR"] = "Charm, Shady",
			-- ru = "Charm, Shady",
			-- tr = "Charm, Shady",
			-- uk = "Charm, Shady",
			-- ["zh-CN"] = "Charm, Shady",
			-- ["zh-TW"] = "Charm, Shady",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			en =
			"{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un ornement inébranlable pour les portails protégés menant en haut comme en bas.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Steadfast embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			-- de =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- el =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- es =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			fr =
			"Récupérée parmi les affaires de votre frère Zagreus dans sa chambre, cette breloque lui fut offerte par l'ombre de Sisyphe et représente son fidèle compagnon de pierre, Bouldy.",
			-- it =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- ja =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- ko =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- pl =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- ["pt-BR"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- ru =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- tr =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- uk =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- ["zh-CN"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
			-- ["zh-TW"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by the shade Sisyphus and depicts his trusted rock companion, Bouldy.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Megaera",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\ExitCharm_Sisyphus_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Sisyphus",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Sisyphus has given you his companion
				PathTrue = { "GameState", "TextLinesRecord", "SisyphusGift07_A" }
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		AlwaysRevealImmediately = true,
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
			-- de = "Charm, Rib",
			-- el = "Charm, Rib",
			en = "Charm, Rib",
			-- es = "Charm, Rib",
			fr = "Talismans de Rib",
			-- it = "Charm, Rib",
			-- ja = "Charm, Rib",
			-- ko = "Charm, Rib",
			-- pl = "Charm, Rib",
			-- ["pt-BR"] = "Charm, Rib",
			-- ru = "Charm, Rib",
			-- tr = "Charm, Rib",
			-- uk = "Charm, Rib",
			-- ["zh-CN"] = "Charm, Rib",
			-- ["zh-TW"] = "Charm, Rib",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			en =
			"{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un ornement squelettique pour les portails protégés menant en haut comme en bas.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Skeletal embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			-- de =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- el =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- es =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			fr =
			"Récupérée parmi les affaires de votre frère Zagreus dans sa chambre, cette breloque lui fut offerte par son copain Skelly, et ressemble étrangement au Commandant...",
			-- it =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- ja =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- ko =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- pl =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- ["pt-BR"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- ru =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- tr =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- uk =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- ["zh-CN"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
			-- ["zh-TW"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by his buddy Skelly, and bears a striking resemblance to Commander Schelemeus...",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Sisyphus",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\ExitCharm_Skelly_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Skelly",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Completed Skelly's Augmentation of Bone Density quest
				PathTrue = { "GameState", "ObjectivesCompleted", "KillSkelly" },
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		AlwaysRevealImmediately = true,
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
			-- de = "Charm, Mort",
			-- el = "Charm, Mort",
			en = "Charm, Mort",
			-- es = "Charm, Mort",
			fr = "Talismans de la Mort",
			-- it = "Charm, Mort",
			-- ja = "Charm, Mort",
			-- ko = "Charm, Mort",
			-- pl = "Charm, Mort",
			-- ["pt-BR"] = "Charm, Mort",
			-- ru = "Charm, Mort",
			-- tr = "Charm, Mort",
			-- uk = "Charm, Mort",
			-- ["zh-CN"] = "Charm, Mort",
			-- ["zh-TW"] = "Charm, Mort",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			en =
			"{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un ornement trottinant pour les portails protégés menant en haut comme en bas.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Scurrying embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			-- de =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- el =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- es =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			fr =
			"Récupérée parmi les affaires de votre frère Zagreus dans sa chambre, cette breloque lui fut offerte par Thanatos, dieu de la Mort, allié occasionnel et bien plus encore.",
			-- it =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- ja =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- ko =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- pl =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- ["pt-BR"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- ru =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- tr =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- uk =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- ["zh-CN"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
			-- ["zh-TW"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm was given to him by Thanatos, God of the Dead, occasional ally and more than that.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Skelly",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\ExitCharm_Thanatos_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\ExitCharm_Thanatos",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				-- Thanatos has given you his companion
				PathTrue = { "GameState", "TextLinesRecord", "ThanatosGift07_A" }
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 600,
			ModsNikkelMHadesBiomes_CropAsphodel = 4,
			ModsNikkelMHadesBiomes_CropElysium = 4,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0789", Text = "{#Emph}I am the only visage of Death you shall ever require!", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraScaryAppearArgs },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Cerberus",
		Name = {
			-- de = "Charm, Solo",
			-- el = "Charm, Solo",
			en = "Charm, Solo",
			-- es = "Charm, Solo",
			fr = "Talismans de Solo",
			-- it = "Charm, Solo",
			-- ja = "Charm, Solo",
			-- ko = "Charm, Solo",
			-- pl = "Charm, Solo",
			-- ["pt-BR"] = "Charm, Solo",
			-- ru = "Charm, Solo",
			-- tr = "Charm, Solo",
			-- uk = "Charm, Solo",
			-- ["zh-CN"] = "Charm, Solo",
			-- ["zh-TW"] = "Charm, Solo",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			en =
			"{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un ornement à caresser pour les portails protégés menant en haut comme en bas.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Pettable embellishment to the warded gateways leading both above and below.",
		},
		FlavorText = {
			-- de =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- el =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			en =
			"Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- es =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			fr =
			"Récupérée parmi les affaires de votre frère Zagreus dans sa chambre, cette breloque représente le chien des Enfers sous sa forme la plus terrifiante.",
			-- it =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- ja =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- ko =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- pl =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- ["pt-BR"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- ru =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- tr =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- uk =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- ["zh-CN"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
			-- ["zh-TW"] =
			-- "Recovered from the belongings of your brother Zagreus in his bedchamber, this charm depicts the hound of hell, in it's most terrifying form.",
		},
		CosmeticsGroup = "Cosmetic_ExitCharm",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_Thanatos",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 589859, 589860 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\ExitCharm_Cerberus_Icon",
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
		AlwaysRevealImmediately = true,
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
			-- de = "Dais, Fancy",
			-- el = "Dais, Fancy",
			en = "Dais, Fancy",
			-- es = "Dais, Fancy",
			fr = "Dalle Raffinée",
			-- it = "Dais, Fancy",
			-- ja = "Dais, Fancy",
			-- ko = "Dais, Fancy",
			-- pl = "Dais, Fancy",
			-- ["pt-BR"] = "Dais, Fancy",
			-- ru = "Dais, Fancy",
			-- tr = "Dais, Fancy",
			-- uk = "Dais, Fancy",
			-- ["zh-CN"] = "Dais, Fancy",
			-- ["zh-TW"] = "Dais, Fancy",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			en =
			"{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			fr =
			"{$Keywords.CosmeticSwap} : Une plateforme de pierre finement ouvragée, là où {$Keywords.CharSkelly} se tient habituellement.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Intricate stone platform, set right where {$Keywords.CharSkelly} typically resides.",
		},
		FlavorText = {
			-- de =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- el =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			en =
			"With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- es =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			fr =
			"Avec des symboles tels qu'on en trouvait jadis dans la Maison d'Hadès, le Commandant devrait être dûment inspiré à de grands exploits en se tenant sur ce piédestal.",
			-- it =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- ja =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- ko =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- pl =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- ["pt-BR"] =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- ru =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- tr =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- uk =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- ["zh-CN"] =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
			-- ["zh-TW"] =
			-- "With symbolisms as could be found in the House of Hades in times past, the Commander should be suitably inspired to great deeds while standing upon this dais.",
		},
		CosmeticsGroup = "Cosmetic_SkellyFloor01",
		InsertAfterCosmetic = "Cosmetic_SkellyFloor01c",
		ShopCategory = "CosmeticsShop_PreRun",
		SetAnimationIds = { 587209 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\SkellyFloor_Fancy_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\SkellyFloor_Fancy",
		AnimationScale = 2,
		GameStateRequirements = {
			NamedRequirements = { "T1Cosmetic" },
		},
		AlwaysRevealImmediately = true,
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
			-- de = "Dais, Olympian",
			-- el = "Dais, Olympian",
			en = "Dais, Olympian",
			-- es = "Dais, Olympian",
			fr = "Dalle Olympienne",
			-- it = "Dais, Olympian",
			-- ja = "Dais, Olympian",
			-- ko = "Dais, Olympian",
			-- pl = "Dais, Olympian",
			-- ["pt-BR"] = "Dais, Olympian",
			-- ru = "Dais, Olympian",
			-- tr = "Dais, Olympian",
			-- uk = "Dais, Olympian",
			-- ["zh-CN"] = "Dais, Olympian",
			-- ["zh-TW"] = "Dais, Olympian",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			en =
			"{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			fr =
			"{$Keywords.CosmeticSwap} : Une plateforme de pierre vigilante, là où {$Keywords.CharSkelly} se tient habituellement.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Watchful stone platform, set right where {$Keywords.CharSkelly} typically resides.",
		},
		FlavorText = {
			-- de =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- el =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			en =
			"What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- es =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			fr =
			"Quoi de mieux, pour que le Commandant prouve qu'il a la faveur des dieux eux-mêmes, que de se tenir sur un piédestal façonné en leur honneur ?",
			-- it =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- ja =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- ko =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- pl =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- ["pt-BR"] =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- ru =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- tr =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- uk =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- ["zh-CN"] =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
			-- ["zh-TW"] =
			-- "What better way for the Commander to prove that he is favoured by the gods themselves, than to stand upon a dais crafted in their honour?",
		},
		CosmeticsGroup = "Cosmetic_SkellyFloor01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_SkellyFloor_Fancy",
		ShopCategory = "CosmeticsShop_PreRun",
		SetAnimationIds = { 587209 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\SkellyFloor_Olympian_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\SkellyFloor_Olympian",
		AnimationScale = 2,
		GameStateRequirements = {
			NamedRequirements = { "T1Cosmetic" },
		},
		AlwaysRevealImmediately = true,
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
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_SkellyFloor_Psychopomp",
		Name = {
			-- de = "Dais, Psychopomp",
			-- el = "Dais, Psychopomp",
			en = "Dais, Psychopomp",
			-- es = "Dais, Psychopomp",
			fr = "Dalle Psychopompe",
			-- it = "Dais, Psychopomp",
			-- ja = "Dais, Psychopomp",
			-- ko = "Dais, Psychopomp",
			-- pl = "Dais, Psychopomp",
			-- ["pt-BR"] = "Dais, Psychopomp",
			-- ru = "Dais, Psychopomp",
			-- tr = "Dais, Psychopomp",
			-- uk = "Dais, Psychopomp",
			-- ["zh-CN"] = "Dais, Psychopomp",
			-- ["zh-TW"] = "Dais, Psychopomp",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			en =
			"{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			fr =
			"{$Keywords.CosmeticSwap} : Une riche plateforme de pierre, là où {$Keywords.CharSkelly} se tient habituellement.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Rich stone platform, set right where {$Keywords.CharSkelly} typically resides.",
		},
		FlavorText = {
			-- de =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- el =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			en =
			"Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- es =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			fr =
			"Les récits parlent d'un gueux assez semblable au Commandant, jadis employé par un certain nocher pour l'assister dans une affaire d'importance à la Maison d'Hadès.",
			-- it =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- ja =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- ko =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- pl =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- ["pt-BR"] =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- ru =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- tr =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- uk =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- ["zh-CN"] =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
			-- ["zh-TW"] =
			-- "Stories speak of a wretch not dissimilar to the Commander, who once was employed by a certain ferryman to assist with an important matter in the House of Hades.",
		},
		CosmeticsGroup = "Cosmetic_SkellyFloor01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_SkellyFloor_Olympian",
		ShopCategory = "CosmeticsShop_PreRun",
		SetAnimationIds = { 587209 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\SkellyFloor_Psychopomp_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\SkellyFloor_Psychopomp",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersCompletedCache", "BossCharon" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 500,
			CharonPoints = 2,
			ModsNikkelMHadesBiomes_PlantAsphodel = 4,
			ModsNikkelMHadesBiomes_CropElysium = 3,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Skelly_01",
				RequiredSourceValueFalse = "InPartnerConversation",
				{ Cue = "/VO/Skelly_0216", Text = "{#Emph}Ahh{#Prev}, yes!" },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	-- #endregion
	-- #region Effigies/Scarecrows/Cosmetic_TrainingDummy01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TrainingDummy_Scarecrow",
		Name = {
			-- de = "Effigies, Scary",
			-- el = "Effigies, Scary",
			en = "Effigies, Scary",
			-- es = "Effigies, Scary",
			fr = "Mannequins Effrayants",
			-- it = "Effigies, Scary",
			-- ja = "Effigies, Scary",
			-- ko = "Effigies, Scary",
			-- pl = "Effigies, Scary",
			-- ["pt-BR"] = "Effigies, Scary",
			-- ru = "Effigies, Scary",
			-- tr = "Effigies, Scary",
			-- uk = "Effigies, Scary",
			-- ["zh-CN"] = "Effigies, Scary",
			-- ["zh-TW"] = "Effigies, Scary",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			en =
			"{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			fr =
			"{$Keywords.CosmeticSwap} : Des cibles d'entraînement au combat qui font fuir les oiseaux, derrière l'endroit où {$Keywords.CharSkelly} se tient habituellement.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Bird-repelling targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
		},
		FlavorText = {
			-- de =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- el =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			en =
			"Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- es =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			fr =
			"Bien qu'il ne s'en plaindrait jamais auprès de la Princesse, on a vu le Commandant chasser plus d'un oiseau l'ayant pris pour un perchoir.",
			-- it =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- ja =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- ko =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- pl =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- ["pt-BR"] =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- ru =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- tr =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- uk =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- ["zh-CN"] =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
			-- ["zh-TW"] =
			-- "Though he would never complain about it to the Princess, the Commander has been seen to shoo away the occasional bird that mistook him for a resting place.",
		},
		CosmeticsGroup = "Cosmetic_TrainingDummy01",
		InsertAfterCosmetic = "Cosmetic_TrainingDummy01c",
		ShopCategory = "CosmeticsShop_PreRun",
		CameraFocusId = 566610,
		SetAnimationIds = { 566610, 566612, 567196, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\TrainingDummy_Scarecrow_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\TrainingDummy_Scarecrow",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "SkellyGift04" },
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		AlwaysRevealImmediately = true,
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
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0475", Text = "Don't get too many birds around here but why not?", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs, },
			},
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_TrainingDummy_Psychopomp",
		Name = {
			-- de = "Effigies, Psychopomp",
			-- el = "Effigies, Psychopomp",
			en = "Effigies, Psychopomp",
			-- es = "Effigies, Psychopomp",
			fr = "Mannequins Psychopompes",
			-- it = "Effigies, Psychopomp",
			-- ja = "Effigies, Psychopomp",
			-- ko = "Effigies, Psychopomp",
			-- pl = "Effigies, Psychopomp",
			-- ["pt-BR"] = "Effigies, Psychopomp",
			-- ru = "Effigies, Psychopomp",
			-- tr = "Effigies, Psychopomp",
			-- uk = "Effigies, Psychopomp",
			-- ["zh-CN"] = "Effigies, Psychopomp",
			-- ["zh-TW"] = "Effigies, Psychopomp",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- el =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			en =
			"{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- es =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			fr =
			"{$Keywords.CosmeticSwap} : Des cibles d'entraînement au combat omniprésentes, derrière l'endroit où {$Keywords.CharSkelly} se tient habituellement.",
			-- it =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ja =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ko =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- pl =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ru =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- tr =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- uk =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticSwap}: Ever-present targets for martial training, set behind where {$Keywords.CharSkelly} typically resides.",
		},
		FlavorText = {
			-- de =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- el =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			en =
			"The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- es =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			fr =
			"Le nocher Charon peut se trouver en plusieurs lieux à la fois, et il observe toujours, ne serait-ce qu'à travers les yeux de ses nombreux associés.",
			-- it =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- ja =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- ko =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- pl =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- ["pt-BR"] =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- ru =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- tr =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- uk =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- ["zh-CN"] =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
			-- ["zh-TW"] =
			-- "The boatman Charon can be in many places at once, and is always watching, even if only through the eyes of his many associates.",
		},
		CosmeticsGroup = "Cosmetic_TrainingDummy01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_TrainingDummy_Scarecrow",
		ShopCategory = "CosmeticsShop_PreRun",
		CameraFocusId = 566610,
		SetAnimationIds = { 566610, 566612, 567196, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\TrainingDummy_Psychopomp_Icon",
		IconOffsetX = -10,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\TrainingDummy_Psychopomp",
		AnimationScale = 2,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "EncountersCompletedCache", "BossCharon" },
				Comparison = ">=",
				Value = 2,
			},
			NamedRequirements = { "T4Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 1300,
			ModsNikkelMHadesBiomes_OreStyx = 4,
			ModsNikkelMHadesBiomes_CropAsphodel = 2,
			ModsNikkelMHadesBiomes_PlantTartarus = 4,
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
				{ Cue = "/VO/Dora_0475", Text = "Don't get too many birds around here but why not?", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs, },
			},
		},
	},
	-- #endregion
	-- #region Exit Statue/Cosmetic_SkellyZagreusStatue
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_SkellyStatue_Daemonic",
		Name = {
			-- de = "Statue, Daemonic",
			-- el = "Statue, Daemonic",
			en = "Statue, Daemonic",
			-- es = "Statue, Daemonic",
			fr = "Statue Démoniaque",
			-- it = "Statue, Daemonic",
			-- ja = "Statue, Daemonic",
			-- ko = "Statue, Daemonic",
			-- pl = "Statue, Daemonic",
			-- ["pt-BR"] = "Statue, Daemonic",
			-- ru = "Statue, Daemonic",
			-- tr = "Statue, Daemonic",
			-- uk = "Statue, Daemonic",
			-- ["zh-CN"] = "Statue, Daemonic",
			-- ["zh-TW"] = "Statue, Daemonic",
		},
		Description = {
			-- de =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- el =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			en =
			"{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- es =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			fr =
			"{$Keywords.CosmeticAltAdd} : Un bloc de pierre réduit au ciseau jusqu'à prendre la forme reconnaissable entre toutes du redoutable Chien des Enfers, Cerbère.",
			-- it =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- ja =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- ko =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- pl =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- ["pt-BR"] =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- ru =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- tr =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- uk =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- ["zh-CN"] =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
			-- ["zh-TW"] =
			-- "{$Keywords.CosmeticAltAdd}: Stone slab reduced by chisel to the unmistakable form of the fearsome Hound of Hell, Cerberus.",
		},
		FlavorText = {
			-- de =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- el =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			en =
			"Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- es =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			fr =
			"Toutes les ombres des Enfers connaissent Cerbère, le gardien à trois têtes de la Maison d'Hadès. Peu l'ont vu de leurs yeux, et pourtant toutes savent à quel point son allure est terrifiante.",
			-- it =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- ja =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- ko =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- pl =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- ["pt-BR"] =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- ru =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- tr =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- uk =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- ["zh-CN"] =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
			-- ["zh-TW"] =
			-- "Every shade in the Underworld knows of Cerberus, the three-headed guardian of the House of Hades. Few have seen him themselves, yet all know of his terrifying appearance.",
		},
		CosmeticsGroup = "Cosmetic_SkellyZagreusStatue",
		InsertAfterCosmetic = "Cosmetic_SkellyZagreusStatue",
		ShopCategory = "CosmeticsShop_PreRun",
		ActivateIds = { 780532 },
		ToggleCollision = true,
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\PreRun\\SkellyStatue_Daemonic_Icon",
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\PreRun\\SkellyStatue_Daemonic",
		AnimationScale = 1.8,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "Cosmetic_SkellyZagreusStatue" },
			},
			-- Beaten EM4 Hades
			{
				PathTrue = { "GameState", "TextLinesRecord", "LordHadesExtremeMeasuresDefeat01" },
			},
			NamedRequirements = { "T5Cosmetic" },
		},
		AlwaysRevealImmediately = true,
		Cost = {
			CosmeticsPoints = 2500,
			ModsNikkelMHadesBiomes_OreStyx = 3,
			ModsNikkelMHadesBiomes_BossResourceStyx = 2,
		},
		RevealReactionVoiceLines = {
			{
				PreLineWait = 0.35,
				ObjectType = "NPC_Dora_01",
				{ Cue = "/VO/Dora_0797", Text = "Think they'd make a glorious statue of me if {#Emph}I {#Prev}slept all the time?", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs, },
			},
			{ GlobalVoiceLines = "PositiveReactionVoiceLines" },
		},
	},
	-- #endregion
}
for _, cosmeticData in ipairs(preRunCosmetics) do
	if cosmeticData.GameStateRequirements == nil then
		cosmeticData.GameStateRequirements = {}
	end
	table.insert(cosmeticData.GameStateRequirements, {
		PathTrue = { "GameState", "WorldUpgradesAdded", mod.UnlockCosmeticsIncantationName },
	})
	table.insert(mod.ModdedCosmeticIds, cosmeticData.Id)
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end
-- #endregion

-- #region Arcana Card Backs
-- #region Biomes Pack
table.insert(mod.ModdedCosmeticIds, _PLUGIN.guid .. ".Cosmetic_Arcana_Biomes")
CosmeticsAPI.RegisterCardBackPack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Biomes",
	Name = {
		-- de = "Arcana, Far-Travelled",
		-- el = "Arcana, Far-Travelled",
		en = "Arcana, Far-Travelled",
		-- es = "Arcana, Far-Travelled",
		fr = "Arcanes du Grand Voyage",
		-- it = "Arcana, Far-Travelled",
		-- ja = "Arcana, Far-Travelled",
		-- ko = "Arcana, Far-Travelled",
		-- pl = "Arcana, Far-Travelled",
		-- ["pt-BR"] = "Arcana, Far-Travelled",
		-- ru = "Arcana, Far-Travelled",
		-- tr = "Arcana, Far-Travelled",
		-- uk = "Arcana, Far-Travelled",
		-- ["zh-CN"] = "Arcana, Far-Travelled",
		-- ["zh-TW"] = "Arcana, Far-Travelled",
	},
	Description = {
		-- de =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- el =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		en =
		"{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- es =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		fr =
		"{$Keywords.CosmeticDeck} : Un ensemble de {#UpgradeFormatDark}4 {#Prev}thèmes alternatifs, à l'effigie des régions des Enfers dont Zagreus s'est jadis échappé.",
		-- it =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- ja =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- ko =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- pl =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- ["pt-BR"] =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- ru =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- tr =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- uk =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- ["zh-CN"] =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
		-- ["zh-TW"] =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring the Underworld regions Zagreus once escaped from.",
	},
	FlavorText = {
		-- de =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- el =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		en =
		"Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- es =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		fr =
		"Le périple de votre frère à travers le domaine de son père fut mortel, mais aussi rempli de spectacles extraordinaires.",
		-- it =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- ja =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- ko =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- pl =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- ["pt-BR"] =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- ru =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- tr =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- uk =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- ["zh-CN"] =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
		-- ["zh-TW"] =
		-- "Your brother's journey through his father's domain was a deadly one, but also filled with extraordinary sights.",
	},
	IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Arcana\\Arcana_Biomes_Icon",
	Cost = {
		CosmeticsPoints = 2500,
		ModsNikkelMHadesBiomes_PlantAsphodel = 2,
		ModsNikkelMHadesBiomes_CropElysium = 2,
		ModsNikkelMHadesBiomes_OreStyx = 4,

	},
	GameStateRequirements = {
		{
			PathTrue = { "GameState", "WorldUpgradesAdded", mod.UnlockCosmeticsIncantationName },
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
			Comparison = ">=",
			Value = 3,
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
			Comparison = ">=",
			Value = 1,
		},
	},
	InsertAfterCosmetic = "Cosmetic_CardDeck08",
	PreRevealVoiceLines = {
		Queue = "Interrupt",
		{
			PreLineWait = 0.35,
			UsePlayerSource = true,
			{ Cue = "/VO/Melinoe_5386", Text = "May the Arcana always remind me of my heritage." },
		},
		{ GlobalVoiceLines = "DoraCosmeticReactionVoiceLines" },
	},
})

CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Biomes_Tartarus",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Biomes",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Biomes\\Deck_Tartarus",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Biomes\\DeckMouseover_Tartarus",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackBiomesTartarus",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Biomes_Asphodel",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Biomes",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Biomes\\Deck_Asphodel",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Biomes\\DeckMouseover_Asphodel",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackBiomesAsphodel",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Biomes_Elysium",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Biomes",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Biomes\\Deck_Elysium",
	DeckArtMouseoverPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Biomes\\DeckMouseover_Elysium",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackBiomesElysium",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Biomes_Styx",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Biomes",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Biomes\\Deck_Styx",
	DeckArtMouseoverPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Biomes\\DeckMouseover_Styx",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackBiomesStyx",
})
-- #endregion
-- #region Bosses Pack
table.insert(mod.ModdedCosmeticIds, _PLUGIN.guid .. ".Cosmetic_Arcana_Bosses")
CosmeticsAPI.RegisterCardBackPack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Bosses",
	Name = {
		-- de = "Arcana, Antagonistic",
		-- el = "Arcana, Antagonistic",
		en = "Arcana, Antagonistic",
		-- es = "Arcana, Antagonistic",
		fr = "Arcanes Antagonistes",
		-- it = "Arcana, Antagonistic",
		-- ja = "Arcana, Antagonistic",
		-- ko = "Arcana, Antagonistic",
		-- pl = "Arcana, Antagonistic",
		-- ["pt-BR"] = "Arcana, Antagonistic",
		-- ru = "Arcana, Antagonistic",
		-- tr = "Arcana, Antagonistic",
		-- uk = "Arcana, Antagonistic",
		-- ["zh-CN"] = "Arcana, Antagonistic",
		-- ["zh-TW"] = "Arcana, Antagonistic",
	},
	Description = {
		-- de =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- el =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		en =
		"{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- es =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		fr =
		"{$Keywords.CosmeticDeck} : Un ensemble de {#UpgradeFormatDark}4 {#Prev}thèmes alternatifs, à l'effigie de quelques-uns des gardiens les plus redoutés des Enfers.",
		-- it =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- ja =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- ko =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- pl =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- ["pt-BR"] =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- ru =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- tr =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- uk =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- ["zh-CN"] =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
		-- ["zh-TW"] =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}4 {#Prev}alternate themes, featuring some of the Underworld's most notorious safe-keepers.",
	},
	FlavorText = {
		-- de =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- el =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		en =
		"Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- es =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		fr =
		"S'échapper des Enfers, sans être impossible, est rendu bien plus ardu par leurs divers gardiens.",
		-- it =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- ja =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- ko =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- pl =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- ["pt-BR"] =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- ru =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- tr =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- uk =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- ["zh-CN"] =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
		-- ["zh-TW"] =
		-- "Escaping the Underworld, while not impossible, is made that much more difficult through its various wardens.",
	},
	IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Arcana\\Arcana_Bosses_Icon",
	Cost = {
		CosmeticsPoints = 2700,
		ModsNikkelMHadesBiomes_PlantTartarus = 2,
		ModsNikkelMHadesBiomes_CropStyx = 2,
		ModsNikkelMHadesBiomes_OreElysium = 5,

	},
	GameStateRequirements = {
		{
			PathTrue = { "GameState", "WorldUpgradesAdded", mod.UnlockCosmeticsIncantationName },
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
			Comparison = ">=",
			Value = 4,
		},
	},
	InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Biomes",
})

CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Bosses_Furies",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Bosses",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Bosses\\Deck_Furies",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Bosses\\DeckMouseover_Furies",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackBossesFuries",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Bosses_Hydra",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Bosses",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Bosses\\Deck_Hydra",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Bosses\\DeckMouseover_Hydra",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackBossesHydra",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Bosses_Champions",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Bosses",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Bosses\\Deck_Champions",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Bosses\\DeckMouseover_Champions",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackBossesChampions",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Bosses_Hades",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Bosses",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Bosses\\Deck_Hades",
	DeckArtMouseoverPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Bosses\\DeckMouseover_Hades",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackBossesHades",
})
-- #endregion
-- #region Gods Pack
table.insert(mod.ModdedCosmeticIds, _PLUGIN.guid .. ".Cosmetic_Arcana_Gods")
CosmeticsAPI.RegisterCardBackPack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	Name = {
		-- de = "Arcana, Olympian",
		-- el = "Arcana, Olympian",
		en = "Arcana, Olympian",
		-- es = "Arcana, Olympian",
		fr = "Arcanes Olympiennes",
		-- it = "Arcana, Olympian",
		-- ja = "Arcana, Olympian",
		-- ko = "Arcana, Olympian",
		-- pl = "Arcana, Olympian",
		-- ["pt-BR"] = "Arcana, Olympian",
		-- ru = "Arcana, Olympian",
		-- tr = "Arcana, Olympian",
		-- uk = "Arcana, Olympian",
		-- ["zh-CN"] = "Arcana, Olympian",
		-- ["zh-TW"] = "Arcana, Olympian",
	},
	Description = {
		-- de =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- el =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		en =
		"{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- es =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		fr =
		"{$Keywords.CosmeticDeck} : Un ensemble de {#UpgradeFormatDark}12 {#Prev}thèmes alternatifs, à l'effigie des différents dieux et déesses de l'Olympe qui vous aident dans votre périple.",
		-- it =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- ja =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- ko =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- pl =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- ["pt-BR"] =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- ru =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- tr =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- uk =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- ["zh-CN"] =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
		-- ["zh-TW"] =
		-- "{$Keywords.CosmeticDeck}: Set of {#UpgradeFormatDark}12 {#Prev}alternate themes, featuring the various Olympian Gods and Goddesses aiding you on your journey.",
	},
	FlavorText = {
		-- de =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- el =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		en =
		"It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- es =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		fr =
		"Il est bien connu que les dieux peuvent être vaniteux, il n'est donc pas étonnant qu'ils se donnent tant de mal pour rester constamment présents à votre esprit.",
		-- it =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- ja =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- ko =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- pl =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- ["pt-BR"] =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- ru =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- tr =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- uk =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- ["zh-CN"] =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
		-- ["zh-TW"] =
		-- "It is widely known that Gods can be vain, so it is no wonder they go out of their way to ensure they are ever on your mind.",
	},
	IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Icons\\Arcana\\Arcana_Gods_Icon",
	Cost = {
		CosmeticsPoints = 3000,
		ModsNikkelMHadesBiomes_PlantElysium = 4,
		ModsNikkelMHadesBiomes_OreTartarus = 7,
		ModsNikkelMHadesBiomes_BossResourceElysium = 2,
	},
	GameStateRequirements = {
		{
			PathTrue = { "GameState", "WorldUpgradesAdded", mod.UnlockCosmeticsIncantationName },
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
			Comparison = ">=",
			Value = 10,
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
			Comparison = ">=",
			Value = 5,
		},
	},
	InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Bosses",
})

CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Athena",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Athena",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Athena",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsAthena",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Artemis",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Artemis",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Artemis",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsArtemis",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Ares",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Ares",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Ares",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsAres",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Demeter",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Demeter",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Demeter",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsDemeter",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Zeus",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Zeus",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Zeus",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsZeus",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Dionysus",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Dionysus",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Dionysus",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsDionysus",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Aphrodite",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Aphrodite",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Aphrodite",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsAphrodite",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Apollo",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Apollo",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Apollo",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsApollo",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Hephaestus",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Hephaestus",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Hephaestus",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsHephaestus",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Hera",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Hera",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Hera",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsHera",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Hestia",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Hestia",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Hestia",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsHestia",
})
CosmeticsAPI.RegisterCardBack({
	Id = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods_Poseidon",
	PackId = _PLUGIN.guid .. "." .. "Cosmetic_Arcana_Gods",
	DeckArtPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\Deck_Poseidon",
	DeckArtMouseoverPath =
	"NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Arcana\\Arcana_Gods\\DeckMouseover_Poseidon",
	CardBackPath = "NikkelM-HadesBiomesCosmeticsCardbacks\\GUI\\Screens\\Cardback\\CardBackGodsPoseidon",
})
-- #endregion
-- #endregion

-- Register the cosmetics package to be loaded automatically by the CosmeticsAPI when entering the Crossroads
CosmeticsAPI.RegisterCrossroadsPackages({ "NikkelM-HadesBiomesCosmetics" })
-- Register the arcana card back package to be loaded automatically by the CosmeticsAPI
CosmeticsAPI.RegisterCrossroadsPackages({ "NikkelM-HadesBiomesCosmeticsCardbacks" })
