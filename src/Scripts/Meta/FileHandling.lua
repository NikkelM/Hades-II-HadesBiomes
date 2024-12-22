function mod.ConfirmHadesInstallation()
	-- First, set up the folder in which the Hades installation is located
	mod.hadesGameFolder = config.hadesGameFolder

	-- "root" means we look for the Hades folder in the same parent directory as Hades II
	if mod.hadesGameFolder == "root" or mod.hadesGameFolder == "" then
		local hadesTwoContentFolder = rom.paths.Content()
		mod.hadesGameFolder = rom.path.combine(rom.path.get_parent(rom.path.get_parent(hadesTwoContentFolder)), "Hades")
	end

	-- Check if the Hades installation is valid (by just confirming the .exe exists)
	local exePath = rom.path.combine(mod.hadesGameFolder, "x64\\Hades.exe")
	if not rom.path.exists(exePath) then
		error("Hades installation not found at \"" ..
			exePath ..
			"\". Please set the correct path in the config file. Use \"root\" if the Hades folder is in the same parent directory as Hades II.")
		return false
	end

	print("Hades installation found at " .. mod.hadesGameFolder)
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
		if cachedChecksumsContent ~= currentChecksumsContent then
			print(
				"Game \"checksums.txt\" does not match the mod's cached \"checksums.txt\". This indicates a game update, the mod will be re-installed.")
			-- This will cause a re-installation of the mod immediately after this function call
			config.uninstall = true
			config.firstTimeSetup = true
		else
			print("Game \"checksums.txt\" matches the mod's cached \"checksums.txt\". No game update detected.")
		end
		cachedChecksums:close()
		currentChecksums:close()
	end
end
