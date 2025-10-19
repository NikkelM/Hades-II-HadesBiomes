-- Adds EncounterData for the Surface from Hades to Hades II
local encounterData = mod.LoadHadesEncounterData("EncounterData.lua") or {}
local encounterDataSurface = {
	-- Generic encounters
	Surface = encounterData.Surface,
	Story_Persephone_01 = encounterData.Story_Persephone_01,
}

mod.UpdateField(encounterDataSurface, "Generated", "ModsNikkelMHadesBiomesGenerated", { "InheritFrom" },
	"EncounterDataSurface")

-- For tables that should be replaced. The modifications append table data!
-- Can still use modifications if the modified table did not exist beforehand
local encounterReplacements = {
	-- Story_Persephone_01 = {},
}

local encounterModifications = {
	-- Story_Persephone_01 = {},
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataSurface, encounterModifications, encounterReplacements)
