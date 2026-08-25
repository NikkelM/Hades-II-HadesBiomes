---@meta _
-- grabbing our dependencies,
-- these funky (---@) comments are just there
--	 to help VS Code find the definitions of things

import = require

---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@module "SGG_Modding-ENVY-auto"
mods["SGG_Modding-ENVY"].auto()
-- ^ this gives us `public` and `import`, among others
--	and makes all globals we define private to this plugin.
---@diagnostic disable: lowercase-global

---@diagnostic disable-next-line: undefined-global
rom = rom
---@diagnostic disable-next-line: undefined-global
_PLUGIN = _PLUGIN

-- get definitions for the game's globals
---@module "game"
game = rom.game
---@module "game-import"
---@diagnostic disable-next-line: undefined-global
import_as_fallback(game)

---@module "SGG_Modding-SJSON"
sjson = mods["SGG_Modding-SJSON"]
---@module "SGG_Modding-ModUtil"
modutil = mods["SGG_Modding-ModUtil"]

---@module "SGG_Modding-Chalk"
chalk = mods["SGG_Modding-Chalk"]
---@module "SGG_Modding-ReLoad"
reload = mods["SGG_Modding-ReLoad"]

---@module "config"
config = chalk.auto "config.lua"
-- ^ this updates our `.cfg` file in the config folder!
---@diagnostic disable-next-line: undefined-global
public.config = config -- so other mods can access our config

-- #region Config migration
-- Version for mod_settings config handling
--[==[
local function snapshotConfigSections()
	local sections = {}
	local ok, configFolder = pcall(rom.paths.config)
	if not ok or configFolder == nil then
		return sections
	end
	local file = io.open(rom.path.combine(configFolder, _PLUGIN.guid .. ".cfg"), "r")
	if file == nil then
		return sections
	end
	local currentSection = nil
	for line in file:lines() do
		-- Strip a leading UTF-8 BOM and surrounding whitespace, then ignore blank lines and comments
		local trimmed = line:gsub("^\239\187\191", ""):match("^%s*(.-)%s*$")
		if trimmed ~= "" and trimmed:sub(1, 1) ~= "#" then
			local section = trimmed:match("^%[(.+)%]$")
			if section ~= nil then
				currentSection = section
				sections[currentSection] = sections[currentSection] or {}
			elseif currentSection ~= nil then
				local key = trimmed:match("^(.-)%s*=")
				if key ~= nil and key ~= "" then
					sections[currentSection][key] = true
				end
			end
		end
	end
	file:close()
	return sections
end

local function migrateFlatConfigToNested(preMigrationSections)
	if not config.enabled then
		return
	end

	local configFile = nil
	for _, candidate in pairs(rom.config.config_files) do
		if candidate.owner_guid == _PLUGIN.guid then
			configFile = candidate
			break
		end
	end
	if configFile == nil then
		rom.log.warning(
			"Config file could not be loaded during config migration, config is likely outdated, please manually set the correct values again and report this issue!")
		return
	end

	-- Maps each old flat key to the nested path it moved to
	-- Ensure to update this when updating where these keys live in the nested structure for players updating later on!
	local migrations = {
		hadesGameFolder = { "debugging", "hadesGameFolder" },
		logLevel = { "debugging", "logLevel" },
		enableVanillaDebugPrint = { "debugging", "enableVanillaDebugPrint" },
		firstTimeSetup = { "debugging", "firstTimeSetup" },
		uninstall = { "debugging", "uninstall" },
		z_ExcludeFromDreamDives = { "gameplay", "z_ExcludeFromDreamDives" },
		z_HideElysiumPoisonMessage = { "gameplay", "z_HideElysiumPoisonMessage" },
		z_GoddessMode = { "accessibility", "z_GoddessMode" },
		z_FadeToBlackEnteringHades = { "accessibility", "z_FadeToBlackEnteringHades" },
		z_SpeedrunForceTwoSack = { "speedrunning", "z_SpeedrunForceTwoSack" },
		z_SpeedrunSkipOpeningThanatos = { "speedrunning", "z_SpeedrunSkipOpeningThanatos" },
		z_SpeedrunFreshFileZagreusJourneyRun = { "speedrunning", "z_SpeedrunFreshFileZagreusJourneyRun" },
	}

	local flatSection = preMigrationSections["config"] or {}
	local didMigrate = false
	for oldKey, newPath in pairs(migrations) do
		-- Only act while the old flat key still exists as an orphan in the user's .cfg
		if flatSection[oldKey] then
			-- rom.mod_settings exposes each config section as a userdata proxy, so a navigable container is userdata (a scalar or nil means the path is wrong)
			local node = config
			for i = 1, #newPath - 1 do
				if type(node) ~= "userdata" then
					break
				end
				---@diagnostic disable-next-line: cast-local-type
				node = node[newPath[i]]
			end
			local leafKey = newPath[#newPath]
			-- Only migrate when the whole destination path resolves and the target key already exists (a non-existent target means the migration map is wrong)
			if type(node) == "userdata" and node[leafKey] ~= nil then
				node[leafKey] = configFile:bind("config", oldKey, node[leafKey], ""):get()
				configFile:remove("config", oldKey)
				didMigrate = true
				rom.log.info("Migrated config '" .. oldKey .. "' to '" .. table.concat(newPath, ".") .. "'")
			else
				rom.log.warning("Skipped migrating config '" ..
					oldKey .. "' to '" .. table.concat(newPath, ".") .. "': destination not found.")
			end
		end
	end

	if didMigrate then
		configFile:save()
	end
end
migrateFlatConfigToNested(snapshotConfigSections())
]==]

-- Reads the raw .cfg text to capture which keys exist under each section before the migration touches anything
local function snapshotConfigSections()
	local sections = {}
	local ok, configFolder = pcall(rom.paths.config)
	if not ok or configFolder == nil then
		return sections
	end
	local file = io.open(rom.path.combine(configFolder, _PLUGIN.guid .. ".cfg"), "r")
	if file == nil then
		return sections
	end
	local currentSection = nil
	for line in file:lines() do
		-- Strip a leading UTF-8 BOM and surrounding whitespace, then ignore blank lines and comments
		local trimmed = line:gsub("^\239\187\191", ""):match("^%s*(.-)%s*$")
		if trimmed ~= "" and trimmed:sub(1, 1) ~= "#" then
			local section = trimmed:match("^%[(.+)%]$")
			if section ~= nil then
				currentSection = section
				sections[currentSection] = sections[currentSection] or {}
			elseif currentSection ~= nil then
				local key = trimmed:match("^(.-)%s*=")
				if key ~= nil and key ~= "" then
					sections[currentSection][key] = true
				end
			end
		end
	end
	file:close()
	return sections
end

local function migrateFlatConfigToNested(preMigrationSections)
	if not config.enabled then
		return
	end

	local configFile = chalk.original(config)
	if configFile == nil then
		rom.log.warning(
			"Config file could not be loaded during config migration, config is likely outdated, please manually set the correct values again and report this issue!")
		return
	end

	-- Maps each old flat key to the nested path it moved to
	-- Ensure to update this when updating where these keys live in the nested structure for players updating later on!
	local migrations = {
		hadesGameFolder = { "debugging", "hadesGameFolder" },
		logLevel = { "debugging", "logLevel" },
		enableVanillaDebugPrint = { "debugging", "enableVanillaDebugPrint" },
		firstTimeSetup = { "debugging", "firstTimeSetup" },
		uninstall = { "debugging", "uninstall" },
		z_ExcludeFromDreamDives = { "gameplay", "z_ExcludeFromDreamDives" },
		z_HideElysiumPoisonMessage = { "gameplay", "z_HideElysiumPoisonMessage" },
		z_GoddessMode = { "accessibility", "z_GoddessMode" },
		z_FadeToBlackEnteringHades = { "accessibility", "z_FadeToBlackEnteringHades" },
		z_SpeedrunForceTwoSack = { "speedrunning", "z_SpeedrunForceTwoSack" },
		z_SpeedrunSkipOpeningThanatos = { "speedrunning", "z_SpeedrunSkipOpeningThanatos" },
		z_SpeedrunFreshFileZagreusJourneyRun = { "speedrunning", "z_SpeedrunFreshFileZagreusJourneyRun" },
	}

	local flatSection = preMigrationSections["config"] or {}
	local didMigrate = false
	for oldKey, newPath in pairs(migrations) do
		-- Only act while the old flat key still exists as an orphan in the user's .cfg
		if flatSection[oldKey] then
			local node = config
			for i = 1, #newPath - 1 do
				if type(node) ~= "table" then
					break
				end
				---@diagnostic disable-next-line: cast-local-type
				node = node[newPath[i]]
			end
			local leafKey = newPath[#newPath]
			-- Only migrate when the whole destination path resolves and the target key already exists (a non-existent target means the migration map is wrong)
			if type(node) == "table" and node[leafKey] ~= nil then
				node[leafKey] = configFile:bind("config", oldKey, node[leafKey], ""):get()
				configFile:remove("config", oldKey)
				didMigrate = true
				rom.log.info("Migrated config '" .. oldKey .. "' to '" .. table.concat(newPath, ".") .. "'")
			else
				rom.log.warning("Skipped migrating config '" ..
					oldKey .. "' to '" .. table.concat(newPath, ".") .. "': destination not found.")
			end
		end
	end

	if didMigrate then
		configFile:save()
	end
end

migrateFlatConfigToNested(snapshotConfigSections())
-- #endregion

---@module "NikkelM-Cosmetics_API"
CosmeticsAPI = mods["NikkelM-Cosmetics_API"]

local function on_ready()
	mod = modutil.mod.Mod.Register(_PLUGIN.guid)
	local startTime = os.clock()
	local lastImportTime = startTime

	local function DebugLogScriptImportProgress(scriptName)
		mod.DebugPrint(
			"[Script Loading] Imported " .. scriptName .. " file(s), took " .. (os.clock() - lastImportTime) .. " seconds", 4)
		lastImportTime = os.clock()
	end
	-- Used in some imported files
	mod.EncounteredInstallationIssues = false
	mod.InstallationPending = false

	-- File handling and other generic functions required at install time
	import "Scripts/Meta/Constants.lua"
	import "Scripts/Meta/Utils.lua"
	import "Scripts/Meta/RequiredFileData.lua"
	import "Scripts/Meta/NameMappingData.lua"
	import "Scripts/Meta/FileHandling.lua"
	DebugLogScriptImportProgress("meta")

	---The mod's hidden config, stored in the cache folder as hiddenConfig.sjson.
	---We don't ship the file with the mod to prevent it being overwritten on a mod update
	mod.HiddenConfig = mod.HiddenConfig or mod.TryGetOrCreateCachedSjsonFile("hiddenConfig.sjson", mod.DefaultHiddenConfig)
	mod.DebugPrint("Loaded hiddenConfig.sjson", 4)
	mod.DebugPrint(mod.HiddenConfig, 4)
	---@diagnostic disable-next-line: undefined-global
	public.IsValidInstallation = mod.HiddenConfig.IsValidInstallation

	if config.enabled == false then
		local numMissingFiles = mod.CheckRequiredFiles(true)
		if numMissingFiles == 0 then
			-- Mod is disabled, but has not been uninstalled - do not return early
			mod.DebugPrint(
				"The mod is disabled, but has not been uninstalled yet. Uninstallation will be attempted shortly...", 2)
		else
			mod.DebugPrint("The mod is currently disabled. Set \"enabled\" to true in the config to enable it.", 3)
			return
		end
	end

	-- We need to always import the ShellText files early as we might need to show an unsuccessful install screen with localized text
	import "Game/Text/de/ShellText.de.sjson.lua" -- Decoding the Hades II file fails, so this does nothing
	import "Game/Text/el/ShellText.el.sjson.lua"
	import "Game/Text/en/ShellText.en.sjson.lua"
	import "Game/Text/es/ShellText.es.sjson.lua"
	import "Game/Text/fr/ShellText.fr.sjson.lua"
	import "Game/Text/it/ShellText.it.sjson.lua"
	import "Game/Text/ja/ShellText.ja.sjson.lua"
	import "Game/Text/ko/ShellText.ko.sjson.lua"
	import "Game/Text/pl/ShellText.pl.sjson.lua"
	import "Game/Text/pt-BR/ShellText.pt-BR.sjson.lua"
	import "Game/Text/ru/ShellText.ru.sjson.lua"
	import "Game/Text/tr/ShellText.tr.sjson.lua"
	import "Game/Text/uk/ShellText.uk.sjson.lua"
	import "Game/Text/zh-CN/ShellText.zh-CN.sjson.lua"
	import "Game/Text/zh-TW/ShellText.zh-TW.sjson.lua"
	DebugLogScriptImportProgress("ShellText SJSON")

	import "Scripts/Meta/AnimationDuplicatesDataEnemies.lua"
	import "Scripts/Meta/AnimationDuplicatesDataEnemyAnimations.lua"
	import "Scripts/Meta/AnimationDuplicatesDataFx.lua"
	import "Scripts/Meta/AnimationDuplicatesDataGUIAnimations.lua"
	import "Scripts/Meta/AnimationDuplicatesDataNPCs.lua"
	import "Scripts/Meta/AnimationDuplicatesDataPortraits.lua"
	import "Scripts/Meta/ScreenDataInstallation.lua"
	import "Scripts/Meta/SpeedrunPresentation.lua"
	import "Scripts/Meta/StorytellerVoicelines.lua"
	import "Scripts/Meta/ZagreusFieldVoicelines.lua"
	DebugLogScriptImportProgress("additional meta")

	-- If we should proceed after confirming the installation - if not, we don't confirm, as we only want to uninstall anyways
	local shouldProceed = config.enabled and (not config.debugging.uninstall or config.debugging.firstTimeSetup)
	-- Always confirm the installation, as we might need the path if this is a weird first-install-with-uninstall-set situation
	if not mod.ConfirmHadesInstallation() and shouldProceed then return end
	-- If the user has installed mods for Hades, we cannot proceed with either the installation or loading the mod
	if mod.AreHadesModsInstalled() and shouldProceed then return end

	import "Scripts/Meta/FirstTimeSetup.lua"
	import "Scripts/Meta/Uninstall.lua"
	DebugLogScriptImportProgress("setup/uninstall")

	-- Check if the mod version has changed since last install (mod update or fresh install)
	-- If so, trigger a full uninstall + reinstall to ensure all files are up to date
	if mod.HiddenConfig.InstalledModVersion ~= _PLUGIN.version then
		mod.DebugPrint(
			"Mod version changed: " .. (mod.HiddenConfig.InstalledModVersion or "Not installed") ..
			" -> " .. _PLUGIN.version .. ". The mod will be (re)-installed.", 2)
		config.debugging.uninstall = true
		config.debugging.firstTimeSetup = true
	end

	-- If the mod is enabled but firstTimeSetup is false and required files are missing, the mod was likely uninstalled and reinstalled without the config being reset
	local numMissingFiles = -1
	if config.enabled and not config.debugging.firstTimeSetup and not config.debugging.uninstall then
		numMissingFiles = mod.CheckRequiredFiles(true)
		if numMissingFiles > 0 then
			mod.DebugPrint("Required files are missing but firstTimeSetup is false. Triggering reinstall.", 2)
			config.debugging.uninstall = true
			config.debugging.firstTimeSetup = true
		end
	end

	-- If the mod is disabled, we also want to uninstall it and set the firstTimeSetup flag to true for the next time the mod is enabled again
	if not config.enabled or config.debugging.uninstall then
		local uninstallSuccessful = mod.Uninstall()

		if not config.enabled then
			-- Mark mod to be installed again when enabled
			if uninstallSuccessful then
				mod.DebugPrint(
					"The mod is disabled and was uninstalled successfully. It will be installed again when enabled the next time.",
					3)
				config.debugging.firstTimeSetup = true
				return
			else
				-- Do not disable, as otherwise save files will break
				mod.DebugPrint(
					"You tried disabling the mod, but uninstallation was not successful. The mod is disabled, but some files may have been left behind. This can cause issues if left unresolved! Please try again or start a discussion on https://github.com/NikkelM/Hades-II-HadesBiomes/discussions if the issue persists.",
					2)
			end
		else
			if uninstallSuccessful and not config.debugging.firstTimeSetup then
				mod.DebugPrint(
					"The mod was uninstalled successfully, and the \"firstTimeSetup\" flag is set to false, disabling mod. Set \"enabled\" to true in the config to install the mod the next time the game is started.",
					2)
				config.enabled = false
				-- Set to true to install the next time the mod is enabled
				config.debugging.firstTimeSetup = true
				return
			elseif not uninstallSuccessful then
				mod.DebugPrint(
					"The mod was not uninstalled successfully, validating Hades installation to ensure we can proceed...", 2)

				mod.HiddenConfig.MustShowUninstallFailureScreen = true
				mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

				if not mod.ConfirmHadesInstallation() then return end
			end
		end
	end

	local setupSuccessful = true
	if config.debugging.firstTimeSetup then
		-- Pre-install: Create/Copy files that are required before the loading bar starts
		mod.InstallationPending = true
		setupSuccessful = mod.CreatePreLoadingBarFiles()
	end

	-- When the lua state reloads to load a save the hooks do not run again, so a pending install can never complete and must be treated as a broken one instead
	local canCompleteInstall = mod.InstallationPending and game.GameState == nil

	if setupSuccessful then
		-- Only check if all required files exist here if we are not waiting on an install that can still complete, and haven't successfully checked them before
		-- After the installation completes, mod.CheckRequiredFiles is called again, so we are not missing the check
		if not canCompleteInstall and numMissingFiles == -1 then
			numMissingFiles = mod.CheckRequiredFiles(false)
		end

		if numMissingFiles == 0 or canCompleteInstall then
			-- General data needed for map generation/display
			import "Game/MapGroups.sjson.lua"
			DebugLogScriptImportProgress("MapGroups SJSON")

			-- SJSON changes
			import "Game/Animations/Model/Hero_Melinoe_Animation_Personality.sjson.lua"
			DebugLogScriptImportProgress("Hero Animation SJSON")

			import "Game/Animations/GUI_Portraits_VFX.sjson.lua"
			import "Game/Animations/GUI_Screens_VFX.sjson.lua"
			DebugLogScriptImportProgress("GUI Animation SJSON")

			import "Game/Animations/Enemy_1Base_VFX.sjson.lua"
			import "Game/Animations/Melinoe_Spell_VFX.sjson.lua"
			import "Game/Animations/Melinoe_Zeus_VFX.sjson.lua"
			import "Game/Animations/Obstacle_Asphodel_VFX.sjson.lua"
			import "Game/Animations/Obstacle_Deprecated_VFX.sjson.lua"
			import "Game/Animations/Obstacle_General_VFX.sjson.lua"
			DebugLogScriptImportProgress("Obstacle Animation SJSON")

			import "Game/Units/Enemies.sjson.lua"
			import "Game/Units/NPCs.sjson.lua"
			DebugLogScriptImportProgress("Unit SJSON")

			import "Game/Weapons/EnemyWeapons.sjson.lua"

			import "Game/Projectiles/EnemyProjectiles.sjson.lua"
			DebugLogScriptImportProgress("Projectile SJSON")

			import "Game/Obstacles/Asphodel.sjson.lua"
			import "Game/Obstacles/Elysium.sjson.lua"
			import "Game/Obstacles/Gameplay.sjson.lua"
			import "Game/Obstacles/Graybox.sjson.lua"
			import "Game/Obstacles/House.sjson.lua"
			import "Game/Obstacles/Styx.sjson.lua"
			import "Game/Obstacles/Surface.sjson.lua"
			import "Game/Obstacles/Tartarus.sjson.lua"
			import "Game/Obstacles/Temple.sjson.lua"
			import "Game/Obstacles/Travel.sjson.lua"
			DebugLogScriptImportProgress("Obstacle SJSON")

			-- Helper functions to deduplicate code in the localization files
			import "Game/Text/HadesTextUtils.lua"

			-- The ScreenText files depend on icons in here
			import "Scripts/UIData.lua"
			DebugLogScriptImportProgress("HadesTextUtils and UIData")

			-- Imports enemy, encounter and room data from Hades to Hades II - ALWAYS requires a Hades installation
			-- Done first, as the EncounterData depends on the EnemySets
			import "Scripts/EnemySets.lua"

			-- Porting over voiceline definitions
			-- Needs to be done before they are used in room data, weapon data or enemy data
			import "Scripts/HadesAudioData.lua"
			import "Scripts/AudioData.lua"

			-- New colours need to be added before using them in EnemyData
			import "Scripts/Color.lua"
			-- New GameData entries need to be added before using them in HadesNPCData
			import "Scripts/NarrativeData.lua"
			DebugLogScriptImportProgress("EnemySets, AudioData, Color and NarrativeData")

			import "Scripts/Meta/EnemyTrapDataHandler.lua"
			import "Scripts/HadesEnemyData.lua"
			import "Scripts/HadesNPCData.lua"
			DebugLogScriptImportProgress("Hades Enemy and NPC Data")
			import "Scripts/EnemyData.lua"
			import "Scripts/NPCData.lua"
			DebugLogScriptImportProgress("Enemy and NPC Data")
			import "Scripts/Meta/EncounterDataHandler.lua"
			import "Scripts/Meta/RoomDataHandler.lua"
			DebugLogScriptImportProgress("EncounterDataHandler and RoomDataHandler")

			-- Loads Encounter data
			-- Do this before loading the room data, as the rooms need the legal encounters defined in here
			import "Scripts/EncounterSets.lua"
			import "Scripts/EncounterDataTartarus.lua"
			import "Scripts/EncounterDataAsphodel.lua"
			import "Scripts/EncounterDataElysium.lua"
			import "Scripts/EncounterDataStyx.lua"
			import "Scripts/EncounterDataSurface.lua"
			-- Last since it inherits from encounters in the other biomes
			import "Scripts/EncounterData.lua"
			DebugLogScriptImportProgress("Encounter Sets and Encounter Data")

			-- Loads Room data
			import "Scripts/RoomSets.lua"
			import "Scripts/HadesRoomData.lua"
			import "Scripts/RoomData.lua"
			import "Scripts/HadesRoomDataTartarus.lua"
			import "Scripts/RoomDataTartarus.lua"
			import "Scripts/HadesRoomDataAsphodel.lua"
			import "Scripts/RoomDataAsphodel.lua"
			import "Scripts/HadesRoomDataElysium.lua"
			import "Scripts/RoomDataElysium.lua"
			import "Scripts/HadesRoomDataStyx.lua"
			import "Scripts/RoomDataStyx.lua"
			import "Scripts/HadesRoomDataSurface.lua"
			import "Scripts/RoomDataSurface.lua"
			DebugLogScriptImportProgress("Room Sets and Room Data")

			-- Loads Weapon data
			import "Scripts/HadesWeaponData.lua"
			import "Scripts/WeaponData.lua"
			DebugLogScriptImportProgress("Weapon Data")

			-- Other data that must be loaded before SetupRunData()
			import "Scripts/BadgeData.lua"
			import "Scripts/BountyData.lua"
			import "Scripts/CodexData.lua"
			import "Scripts/ConsumableData.lua"
			import "Scripts/CosmeticsData.lua"
			import "Scripts/CreditsData.lua"
			import "Scripts/DeathLoopData.lua"
			import "Scripts/EffectData.lua"
			import "Scripts/GameStatsData.lua"
			import "Scripts/GardenData.lua"
			import "Scripts/GhostAdminData_Items.lua"
			import "Scripts/HarvestData.lua"
			import "Scripts/HeroData.lua"
			import "Scripts/KeywordData.lua"
			import "Scripts/LootData.lua"
			import "Scripts/LootData_Aphrodite.lua"
			import "Scripts/LootData_Ares.lua"
			import "Scripts/LootData_Artemis.lua"
			import "Scripts/LootData_Athena.lua"
			import "Scripts/LootData_Chaos.lua"
			import "Scripts/LootData_Demeter.lua"
			import "Scripts/LootData_Dionysus.lua"
			import "Scripts/LootData_Hermes.lua"
			import "Scripts/LootData_Poseidon.lua"
			import "Scripts/LootData_Zeus.lua"
			import "Scripts/MarketData.lua"
			import "Scripts/MetaUpgradeData.lua"
			import "Scripts/ResourceData.lua"
			import "Scripts/RequirementsData.lua"
			import "Scripts/ShrineData.lua"
			import "Scripts/TraitData_Chaos.lua"
			import "Scripts/TraitData_Store.lua"
			import "Scripts/TraitData.lua"
			import "Scripts/TraitDataNPCs.lua"
			import "Scripts/ObstacleData.lua"
			import "Scripts/ObjectiveData.lua"
			import "Scripts/ProjectileData.lua"
			import "Scripts/QuestData.lua"
			import "Scripts/RunClearData.lua"
			import "Scripts/RunHistoryData.lua"
			import "Scripts/WeaponUpgradeData.lua"
			import "Scripts/WorldUpgradeData.lua"
			DebugLogScriptImportProgress("other required Data files")

			-- Applies modifications to the rooms, such as LegalEncounterDictionary
			game.SetupRunData()
			mod.DebugPrint("[Script Loading] SetupRunData called, took " .. (os.clock() - lastImportTime) .. " seconds", 4)
			lastImportTime = os.clock()

			-- Function mappings between Hades and Hades II
			import "Scripts/FunctionMappings/AsphodelWrapping.lua"
			import "Scripts/FunctionMappings/BossAsphodel.lua"
			import "Scripts/FunctionMappings/BossCharon.lua"
			import "Scripts/FunctionMappings/BossElysium.lua"
			import "Scripts/FunctionMappings/BossStyx.lua"
			import "Scripts/FunctionMappings/BossTartarus.lua"
			import "Scripts/FunctionMappings/Chariot.lua"
			import "Scripts/FunctionMappings/Crawler.lua"
			import "Scripts/FunctionMappings/CrusherUnit.lua"
			import "Scripts/FunctionMappings/Environment.lua"
			import "Scripts/FunctionMappings/GhostLogic.lua"
			import "Scripts/FunctionMappings/HeavyRanged.lua"
			import "Scripts/FunctionMappings/LightSpawner.lua"
			import "Scripts/FunctionMappings/MiniBossTartarus.lua"
			import "Scripts/FunctionMappings/ShadeNaked.lua"
			import "Scripts/FunctionMappings/StyxLogic.lua"
			import "Scripts/FunctionMappings/SurfaceLogic.lua"
			import "Scripts/FunctionMappings/SurvivalLogic.lua"
			import "Scripts/FunctionMappings/ThanatosLogic.lua"
			import "Scripts/FunctionMappings/WretchAssassin.lua"
			DebugLogScriptImportProgress("Function Mapping files")

			-- "Normal" code changes
			import "Scripts/AudioLogic.lua"
			import "Scripts/BadgeLogic.lua"
			import "Scripts/BiomeMapPresentation.lua"
			import "Scripts/BoonInfoLogic.lua"
			import "Scripts/BountyLogic.lua"
			import "Scripts/BountyPresentation.lua"
			import "Scripts/CodexLogic.lua"
			import "Scripts/Combat.lua"
			import "Scripts/CombatLogic.lua"
			import "Scripts/CombatPresentation.lua"
			import "Scripts/DeathLoopLogic.lua"
			import "Scripts/DreamRunLogic.lua"
			import "Scripts/DreamRunPresentation.lua"
			import "Scripts/EffectLogic.lua"
			import "Scripts/EffectPresentation.lua"
			import "Scripts/EnemyAILogic.lua"
			import "Scripts/EncounterLogic.lua"
			import "Scripts/EventLogic.lua"
			import "Scripts/EventPresentation.lua"
			import "Scripts/FamiliarData.lua"
			import "Scripts/GameStatsLogic.lua"
			import "Scripts/GardenLogic.lua"
			import "Scripts/GhostAdminLogic.lua"
			import "Scripts/HarvestPresentation.lua"
			import "Scripts/HubPresentation.lua"
			import "Scripts/InteractLogic.lua"
			import "Scripts/KeepsakeData.lua"
			import "Scripts/MarketPresentation.lua"
			import "Scripts/MetaUpgradeLogic.lua"
			import "Scripts/NarrativeLogic.lua"
			import "Scripts/NPCLogic.lua"
			import "Scripts/PatchLogic.lua"
			import "Scripts/PowersLogic.lua"
			import "Scripts/QuestLogic.lua"
			import "Scripts/RequirementsLogic.lua"
			import "Scripts/ResourcePresentation.lua"
			import "Scripts/RewardPresentation.lua"
			import "Scripts/RoomEvents.lua"
			import "Scripts/RoomLogic.lua"
			import "Scripts/RoomPresentation.lua"
			import "Scripts/RunHistoryLogic.lua"
			import "Scripts/RunHistoryPresentation.lua"
			import "Scripts/RunLogic.lua"
			import "Scripts/SaveLogic.lua"
			import "Scripts/SellTraitLogic.lua"
			import "Scripts/ShrineLogic.lua"
			import "Scripts/ShrinePresentation.lua"
			import "Scripts/SpellLogic.lua"
			import "Scripts/StoreLogic.lua"
			import "Scripts/TraitLogic.lua"
			import "Scripts/WeaponLogic.lua"
			import "Scripts/WeaponSets.lua"
			DebugLogScriptImportProgress("main logic and presentation scripts")

			-- Ensure the required additional packages are loaded with every biome package immediately before map load
			mod.SetBiomePackageLoadOverrides()
			mod.DebugPrint(
				"[Script Loading] Set biome package load overrides, took " .. (os.clock() - lastImportTime) .. " seconds", 4)
			lastImportTime = os.clock()

			-- E.g. ThanatosElysiumIntro encounter is missing, will be caught when importing EncounterDataElysium.lua
			if mod.EncounteredInstallationIssues == true then
				mod.HiddenConfig.IsValidInstallation = false
				if mod.HiddenConfig.InstallationFailReason == "" then
					mod.HiddenConfig.InstallationFailReason = "MissingFiles"
				end
				mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
				---@diagnostic disable-next-line: undefined-global
				public.IsValidInstallation = false

				mod.DebugPrint(
					"The mod ran into issues during installation and is not active, see the errors above. Please check the log and re-run the installation by setting the \"firstTimeSetup\" and \"uninstall\" in the config to true.",
					1)
			else
				mod.HiddenConfig.IsValidInstallation = true
				---@diagnostic disable-next-line: undefined-global
				public.IsValidInstallation = true

				-- Only persist a valid installation once mod.FinalizeInstallation has actually verified the copied files
				-- Writing it here while an install is pending would mark a broken install as valid if the game is closed before verification completes
				if not mod.InstallationPending then
					mod.HiddenConfig.InstallationFailReason = ""
					mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
				end

				-- Check for any incompatible installed mods to display a warning to the user
				if mod.AreIncompatibleModsInstalled() then
					mod.HiddenConfig.MustShowIncompatibleModsInstallScreen = true
					mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

					mod.DebugPrint(
						"Incompatible mods have been detected, see the logs above for the most likely candidates. Please visit github.com/NikkelM/Hades-II-HadesBiomes/wiki/Incompatible-Mods and uninstall all listed incompatible mods.",
						1)
				end

				-- Load the modded MainMenu package manually on first game start, the hash overrides do not work yet
				-- The package will immediately be unloaded when loading into a save completes, so no worries on that being unnecessary
				if game.GameState == nil then
					game.LoadPackages({ Name = "NikkelM-HadesBiomesMainMenu", IgnoreAssert = true })
				end

				mod.DebugPrint("Mod loaded successfully! (took " .. os.clock() - startTime .. "s)", 3)
			end
		else
			mod.HiddenConfig.IsValidInstallation = false
			mod.HiddenConfig.InstallationFailReason = "MissingFiles"
			mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
			---@diagnostic disable-next-line: undefined-global
			public.IsValidInstallation = false

			mod.DebugPrint(
				"A total of " .. numMissingFiles ..
				" required files are missing and the mod is not active. Please check the log and run the \"firstTimeSetup\" by setting the config value to true.",
				1)
		end
	end

	if mod.HiddenConfig.EnableVanillaDebugKeybinds == true then
		mod.DebugPrint("Enabling vanilla debug keybinds as per hidden config setting.", 2)
		rom.inputs.enable_vanilla_debug_keybinds(true)
	end
end

-- Loaded after all other mods
-- Define static Context Wraps in here to prevent issues as per https://github.com/SGG-Modding/ModUtil/issues/12
local function on_ready_late()
	if config.enabled == false or (mod.HiddenConfig and not mod.HiddenConfig.IsValidInstallation) then return end

	import "Scripts/CodexLogic_Late.lua"
	import "Scripts/CombatLogic_Late.lua"
	import "Scripts/DeathLoopLogic_Late.lua"
	import "Scripts/EffectLogic_Late.lua"
	import "Scripts/EffectPresentation_Late.lua"
	import "Scripts/EventPresentation_Late.lua"
	import "Scripts/GhostLogic_Late.lua"
	import "Scripts/HarvestLogic_Late.lua"
	import "Scripts/HarvestPresentation_Late.lua"
	import "Scripts/HubPresentation_Late.lua"
	import "Scripts/InteractLogic_Late.lua"
	import "Scripts/MarketLogic_Late.lua"
	import "Scripts/ObjectiveLogic_Late.lua"
	import "Scripts/PowersLogic_Late.lua"
	import "Scripts/ResourceLogic_Late.lua"
	import "Scripts/RewardPresentation_Late.lua"
	import "Scripts/RequirementsLogic_Late.lua"
	import "Scripts/RoomLogic_Late.lua"
	import "Scripts/RoomPresentation_Late.lua"
	import "Scripts/RunClearLogic_Late.lua"
	import "Scripts/WeaponUpgradeLogic_Late.lua"

	import "Scripts/Meta/PonyMenuLogic_Late.lua"
end

local function on_reload()
	-- what to do when we are ready, but also again on every reload.
	-- only do things that are safe to run over and over.
	if config.enabled == false then return end
end

local function on_reload_late()
	if config.enabled == false then return end
end

-- this allows us to limit certain functions to not be reloaded.
local loader = reload.auto_multiple()

-- this runs only when modutil and the game's lua is ready
modutil.once_loaded.game(function()
	loader.load("early", on_ready, on_reload)
end)

-- again but loaded later than other mods
mods.on_all_mods_loaded(function()
	modutil.once_loaded.game(function()
		loader.load("late", on_ready_late, on_reload_late)
	end)
end)
