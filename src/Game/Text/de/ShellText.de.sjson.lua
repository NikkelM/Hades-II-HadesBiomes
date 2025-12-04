local shellTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\de\\ShellText.de.sjson")

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {}

local installHadesModsFailureText =
"Are you trying to install {#DialogLegendaryFormat}Zagreus' Journey{#Prev}? Make sure you {#DialogLegendaryFormat}uninstall mods for Hades {#Prev}first! Delete the {#DialogLegendaryFormat}Mods {#Prev}folder in your Hades installation, and {#DialogLegendaryFormat}run modimporter.exe{#Prev}! Then reinstall the mod by setting {#DialogLegendaryFormat}firstTimeSetup {#Prev}and {#DialogLegendaryFormat}uninstall {#Prev}to {#DialogLegendaryFormat}true {#Prev}in the mod's config in your mod manager. "

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
						tostring(value.Mode) .. "' for entry Id '" .. entry.Id .. "' in ScreenText.de.sjson", 4)
				end
			end
		end
	end
end)
