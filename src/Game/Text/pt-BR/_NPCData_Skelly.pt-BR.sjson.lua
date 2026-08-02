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
  -- --  DisplayName = "Se está tendo dificuldades por aí, garoto, apenas lembre-se de uma coisa: você é um deus, tá legal?! Bem mais forte do que pensa. Se te derem trabalho, é só ativar seu Modo Deus, e mande ver por mim!"
	-- 	DisplayName =
	-- 	"If you're having a rough time out there, boyo, you just remember something: You're a {#DialogueItalicFormat}god{#Prev}, all right?! Way tougher than you think. They give you trouble, you just turn on {#DialogLegendaryFormat}Goddess Mode {#Prev}{#DialogueItalicFormat}(in the mod config){#Prev}, and you let 'em have it for me!"
	-- },
	-- {
	-- 	Id = "Modsnikkelmhadesbiomeszagreushome_1506",
	-- 	InheritFrom = "BaseNarrative",
  -- --  DisplayName = "Você age como se esse {#DialogueItalicFormat}Modo Deus {#PreviousFormat}fosse algum tipo de alavanca que eu posso simplesmente acionar quando quiser para desbloquear minha força latente, parceiro."
	-- 	DisplayName =
	-- 	"You act as though this {#DialogueItalicFormat}Goddess Mode {#Prev}is some sort of lever I can simply switch at will if ever I wish to unlock my latent strength, there, mate."
	-- },
	-- #endregion
}

sjson.hook(NPCDataFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
