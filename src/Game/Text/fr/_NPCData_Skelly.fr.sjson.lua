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
  -- --  DisplayName = "Si jamais tu galères dehors, mon gars, souviens-toi de ça : t'es un {#DialogueItalicFormat}dieu{#PreviousFormat}, OK ?! T'es bien plus costaud que tu le penses. Si tes ennemis te cherchent des ennuis, passe en {#DialogueItalicFormat}Mode Divin {#PreviousFormat}et botte-leur les fesses pour moi !"
	-- 	DisplayName =
	-- 	"If you're having a rough time out there, boyo, you just remember something: You're a {#DialogueItalicFormat}god{#Prev}, all right?! Way tougher than you think. They give you trouble, you just turn on {#DialogLegendaryFormat}Goddess Mode {#Prev}{#DialogueItalicFormat}(in the mod config){#Prev}, and you let 'em have it for me!"
	-- },
	-- {
	-- 	Id = "Modsnikkelmhadesbiomeszagreushome_1506",
	-- 	InheritFrom = "BaseNarrative",
  -- --  DisplayName = "Tu parles comme si ce {#DialogueItalicFormat}Mode Divin {#PreviousFormat}est un genre de levier que je peux simplement actionner à volonté au cas où j'aurais envie de libérer ma puissance latente, l’ami."
	-- 	DisplayName =
	-- 	"You act as though this {#DialogueItalicFormat}Goddess Mode {#Prev}is some sort of lever I can simply switch at will if ever I wish to unlock my latent strength, there, mate."
	-- },
	-- #endregion
}

sjson.hook(NPCDataFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
