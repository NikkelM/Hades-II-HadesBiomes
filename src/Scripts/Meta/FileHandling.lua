function mod.ConfirmHadesInstallation()
	mod.hadesGameFolder = config.hadesGameFolder

	-- "root" means we look for the Hades folder in the same parent directory as Hades II
	if mod.hadesGameFolder == "root" or mod.hadesGameFolder == "" then
		local hadesTwoContentFolder = rom.paths.Content()
		mod.hadesGameFolder = rom.path.combine(rom.path.get_parent(rom.path.get_parent(hadesTwoContentFolder)), "Hades")
	end

	-- Check if the Hades installation is valid (by just confirming the .exe exists)
	local exePath = rom.path.combine(mod.hadesGameFolder, "x64\\Hades.exe")
	if not rom.path.exists(exePath) then
		mod.DebugPrint("Hades installation not found at \"" ..
			exePath ..
			"\". Please set the correct path in the config file. Use \"root\" if the Hades folder is in the same parent directory as Hades II.",
			1)
		return false
	end

	mod.DebugPrint("Hades installation found at " .. mod.hadesGameFolder, 3)
	return true
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

		if cachedChecksumsContent == "" then
			mod.DebugPrint("First game start with the mod installed has been detected. Running first time setup.", 3)
			-- Just in case the user disabled the setting, we will set it to true here
			config.firstTimeSetup = true
		elseif cachedChecksumsContent ~= currentChecksumsContent then
			mod.DebugPrint(
				"Game \"checksums.txt\" does not match the mod's cached \"checksums.txt\". This indicates a game or mod update, the mod will be re-installed.",
				2)
			-- This will cause a re-installation of the mod immediately after this function call
			config.uninstall = "true"
			config.firstTimeSetup = true
		else
			mod.DebugPrint(
				"Game \"checksums.txt\" matches the mod's cached \"checksums.txt\". No game update detected, proceeding normally.",
				3)
		end

		cachedChecksums:close()
		currentChecksums:close()
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
			mod.DebugPrint("File not found: " .. filePath .. " (attempt " .. i .. ")", 1)
		else
			return false
		end
		sleep(delay)
	end
	return false
end

local function checkFilesExist(fileMappings, basePath, extension, failFast)
	local missingFiles = 0
	for src, dest in pairs(fileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), basePath .. dest .. extension)
		if not checkFileExistsWithRetry(destPath, 3, 1, failFast) then
			if not failFast then
				mod.DebugPrint("Missing file: " .. destPath, 1)
			end
			missingFiles = missingFiles + 1
			if failFast then return missingFiles end
		end
	end
	return missingFiles
end

function mod.CheckRequiredFiles(failFast)
	failFast = failFast or false
	local missingFiles = 0

	missingFiles = missingFiles + checkFilesExist(mod.AudioFileMappings, "Audio\\Desktop\\", ".bank", failFast)
	-- We only check once, since with a successful uninstall, there will be at least one missing file here already
	if failFast and missingFiles > 0 then return missingFiles end

	missingFiles = missingFiles + checkFilesExist(mod.PackageFileMappings, "Packages\\1080p\\", ".pkg", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.PackageFileMappings, "Packages\\1080p\\", ".pkg_manifest", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.PackageFileMappings, "Packages\\720p\\", ".pkg", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.PackageFileMappings, "Packages\\720p\\", ".pkg_manifest", failFast)

	missingFiles = missingFiles + checkFilesExist(mod.BikFileMappings, "Movies\\1080p\\", ".bik", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.BikFileMappings, "Movies\\1080p\\", ".bik_atlas", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.BikFileMappings, "Movies\\720p\\", ".bik", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.BikFileMappings, "Movies\\720p\\", ".bik_atlas", failFast)

	missingFiles = missingFiles + checkFilesExist(mod.SjsonFileMappings, "Game\\", ".sjson", failFast)

	missingFiles = missingFiles + checkFilesExist({ mod.HadesFxDestinationFilename }, "", "", failFast)
	missingFiles = missingFiles + checkFilesExist({ mod.HadesGUIAnimationsDestinationFilename }, "", "", failFast)
	missingFiles = missingFiles + checkFilesExist({ mod.HadesPortraitAnimationsDestinationFilename }, "", "", failFast)
	missingFiles = missingFiles +
			checkFilesExist({ mod.HadesCharacterAnimationsNPCsDestinationFilename }, "", "", failFast)

	missingFiles = missingFiles + checkFilesExist(mod.MapFileMappings, "Maps\\", ".map_text", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.MapFileMappings, "Maps\\bin\\", ".thing_bin", failFast)

	missingFiles = missingFiles + checkFilesExist(mod.VoiceoverFileNames, "Audio\\Desktop\\VO\\", ".txt", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.VoiceoverFileNames, "Audio\\Desktop\\VO\\", ".fsb", failFast)

	-- The helpText files in the different languages
	-- _NPCData files are installed differently, so not part of this table by default
	local allHelpTextFileNames = game.DeepCopyTable(mod.HadesHelpTextFileNames) or {}
	table.insert(allHelpTextFileNames, "_NPCData")
	for _, fileName in ipairs(allHelpTextFileNames) do
		for _, language in ipairs(mod.HelpTextLanguages) do
			if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
				local helpTextFile = rom.path.combine(rom.paths.Content(),
					"Game\\Text\\" .. language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language .. ".sjson")
				if not checkFileExistsWithRetry(helpTextFile, 3, 1) then
					mod.DebugPrint("Missing file: " .. helpTextFile, 1)
					missingFiles = missingFiles + 1
				end
			end
		end
	end

	return missingFiles
end

OnAnyLoad {
	function(triggerArgs)
		-- #region Install screens
		-- Only show the install screen if we are in the Training Grounds
		if triggerArgs.name == "Hub_PreRun" then
			-- If we haven't shown the install screen yet, or the installation is invalid
			if (not mod.HiddenConfig.HasShownSuccessfulInstallScreen) or (not mod.HiddenConfig.IsValidInstallation) then
				-- Update the config with the type of screen we are showing
				-- Do it before showing the screen to also have this saved if the user closes the game without closing the screen first
				mod.HiddenConfig.HasShownSuccessfulInstallScreen = mod.HiddenConfig.IsValidInstallation
				mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

				mod.OpenModInstallScreen(mod.HiddenConfig)
			end
		end
		-- #endregion
	end
}

function mod.OpenModInstallScreen(args)
	args = args or {}
	local screen = {}
	if args.IsValidInstallation then
		screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallSuccess) or {}
	else
		screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallFailure) or {}
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
