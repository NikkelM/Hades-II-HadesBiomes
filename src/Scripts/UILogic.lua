function mod.TryImportLanguageFile(fileType, lang)
	if lang == nil then
		lang = game.GetLanguage({})
	end
	local filePath = "Game/Text/" .. lang .. "/" .. fileType .. "." .. lang .. ".sjson.lua"
	-- Try to import the file, silently skip if it doesn't exist
	local success, err = pcall(import, filePath)
	if success then
		mod.DebugPrint("Loaded " .. fileType .. " for " .. lang, 4)
	else
		mod.DebugPrint("Skipping " .. fileType .. " for " .. lang .. " (file not found or error)", 4)
	end
	return success
end

modutil.mod.Path.Wrap("OnLanguageChanged", function(base, args)
	-- TODO: While the files are loaded correctly, the texts aren't loaded into memory as the hooks are only executed on a game start
	local currentLanguage = game.GetLanguage({})

	mod.TryImportLanguageFile("HelpText", currentLanguage)
	mod.TryImportLanguageFile("CodexText", currentLanguage)
	mod.TryImportLanguageFile("ScreenText", currentLanguage)
	mod.TryImportLanguageFile("TraitText", currentLanguage)
	mod.TryImportLanguageFile("MiscText", currentLanguage)

	-- Also always import english files with custom strings in case we are missing localizations
	if currentLanguage ~= "en" then
		mod.TryImportLanguageFile("HelpText", "en")
		mod.TryImportLanguageFile("ScreenText", "en")
		mod.TryImportLanguageFile("TraitText", "en")
	end

	return base(args)
end)
