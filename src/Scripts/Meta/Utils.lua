---Logs a message at the specified log level with colour coding.
---@param t any The message to log.
---@param level number|nil The log level. 0 = Off, 1 = Errors, 2 = Warnings, 3 = Info, 4 = Debug. nil omits the level display.
function mod.LogMessage(t, level)
	if level == 1 then
		-- Using rom.log.error would actually throw an error
		print(string.format("\27[31m[ERROR] %s\27[0m", tostring(t)))
	elseif level == 2 then
		rom.log.warning(tostring(t))
	elseif level == 3 then
		rom.log.info(tostring(t))
	elseif level == 4 then
		rom.log.debug(tostring(t))
	end
end

---Prints a message to the console at the specified log level
---@param t any The message to print.
---@param level number|nil The verbosity level required to print the message. 0 = Off/Always printed, 1 = Errors, 2 = Warnings, 3 = Info, 4 = Debug
function mod.DebugPrint(t, level)
	level = level or 0
	if config.logLevel >= level then
		if type(t) == "table" then
			-- Tables are always logged without a level display
			mod.PrintTable(t, nil, nil)
		else
			mod.LogMessage(t, level)
		end
	end
end

---Prints a table (or any other printable entity) up to a certain depth.
---@param t any The table to print, can also be another printable entity.
---@param maxDepth number|nil The maximum depth to print the table to, after which it is cut off with ...
---@param indent number|nil The current indentation level.
function mod.PrintTable(t, maxDepth, indent)
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
			mod.PrintTable(v, maxDepth, indent + 1)
		else
			print(formatting .. k .. ": " .. tostring(v))
		end
	end
end

---Adds keys or entries from one table to another, skipping duplicates.
---If property is provided, skips duplicates based on the property (e.g., "Name").
---Returns tableToTake without the duplicate keys or entries.
---@param tableToAddTo table The table to add keys or entries to.
---@param tableToTake table The table to take keys or entries from.
---@param property string|nil The property to check for duplicates with. If nil, keys are checked.
---@param order table|nil If provided, entries will be inserted as sjson objects using this order.
---@return table tableToTake All non-duplicate keys or entries from tableToTake.
function mod.AddTableKeysSkipDupes(tableToAddTo, tableToTake, property, order)
	if tableToTake == nil then
		return {}
	end

	local nonDuplicateItems = {}

	if property then
		local propertyLookup = {}

		-- Create a lookup table for the property values in tableToAddTo
		for index, entry in ipairs(tableToAddTo) do
			if entry[property] then
				propertyLookup[entry[property]] = index
			end
		end

		-- Iterate through tableToTake and add non-duplicate entries to tableToAddTo
		for _, entryToTake in pairs(tableToTake) do
			if entryToTake[property] and not propertyLookup[entryToTake[property]] then
				if order ~= nil then
					table.insert(tableToAddTo, sjson.to_object(entryToTake, order))
				else
					table.insert(tableToAddTo, entryToTake)
				end
				table.insert(nonDuplicateItems, entryToTake)
				propertyLookup[entryToTake[property]] = #tableToAddTo
			else
				mod.DebugPrint("Skipped duplicate key: " .. entryToTake[property], 4)
			end
		end
	else
		-- Iterate through tableToTake and add non-duplicate keys to tableToAddTo
		for key, value in pairs(tableToTake) do
			if tableToAddTo[key] == nil then
				if value == "nil" then
					tableToAddTo[key] = nil
				else
					tableToAddTo[key] = value
				end
				nonDuplicateItems[key] = value
			else
				mod.DebugPrint("Skipped duplicate key: " .. key, 4)
			end
		end
	end

	return nonDuplicateItems
end

---Recursive function to rename keys in a table.
---@param base table The table to modify
---@param replacements table The replacements to apply. May contain nested tables, but leaf values must be strings.
---@param baseName string The name of the base table, used for debugging purposes.
function mod.RenameKeys(base, replacements, baseName, propertyPath)
	propertyPath = propertyPath or ""
	for key, value in pairs(replacements) do
		local currentPath = propertyPath .. (propertyPath == "" and "" or ".") .. key
		if base[key] ~= nil then
			if type(value) == "table" then
				-- If all values of base[key] are tables, apply recursively to each child
				local allChildrenAreTables = true
				if type(base[key]) == "table" then
					for _, v in pairs(base[key]) do
						if type(v) ~= "table" then
							allChildrenAreTables = false
							break
						end
					end
				else
					allChildrenAreTables = false
				end

				if allChildrenAreTables then
					for childKey, childTable in pairs(base[key]) do
						mod.RenameKeys(childTable, value, baseName, currentPath .. "." .. tostring(childKey))
					end
				else
					mod.RenameKeys(base[key], value, baseName, currentPath)
				end
			else
				mod.DebugPrint("Renamed key " .. currentPath .. " to " .. value .. " for " .. baseName, 4)
				base[value] = base[key]
				base[key] = nil
			end
		end
	end
end

---Updates a specified field in a table to match the new property name.
---This will also work for tables with multiple entries and nested structures.
---@param tableToModify table The table to modify.
---@param find string The value to find.
---@param replaceWith any The value to replace "find" with.
---@param propertyPath table The path to the property being modified, as a list of keys, such as { "GeneratorData", "BlockEnemyTypes" }. A "*" key will apply the change to all keys in the table.
---@param tableName string|nil The name of the table being modified, used for debugging purposes.
function mod.UpdateField(tableToModify, find, replaceWith, propertyPath, tableName)
	local function updateField(data, path)
		local replaced = false
		if #path == 0 then
			if type(data) == "string" then
				if data == find then
					replaced = true
					return replaceWith, replaced
				end
			elseif type(data) == "table" then
				for i, value in ipairs(data) do
					if value == find then
						data[i] = replaceWith
						replaced = true
					end
				end
			end
			return data, replaced
		else
			local key = table.remove(path, 1)
			if key == "*" then
				if type(data) == "table" then
					for k, v in pairs(data) do
						data[k], replaced = updateField(v, { table.unpack(path) })
					end
				end
			elseif data ~= nil and data[key] then
				data[key], replaced = updateField(data[key], path)
			end
			return data, replaced
		end
	end

	local replaced = false
	for name, data in pairs(tableToModify) do
		if type(name) == "number" and data.Name ~= nil then
			name = data.Name
		end
		local pathCopy = { table.unpack(propertyPath) }
		data, replaced = updateField(data, pathCopy)
		if replaced then
			mod.DebugPrint(
				"Updated " .. table.concat(propertyPath, "-") .. " from " .. find .. " to " .. tostring(replaceWith) ..
				" for " .. (name or "an unknown entry") .. " in " .. (tableName or "an unknown table"), 4)
		end
	end
end

---Updates the name of a property at a given path, including handling wildcards.
---Useful when needing to replace a property that was changed between Hades and Hades II, and in conjunction with UpdateField().
---@param tableToModify table The table to modify.
---@param propertyNameToFind string The property name to find.
---@param newPropertyName string The new property name to replace the old one.
---@param propertyPath table The path to the property being modified, as a list of keys, such as { "ManualWaveTemplates", "*", "Spawns", "*" }.
---@param tableName string|nil The name of the table being modified, used for debugging purposes.
function mod.UpdatePropertyName(tableToModify, propertyNameToFind, newPropertyName, propertyPath, tableName)
	local function updateProperty(data, path)
		local renamed = false
		if #path == 0 then
			if type(data) == "table" and data[propertyNameToFind] ~= nil then
				data[newPropertyName] = data[propertyNameToFind]
				data[propertyNameToFind] = nil
				renamed = true
			end
			return data, renamed
		else
			local key = table.remove(path, 1)
			if key == "*" then
				if type(data) == "table" then
					for _, child in pairs(data) do
						child, renamed = updateProperty(child, { table.unpack(path) })
					end
				end
			elseif data ~= nil and data[key] then
				data[key], renamed = updateProperty(data[key], path)
			end
			return data, renamed
		end
	end

	-- Handle renaming at the top level if propertyPath is empty
	if #propertyPath == 0 then
		if tableToModify[propertyNameToFind] ~= nil then
			tableToModify[newPropertyName] = tableToModify[propertyNameToFind]
			tableToModify[propertyNameToFind] = nil
			mod.DebugPrint(
				"Renamed top-level property " ..
				propertyNameToFind .. " to " .. newPropertyName ..
				" in " .. (tableName or "an unknown table"), 4)
		end
	else
		-- Handle nested renaming
		local renamed = false
		for name, data in pairs(tableToModify) do
			local pathCopy = { table.unpack(propertyPath) }
			data, renamed = updateProperty(data, pathCopy)
			if renamed then
				mod.DebugPrint(
					"Renamed property " ..
					propertyNameToFind .. " to " .. newPropertyName .. " at path " .. table.concat(propertyPath, "-") ..
					" for " .. (name or "an unknown entry") .. " in " .. (tableName or "an unknown table"), 4)
			end
		end
	end
end

---Apply a set of potentially nested modifications to a table.
---If the leaf node is a table, the contents will be replaced, not merged!
---@param baseData table The table to modify.
---@param modificationData any The modification(s) to apply.
---@param replaceTable boolean|nil If modificationData is a table, this will replace the entire table instead of merging.
function mod.ApplyModifications(baseData, modificationData, replaceTable)
	for key, value in pairs(modificationData) do
		if value == mod.NilValue then
			baseData[key] = nil
		elseif type(value) == "table" then
			if replaceTable then
				baseData[key] = game.DeepCopyTable(value)
			else
				if type(baseData[key]) ~= "table" then
					baseData[key] = {}
				end
				mod.ApplyModifications(baseData[key], value, replaceTable)
			end
		else
			baseData[key] = value
		end
	end
end

---Wrapper function around sjson.decode that reads a file and decodes it.
---It replaces quadruple quotes with triple quotes and a newline, as quadruple quotes are not parsed correctly in the sjson library.
---Also applies some language-specific fixes for known issues in certain localization files.
---@param filePath string The path to the file to decode.
---@return table sjsonAsTable The decoded table.
function mod.DecodeSjsonFile(filePath)
	local fileHandle = io.open(filePath, "r")
	if not fileHandle then
		mod.DebugPrint("Could not open sjson file: " .. filePath, 1)

		-- To make sure we only try this if we've already successfully loaded the hidden config, as that also uses this function
		if mod.HiddenConfig then
			mod.HiddenConfig.IsValidInstallation = false
			mod.HiddenConfig.InstallationFailReason = "Generic"
			mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
		end

		return {}
	end

	local fileString = fileHandle:read("*a")
	fileHandle:close()

	if filePath:find("pt%-BR") then
		-- Cannot decode “, so replace it with '
		fileString = string.gsub(fileString, '\\“', '\'')
	elseif filePath:find("CodexText%.de") then
		-- Replace mistakenly added """" instead of '"""
		fileString = string.gsub(fileString, '""""', '\'"""')
	elseif filePath:find("_NPCData.ja") then
		-- Fix n\ instead of \n for Game Pass version
		fileString = string.gsub(fileString, "父上は、エウリュディケを冥界からn\\", "父上は、エウリュディケを冥界から\n")
	end

	-- In some localizations, multiline strings (starting with """) are used, but " are still incorrectly escaped using \"
	-- This breaks the sjson decoding, so we need to fix it by replacing \" with "
	fileString = string.gsub(fileString, '"""(.-)"""', function(content)
		return '"""' .. content:gsub('\\"', '"') .. '"""'
	end)

	-- Replace opening quadruple quotes with triple quotes and a newline
	fileString = string.gsub(fileString, '= """"', '= """\n"')
	-- Replace closing quadruple quotes with a newline and triple quotes
	fileString = string.gsub(fileString, '""""', '"\n"""')

	-- Decode the string to a table
	return sjson.decode(fileString)
end

---Applies modifications to the given table, not overwriting parent tables.
---The modification's key must match a Name key in the destinationTable entry.
---Do not use this to rename the Name property of an entry, instead use RenameSjsonEntries.
---@param destinationTable table The table to modify.
---@param modifications table The modifications to apply. The key must match a Name key in the destinationTable entry.
function mod.ApplyNestedSjsonModifications(destinationTable, modifications)
	local function mergeTable(target, source)
		for key, value in pairs(source) do
			if value == mod.NilValue then
				target[key] = nil
			elseif type(value) == "table" and type(target[key]) == "table" then
				mergeTable(target[key], value)
			else
				target[key] = value
			end
		end
	end

	-- Collect names to remove to avoid issues with removing during iteration
	local namesToRemove = {}
	for _, entry in ipairs(destinationTable) do
		local modification = modifications[entry.Name]
		if modification then
			if modification == mod.NilValue then
				table.insert(namesToRemove, entry.Name)
			else
				mergeTable(entry, modification)
			end
		end
	end

	-- Remove entries after iteration for safety
	if #namesToRemove > 0 then
		local nameSet = {}
		for _, name in ipairs(namesToRemove) do
			nameSet[name] = true
		end
		for i = #destinationTable, 1, -1 do
			local entry = destinationTable[i]
			if entry.Name and nameSet[entry.Name] then
				table.remove(destinationTable, i)
			end
		end
	end
end

---Replaces the key's value of entries named in the mappings table in the tableToModify.
---@param tableToModify table The table to modify
---@param mappings table Needs to have the format {["OldName"] = "NewName"}
---@param key string The key to replace the values of
---@param filename string|nil The name of the file being modified, used for debugging purposes
function mod.RenameSjsonEntries(tableToModify, mappings, key, filename)
	for _, entry in ipairs(tableToModify) do
		if entry[key] then
			if mappings[entry[key]] then
				mod.DebugPrint("Renamed entry: " ..
					entry[key] .. " to " .. mappings[entry[key]] .. " in " .. (filename or "an unknown file"), 4)
				entry[key] = mappings[entry[key]]
			end
		end
	end
end

---Removes entries named in the mappings table from the tableToModify.
---@param tableToModify table The table to modify
---@param mappings table Needs to be a list of names to remove
---@param key string The key to check for removal
---@param filename string|nil The name of the file being modified, used for debugging purposes
function mod.RemoveSjsonEntries(tableToModify, mappings, key, filename)
	local mappingsSet = {}
	for _, name in ipairs(mappings) do
		mappingsSet[name] = true
	end

	for i = #tableToModify, 1, -1 do
		local entry = tableToModify[i]
		if entry[key] and mappingsSet[entry[key]] then
			mod.DebugPrint("Removed entry: " .. entry[key] .. " from " .. (filename or "an unknown file"), 4)
			table.remove(tableToModify, i)
		end
	end
end

---Applies modifications from mod.ModdedGameObjectModifications to the game's globals.
---@param useModded boolean If true, will apply the "Modded" values, otherwise the "Default" values.
---@param target table|nil On first invocation, will be set to the game's global. Afterwards, the sub-tables as defined in the modifications.
---@param modifications table|nil The modifications to apply. Must be a hierarchical table as in the game's global, with "Default" and "Modded" leaf keys.
function mod.ApplyGlobalGameObjectModifications(useModded, target, modifications)
	target = target or game
	modifications = modifications or mod.ModdedGameObjectModifications
	for key, value in pairs(modifications) do
		if type(value) == "table" and value.Default ~= nil and value.Modded ~= nil then
			-- Set to Modded or Default based on parameter
			target[key] = useModded and value.Modded or value.Default
			mod.DebugPrint("Applying modification to leaf key: " .. key .. " with new value: " .. tostring(target[key]), 4)
		elseif type(value) == "table" and target[key] ~= nil and type(target[key]) == "table" then
			mod.ApplyGlobalGameObjectModifications(useModded, target[key], value)
		end
	end
end

---Returns if a given entry should be removed from a table based on a list of entries to remove.
---@param entryName string The name, ID or other identifier of the entry to check. This will most times be passed in as table.Name or table.Id.
---@param entriesToRemove table A list of names, IDs or other identifiers to remove.
---@return boolean shouldRemove True if the entry should be removed, false otherwise.
function mod.ShouldRemoveEntry(entryName, entriesToRemove)
	for _, removeName in ipairs(entriesToRemove) do
		if entryName == removeName then
			return true
		end
	end
	return false
end

---Tries to use TryLoadCachedSjsonFile to load a file in the mod's cache folder.
---If the file does not exist, creates it with the provided default content.
---@param fileName string The name of the file to load or create. This file must be located in the mod's cache folder.
---@param defaultContent table The default content to create the file with, if it does not exist.
---@return table decodedSjsonFile The decoded sjson file
function mod.TryGetOrCreateCachedSjsonFile(fileName, defaultContent)
	defaultContent = defaultContent or {}
	local basePath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid .. "\\cache\\")
	local path = rom.path.combine(basePath, fileName)

	if rom.path.exists(path) then
		local loadedFileContent = mod.TryLoadCachedSjsonFile(path) or {}
		-- Add all missing keys from defaultContent to loadedFileContent
		mod.AddTableKeysSkipDupes(loadedFileContent, defaultContent)
		-- Opposite: Remove any keys in loadedFileContent that are not in defaultContent
		local anyRemoved = false
		for key, _ in pairs(loadedFileContent) do
			if defaultContent[key] == nil then
				loadedFileContent[key] = nil
				anyRemoved = true
			end
		end
		if anyRemoved then
			-- Save the updated content back to the file
			mod.SaveCachedSjsonFile(fileName, loadedFileContent)
		end

		return loadedFileContent
	else
		mod.SaveCachedSjsonFile(fileName, defaultContent)
		return defaultContent
	end
end

---Tries to load a file in the mod's cache folder and returns its contents.
---@return table|nil decodedSjsonFile The decoded sjson file.
function mod.TryLoadCachedSjsonFile(fileName)
	local basePath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid .. "\\cache\\")
	local path = rom.path.combine(basePath, fileName)
	mod.DebugPrint("Trying to load cached sjson file: " .. path, 4)

	if rom.path.exists(path) then
		return mod.DecodeSjsonFile(path)
	else
		mod.DebugPrint(
			fileName ..
			" not found in the cache! Please reinstall the mod by removing it from r2modman and installing it again afterwards.",
			1)
		return nil
	end
end

---Saves data to a file in the mod's cache folder.
---@param fileName string The name of the file to save to. This file must be located in the mod's cache folder.
---@param data table The data to save.
function mod.SaveCachedSjsonFile(fileName, data)
	local basePath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid .. "\\cache\\")
	local path = rom.path.combine(basePath, fileName)
	sjson.encode_file(path, data)
end

---Checks if the user has Hades mods installed, which would conflict with this mod
---The installation/mod load will be aborted and a message shown to the user
---@return boolean True if Hades mods are installed, false otherwise
function mod.AreHadesModsInstalled()
	local modimporterLogFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\modimporter.log.txt")
	if rom.path.exists(modimporterLogFilePath) then
		local file = io.open(modimporterLogFilePath, "r")
		if file then
			local content = file:read("*all")
			file:close()
			if content and content:find("base files import a total of") and not content:find("0 base files import a total of 0 mod files") then
				mod.DebugPrint(
					"Hades mods detected! You must uninstall all mods for Hades before installing Zagreus' Journey. Aborting mod installation to prevent conflicts.",
					1)

				mod.HiddenConfig.IsValidInstallation = false
				mod.HiddenConfig.InstallationFailReason = "HadesModsInstalled"
				mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

				-- Ensure we get a new clean install next time
				config.uninstall = true
				config.firstTimeSetup = true

				return true
			end
		end
	end
	return false
end

---We need to override the packages that are loaded with a biome package, to also load the Fx package, as we need the textures from it before map load.
function mod.SetBiomePackageLoadOverrides()
	local tartarusBiomeHash = rom.data.get_hash_guid_from_string("TartarusModsNikkelMHadesBiomes")
	local asphodelBiomeHash = rom.data.get_hash_guid_from_string("AsphodelModsNikkelMHadesBiomes")
	local elysiumBiomeHash = rom.data.get_hash_guid_from_string("ElysiumModsNikkelMHadesBiomes")
	local styxBiomeHash = rom.data.get_hash_guid_from_string("StyxModsNikkelMHadesBiomes")
	local surfaceBiomeHash = rom.data.get_hash_guid_from_string("SurfaceModsNikkelMHadesBiomes")
	local erebusBiomeHash = rom.data.get_hash_guid_from_string("ErebusModsNikkelMHadesBiomes")
	local charonBiomeHash = rom.data.get_hash_guid_from_string("CharonModsNikkelMHadesBiomes")

	local originalFxHash = rom.data.get_hash_guid_from_string("ModsNikkelMHadesBiomesFxOriginal")
	local moddedFxHash = rom.data.get_hash_guid_from_string("NikkelM-HadesBiomesFxModded")
	local roomManagerHash = rom.data.get_hash_guid_from_string("RoomManagerModsNikkelMHadesBiomes")

	rom.data.load_package_overrides_set(tartarusBiomeHash,
		{ tartarusBiomeHash, originalFxHash, moddedFxHash, roomManagerHash })
	rom.data.load_package_overrides_set(asphodelBiomeHash,
		{ asphodelBiomeHash, originalFxHash, moddedFxHash, roomManagerHash })
	rom.data.load_package_overrides_set(elysiumBiomeHash,
		{ elysiumBiomeHash, originalFxHash, moddedFxHash, roomManagerHash })
	rom.data.load_package_overrides_set(styxBiomeHash,
		{ styxBiomeHash, originalFxHash, moddedFxHash, roomManagerHash })
	rom.data.load_package_overrides_set(surfaceBiomeHash,
		{ surfaceBiomeHash, originalFxHash, moddedFxHash, roomManagerHash })
	rom.data.load_package_overrides_set(erebusBiomeHash,
		{ erebusBiomeHash, originalFxHash, moddedFxHash, roomManagerHash })
	rom.data.load_package_overrides_set(charonBiomeHash,
		{ charonBiomeHash, originalFxHash, moddedFxHash, roomManagerHash })
end

modutil.mod.Path.Wrap("DebugPrint", function(base, args)
	mod.DebugPrint(args.Text, 4)
	return base(args)
end)
