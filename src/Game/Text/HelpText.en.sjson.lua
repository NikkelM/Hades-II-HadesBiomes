local order = {
  "Id",
  "DisplayName",
  "OverwriteLocalization"
}

-- TODO: Instead of redoing everything, simply load the help text file from Hades, but skip any existing entries

local newData = {
	{
		Id = "Location_Tartarus",
		DisplayName = "TARTARUS - MEMORY"
	}
}

local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/en/HelpText.en.sjson')

sjson.hook(helpTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
