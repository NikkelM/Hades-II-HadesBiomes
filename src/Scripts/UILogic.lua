local function tryImportLanguageFile(fileType, lang)
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

	tryImportLanguageFile("HelpText", currentLanguage)
	tryImportLanguageFile("CodexText", currentLanguage)
	tryImportLanguageFile("ScreenText", currentLanguage)
	tryImportLanguageFile("TraitText", currentLanguage)
	tryImportLanguageFile("MiscText", currentLanguage)

	base(args)
end)
