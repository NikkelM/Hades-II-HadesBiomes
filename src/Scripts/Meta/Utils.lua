-- Utility functions

-- Adds keys or entries from one table to another, skipping duplicates
-- If property is provided, skips duplicates based on the property (e.g., "Name")
-- Returns tableToTake without the duplicate keys or entries
function mod.AddTableKeysSkipDupes(tableToOverwrite, tableToTake, property, debug)
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
			elseif debug then
				print("Skipping duplicate key: " .. entryToTake[property])
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
			elseif debug then
				print("Skipping duplicate key: " .. key)
			end
		end
	end

	return nonDuplicateItems
end

-- Updates the InheritFrom field in a table to match the new property name
function mod.UpdateInheritFrom(tableToModify, find, replaceWith)
	for _, data in pairs(tableToModify) do
		if data.InheritFrom then
			for i, value in ipairs(data.InheritFrom) do
				if value == find then
					data.InheritFrom[i] = replaceWith
				end
			end
		end
	end
end

-- Applies modifications to the given table, not overwriting parent tables
-- The modification's key must match a Name key in the destinationTable entry
function mod.applyNestedSjsonModifications(destinationTable, modifications)
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
