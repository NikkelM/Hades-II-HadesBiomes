local shellTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\fr\\ShellText.fr.sjson")

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
	"Description",
	"OverwriteLocalization",
}

local newData = {}

local installHadesModsFailureText =
"Essayez-vous d'installer {#DialogLegendaryFormat}Zagreus' Journey{#Prev} ? Assurez-vous d'abord de {#DialogLegendaryFormat}désintaller vos mods d'Hades I{#Prev}. Supprimez ou renommez le dossier {#DialogLegendaryFormat}Mods {#Prev}de votre installation d'Hades, puis lancez {#DialogLegendaryFormat}modimporter.exe{#Prev}. Réinstallez ensuite le mod en réglant {#DialogLegendaryFormat}firstTimeSetup {#Prev}et {#DialogLegendaryFormat}uninstall {#Prev} sur {#DialogLegendaryFormat}true {#Prev}dans la config du mod."

local modifiedEntries = {
	FileAccessErrorPC = {
		Description = {
			Mode = "Prepend",
			Text = installHadesModsFailureText,
		},
	},
	DataFileCorrupt = {
		Description = {
			Mode = "Prepend",
			Text = installHadesModsFailureText,
		},
	},
}

sjson.hook(shellTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)

	for _, entry in ipairs(data.Texts) do
		local modifiedEntry = modifiedEntries[entry.Id]
		if modifiedEntry then
			for key, value in pairs(modifiedEntry) do
				if value.Mode == "Prepend" then
					entry[key] = value.Text .. (entry[key] or "")
				elseif value.Mode == "Append" then
					entry[key] = (entry[key] or "") .. value.Text
				elseif value.Mode == "Replace" then
					entry[key] = value
				else
					mod.DebugPrint("Unknown modification mode '" ..
						tostring(value.Mode) .. "' for entry Id '" .. entry.Id .. "' in ScreenText.fr.sjson", 4)
				end
			end
		end
	end
end)
