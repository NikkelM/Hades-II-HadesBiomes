---@meta _
-- grabbing our dependencies,
-- these funky (---@) comments are just there
--	 to help VS Code find the definitions of things

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
public.config = config -- so other mods can access our config

-- For debugging
-- TODO: Remove when releasing
function game.printTable(t, maxDepth, indent)
	if type(t) ~= "table" then
		print(t)
		return
	end

	indent = indent or 0
	maxDepth = maxDepth or math.huge
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

function printTable(t, maxDepth, indent)
	if type(t) ~= "table" then
		print(t)
		return
	end

	indent = indent or 0
	maxDepth = maxDepth or math.huge
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

	-- File handling and other generic functions
	import "Scripts/Meta/Utils.lua"
	import "Scripts/Meta/RequiredFileData.lua"
	import "Scripts/Meta/FileHandling.lua"

	if not mod.ConfirmHadesInstallation() then return end

	-- Imports enemy, encounter and room data from Hades to Hades II - ALWAYS requires a Hades installation
	-- Done first, as the EncounterData depends on the EnemySets
	import "Scripts/EnemySets.lua"

	import "Scripts/Meta/EnemyDataHandler.lua"
	import "Scripts/Meta/EncounterDataHandler.lua"
	import "Scripts/Meta/RoomDataHandler.lua"

	import "Scripts/Meta/FirstTimeSetup.lua"
	import "Scripts/Meta/Uninstall.lua"

	-- If the game was updated, the file checksums very likely got updated as well
	-- At the same time, if the mod gets updated, the checksums.txt will be reset to the empty file as well
	-- We can use this to determine if we should re-install the mod, to make sure we do not interfere with any files the game modified
	mod.CompareChecksums()

	if config.uninstall then
		mod.Uninstall()
		if not config.firstTimeSetup then
			return
		end
	end

	if config.firstTimeSetup then
		mod.FirstTimeSetup()
	end

	-- Before proceeding, check that required files exist
	if mod.CheckRequiredFiles() then
		-- Loads Encounter data
		-- Do this before loading the room data, as the rooms need the legal encounters defined in here
		import "Scripts/EncounterSets.lua"
		import "Scripts/EncounterDataTartarus.lua"

		-- Loads Room data
		import "Scripts/RoomSets.lua"
		import "Scripts/RoomDataTartarus.lua"


		-- Applies modifications to the rooms, such as LegalEncounterDictionary
		game.SetupRunData()

		-- General data needed for map generation/display
		import "Game/MapGroups.sjson.lua"

		-- Function mappings between Hades and Hades II
		import "Scripts/Meta/FunctionMappings.lua"

		-- "Normal" code changes
		import "Scripts/DeathLoopData.lua"

		-- SJSON changes
		import "Game/Units/Enemies.sjson.lua"
		import "Game/Weapons/EnemyWeapons.sjson.lua"
		import "Game/Projectiles/EnemyProjectiles.sjson.lua"
		import "Game/Obstacles/Tartarus.sjson.lua"
		import "Game/Obstacles/Chaos.sjson.lua"
		-- Localizations, custom texts
		import "Game/Text/HelpText.en.sjson.lua"
	else
		error(
			"Required files are missing. Please check the log and run the first time setup by setting the config value to true.")
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
