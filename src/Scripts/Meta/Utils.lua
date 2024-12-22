-- Utility functions

-- Adds keys from one table to another, skipping duplicates
-- Returns tableToTake without the duplicate keys
function mod.AddTableKeysSkipDupes(tableToOverwrite, tableToTake)
	if tableToTake == nil then
		return {}
	end

	local nonDuplicateKeys = {}

	for key, value in pairs(tableToTake) do
		if tableToOverwrite[key] == nil then
			if value == "nil" then
				tableToOverwrite[key] = nil
			else
				tableToOverwrite[key] = value
			end
			nonDuplicateKeys[key] = value
		end
	end

	return nonDuplicateKeys
end
