-- Utility functions

mod.NilValue = {}
mod.TableValue = {}

---Logs a message at the specified log level with colour coding.
---@param t any The message to log.
---@param level number|nil The log level. 0 = Off, 1 = Errors, 2 = Warnings, 3 = Info, 4 = Debug. nil omits the level display.
function mod.LogMessage(t, level)
	local logLevels = { [1] = "[ERROR] ", [2] = "[WARNING] ", [3] = "[INFO] ", [4] = "[DEBUG] " }
	local logColours = { [1] = "\27[31m", [2] = "\27[33m", [3] = "\27[32m", [4] = "\27[34m" } -- Red, Yellow, Green, Blue
	local resetColour = "\27[0m"

	local logLevelText = logLevels[level] or ""
	local logLevelColour = logColours[level] or resetColour
	local logColour
	if level <= 2 then logColour = logColours[level] else logColour = resetColour end

	print(string.format("%s%s%s%s%s", logLevelColour, logLevelText, logColour, tostring(t), resetColour))
end

---Prints a message to the console at the specified log level
---@param t any The message to print.
---@param level number|nil The verbosity level required to print the message. 0 = Off, 1 = Errors, 2 = Warnings, 3 = Info, 4 = Debug
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

mod.CachedRunsFilePath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid .. "\\cache\\cachedRuns.sjson")

---Loads the cachedRuns.sjson file and returns its contents.
---@return table
function mod.LoadCachedRunsFile()
	if rom.path.exists(mod.CachedRunsFilePath) then
		return sjson.decode_file(mod.CachedRunsFilePath)
	else
		error(
			"\"cachedRuns.sjson\" not found! Please re-install the mod by setting both \"uninstall\" and \"firstTimeSetup\" in the config to \"true\".")
	end
end

---Adds keys or entries from one table to another, skipping duplicates.
---If property is provided, skips duplicates based on the property (e.g., "Name").
---Returns tableToTake without the duplicate keys or entries.
---@param tableToOverwrite table The table to add keys or entries to.
---@param tableToTake table The table to take keys or entries from.
---@param property string|nil The property to check for duplicates with. If nil, keys are checked.
---@return table tableToTake All non-duplicate keys or entries from tableToTake.
function mod.AddTableKeysSkipDupes(tableToOverwrite, tableToTake, property)
	if tableToTake == nil then
		return {}
	end

	local nonDuplicateItems = {}

	if property then
		local propertyLookup = {}

		-- Create a lookup table for the property values in tableToOverwrite
		for index, entry in ipairs(tableToOverwrite) do
			if entry[property] then
				propertyLookup[entry[property]] = index
			end
		end

		-- Iterate through tableToTake and add non-duplicate entries to tableToOverwrite
		for _, entryToTake in pairs(tableToTake) do
			if entryToTake[property] and not propertyLookup[entryToTake[property]] then
				table.insert(tableToOverwrite, entryToTake)
				table.insert(nonDuplicateItems, entryToTake)
				propertyLookup[entryToTake[property]] = #tableToOverwrite
			else
				mod.DebugPrint("Skipped duplicate key: " .. entryToTake[property], 4)
			end
		end
	else
		-- Iterate through tableToTake and add non-duplicate keys to tableToOverwrite
		for key, value in pairs(tableToTake) do
			if tableToOverwrite[key] == nil then
				if value == "nil" then
					tableToOverwrite[key] = nil
				else
					tableToOverwrite[key] = value
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
			if key == '*' then
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
---@param filePath string The path to the file to decode.
---@return table sjsonAsTable The decoded table.
function mod.DecodeSjsonFile(filePath)
	local fileHandle = io.open(filePath, "r")
	if not fileHandle then
		error("Could not open help text file: " .. filePath)
	end

	local fileString = fileHandle:read("*a")
	fileHandle:close()

	if filePath:find("pt%-BR") then
		-- Cannot decode “, so replace it with '
		fileString = string.gsub(fileString, '\\“', '\'')
	elseif filePath:find("CodexText%.de") then
		-- Replace mistakenly added """" instead of '"""
		fileString = string.gsub(fileString, '""""', '\'"""')
	end

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
	for _, entry in ipairs(destinationTable) do
		local modification = modifications[entry.Name]
		if modification then
			for key, value in pairs(modification) do
				if type(value) == "table" then
					entry[key] = entry[key] or {}
					for subKey, subValue in pairs(value) do
						entry[key][subKey] = subValue
					end
				else
					entry[key] = value
				end
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
