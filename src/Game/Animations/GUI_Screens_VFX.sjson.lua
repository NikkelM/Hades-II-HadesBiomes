local hadesTwoScreensVFXFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Screens_VFX.sjson")

local hadesTwoScreenVFXModifications = {}

-- These need to be added before the others, as they are inherited from
local addParentAnimations = {}

local addAnimations = {
	-- #region Run End Screens
	ModsNikkelMHadesBiomes_VictoryScreenIllustration_Elysium = {
		Name = "ModsNikkelMHadesBiomes_VictoryScreenIllustration_Elysium",
		InheritFrom = "VictoryScreenIllustration_Underworld",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\VictoryScreen\\VictoryScreenBackground_Elysium",
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
}

sjson.hook(hadesTwoScreensVFXFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addParentAnimations, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoScreenVFXModifications)
end)
