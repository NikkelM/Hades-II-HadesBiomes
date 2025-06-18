-- Contains mostly utility functions removed between Hades and Hades II
function game.CombineAllValues(tables)
	if tables == nil then
		return
	end

	local returnTable = {}
	for k, subTable in pairs(tables) do
		for k, value in pairs(subTable) do
			table.insert(returnTable, value)
		end
	end

	return returnTable
end
