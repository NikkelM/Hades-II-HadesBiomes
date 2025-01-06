-- Utility functions

-- Used to represent nil
mod.NilValue = {}

---Prints a message to the console only if debug mode is enabled.
---@param t any The message to print.
function mod.DebugPrint(t)
	if config.debug then
		mod.PrintTable(t)
	end
end

---Prints a table up to a certain depth, or any other printable entity.
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
---@param tableToOverwrite table The table to add keys or entries to.
---@param tableToTake table The table to take keys or entries from.
---@param property string|nil The property to check for duplicates with.
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
				mod.DebugPrint("Skipping duplicate key: " .. entryToTake[property])
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
				mod.DebugPrint("Skipping duplicate key: " .. key)
			end
		end
	end

	return nonDuplicateItems
end

---Updates a specified field in a table to match the new property name.
---This will also work for tables with multiple entries and nested structures.
---@param tableToModify table The table to modify.
---@param find string The value to find.
---@param replaceWith string The value to replace "find" with.
---@param propertyPath table The path to the property being modified, as a list of keys, such as { "GeneratorData", "BlockEnemyTypes" }.
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
			if data[key] then
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
			mod.DebugPrint("Updated " .. table.concat(propertyPath, "-") .. " from " ..
				find ..
				" to " .. replaceWith .. " for " .. (name or "an unknown entry") .. " in " .. (tableName or "an unknown table"))
		end
	end
end

---Apply a set of potentially nested modifications to a table.
---@param baseData table The table to modify.
---@param modificationData any The modification(s) to apply.
---@param replaceTable boolean|nil If modificationData is a table, this will replace the entire table instead of merging.
function mod.ApplyModifications(baseData, modificationData, replaceTable)
	for key, value in pairs(modificationData) do
		if value == mod.NilValue then
			baseData[key] = nil
		elseif type(value) == "table" then
			if replaceTable then
				baseData[key] = value
			else
				if type(baseData[key]) ~= "table" then
					baseData[key] = {}
				end
				mod.ApplyModifications(baseData[key], value)
			end
		else
			baseData[key] = value
		end
	end
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

---Replaces the "Name" values of entries named in the mappings table in the tableToModify.
---@param tableToModify table The table to modify
---@param mappings table Needs to have the format {["OldName"] = "NewName"}
---@param filename string|nil The name of the file being modified, used for debugging purposes
function mod.RenameSjsonEntries(tableToModify, mappings, filename)
	for _, entry in ipairs(tableToModify) do
		if entry.Name then
			if mappings[entry.Name] then
				mod.DebugPrint("Renamed entry: " ..
					entry.Name .. " to " .. mappings[entry.Name] .. " in " .. (filename or "an unknown file"))
				entry.Name = mappings[entry.Name]
			end
		end
	end
end
