local mod = modutil.mod.Mod.Register(_PLUGIN.guid)

-- First, set up the folder in which the Hades installation is located
mod.hadesGameFolder = config.hadesGameFolder

-- This means we look for the Hades folder in the same parent directory as Hades II
if mod.hadesGameFolder == "root" then
	local hadesTwoContentFolder = rom.paths.Content()
	mod.hadesGameFolder = rom.path.combine(rom.path.get_parent(rom.path.get_parent(hadesTwoContentFolder)), "Hades")
end

-- Loads RoomData from a file in Hades
function mod.LoadHadesRoomData(fileName)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content/Scripts", fileName)
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		return RoomSetData
	else
		print("Error loading RoomData: " .. err)
	end
end