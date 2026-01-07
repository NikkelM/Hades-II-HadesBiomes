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

---@module "NikkelM-Cosmetics_API"
CosmeticsAPI = mods["NikkelM-Cosmetics_API"]

local function on_ready()
	mod = modutil.mod.Mod.Register(_PLUGIN.guid)
	local startTime = os.clock()
	-- Used in some imported files
	mod.EncounteredInstallationIssues = false

	-- File handling and other generic functions required at install time
	import "Scripts/Meta/Constants.lua"
	import "Scripts/Meta/Utils.lua"
	import "Scripts/Meta/RequiredFileData.lua"
	import "Scripts/Meta/NameMappingData.lua"
	import "Scripts/Meta/FileHandling.lua"

	---The mod's hidden config, stored in the cache folder as hiddenConfig.sjson.
	---We don't ship the file with the mod to prevent it being overwritten on a mod update
	mod.HiddenConfig = mod.HiddenConfig or mod.TryGetOrCreateCachedSjsonFile("hiddenConfig.sjson", mod.DefaultHiddenConfig)
	mod.DebugPrint("Loaded hiddenConfig.sjson", 4)
	mod.DebugPrint(mod.HiddenConfig, 4)

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

	-- We need to always import the ScreenText and ShellText files early as we might need to show an unsuccessful install screen with localized text
	import "Game/Text/de/ScreenText.de.sjson.lua"
	import "Game/Text/el/ScreenText.el.sjson.lua"
	import "Game/Text/en/ScreenText.en.sjson.lua"
	import "Game/Text/es/ScreenText.es.sjson.lua"
	import "Game/Text/fr/ScreenText.fr.sjson.lua"
	import "Game/Text/it/ScreenText.it.sjson.lua"
	import "Game/Text/ja/ScreenText.ja.sjson.lua"
	import "Game/Text/ko/ScreenText.ko.sjson.lua"
	import "Game/Text/pl/ScreenText.pl.sjson.lua"
	import "Game/Text/pt-BR/ScreenText.pt-BR.sjson.lua"
	import "Game/Text/ru/ScreenText.ru.sjson.lua"
	import "Game/Text/tr/ScreenText.tr.sjson.lua"
	import "Game/Text/uk/ScreenText.uk.sjson.lua"
	import "Game/Text/zh-CN/ScreenText.zh-CN.sjson.lua" -- Decoding the Hades II file fails, so this does nothing
	import "Game/Text/zh-TW/ScreenText.zh-TW.sjson.lua"

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

	import "Scripts/Meta/AnimationDuplicatesDataFx.lua"
	import "Scripts/Meta/AnimationDuplicatesDataGUIAnimations.lua"
	import "Scripts/Meta/AnimationDuplicatesDataPortraits.lua"
	import "Scripts/Meta/AnimationDuplicatesDataNPCs.lua"
	import "Scripts/Meta/ScreenDataInstallation.lua"
	import "Scripts/Meta/StorytellerVoicelines.lua"
	import "Scripts/Meta/ZagreusFieldVoicelines.lua"

	-- If we should proceed after confirming the installation - if not, we don't confirm, as we only want to uninstall anyways
	local shouldProceed = config.enabled and (not config.uninstall or config.firstTimeSetup)
	-- Always confirm the installation, as we might need the path if this is a weird first-install-with-uninstall-set situation
	if not mod.ConfirmHadesInstallation() and shouldProceed then return end
	-- If the user has installed mods for Hades, we cannot proceed with either the installation or loading the mod
	if mod.AreHadesModsInstalled() and shouldProceed then return end

	import "Scripts/Meta/FirstTimeSetup.lua"
	import "Scripts/Meta/Uninstall.lua"

	-- If the game was updated, the file checksums very likely got updated as well
	-- At the same time, if the mod gets updated, the checksums.txt will be reset to the empty file as well
	-- We can use this to determine if we should re-install the mod, to make sure we do not interfere with any files the game modified
	mod.CompareChecksums()

	-- If the mod is disabled, we also want to uninstall it and set the firstTimeSetup flag to true for the next time the mod is enabled again
	if not config.enabled or config.uninstall then
		local uninstallSuccessful = mod.Uninstall()

		if not config.enabled then
			-- Mark mod to be installed again when enabled
			if uninstallSuccessful then
				mod.DebugPrint(
					"The mod is disabled and was uninstalled successfully. It will be installed again when enabled the next time.",
					3)
				config.firstTimeSetup = true
				return
			else
				-- Do not disable, as otherwise save files will break
				mod.DebugPrint(
					"You tried disabling the mod, but uninstallation was not successful. The mod is disabled, but some files may have been left behind. This can cause issues if left unresolved! Please try again or start a discussion on https://github.com/NikkelM/Hades-II-HadesBiomes/discussions if the issue persists.",
					2)
			end
		else
			if uninstallSuccessful and not config.firstTimeSetup then
				mod.DebugPrint(
					"The mod was uninstalled successfully, and the \"firstTimeSetup\" flag is set to false, disabling mod. Set \"enabled\" to true in the config to install the mod the next time the game is started.",
					2)
				config.enabled = false
				-- Set to true to install the next time the mod is enabled
				config.firstTimeSetup = true
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
	if config.firstTimeSetup then
		setupSuccessful = mod.FirstTimeSetup()
	end

	-- Only check for files if the first time setup was successful, or the mod was already installed
	if setupSuccessful then
		-- Before proceeding, check that required files exist
		local numMissingFiles = mod.CheckRequiredFiles(false)
		if numMissingFiles == 0 then
			-- General data needed for map generation/display
			import "Game/MapGroups.sjson.lua"

			-- SJSON changes
			import "Game/Animations/Model/Hero_Melinoe_Animation_Personality.sjson.lua"
			import "Game/Animations/CharacterAnimationsEnemies.sjson.lua"
			-- Must be loaded after CharacterAnimationsEnemies, as it inherits some animations from it
			import "Game/Animations/EnemyAnimations.sjson.lua"
			import "Game/Animations/GUI_Boons_VFX.sjson.lua"
			import "Game/Animations/GUI_Portraits_VFX.sjson.lua"
			import "Game/Animations/GUI_Screens_VFX.sjson.lua"
			import "Game/Animations/GUI_VFX.sjson.lua"
			import "Game/Animations/Items_General_VFX.sjson.lua"
			import "Game/Animations/Items_Harvest_VFX.sjson.lua"
			import "Game/Animations/Melinoe_Zeus_VFX.sjson.lua"
			import "Game/Animations/Obstacle_1Base_VFX.sjson.lua"
			import "Game/Animations/Obstacle_Asphodel_VFX.sjson.lua"
			import "Game/Animations/Obstacle_Deprecated_VFX.sjson.lua"
			import "Game/Animations/Obstacle_General_VFX.sjson.lua"

			import "Game/Units/Enemies.sjson.lua"
			import "Game/Units/NPCs.sjson.lua"

			import "Game/Weapons/EnemyWeapons.sjson.lua"

			-- Must be loaded before the other projectile files
			import "Game/Projectiles/Projectiles.sjson.lua"
			import "Game/Projectiles/EnemyProjectiles.sjson.lua"
			import "Game/Projectiles/Enemy_BiomeN_Projectiles.sjson.lua"
			import "Game/Projectiles/Enemy_Traps_Projectiles.sjson.lua"

			import "Game/Obstacles/Asphodel.sjson.lua"
			import "Game/Obstacles/Chaos.sjson.lua"
			import "Game/Obstacles/Elysium.sjson.lua"
			import "Game/Obstacles/Gameplay.sjson.lua"
			import "Game/Obstacles/Graybox.sjson.lua"
			import "Game/Obstacles/Styx.sjson.lua"
			import "Game/Obstacles/Surface.sjson.lua"
			import "Game/Obstacles/Tartarus.sjson.lua"
			import "Game/Obstacles/Travel.sjson.lua"

			-- Helper functions to deduplicate code in the localization files
			import "Game/Text/HadesTextUtils.lua"

			-- The ScreenText files depend on icons in here
			import "Scripts/UIData.lua"

			-- Localizations, custom texts
			import "Game/Text/de/CodexText.de.sjson.lua"
			-- import "Game/Text/el/CodexText.el.sjson.lua"
			import "Game/Text/en/CodexText.en.sjson.lua"
			import "Game/Text/es/CodexText.es.sjson.lua"
			import "Game/Text/fr/CodexText.fr.sjson.lua"
			import "Game/Text/it/CodexText.it.sjson.lua"
			import "Game/Text/ja/CodexText.ja.sjson.lua"
			import "Game/Text/ko/CodexText.ko.sjson.lua"
			import "Game/Text/pl/CodexText.pl.sjson.lua"
			import "Game/Text/pt-BR/CodexText.pt-BR.sjson.lua"
			import "Game/Text/ru/CodexText.ru.sjson.lua"
			-- import "Game/Text/tr/CodexText.tr.sjson.lua"
			-- import "Game/Text/uk/CodexText.uk.sjson.lua"
			import "Game/Text/zh-CN/CodexText.zh-CN.sjson.lua"
			-- import "Game/Text/zh-TW/CodexText.zh-TW.sjson.lua"

			import "Game/Text/de/HelpText.de.sjson.lua"
			import "Game/Text/el/HelpText.el.sjson.lua"
			import "Game/Text/en/HelpText.en.sjson.lua"
			import "Game/Text/es/HelpText.es.sjson.lua"
			import "Game/Text/fr/HelpText.fr.sjson.lua"
			import "Game/Text/it/HelpText.it.sjson.lua"
			import "Game/Text/ja/HelpText.ja.sjson.lua"
			import "Game/Text/ko/HelpText.ko.sjson.lua"
			import "Game/Text/pl/HelpText.pl.sjson.lua"
			import "Game/Text/pt-BR/HelpText.pt-BR.sjson.lua"
			import "Game/Text/ru/HelpText.ru.sjson.lua"
			import "Game/Text/tr/HelpText.tr.sjson.lua"
			import "Game/Text/uk/HelpText.uk.sjson.lua"
			import "Game/Text/zh-CN/HelpText.zh-CN.sjson.lua"
			import "Game/Text/zh-TW/HelpText.zh-TW.sjson.lua"

			import "Game/Text/de/MiscText.de.sjson.lua"
			-- import "Game/Text/el/MiscText.el.sjson.lua"
			import "Game/Text/en/MiscText.en.sjson.lua"
			import "Game/Text/es/MiscText.es.sjson.lua"
			import "Game/Text/fr/MiscText.fr.sjson.lua"
			import "Game/Text/it/MiscText.it.sjson.lua"
			import "Game/Text/ja/MiscText.ja.sjson.lua"
			import "Game/Text/ko/MiscText.ko.sjson.lua"
			import "Game/Text/pl/MiscText.pl.sjson.lua"
			import "Game/Text/pt-BR/MiscText.pt-BR.sjson.lua"
			import "Game/Text/ru/MiscText.ru.sjson.lua"
			-- import "Game/Text/tr/MiscText.tr.sjson.lua"
			-- import "Game/Text/uk/MiscText.uk.sjson.lua"
			import "Game/Text/zh-CN/MiscText.zh-CN.sjson.lua"
			-- import "Game/Text/zh-TW/MiscText.zh-TW.sjson.lua"

			import "Game/Text/de/TraitText.de.sjson.lua"
			-- import "Game/Text/el/TraitText.el.sjson.lua"
			import "Game/Text/en/TraitText.en.sjson.lua"
			import "Game/Text/es/TraitText.es.sjson.lua"
			import "Game/Text/fr/TraitText.fr.sjson.lua"
			import "Game/Text/it/TraitText.it.sjson.lua"
			import "Game/Text/ja/TraitText.ja.sjson.lua"
			import "Game/Text/ko/TraitText.ko.sjson.lua"
			import "Game/Text/pl/TraitText.pl.sjson.lua"
			import "Game/Text/pt-BR/TraitText.pt-BR.sjson.lua"
			import "Game/Text/ru/TraitText.ru.sjson.lua"
			-- import "Game/Text/tr/TraitText.tr.sjson.lua"
			-- import "Game/Text/uk/TraitText.uk.sjson.lua"
			import "Game/Text/zh-CN/TraitText.zh-CN.sjson.lua"
			-- import "Game/Text/zh-TW/TraitText.zh-TW.sjson.lua"

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

			import "Scripts/Meta/EnemyTrapDataHandler.lua"
			import "Scripts/HadesEnemyData.lua"
			import "Scripts/HadesNPCData.lua"
			import "Scripts/EnemyData.lua"
			import "Scripts/NPCData.lua"
			import "Scripts/Meta/EncounterDataHandler.lua"
			import "Scripts/Meta/RoomDataHandler.lua"

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

			-- Loads Weapon data
			import "Scripts/HadesWeaponData.lua"
			import "Scripts/WeaponData.lua"

			-- Other data that must be loaded before SetupRunData()
			import "Scripts/BountyData.lua"
			import "Scripts/CodexData.lua"
			import "Scripts/ConsumableData.lua"
			import "Scripts/CosmeticsData.lua"
			import "Scripts/CreditsData.lua"
			import "Scripts/DeathLoopData.lua"
			import "Scripts/EffectData.lua"
			import "Scripts/GardenData.lua"
			import "Scripts/GhostAdminData_Items.lua"
			import "Scripts/HarvestData.lua"
			import "Scripts/HeroData.lua"
			import "Scripts/KeywordData.lua"
			import "Scripts/LootData.lua"
			import "Scripts/MarketData.lua"
			import "Scripts/MetaUpgradeData.lua"
			import "Scripts/ResourceData.lua"
			import "Scripts/RequirementsData.lua"
			import "Scripts/ShrineData.lua"
			import "Scripts/TraitData.lua"
			import "Scripts/TraitDataNPCs.lua"
			import "Scripts/ObstacleData.lua"
			import "Scripts/ObjectiveData.lua"
			import "Scripts/ProjectileData.lua"
			import "Scripts/RunClearData.lua"
			import "Scripts/RunHistoryData.lua"
			import "Scripts/WorldUpgradeData.lua"

			-- Applies modifications to the rooms, such as LegalEncounterDictionary
			game.SetupRunData()

			-- Function mappings between Hades and Hades II
			import "Scripts/FunctionMappings/AsphodelWrapping.lua"
			import "Scripts/FunctionMappings/BossAsphodel.lua"
			import "Scripts/FunctionMappings/BossElysium.lua"
			import "Scripts/FunctionMappings/BossStyx.lua"
			import "Scripts/FunctionMappings/BossTartarus.lua"
			import "Scripts/FunctionMappings/Chariot.lua"
			import "Scripts/FunctionMappings/Crawler.lua"
			import "Scripts/FunctionMappings/CrusherUnit.lua"
			import "Scripts/FunctionMappings/Environment.lua"
			import "Scripts/FunctionMappings/HeavyRanged.lua"
			import "Scripts/FunctionMappings/LightSpawner.lua"
			import "Scripts/FunctionMappings/MiniBossTartarus.lua"
			import "Scripts/FunctionMappings/NPCLogic.lua"
			import "Scripts/FunctionMappings/ShadeNaked.lua"
			import "Scripts/FunctionMappings/StyxLogic.lua"
			import "Scripts/FunctionMappings/SurfaceLogic.lua"
			import "Scripts/FunctionMappings/SurvivalLogic.lua"
			import "Scripts/FunctionMappings/ThanatosLogic.lua"
			import "Scripts/FunctionMappings/WretchAssassin.lua"

			-- "Normal" code changes
			import "Scripts/AudioLogic.lua"
			import "Scripts/BiomeMapPresentation.lua"
			import "Scripts/CodexLogic.lua"
			import "Scripts/Combat.lua"
			import "Scripts/CombatLogic.lua"
			import "Scripts/CombatPresentation.lua"
			import "Scripts/DeathLoopLogic.lua"
			import "Scripts/EffectLogic.lua"
			import "Scripts/EffectPresentation.lua"
			import "Scripts/EnemyAILogic.lua"
			import "Scripts/EncounterLogic.lua"
			import "Scripts/EventPresentation.lua"
			import "Scripts/HarvestPresentation.lua"
			import "Scripts/HubPresentation.lua"
			import "Scripts/NarrativeLogic.lua"
			import "Scripts/PatchLogic.lua"
			import "Scripts/PowersLogic.lua"
			import "Scripts/RequirementsLogic.lua"
			import "Scripts/RewardPresentation.lua"
			import "Scripts/RoomEvents.lua"
			import "Scripts/RoomLogic.lua"
			import "Scripts/RoomPresentation.lua"
			import "Scripts/RunHistoryLogic.lua"
			import "Scripts/RunHistoryPresentation.lua"
			import "Scripts/RunLogic.lua"
			import "Scripts/ShrinePresentation.lua"
			import "Scripts/StoreLogic.lua"
			import "Scripts/TraitLogic.lua"
			import "Scripts/WeaponLogic.lua"
			import "Scripts/WeaponSets.lua"

			-- Ensure the FxOriginal package is loaded with every biome package
			mod.SetBiomePackageLoadOverrides()

			-- E.g. ThanatosElysiumIntro encounter is missing, will be caught when importing EncounterDataElysium.lua
			if mod.EncounteredInstallationIssues ~= true then
				mod.HiddenConfig.IsValidInstallation = true
				mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

				mod.DebugPrint("Mod loaded successfully! (took " .. os.clock() - startTime .. "s)", 3)
			end
		else
			mod.HiddenConfig.IsValidInstallation = false
			mod.HiddenConfig.InstallationFailReason = "MissingFiles"
			mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

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

	import "Scripts/CombatLogic_Late.lua"
	import "Scripts/DeathLoopLogic_Late.lua"
	import "Scripts/EventPresentation_Late.lua"
	import "Scripts/GhostLogic_Late.lua"
	import "Scripts/HarvestLogic_Late.lua"
	import "Scripts/HarvestPresentation_Late.lua"
	import "Scripts/HubPresentation_Late.lua"
	import "Scripts/InteractLogic_Late.lua"
	import "Scripts/MarketLogic_Late.lua"
	import "Scripts/ObjectiveLogic_Late.lua"
	import "Scripts/RoomLogic_Late.lua"
	import "Scripts/RoomPresentation_Late.lua"
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
