function mod.ConfirmHadesInstallation()
	mod.hadesGameFolder = config.hadesGameFolder

	-- "root" means we look for the Hades folder in the same parent directory as Hades II
	if mod.hadesGameFolder == "root" or mod.hadesGameFolder == "" then
		local hadesTwoContentFolder = rom.paths.Content()
		mod.hadesGameFolder = rom.path.combine(rom.path.get_parent(rom.path.get_parent(hadesTwoContentFolder)), "Hades")
	end

	-- Check if the Hades installation is valid (by just confirming the .exe exists)
	local exePath = rom.path.combine(mod.hadesGameFolder, "x64\\Hades.exe")
	-- Check for a Steam or Epic installation first
	if not rom.path.exists(exePath) then
		-- If not found, the user may have Hades installed from the Microsoft Store, which uses a different path for the .exe
		local microsoftExePath = rom.path.combine(mod.hadesGameFolder, "Content\\Hades.exe")
		if not rom.path.exists(microsoftExePath) then
			-- If not found, check for the Microsoft Store Path one Content level up, in case the user misunderstood the instructions
			local microsoftBackupExePath = rom.path.combine(mod.hadesGameFolder, "Hades.exe")
			if not rom.path.exists(microsoftBackupExePath) then
				-- Set the invalid installation flag
				mod.HiddenConfig.IsValidInstallation = false
				mod.HiddenConfig.InstallationFailReason = "NoHadesInstallationFound"
				mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
				---@diagnostic disable-next-line: undefined-global
				public.IsValidInstallation = false

				mod.DebugPrint(
					"The mod tried finding your Hades installation at \"" ..
					exePath .. "\" (Steam/Epic) or \"" ..
					microsoftExePath ..
					"\" (Microsoft Store/Game Pass), but did not find it. Please set the correct path in the config file through your mod manager. Use \"root\" if the Hades folder is in the same folder as the Hades II folder.",
					1)

				return false
			end
		else
			-- If the backup path exists, the hadesGameFolder needs to go one "Content" level deeper
			mod.hadesGameFolder = rom.path.combine(mod.hadesGameFolder, "Content")
		end
	end

	mod.DebugPrint("Hades installation found at " .. mod.hadesGameFolder, 3)
	return true
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

-- Compare the contents of plugins_data/checksums.txt and Content/Scripts/checksums.txt
-- If they differ, the game has likely updated and the mod needs to be re-installed
function mod.CompareChecksums()
	local cachedChecksumsPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, "checksums.txt")
	local currentChecksumsPath = rom.path.combine(rom.paths.Content(), "Scripts", "checksums.txt")

	local cachedChecksums = io.open(cachedChecksumsPath, "r")
	local currentChecksums = io.open(currentChecksumsPath, "r")

	if cachedChecksums and currentChecksums then
		local cachedChecksumsContent = cachedChecksums:read("*a")
		local currentChecksumsContent = currentChecksums:read("*a")

		-- It will be empty on first install or mod update, and unequal on game update
		if cachedChecksumsContent == "" or cachedChecksumsContent ~= currentChecksumsContent then
			mod.DebugPrint(
				"Game \"checksums.txt\" does not match the mod's \"checksums.txt\". This indicates a game or mod update or fresh install, the mod will be (re)-installed.",
				2)
			-- This will cause a re-installation of the mod immediately after this function call
			config.uninstall = true
			config.firstTimeSetup = true
		else
			mod.DebugPrint(
				"Game \"checksums.txt\" matches the mod's cached \"checksums.txt\". No game update detected, proceeding normally, please wait...",
				3)
		end

		cachedChecksums:close()
		currentChecksums:close()
	end
end

function mod.RemoveFile(filePath)
	if rom.path.exists(filePath) then
		mod.DebugPrint("Removing file: " .. filePath, 4)
		local success, err = os.remove(filePath)
		if not success then
			mod.DebugPrint("Error removing file: " .. err, 1)
		end
	end
end

local function checkFileExistsWithRetry(filePath, retries, delay, failFast)
	local function sleep(sleepFor)
		local t0 = os.clock()
		while os.clock() - t0 <= sleepFor do end
	end

	for i = 1, retries do
		local file = io.open(filePath, "r")
		if file then
			file:close()
			return true
		end
		if not failFast then
			mod.DebugPrint("File not found: " .. filePath .. " (attempt " .. i .. ")", 2)
		else
			return false
		end
		sleep(delay)
	end
	return false
end

local function checkFilesExist(fileMappings, rootPath, basePath, extension, failFast)
	local missingFiles = 0
	for src, dest in pairs(fileMappings) do
		local destPath = rom.path.combine(rootPath, basePath .. dest .. extension)
		if not checkFileExistsWithRetry(destPath, 3, 0.2, failFast) then
			if not failFast then
				mod.DebugPrint("Missing file: " .. destPath, 1)
			end
			missingFiles = missingFiles + 1
			if failFast then return missingFiles end
		end
	end
	return missingFiles
end

-- Returns a combined list of help text and NPC text file names for iteration
local function getAllHelpAndNPCTextFileNames()
	local allFileNames = game.DeepCopyTable(mod.HadesHelpTextFileNames) or {}
	for fileName, _ in pairs(mod.NPCTextFileNames) do
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

	for _, fileName in ipairs(getAllHelpAndNPCTextFileNames()) do
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
	local contentRoot = rom.paths.Content()
	local sjsonDataRoot = mod.SjsonDataBasePath
	local pluginsDataContentRoot = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, "Content")

	-- Non-SJSON files: checked in the game install directory
	missingFiles = missingFiles + checkFilesExist(mod.AudioFileMappings, contentRoot, "Audio\\Desktop\\", ".bank", failFast)
	-- We only check once, since with a successful uninstall, there will be at least one missing file here already
	if failFast and missingFiles > 0 then return missingFiles end

	missingFiles = missingFiles + checkFilesExist(mod.BikFileNames, contentRoot, "Movies\\1080p\\", ".bik", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.BikFileNames, contentRoot, "Movies\\1080p\\", ".bik_atlas", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.BikFileNames, contentRoot, "Movies\\720p\\", ".bik", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.BikFileNames, contentRoot, "Movies\\720p\\", ".bik_atlas", failFast)

	missingFiles = missingFiles + checkFilesExist(mod.CustomBikFileNames, contentRoot, "Movies\\1080p\\", ".bik", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.CustomBikFileNames, contentRoot, "Movies\\1080p\\", ".bik_atlas", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.CustomBikFileNames, contentRoot, "Movies\\720p\\", ".bik", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.CustomBikFileNames, contentRoot, "Movies\\720p\\", ".bik_atlas", failFast)

	missingFiles = missingFiles + checkFilesExist(mod.MapFileMappings, pluginsDataContentRoot, "Maps\\", ".map_text", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.MapFileMappings, pluginsDataContentRoot, "Maps\\bin\\", ".thing_bin", failFast)

	missingFiles = missingFiles + checkFilesExist(mod.VoiceoverFileNames, contentRoot, "Audio\\Desktop\\VO\\", ".txt", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.VoiceoverFileNames, contentRoot, "Audio\\Desktop\\VO\\", ".fsb", failFast)

	-- SJSON files: placed in the SJSON data directory in plugins_data
	missingFiles = missingFiles + checkFilesExist(mod.SjsonFileMappings, sjsonDataRoot, "", ".sjson", failFast)

	for _, sjsonDataRelativePath in ipairs({
		mod.HadesFxSjsonDataPath,
		mod.HadesGUIAnimationsSjsonDataPath,
		mod.HadesPortraitAnimationsSjsonDataPath,
		mod.HadesCharacterAnimationsNPCsSjsonDataPath,
	}) do
		if not rom.path.exists(rom.path.combine(mod.SjsonDataBasePath, sjsonDataRelativePath)) then
			if not failFast then
				mod.DebugPrint("Missing SJSON data file: " .. sjsonDataRelativePath, 1)
			end
			missingFiles = missingFiles + 1
			if failFast then return missingFiles end
		end
	end

	-- Help text/NPC text SJSON files in the SJSON data directory
	for _, fileName in ipairs(getAllHelpAndNPCTextFileNames()) do
		for _, language in ipairs(mod.HelpTextLanguages) do
			if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
				local sjsonDataRelativePath = "Text\\" .. language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language .. ".sjson"
				if not rom.path.exists(rom.path.combine(mod.SjsonDataBasePath, sjsonDataRelativePath)) then
					mod.DebugPrint("Missing SJSON data file: " .. sjsonDataRelativePath, 1)
					missingFiles = missingFiles + 1
				end
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

		-- #region SJSON Hook validation
		-- Note: Enemies.sjson is currently the sjson file that is loaded before all others, meaning we reset the table there
		local sjsonLoads = mod.CachedSjsonLoadsFile or mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
		local sjsonLoadCount = 0

		for _ in pairs(sjsonLoads) do
			sjsonLoadCount = sjsonLoadCount + 1
		end

		-- Any install failure screens will be shown first
		-- The sjson hook failure screen will only be shown in the Crossroads, or if we are in a modded run
		if not (game.CurrentHubRoom ~= nil and not mod.HiddenConfig.IsValidInstallation)
				and (sjsonLoadCount ~= mod.ExpectedNumSjsonHooks and (game.CurrentHubRoom or (game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun))) then
			mod.DebugPrint(
				sjsonLoadCount ..
				" sjson hooks were executed during this game start, but " ..
				mod.ExpectedNumSjsonHooks .. " were expected! Please restart the game.", 1)
			mod.DebugPrint("The following sjson files were loaded:", 1)
			for sjsonFileName, _ in pairs(sjsonLoads) do
				mod.DebugPrint(" - " .. sjsonFileName, 1)
			end
			mod.OpenModInstallScreen({ IsSjsonLoadError = true })
			-- #endregion

			-- #region Install screens
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
		-- #endregion
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
	return rom.path.combine(mod.SjsonDataBasePath,
		"Text\\" .. language .. "\\Z_ModsNikkelMHadesBiomes" .. speakerName .. "." .. language .. ".sjson")
end
