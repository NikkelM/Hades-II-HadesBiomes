-- Contains the upgrade choices the player can choose from NPCs like Sisyphus
local newTraitData = {
	SisyphusHealing = {
		InheritFrom = { "NarcissusA", },
	},
	SisyphusMoney =
	{
		InheritFrom = { "NarcissusB", },
	},
	SisyphusMetapoints =
	{
		InheritFrom = { "NarcissusC", },
	},
}

game.OverwriteTableKeys(game.TraitData, newTraitData)
