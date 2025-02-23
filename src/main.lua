---@meta _
-- grabbing our dependencies,
-- these funky (---@) comments are just there
--	 to help VS Code find the definitions of things

import = require

---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@module 'SGG_Modding-ENVY-auto'
mods['SGG_Modding-ENVY'].auto()
-- ^ this gives us `public` and `import`, among others
--	and makes all globals we define private to this plugin.
---@diagnostic disable: lowercase-global

---@diagnostic disable-next-line: undefined-global
rom = rom
---@diagnostic disable-next-line: undefined-global
_PLUGIN = _PLUGIN

-- get definitions for the game's globals
---@module 'game'
game = rom.game
---@module 'game-import'
---@diagnostic disable-next-line: undefined-global
import_as_fallback(game)

---@module 'SGG_Modding-SJSON'
sjson = mods['SGG_Modding-SJSON']
---@module 'SGG_Modding-ModUtil'
modutil = mods['SGG_Modding-ModUtil']

---@module 'SGG_Modding-Chalk'
chalk = mods["SGG_Modding-Chalk"]
---@module 'SGG_Modding-ReLoad'
reload = mods['SGG_Modding-ReLoad']

---@module 'config'
config = chalk.auto 'config.lua'
-- ^ this updates our `.cfg` file in the config folder!
---@diagnostic disable-next-line: undefined-global
public.config = config -- so other mods can access our config

-- For debugging
-- TODO: Remove when releasing
function game.printTable(t, maxDepth, indent)
	if type(t) ~= "table" then
		print(t)
		return
	end

	indent = indent or 0
	maxDepth = maxDepth or 20
	if indent > maxDepth then
		print(string.rep("  ", indent) .. "...")
		return
	end

	local formatting = string.rep("  ", indent)
	for k, v in pairs(t) do
		if type(v) == "table" then
			print(formatting .. k .. ":")
			game.printTable(v, maxDepth, indent + 1)
		else
			print(formatting .. k .. ": " .. tostring(v))
		end
	end
end

local function on_ready()
	-- what to do when we are ready, but not re-do on reload.
	if config.enabled == false then return end

	mod = modutil.mod.Mod.Register(_PLUGIN.guid)

	-- File handling and other generic functions required at install time
	import "Scripts/Meta/GameStateRequirements.lua"
	import "Scripts/Meta/Utils.lua"
	import "Scripts/Meta/RequiredFileData.lua"
	import "Scripts/Meta/AnimationDuplicatesDataFx.lua"
	import "Scripts/Meta/AnimationDuplicatesDataGUI.lua"
	import "Scripts/Meta/AnimationDuplicatesDataPortraits.lua"
	import "Scripts/Meta/AnimationDuplicatesDataNPCs.lua"
	import "Scripts/Meta/NameMappingData.lua"
	import "Scripts/Meta/FileHandling.lua"

	if not mod.ConfirmHadesInstallation() then return end

	import "Scripts/Meta/FirstTimeSetup.lua"
	import "Scripts/Meta/Uninstall.lua"

	-- If the game was updated, the file checksums very likely got updated as well
	-- At the same time, if the mod gets updated, the checksums.txt will be reset to the empty file as well
	-- We can use this to determine if we should re-install the mod, to make sure we do not interfere with any files the game modified
	mod.CompareChecksums()

	if config.uninstall == "true" or config.uninstall == "I AM SURE - UNINSTALL" then
		local uninstallSuccessful = mod.Uninstall()
		if uninstallSuccessful and not config.firstTimeSetup then
			config.enabled = false
			return
		end
	elseif config.uninstall ~= "false" then
		mod.DebugPrint(
			"Invalid value for \"uninstall\" in the config file (\"" ..
			config.uninstall ..
			"\"). Please set it to \"true\" to uninstall the mod normally, \"I AM SURE - UNINSTALL\" to force an uninstall, or \"false\" to not uninstall.",
			2)
		config.uninstall = "false"
	end

	if config.firstTimeSetup then
		mod.FirstTimeSetup()
	end

	-- Before proceeding, check that required files exist
	if mod.CheckRequiredFiles() then
		-- General data needed for map generation/display
		import "Game/MapGroups.sjson.lua"

		-- SJSON changes
		import "Game/Animations/Model/Hero_Melinoe_Animation_Personality.sjson.lua"
		import "Game/Animations/CharacterAnimationsEnemies.sjson.lua"
		-- Must be loaded after CharacterAnimationsEnemies, as it inherits some animations from it
		import "Game/Animations/EnemyAnimations.sjson.lua"
		import "Game/Animations/Obstacle_Deprecated_VFX.sjson.lua"
		import "Game/Animations/Obstacle_General_VFX.sjson.lua"
		import "Game/Units/Enemies.sjson.lua"
		import "Game/Weapons/EnemyWeapons.sjson.lua"
		import "Game/Projectiles/Projectiles.sjson.lua"
		import "Game/Projectiles/EnemyProjectiles.sjson.lua"
		import "Game/Obstacles/Tartarus.sjson.lua"
		import "Game/Obstacles/Chaos.sjson.lua"
		-- Localizations, custom texts
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
		import "Game/Text/zh-CN/ScreenText.zh-CN.sjson.lua"
		import "Game/Text/zh-TW/ScreenText.zh-TW.sjson.lua"

		-- Imports enemy, encounter and room data from Hades to Hades II - ALWAYS requires a Hades installation
		-- Done first, as the EncounterData depends on the EnemySets
		import "Scripts/EnemySets.lua"

		import "Scripts/Meta/EnemyTrapDataHandler.lua"
		import "Scripts/EnemyData.lua"
		import "Scripts/Meta/EncounterDataHandler.lua"
		import "Scripts/Meta/RoomDataHandler.lua"

		-- Loads Encounter data
		-- Do this before loading the room data, as the rooms need the legal encounters defined in here
		import "Scripts/EncounterSets.lua"
		import "Scripts/EncounterDataTartarus.lua"

		-- Loads Room data
		import "Scripts/RoomSets.lua"
		import "Scripts/HadesRoomData.lua"
		import "Scripts/RoomData.lua"
		import "Scripts/HadesRoomDataTartarus.lua"
		import "Scripts/RoomDataTartarus.lua"

		-- Loads Weapon data
		import "Scripts/HadesWeaponData.lua"
		import "Scripts/WeaponData.lua"

		-- Applies modifications to the rooms, such as LegalEncounterDictionary
		game.SetupRunData()

		-- Function mappings between Hades and Hades II
		import "Scripts/FunctionMappings/MiniBossTartarus.lua"
		import "Scripts/FunctionMappings/BossTartarus.lua"
		import "Scripts/FunctionMappings/Environment.lua"
		import "Scripts/FunctionMappings/LightSpawner.lua"
		import "Scripts/FunctionMappings/HeavyRanged.lua"
		import "Scripts/FunctionMappings/WretchAssassin.lua"

		-- "Normal" code changes
		import "Scripts/AudioData.lua"
		import "Scripts/Combat.lua"
		import "Scripts/CombatLogic.lua"
		import "Scripts/CombatPresentation.lua"
		import "Scripts/DeathLoopData.lua"
		import "Scripts/EnemyAILogic.lua"
		import "Scripts/HeroData.lua"
		import "Scripts/NPCData.lua"
		import "Scripts/ObstacleData.lua"
		import "Scripts/ProjectileData.lua"
		import "Scripts/RewardPresentation.lua"
		import "Scripts/RoomEvents.lua"
		import "Scripts/RoomLogic.lua"
		import "Scripts/RunLogic.lua"
		import "Scripts/UIData.lua"
		import "Scripts/WeaponSets.lua"
	else
		error(
			"Required files are missing and the mod is not active. Please check the log and run the first time setup by setting the config value to true.")
	end
end

local function on_reload()
	-- what to do when we are ready, but also again on every reload.
	-- only do things that are safe to run over and over.
	if config.enabled == false then return end
end

-- this allows us to limit certain functions to not be reloaded.
local loader = reload.auto_single()

-- this runs only when modutil and the game's lua is ready
modutil.once_loaded.game(function()
	loader.load(on_ready, on_reload)
end)
