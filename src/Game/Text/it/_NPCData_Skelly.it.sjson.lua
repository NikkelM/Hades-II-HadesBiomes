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
  -- --  DisplayName = "Se te la passi male là fuori, ricordati una cosa, ciccio: tu sei un {#DialogueItalicFormat}dio{#PreviousFormat}, ok?! Sei molto più tosto di quanto tu creda. Se qualcuno ti dà noia, vai di {#DialogueItalicFormat}Modalità Dio {#PreviousFormat}e vedrai come se la daranno a gambe!"
	-- 	DisplayName =
	-- 	"If you're having a rough time out there, boyo, you just remember something: You're a {#DialogueItalicFormat}god{#Prev}, all right?! Way tougher than you think. They give you trouble, you just turn on {#DialogLegendaryFormat}Goddess Mode {#Prev}{#DialogueItalicFormat}(in the mod config){#Prev}, and you let 'em have it for me!"
	-- },
	-- {
	-- 	Id = "Modsnikkelmhadesbiomeszagreushome_1506",
	-- 	InheritFrom = "BaseNarrative",
  -- --  DisplayName = "A sentirti, amico, si direbbe quasi che questa {#DialogueItalicFormat}Modalità Dio {#Prev}sia una sorta di opzione che possa attivare a piacimento per dar sfogo alla mia forza latente."
	-- 	DisplayName =
	-- 	"You act as though this {#DialogueItalicFormat}Goddess Mode {#Prev}is some sort of lever I can simply switch at will if ever I wish to unlock my latent strength, there, mate."
	-- },
	-- #endregion
}

sjson.hook(NPCDataFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
