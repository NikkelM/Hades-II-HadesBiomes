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
				-- Used to decide which install failure screen to show
				mod.hadesGameFolder = nil
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
			mod.DebugPrint("File not found: " .. filePath .. " (attempt " .. i .. ")", 2)
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

	missingFiles = missingFiles + checkFilesExist(mod.BikFileNames, "Movies\\1080p\\", ".bik", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.BikFileNames, "Movies\\1080p\\", ".bik_atlas", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.BikFileNames, "Movies\\720p\\", ".bik", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.BikFileNames, "Movies\\720p\\", ".bik_atlas", failFast)

	missingFiles = missingFiles + checkFilesExist(mod.CustomBikFileNames, "Movies\\1080p\\", ".bik", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.CustomBikFileNames, "Movies\\1080p\\", ".bik_atlas", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.CustomBikFileNames, "Movies\\720p\\", ".bik", failFast)
	missingFiles = missingFiles + checkFilesExist(mod.CustomBikFileNames, "Movies\\720p\\", ".bik_atlas", failFast)

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
			-- If an uninstall was just attempted, but failed
			if mod.HiddenConfig.MustShowUninstallFailureScreen then
				mod.HiddenConfig.MustShowUninstallFailureScreen = false
				mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

				-- Workaround to have this show up now, but not again on the next game start
				mod.HiddenConfig.MustShowUninstallFailureScreen = true
				mod.OpenModInstallScreen(mod.HiddenConfig)
				mod.HiddenConfig.MustShowUninstallFailureScreen = false
			else
				-- If we haven't shown the install screen yet, or the installation is invalid
				if (not mod.HiddenConfig.HasShownSuccessfulInstallScreen) or (not mod.HiddenConfig.IsValidInstallation) then
					-- Update the config with the type of screen we are showing
					-- Do it before showing the screen to also have this saved if the user closes the game without closing the screen first
					mod.HiddenConfig.HasShownSuccessfulInstallScreen = mod.HiddenConfig.IsValidInstallation
					mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

					mod.OpenModInstallScreen(mod.HiddenConfig)
				end
			end
		end
		-- #endregion
	end
}

function mod.OpenModInstallScreen(args)
	args = args or {}
	local screen = {}
	if args.MustShowUninstallFailureScreen then
		screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesUninstallFailure) or {}
	elseif args.IsValidInstallation then
		screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallSuccess) or {}
	else
		if mod.hadesGameFolder == nil then
			screen = game.DeepCopyTable(game.ScreenData.ModsNikkelMHadesBiomesInstallFailureHadesNotFound) or {}
		else
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
