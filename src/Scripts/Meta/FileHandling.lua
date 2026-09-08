function mod.ConfirmHadesInstallation()
	mod.hadesGameFolder = config.debugging.hadesGameFolder or "root"

	-- Clean leading/trailing quotes, spaces and apostrophes from user-provided path
	mod.hadesGameFolder = mod.hadesGameFolder:gsub("^[\"'%s]+", ""):gsub("[\"'%s]+$", "")

	local candidateFolders = {}
	-- "root" means we look for the Hades folder in the same parent directory as Hades II
	if mod.hadesGameFolder == "root" or mod.hadesGameFolder == "" then
		local sharedFolder = rom.path.get_parent(rom.path.get_parent(rom.paths.Content()))
		for _ = 1, 3 do
			if sharedFolder == "" then
				break
			end

			-- Steam
			table.insert(candidateFolders, rom.path.combine(sharedFolder, "Hades"))
			-- Epic Games
			table.insert(candidateFolders, rom.path.combine(sharedFolder, "Hades\\Hades"))
			-- Microsoft Store
			table.insert(candidateFolders, rom.path.combine(sharedFolder, "Hades\\Content"))
			sharedFolder = rom.path.get_parent(sharedFolder)
		end
	else
		table.insert(candidateFolders, mod.hadesGameFolder)
		-- In case the user pointed at the x64/x86 subfolder, or at the folder above a Microsoft Store install
		local parentFolder = rom.path.get_parent(mod.hadesGameFolder)
		if parentFolder ~= "" then
			table.insert(candidateFolders, parentFolder)
		end
		table.insert(candidateFolders, rom.path.combine(mod.hadesGameFolder, "Content"))
	end

	for _, candidateFolder in ipairs(candidateFolders) do
		-- Steam and Epic ship the executable in an x64 subfolder, the Microsoft Store version sits directly in the game folder
		if rom.path.exists(rom.path.combine(candidateFolder, "x64\\Hades.exe")) or rom.path.exists(rom.path.combine(candidateFolder, "Hades.exe")) then
			if candidateFolder ~= mod.hadesGameFolder then
				mod.DebugPrint(
					"Corrected the hadesGameFolder path from " ..
					tostring(config.debugging.hadesGameFolder) .. " to " .. candidateFolder, 4)
				config.debugging.hadesGameFolder = candidateFolder
			end

			mod.hadesGameFolder = candidateFolder
			mod.DebugPrint("Hades installation found at " .. mod.hadesGameFolder, 3)
			return true
		end
	end

	-- Set the invalid installation flag
	mod.HiddenConfig.IsValidInstallation = false
	mod.HiddenConfig.InstallationFailReason = "NoHadesInstallationFound"
	mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
	---@diagnostic disable-next-line: undefined-global
	public.IsValidInstallation = false

	mod.DebugPrint(
		"The mod looked for your Hades installation in the following locations, but did not find it: \"" ..
		table.concat(candidateFolders, "\", \"") ..
		"\". Please set the \"hadesGameFolder\" path in the config file through your mod manager, or leave it as \"root\" to search next to your Hades II installation automatically." ..
		"\nThe path must point at the folder that contains the Hades executable, which by default is:" ..
		"\n - Steam: C:\\Program Files (x86)\\Steam\\steamapps\\common\\Hades" ..
		"\n - Epic Games: C:\\Program Files\\Epic Games\\Hades\\Hades" ..
		"\n - Microsoft Store/Game Pass: C:\\XboxGames\\Hades\\Content",
		1)

	return false
end

function mod.AreIncompatibleModsInstalled()
	-- Thunderstore mod dependency strings (without versions) of incompatible mods
	local incompatibleModDependencyStrings = {
		"ellomenop-SortedStatScreen",
	}

	local anyIncompatible = false
	local mods = rom.mods
	for _, modDependencyString in ipairs(incompatibleModDependencyStrings) do
		if mods[modDependencyString] then
			anyIncompatible = true
			mod.DebugPrint("The mod detected that you have a potentially incompatible mod installed: " .. modDependencyString,
				1)
		end
	end

	return anyIncompatible
end

function mod.RemoveFile(filePath)
	if rom.path.exists(filePath) then
		mod.DebugPrint("[Uninstall] Removing file: " .. filePath, 4)
		local success, err = os.remove(filePath)
		if not success then
			mod.DebugPrint("[Uninstall] Error removing file: " .. err, 1)
		end
	end
end

local function checkFileExists(filePath)
	local file = io.open(filePath, "r")
	if not file then
		return false
	end
	file:close()
	return true
end

local function checkFilesExist(fileMappings, rootPath, basePath, extension, failFast)
	local missingFiles = 0
	for src, dest in pairs(fileMappings) do
		local destPath = rom.path.combine(rootPath, basePath .. dest .. extension)
		if not checkFileExists(destPath) then
			mod.DebugPrint("Missing file: " .. destPath, 1)
			missingFiles = missingFiles + 1
			if failFast then return missingFiles end
		end
	end
	return missingFiles
end

-- Every text file name the install generates, including the NPC text files that copyHadesNPCTexts writes
function mod.GetAllGeneratedTextFileNames()
	local allFileNames = mod.GetAllHadesTextFileNames()
	for fileName, _ in pairs(mod.NPCTextFileNames) do
		table.insert(allFileNames, fileName)
	end

	return allFileNames
end

-- The text files copyHadesTextFiles copies, NPC text files are excluded as their entries are filtered by speaker instead
function mod.GetAllHadesTextFileNames()
	local allFileNames = {}
	for _, fileName in ipairs(mod.HadesTextFileNames) do
		table.insert(allFileNames, fileName)
	end
	for _, fileName in ipairs(mod.HadesHelpTextFileNames) do
		table.insert(allFileNames, fileName)
	end
	return allFileNames
end

-- #region Legacy cleanup to remove files copied to the game install directory (for migration from mod versions before 1.0.0)
function mod.RemoveLegacySjsonFilesFromContent()
	for src, dest in pairs(mod.SjsonFileMappings) do
		mod.RemoveFile(rom.path.combine(rom.paths.Content(), "Game\\" .. dest .. ".sjson"))
	end

	mod.RemoveFile(rom.path.combine(rom.paths.Content(), "Game\\" .. mod.HadesFxSjsonDataPath))
	mod.RemoveFile(rom.path.combine(rom.paths.Content(), "Game\\" .. mod.HadesGUIAnimationsSjsonDataPath))
	mod.RemoveFile(rom.path.combine(rom.paths.Content(), "Game\\" .. mod.HadesPortraitAnimationsSjsonDataPath))
	mod.RemoveFile(rom.path.combine(rom.paths.Content(), "Game\\" .. mod.HadesCharacterAnimationsNPCsSjsonDataPath))

	for _, fileName in ipairs(mod.GetAllGeneratedTextFileNames()) do
		for _, language in ipairs(mod.HelpTextLanguages) do
			if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
				mod.RemoveFile(rom.path.combine(rom.paths.Content(),
					"Game\\Text\\" .. language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language .. ".sjson"))
			end
		end
	end

	local languages = {}
	for key, value in pairs(mod.SubtitleCsvFolderNames or {}) do
		for _, language in ipairs(value) do
			languages[language] = true
		end
	end
	for language, _ in pairs(languages) do
		for speakerName, _ in pairs(mod.SubtitleCsvFileNameMappings or {}) do
			mod.RemoveFile(rom.path.combine(rom.paths.Content(),
				"Game\\Text\\" .. language .. "\\Z_ModsNikkelMHadesBiomes" .. speakerName .. "." .. language .. ".sjson"))
		end
	end
end

-- #endregion

function mod.CheckRequiredFiles(failFast)
	failFast = failFast or false
	local missingFiles = 0
	local sjsonDataRoot = _PLUGIN.sjson_data_path
	local pluginsDataContentRoot = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, "Content")

	-- Non-SJSON files: checked in the game install directory
	missingFiles = missingFiles +
			checkFilesExist(mod.AudioFileMappings, pluginsDataContentRoot, "Audio\\Desktop\\", ".bank", failFast)
	-- We only check once, since with a successful uninstall, there will be at least one missing file here already
	if failFast and missingFiles > 0 then return missingFiles end

	missingFiles = missingFiles +
			checkFilesExist(mod.BikFileNames, pluginsDataContentRoot, "Movies\\1080p\\", ".bik", failFast)
	missingFiles = missingFiles +
			checkFilesExist(mod.BikFileNames, pluginsDataContentRoot, "Movies\\1080p\\", ".bik_atlas", failFast)
	missingFiles = missingFiles +
			checkFilesExist(mod.BikFileNames, pluginsDataContentRoot, "Movies\\720p\\", ".bik", failFast)
	missingFiles = missingFiles +
			checkFilesExist(mod.BikFileNames, pluginsDataContentRoot, "Movies\\720p\\", ".bik_atlas", failFast)

	missingFiles = missingFiles +
			checkFilesExist(mod.CustomBikFileNames, pluginsDataContentRoot, "Movies\\1080p\\", ".bik", failFast)
	missingFiles = missingFiles +
			checkFilesExist(mod.CustomBikFileNames, pluginsDataContentRoot, "Movies\\1080p\\", ".bik_atlas", failFast)
	missingFiles = missingFiles +
			checkFilesExist(mod.CustomBikFileNames, pluginsDataContentRoot, "Movies\\720p\\", ".bik", failFast)
	missingFiles = missingFiles +
			checkFilesExist(mod.CustomBikFileNames, pluginsDataContentRoot, "Movies\\720p\\", ".bik_atlas", failFast)

	missingFiles = missingFiles +
			checkFilesExist(mod.MapFileMappings, pluginsDataContentRoot, "Maps\\", ".map_text", failFast)
	missingFiles = missingFiles +
			checkFilesExist(mod.MapFileMappings, pluginsDataContentRoot, "Maps\\bin\\", ".thing_bin", failFast)

	missingFiles = missingFiles +
			checkFilesExist(mod.VoiceoverFileNames, pluginsDataContentRoot, "Audio\\Desktop\\VO\\", ".txt", failFast)
	missingFiles = missingFiles +
			checkFilesExist(mod.VoiceoverFileNames, pluginsDataContentRoot, "Audio\\Desktop\\VO\\", ".fsb", failFast)

	-- SJSON files: placed in the SJSON data directory in plugins_data
	missingFiles = missingFiles + checkFilesExist(mod.SjsonFileMappings, sjsonDataRoot, "", ".sjson", failFast)

	for _, sjsonDataRelativePath in ipairs({
		mod.HadesFxSjsonDataPath,
		mod.HadesGUIAnimationsSjsonDataPath,
		mod.HadesPortraitAnimationsSjsonDataPath,
		mod.HadesCharacterAnimationsNPCsSjsonDataPath,
		mod.HadesCharacterAnimationsEnemiesSjsonDataPath,
		mod.HadesEnemyAnimationsSjsonDataPath,
	}) do
		if not rom.path.exists(rom.path.combine(_PLUGIN.sjson_data_path, sjsonDataRelativePath)) then
			if not failFast then
				mod.DebugPrint("Missing SJSON data file: " .. sjsonDataRelativePath, 1)
			end
			missingFiles = missingFiles + 1
			if failFast then return missingFiles end
		end
	end

	-- Help text/NPC text SJSON files in the SJSON data directory
	for _, fileName in ipairs(mod.GetAllGeneratedTextFileNames()) do
		for _, language in ipairs(mod.HelpTextLanguages) do
			if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
				local sjsonDataRelativePath = "Text\\" ..
						language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language .. ".sjson"
				if not rom.path.exists(rom.path.combine(_PLUGIN.sjson_data_path, sjsonDataRelativePath)) then
					mod.DebugPrint("Missing SJSON data file: " .. sjsonDataRelativePath, 1)
					missingFiles = missingFiles + 1
				end
			end
		end
	end

	-- Subtitle SJSON files parsed from the Hades .csv files, one per language and speaker
	local subtitleLanguages = {}
	for _, targetFolderNames in pairs(mod.SubtitleCsvFolderNames or {}) do
		for _, language in ipairs(targetFolderNames) do
			subtitleLanguages[language] = true
		end
	end
	for language, _ in pairs(subtitleLanguages) do
		for speakerName, _ in pairs(mod.SubtitleCsvFileNameMappings or {}) do
			local subtitlePath = mod.GetSubtitleSjsonPath(language, speakerName)
			if not rom.path.exists(subtitlePath) then
				if not failFast then
					mod.DebugPrint("Missing subtitle SJSON data file: " .. subtitlePath, 1)
				end
				missingFiles = missingFiles + 1
				if failFast then return missingFiles end
			end
		end
	end

	return missingFiles
end

-- To not keep loading the file on each OnAnyLoad
mod.CachedSjsonLoadsFile = nil
OnAnyLoad {
	function(triggerArgs)
		-- This engine function hook does not get reset on lua state reset it seems, so if the mod was uninstalled during game start, we don't want to run it when loading a save
		if not config.enabled then return end

		local sjsonLoads = mod.CachedSjsonLoadsFile or mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
		local sjsonLoadCount = 0

		for _ in pairs(sjsonLoads) do
			sjsonLoadCount = sjsonLoadCount + 1
		end

		-- Any install failure screens will be shown before the half-loaded or sjson screens can show
		-- Will only be shown in the Crossroads, or if we are in a modded run
		if not mod.FinishedLoading
				-- Not in the hub OR the installation is valid - this ensures invalid install screens show first if we are in a hub room
				and (game.CurrentHubRoom == nil or mod.HiddenConfig.IsValidInstallation)
				and (game.CurrentHubRoom or (game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun)) then
			mod.DebugPrint(
				"The mod did not finish loading correctly, though it seems to be installed properly. Please check the log above for errors and try reinstalling the mod.",
				1)
			-- Not passing any args so that the generic invalid install screen is shown
			mod.OpenModInstallScreen()
			-- Will only be shown in the Crossroads, or if we are in a modded run
		elseif sjsonLoadCount ~= mod.ExpectedNumSjsonHooks
				and (game.CurrentHubRoom == nil or mod.HiddenConfig.IsValidInstallation)
				and (game.CurrentHubRoom or (game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun)) then
			mod.DebugPrint(
				sjsonLoadCount ..
				" sjson hooks were executed during this game start, but " ..
				mod.ExpectedNumSjsonHooks .. " were expected! Please restart the game.", 1)
			mod.DebugPrint("The following sjson files were loaded:", 1)
			for sjsonFileName, _ in pairs(sjsonLoads) do
				mod.DebugPrint(" - " .. sjsonFileName, 1)
			end
			mod.OpenModInstallScreen({ IsSjsonLoadError = true })

			-- Only show the install screen if we are in the Crossroads
		elseif game.CurrentHubRoom ~= nil and game.CurrentHubRoom.Name == "Hub_PreRun" then
			-- If an uninstall was just attempted, but failed
			if mod.HiddenConfig.MustShowUninstallFailureScreen then
				mod.HiddenConfig.MustShowUninstallFailureScreen = false
				mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

				-- Workaround to have this show up now, but not again on the next game start
				mod.HiddenConfig.MustShowUninstallFailureScreen = true
				mod.OpenModInstallScreen(mod.HiddenConfig)
				-- Don't need to save to the file as it's already saved above
				mod.HiddenConfig.MustShowUninstallFailureScreen = false
			else
				-- A pending install on map load means it didn't complete correctly, so throw an error
				if mod.InstallationPending then
					mod.DebugPrint("The installation never completed, marking it as invalid.", 1)
					mod.HiddenConfig.IsValidInstallation = false
					if mod.HiddenConfig.InstallationFailReason == "" then
						mod.HiddenConfig.InstallationFailReason = "MissingFiles"
					end
					---@diagnostic disable-next-line: undefined-global
					public.IsValidInstallation = false
				end

				-- If we haven't shown the install screen yet, or the installation is invalid, or we must show the warning about incompatible mods
				if not mod.HiddenConfig.HasShownSuccessfulInstallScreen or not mod.HiddenConfig.IsValidInstallation or mod.HiddenConfig.MustShowIncompatibleModsInstallScreen then
					-- Update the config with the type of screen we are showing
					-- Do it before showing the screen to also have this saved if the user closes the game without closing the screen first
					mod.HiddenConfig.HasShownSuccessfulInstallScreen = mod.HiddenConfig.IsValidInstallation
					mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

					mod.OpenModInstallScreen(mod.HiddenConfig)
					if mod.HiddenConfig.MustShowIncompatibleModsInstallScreen then
						mod.HiddenConfig.MustShowIncompatibleModsInstallScreen = false
						mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
					end
				end
			end
		end
	end
}

function mod.OpenModInstallScreen(args)
	args = args or {}
	local screen = {}

	-- For the Sjson load errors
	if args.IsSjsonLoadError then
		screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesSjsonLoadError) or {}
	elseif args.MustShowUninstallFailureScreen then
		screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesUninstallFailure) or {}
	elseif args.IsValidInstallation then
		if args.MustShowIncompatibleModsInstallScreen then
			-- Mods that are marked as incompatible with Zagreus' Journey are installed
			screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallFailureIncompatibleModsInstalled) or {}
		else
			screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallSuccess) or {}
		end
	else
		if args.InstallationFailReason == "NoHadesInstallationFound" then
			screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallFailureHadesNotFound) or {}
		elseif args.InstallationFailReason == "HadesModsInstalled" then
			screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallFailureHadesModsInstalled) or {}
		elseif args.InstallationFailReason == "MissingFiles" then
			screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallFailureMissingFiles) or {}
		elseif args.InstallationFailReason == "HadesNotUpdated" then
			-- Either the Hades install is not updated, or, more likely, the Hades install is pirated
			screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallFailureHadesNotUpdated) or {}
		else
			-- Generic fallback
			screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallFailure) or {}
		end
	end
	local components = screen.Components
	game.OnScreenOpened(screen)
	game.CreateScreenFromData(screen, screen.ComponentData)
	TeleportCursor({ DestinationId = components.ConfirmButton.Id, ForceUseCheck = true })
	SetConfigOption({ Name = "ExclusiveInteractGroup", Value = "Combat_Menu_TraitTray_Overlay" })
	SetColor({ Id = components.BackgroundTint.Id, Color = Color.Black })
	SetAlpha({ Id = components.BackgroundTint.Id, Fraction = 0.0, Duration = 0 })
	SetAlpha({ Id = components.BackgroundTint.Id, Fraction = 0.9, Duration = 0.3 })
	game.wait(0.3)
	screen.KeepOpen = true
	game.HandleScreenInput(screen)
end

function mod.ConfirmExitInstallSuccessScreen(screen)
	SetConfigOption({ Name = "ExclusiveInteractGroup", Value = nil })
	game.OnScreenCloseStarted(screen)
	game.CloseScreen(game.GetAllIds(screen.Components), 0.15)
	game.OnScreenCloseFinished(screen)
end

---Used by both the install and uninstall scripts to get the paths for sjson subtitle files that are created from Hades CSV files
---@param language string The language shorthand, e.g. "en"
---@param speakerName string The name of the speaker with which the subtitle CSV file is associated, e.g. "MegaeraField"
---@return string destPath The absolute path to the sjson subtitle file in the SJSON data directory
function mod.GetSubtitleSjsonPath(language, speakerName)
	return rom.path.combine(_PLUGIN.sjson_data_path,
		"Text\\" .. language .. "\\Z_ModsNikkelMHadesBiomes" .. speakerName .. "." .. language .. ".sjson")
end
