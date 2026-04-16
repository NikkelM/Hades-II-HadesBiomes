local hadesTwoScreensVFXFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Screens_VFX.sjson")

local hadesTwoScreenVFXModifications = {
	GameStatsIn = {
		-- Need the changed column sizes
		ChainTo = "ModsNikkelMHadesBiomes_GameStatsFront",
		-- Need to remove some frames at the end and speed up to hide the columns moving and resizing
		NumFrames = 12,
		PlaySpeed = 40,
		EndFrame = 12,
	},
	-- Change the ChildAnimation to the X, so that it gets rendered below the two logos
	MainMenuIn = {
		ChildAnimation = "ModsNikkelMHadesBiomes_MainMenuDelay",
	},
	MainMenuLoop = {
		ChildAnimation = "ModsNikkelMHadesBiomes_MainMenuMashupX",
	},
	-- The actual fade is on the _Early variant, this one should simply replace one the Loop starts
	MainMenuLogoOutline = {
		StartScale = 0.6825999,
		StartAlpha = 1,
		Duration = 0,
	},
}

-- These need to be added before the others, as they are inherited from
local addParentAnimations = {
	ModsNikkelMHadesBiomes_MainMenuMashupX_Early = {
		Name = "ModsNikkelMHadesBiomes_MainMenuMashupX_Early",
		FilePath = "NikkelM-HadesBiomesMainMenu\\Screens\\Logo\\MashupX",
		StartScale = 0.5,
		EndScale = 0.505,
		OffsetX = -1051,
		OffsetY = -754.5,
		Duration = 0.5,
		Loop = false,
		HoldLastFrame = true,
		StartAlpha = 0,
		EndAlpha = 1,
		EaseIn = 0,
		EaseOut = 1,
		FlipHorizontal = true,
		ChildAnimation = "ModsNikkelMHadesBiomes_MainMenuMashupLogo_Early",
	},
	ModsNikkelMHadesBiomes_MainMenuMashupLogo_Early = {
		Name = "ModsNikkelMHadesBiomes_MainMenuMashupLogo_Early",
		FilePath = "NikkelM-HadesBiomesMainMenu\\Screens\\Logo\\HadesLogo",
		StartScale = 0.55,
		EndScale = 0.56,
		OffsetX = -820,
		OffsetY = -747,
		Duration = 0.5,
		Loop = false,
		HoldLastFrame = true,
		StartAlpha = 0,
		EndAlpha = 1,
		EaseIn = 0,
		EaseOut = 1,
		-- The original H2 outline/logo
		ChildAnimation = "MainMenuLogoOutline_Early",
	},
	MainMenuLogoOutline_Early = {
		Name = "MainMenuLogoOutline_Early",
		FilePath = "Screens\\MainMenu\\HadesLogoOutline",
		StartScale = 0.6825,
		EndScale = 0.6826,
		OffsetX = -1443.5,
		OffsetY = -762.5,
		Duration = 0.5,
		Loop = false,
		HoldLastFrame = true,
		StartAlpha = 0,
		EndAlpha = 1,
		EaseIn = 0,
		EaseOut = 1,
	},
}

local addAnimations = {
	-- #region Run End Screens
	-- Background image
	ModsNikkelMHadesBiomes_VictoryScreenIllustration_Elysium = {
		Name = "ModsNikkelMHadesBiomes_VictoryScreenIllustration_Elysium",
		InheritFrom = "VictoryScreenIllustration_Underworld",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\VictoryScreen\\VictoryScreenBackground_Elysium",
	},
	-- Badge Rank Vignette
	ModsNikkelMHadesBiomes_RankBadgeVignette = {
		Name = "ModsNikkelMHadesBiomes_RankBadgeVignette",
		Type = "Constant",
		FilePath = "GUI\\HUD\\Badges\\ModsNikkelMHadesBiomes_BadgeRankVignette",
		Material = "Unlit",
	},
	-- Badge Rank Nameplate
	ModsNikkelMHadesBiomes_BadgeNamePlate01 = {
		Name = "ModsNikkelMHadesBiomes_BadgeNamePlate01",
		Type = "Constant",
		FilePath = "GUI\\HUD\\Badges\\Nameplate01_Modded",
		Material = "Unlit",
	},
	-- #endregion
	-- #region Run History Screens
	-- #region Run cleared
	-- #region In/Loop/Out
	{
		Name = "ModsNikkelMHadesBiomes_RunHistoryIn",
		VideoTexture = "RunHistoryInHadesModdedXX",
		NumFrames = 20,
		PlaySpeed = 30,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_RunHistoryLoop",
		Sound = "/SFX/Menu Sounds/RunHistoryUnderworld",
	},
	{
		Name = "ModsNikkelMHadesBiomes_RunHistoryLoop",
		VideoTexture = "RunHistoryLoopHadesModded",
		NumFrames = 150,
		PlaySpeed = 30,
		Material = "Unlit",
		Loop = true,
	},
	{
		Name = "ModsNikkelMHadesBiomes_RunHistoryOut",
		VideoTexture = "RunHistoryInHadesModdedXX",
		NumFrames = 20,
		PlaySpeed = 30,
		Material = "Unlit",
		PlayBackwards = true,
	},
	-- #endregion
	-- #region To/From Blank
	{
		Name = "ModsNikkelMHadesBiomes_RunHistoryTransitionBlankToModded",
		VideoTexture = "RunHistoryTransitionBlankToModdedX",
		NumFrames = 35,
		PlaySpeed = 60,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_RunHistoryLoop",
		Sound = "/SFX/Menu Sounds/RunHistoryUnderworld",
	},
	{
		Name = "ModsNikkelMHadesBiomes_RunHistoryTransitionModdedToBlank",
		VideoTexture = "RunHistoryTransitionBlankToModdedX",
		NumFrames = 20,
		StartFrame = 1,
		EndFrame = 20,
		PlaySpeed = 60,
		Material = "Unlit",
		PlayBackwards = true,
		ChainTo = "RunHistoryLoopBlank",
		Sound = "/SFX/Menu Sounds/RunHistoryCrystalsOut",
	},
	-- #endregion
	-- #endregion
	-- #region Fail
	-- #region In/Loop/Out
	{
		Name = "ModsNikkelMHadesBiomes_RunHistoryInFail",
		VideoTexture = "RunHistoryInModdedFailXXX",
		NumFrames = 20,
		PlaySpeed = 30,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_RunHistoryLoopFail",
		Sound = "/SFX/Menu Sounds/RunHistoryUnderworld",
	},
	{
		Name = "ModsNikkelMHadesBiomes_RunHistoryLoopFail",
		VideoTexture = "RunHistoryLoopModdedFailX",
		NumFrames = 150,
		PlaySpeed = 30,
		Material = "Unlit",
		Loop = true,
	},
	{
		Name = "ModsNikkelMHadesBiomes_RunHistoryOutFail",
		VideoTexture = "RunHistoryInModdedFailXXX",
		NumFrames = 20,
		PlaySpeed = 30,
		Material = "Unlit",
		PlayBackwards = true,
	},
	-- #endregion
	-- #region To/From Blank
	{
		Name = "ModsNikkelMHadesBiomes_RunHistoryTransitionBlankToModdedFail",
		VideoTexture = "RunHistoryTransitionBlankToModdedFailX",
		NumFrames = 35,
		PlaySpeed = 60,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_RunHistoryLoopFail",
		Sound = "/SFX/Menu Sounds/RunHistoryUnderworld",
	},
	{
		Name = "ModsNikkelMHadesBiomes_RunHistoryTransitionModdedFailToBlank",
		VideoTexture = "RunHistoryTransitionBlankToModdedFailX",
		NumFrames = 20,
		StartFrame = 1,
		EndFrame = 20,
		PlaySpeed = 60,
		Material = "Unlit",
		PlayBackwards = true,
		ChainTo = "RunHistoryLoopBlank",
		Sound = "/SFX/Menu Sounds/RunHistoryCrystalsOut",
	},
	-- #endregion
	-- #endregion
	-- #endregion
	-- #region GameStats Screen
	ModsNikkelMHadesBiomes_GameStatsFront = {
		Name = "ModsNikkelMHadesBiomes_GameStatsFront",
		FilePath = "NikkelM-HadesBiomesCosmetics\\GUI\\Screens\\GameStats\\GameStats_Front_Modded",
		Material = "Unlit",
	},
	-- #endregion
	-- #region Main Menu
	-- Dummy animation that's only there to delay the logo fade-in
	ModsNikkelMHadesBiomes_MainMenuDelay = {
		Name = "ModsNikkelMHadesBiomes_MainMenuDelay",
		ChainTo = "ModsNikkelMHadesBiomes_MainMenuMashupX_Early",
		Duration = 1.7,
	},
	ModsNikkelMHadesBiomes_MainMenuMashupX = {
		Name = "ModsNikkelMHadesBiomes_MainMenuMashupX",
		FilePath = "NikkelM-HadesBiomesMainMenu\\Screens\\Logo\\MashupX",
		StartScale = 0.5049999,
		EndScale = 0.505,
		OffsetX = -180,
		OffsetY = -425,
		Duration = 0,
		Loop = false,
		HoldLastFrame = true,
		StartAlpha = 1,
		EndAlpha = 1,
		EaseIn = 0,
		EaseOut = 1,
		FlipHorizontal = true,
		ChildAnimation = "ModsNikkelMHadesBiomes_MainMenuMashupLogo",
	},
	ModsNikkelMHadesBiomes_MainMenuMashupLogo = {
		Name = "ModsNikkelMHadesBiomes_MainMenuMashupLogo",
		FilePath = "NikkelM-HadesBiomesMainMenu\\Screens\\Logo\\HadesLogo",
		StartScale = 0.5599999,
		EndScale = 0.56,
		OffsetX = 250,
		OffsetY = -370,
		Duration = 0,
		Loop = false,
		HoldLastFrame = true,
		StartAlpha = 1,
		EndAlpha = 1,
		EaseIn = 0,
		EaseOut = 1,
		-- The original H2 outline/logo
		ChildAnimation = "MainMenuLogoOutline",
	},
	-- #endregion
}

sjson.hook(hadesTwoScreensVFXFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["GUI_Screens_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addParentAnimations, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoScreenVFXModifications)
end)
