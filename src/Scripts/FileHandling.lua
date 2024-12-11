local mod = modutil.mod.Mod.Register(_PLUGIN.guid)

-- First, set up the folder in which the Hades installation is located
mod.hadesGameFolder = config.hadesGameFolder

-- This means we look for the Hades folder in the same parent directory as Hades II
if mod.hadesGameFolder == "root" then
	local hadesTwoContentFolder = rom.paths.Content()
	mod.hadesGameFolder = rom.path.combine(rom.path.get_parent(rom.path.get_parent(hadesTwoContentFolder)), "Hades")
end
