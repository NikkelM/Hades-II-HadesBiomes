local NPCDataFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\de\\_NPCData_Skelly.de.sjson")

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
}

local newData = {
	-- #region Goddess Mode intro (updated base game text, changing God Mode to Goddess Mode)
	-- {
	-- 	Id = "Modsnikkelmhadesbiomesskelly_0367",
	-- 	InheritFrom = "BaseNarrative",
  -- --  DisplayName = "Если тебе там придётся несладко, малец, вспомни вот что: ты бог, усёк?! Ты намного крепче, чем может показаться. И когда вражины на тебя крепко насядут, просто врубай божественный режим и врежь им за меня как следует!"
	-- 	DisplayName =
	-- 	"If you're having a rough time out there, boyo, you just remember something: You're a {#DialogueItalicFormat}god{#Prev}, all right?! Way tougher than you think. They give you trouble, you just turn on {#DialogLegendaryFormat}Goddess Mode {#Prev}{#DialogueItalicFormat}(in the mod config){#Prev}, and you let 'em have it for me!"
	-- },
	-- {
	-- 	Id = "Modsnikkelmhadesbiomeszagreushome_1506",
	-- 	InheritFrom = "BaseNarrative",
  -- --  DisplayName = "Приятель, ты говоришь так, будто этот божественный режим можно просто взять и включить, когда потребуется дополнительная сила."
	-- 	DisplayName =
	-- 	"You act as though this {#DialogueItalicFormat}Goddess Mode {#Prev}is some sort of lever I can simply switch at will if ever I wish to unlock my latent strength, there, mate."
	-- },
	-- #endregion
}

sjson.hook(NPCDataFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
