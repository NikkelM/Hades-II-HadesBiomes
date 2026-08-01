local ponyMenu = mod.IsOtherModActive("PonyWarrior-PonyMenu")
if ponyMenu == nil or ponyMenu.CommandData == nil then
	return
end

local ponyMenuInternal = modutil.mod.Path.Get("PonyWarrior-PonyMenu")
if ponyMenuInternal == nil or ponyMenuInternal.BoonData == nil then
	return
end

local iconScale = 0.25
local npcMenuEntries = {
	{
		Name = "NPC_SisyphusAndBouldy_01",
		-- Bond icons from SharedKeepsakePort
		IconPath = "zannc-SharedKeepsakePort\\GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\Sisyphus_02",
		EnemyName = "NPC_Sisyphus_01",
		BlessingKeys = { "BouldyRandomBlessings" },
	},
	{
		Name = "NPC_Eurydice_01",
		IconPath = "zannc-SharedKeepsakePort\\GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\Eurydice_02",
		EnemyName = "NPC_Eurydice_01",
	},
	{
		Name = "NPC_Patroclus_01",
		IconPath = "zannc-SharedKeepsakePort\\GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\Patroclus_02",
		EnemyName = "NPC_Patroclus_01",
	},
	{
		Name = "NPC_Orpheus_01",
		IconPath = "zannc-SharedKeepsakePort\\GUI\\Screens\\AwardMenu\\KeepsakeMaxGift\\Orpheus_02",
		EnemyName = "NPC_Orpheus_01",
	},
}

local function gatherEntryTraits(entry)
	local traits = {}
	local seen = {}

	local function addTrait(traitName)
		if traitName ~= nil and not seen[traitName] and game.TraitData[traitName] ~= nil then
			seen[traitName] = true
			table.insert(traits, traitName)
		end
	end

	local enemyData = entry.EnemyName ~= nil and game.EnemyData[entry.EnemyName] or nil
	if type(enemyData) == "table" and type(enemyData.Traits) == "table" then
		for _, traitName in ipairs(enemyData.Traits) do
			addTrait(traitName)
		end
	end

	-- For Bouldy
	for _, blessingKey in ipairs(entry.BlessingKeys or {}) do
		local blessings = mod.PresetEventArgs[blessingKey]
		if type(blessings) == "table" then
			for _, traitName in ipairs(blessings) do
				addTrait(traitName)
			end
		end
	end

	return traits
end

local function isAlreadyRegistered(name)
	for _, existing in ipairs(ponyMenu.CommandData) do
		if existing.Name == name then
			return true
		end
	end
	return false
end

for _, entry in ipairs(npcMenuEntries) do
	local traits = gatherEntryTraits(entry)
	if #traits > 0 then
		ponyMenuInternal.BoonData[entry.Name] = traits
		if not isAlreadyRegistered(entry.Name) then
			table.insert(ponyMenu.CommandData, {
				IconPath = entry.IconPath,
				IconScale = iconScale,
				Name = entry.Name,
				Type = "Boon",
				NoRarity = true,
				NoSpawn = true,
			})
		end
	end
end
