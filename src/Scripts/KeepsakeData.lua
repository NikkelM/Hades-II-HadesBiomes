game.GiftData.NPC_Thanatos_01 = game.GiftData.NPC_Thanatos_01 or {}
game.GiftData.NPC_Thanatos_01.UnlockGameStateRequirements = game.GiftData.NPC_Thanatos_01.UnlockGameStateRequirements or
		{}
game.GiftData.NPC_Thanatos_01.UnlockGameStateRequirements.RequiredTextLines = { "ThanatosFieldBuildingTrust01", }

game.GiftData.NPC_FurySister_01 = game.GiftData.NPC_FurySister_01 or {}
game.GiftData.NPC_FurySister_01.UnlockGameStateRequirements = game.GiftData.NPC_FurySister_01
		.UnlockGameStateRequirements or {}
game.GiftData.NPC_FurySister_01.UnlockGameStateRequirements.RequiredAnyTextLines = { "MegaeraBedroom02",
	"MegaeraBedroom02B", }

game.GiftData.NPC_Achilles_01 = game.GiftData.NPC_Achilles_01 or {}
game.GiftData.NPC_Achilles_01.UnlockGameStateRequirements = game.GiftData.NPC_Achilles_01.UnlockGameStateRequirements or
		{}
game.GiftData.NPC_Achilles_01.UnlockGameStateRequirements.RequiredTextLines = { "MyrmidonReunionQuestComplete" }

-- game.GiftData.NPC_Dusa_01 = game.GiftData.NPC_Dusa_01 or {}
-- game.GiftData.NPC_Dusa_01.UnlockGameStateRequirements = game.GiftData.NPC_Dusa_01.UnlockGameStateRequirements or
-- 		{}
-- game.GiftData.NPC_Dusa_01.UnlockGameStateRequirements.RequiredTextLines = { "DusaLoungeRenovationQuestComplete", }

-- #region Assist Traits
table.insert(game.GiftData.NPC_Sisyphus_01, {
	Gift = "SisyphusAssistTrait",
	GameStateRequirements = {
		{
			PathTrue = { "GameState", "TextLinesRecord", "SisyphusGift07_A" },
		},
	},
})

table.insert(game.ScreenData.KeepsakeRack.ComponentData.Order, "ModsNikkelMHadesBiomesAssistEquippedFrame")
game.ScreenData.KeepsakeRack.ComponentData.ModsNikkelMHadesBiomesAssistEquippedFrame = {
	Graphic = "BlankObstacle",
	AnimationName = "ModsNikkelMHadesBiomesLegendaryMenuItemEquipped",
	Alpha = 0,
	Scale = 1,
	GroupName = "Combat_Menu_Overlay_Additive",
}

table.insert(game.ScreenData.KeepsakeRack.ComponentData.Order, "ModsNikkelMHadesBiomesAssistHoverFrame")
game.ScreenData.KeepsakeRack.ComponentData.ModsNikkelMHadesBiomesAssistHoverFrame = {
	Graphic = "BlankObstacle",
	Alpha = 0,
	Scale = 1,
	GroupName = "Combat_Menu_Overlay_Additive",
}
-- #endregion
