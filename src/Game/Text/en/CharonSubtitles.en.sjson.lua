-- Hooking into one of our own subtitle files
local zagreusFieldSubtitleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Text\\en\\Z_ModsNikkelMHadesBiomesZagreusField.en.sjson")

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
}

local newData = {
	-- Player injured
	{
		Id = "Megaera_10079",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Heehh...",
	},
	{
		Id = "Megaera_10080",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Tsyehh...",
	},
	{
		Id = "Megaera_10081",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrrnn...",
	},
	{
		Id = "Megaera_10082",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Haah...",
	},
	{
		Id = "Megaera_10083",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Krrr...",
	},
	{
		Id = "Megaera_10084",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Kh,hh,hh...",
	},
	{
		Id = "Megaera_10085",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hah!",
	},
	{
		Id = "Megaera_10086",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrn!",
	},
	{
		Id = "Megaera_10087",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hehh!",
	},
	-- Last stand reaction
	{
		Id = "Megaera_10088",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hoh...",
	},
	{
		Id = "Megaera_10089",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrnn...",
	},
	{
		Id = "Megaera_10090",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Khh...",
	},
	{
		Id = "Megaera_10091",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hhhh...",
	},
	{
		Id = "Megaera_10092",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Phhh...",
	},
	-- Wrath reaction
	{
		Id = "Megaera_10093",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrrrnn!",
	},
	{
		Id = "Megaera_10094",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Gaahhh!",
	},
	{
		Id = "Megaera_10095",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Khhaaa!",
	},
	{
		Id = "Megaera_10096",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Shehh!",
	},
	{
		Id = "Megaera_10097",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hohh...",
	},
	{
		Id = "Megaera_10098",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Nraugh!",
	},
	-- Assist reaction
	{
		Id = "Megaera_10054",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hehh?",
	},
	{
		Id = "Megaera_10055",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hraugh!",
	},
	{
		Id = "Megaera_10069",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrrngh?!",
	},
	{
		Id = "Megaera_10070",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Haaah?!",
	},
	{
		Id = "Megaera_10071",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Rraah!!",
	},
	{
		Id = "Megaera_10056",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Ch'hehhh....",
	},
	{
		Id = "Megaera_10057",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrnmm..",
	},
	{
		Id = "Megaera_10058",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Krrr...",
	},
	{
		Id = "Megaera_10059",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Nrrrhh...",
	},
	-- Cause of death
	{
		Id = "Megaera_10048",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrreehhh, hehh....",
	},
	{
		Id = "Megaera_10049",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrrooooaaauugghh...",
	},
	{
		Id = "Megaera_10050",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Grraauugggh....",
	},
	{
		Id = "Megaera_10051",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hooaaaahh...!",
	},
	-- Invulnerable hit reaction
	{
		Id = "Megaera_10028",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Harrhh...!",
	},
	{
		Id = "Megaera_10029",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrraahh...!",
	},
	{
		Id = "Megaera_10030",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrrrr...!",
	},
	{
		Id = "Megaera_10031",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Nrrrrhhh...!",
	},
	{
		Id = "Megaera_10032",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hmmmm....!",
	},
	{
		Id = "Megaera_10033",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Guuhhhh...",
	},
	{
		Id = "Megaera_10034",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Heehhhh...",
	},
	{
		Id = "Megaera_10035",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Mrrrrnnn....",
	},
	-- Early exit
	{
		Id = "Megaera_10100",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrraaauuggh!!",
	},
	{
		Id = "Megaera_10101",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hyyeeeh!",
	},
	{
		Id = "Megaera_10102",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Nyaaaahh!",
	},
	{
		Id = "Megaera_10103",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrrrnnn!",
	},
	{
		Id = "Megaera_10104",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hoh, hoohhh!",
	},
	{
		Id = "Megaera_10060",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Rrrraauuggghhh....",
	},
	{
		Id = "Megaera_10061",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Urrraaauuhggghh...",
	},
	{
		Id = "Megaera_10062",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrrrnngaaaaugh!!",
	},
	{
		Id = "Megaera_10063",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Krraaugghhh....",
	},
	-- Attack/Weapon voicelines
	{
		Id = "Megaera_10005",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Haaahhhhhhhhh....",
	},
	{
		Id = "Megaera_10026",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrreehhh hohhhhhh....",
	},
	-- Stealing the bag
	{
		Id = "Megaera_10052",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hoh?",
	},
	{
		Id = "Megaera_10053",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrn?",
	},
	{
		Id = "Megaera_10068",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Nrraugh?!",
	},
	{
		Id = "Megaera_10072",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrrnn!!",
	},
	{
		Id = "Megaera_10041",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Nrraaauuuggghhh!!",
	},
	{
		Id = "Megaera_10042",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hhhaaaauuuhhhhh!!",
	},
	{
		Id = "Megaera_10043",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Hrrrauuugggghhhh!",
	},
	{
		Id = "Megaera_10044",
		InheritFrom = "BaseSubtitle",
		DisplayName = "Grrraauuuggggghhh!",
	},
	-- #endregion
}

sjson.hook(zagreusFieldSubtitleFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
