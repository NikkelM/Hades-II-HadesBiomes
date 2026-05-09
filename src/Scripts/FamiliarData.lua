-- #region Frinos
-- #region InteractVoiceLines in the tent
local frinosPetVoiceLines = game.FamiliarData.FrogFamiliar.InteractVoiceLines
mod.ReplaceVoiceLineRequirements(frinosPetVoiceLines, "/VO/Melinoe_5201", {
	{
		PathTrue = { "GameState", "ReachedTrueEnding" },
	},
	{
		Path = { "CurrentRun", "RoomsEntered" },
		HasNone = { "D_Boss01" },
	},
})
mod.ReplaceVoiceLineRequirements(frinosPetVoiceLines, "/VO/Melinoe_5202", {
	{
		PathTrue = { "GameState", "ReachedTrueEnding" },
	},
	{
		Path = { "CurrentRun", "RoomsEntered" },
		HasNone = { "D_Boss01" },
	},
})
mod.ReplaceVoiceLineRequirements(frinosPetVoiceLines, "/VO/Melinoe_2847", {
	{
		Path = { "CurrentRun", "RoomsEntered" },
		HasAny = { "I_Boss01", "D_Boss01" },
	},
})
mod.ReplaceVoiceLineRequirements(frinosPetVoiceLines, "/VO/Melinoe_2849", {
	{
		Path = { "CurrentRun", "RoomsEntered" },
		HasAny = { "I_Boss01", "D_Boss01" },
	},
})
mod.ReplaceVoiceLineRequirements(frinosPetVoiceLines, "/VO/Melinoe_0090", {
	{
		Path = { "CurrentRun", "CurrentRoom", "Name", },
		IsNone = { "F_Boss01", "F_Boss02" },
	},
	{
		Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName", },
		IsNone = { "A_Boss01", "A_Boss02", "A_Boss03", "X_Boss01", "X_Boss02" },
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "H", "I", "N", "Tartarus", "Asphodel" },
	},
	{
		Path = { "CurrentRun" },
		HasNone = { "Cleared", "BountyCleared" }
	},
})
-- #endregion
-- #endregion
