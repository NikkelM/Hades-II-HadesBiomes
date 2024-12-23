-- Utility functions

-- Adds keys or entries from one table to another, skipping duplicates
-- If property is provided, skips duplicates based on the property (e.g., "Name")
-- Returns tableToTake without the duplicate keys or entries
function mod.AddTableSkipDupes(tableToOverwrite, tableToTake, property)
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
