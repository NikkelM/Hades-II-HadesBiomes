-- This is for the chaos gate that functions as the run start door for a Hades run
-- Even though we set a different animation, this is the base obstacle we still need to mute the sound

local order = {
	"Name",
	"InheritFrom",
	"OverwriteLocalization"
}

local newData = {
	{
		Name = "ModsNikkelMHadesBiomes_HadesRunStartDoor",
		InheritFrom = "SecretDoor",
		Thing = {
			AmbientSound = "/EmptyCue"
		},
	}
}

local chaosObstaclesFile = rom.path.combine(rom.paths.Content(), 'Game/Obstacles/Chaos.sjson')

sjson.hook(chaosObstaclesFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Obstacles, sjson.to_object(newValue, order))
	end
end)
