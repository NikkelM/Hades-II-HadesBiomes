-- Contains file names/patterns required for copying over files from the Hades installation, and for uninstalling the mod

PackageFileMappings = {
	-- Tartarus map package
	["Content\\Win\\Packages\\Tartarus.pkg"] = "Packages\\1080p\\TartarusModsNikkelMHadesBiomes.pkg",
	["Content\\Win\\Packages\\Tartarus.pkg_manifest"] = "Packages\\1080p\\TartarusModsNikkelMHadesBiomes.pkg_manifest",
	["Content\\Win\\Packages\\720p\\Tartarus.pkg"] = "Packages\\720p\\TartarusModsNikkelMHadesBiomes.pkg",
	["Content\\Win\\Packages\\720p\\Tartarus.pkg_manifest"] = "Packages\\720p\\TartarusModsNikkelMHadesBiomes.pkg_manifest",
	-- Enemies
	["Content\\Win\\Packages\\RoomManager.pkg"] = "Packages\\1080p\\RoomManagerModsNikkelMHadesBiomes.pkg",
	["Content\\Win\\Packages\\RoomManager.pkg_manifest"] = "Packages\\1080p\\RoomManagerModsNikkelMHadesBiomes.pkg_manifest",
	["Content\\Win\\Packages\\720p\\RoomManager.pkg"] = "Packages\\720p\\RoomManagerModsNikkelMHadesBiomes.pkg",
	["Content\\Win\\Packages\\720p\\RoomManager.pkg_manifest"] = "Packages\\720p\\RoomManagerModsNikkelMHadesBiomes.pkg_manifest",
}

-- map_text and thing_bin file names
MapFileNames = {
	-- Tartarus
	"RoomOpening",
	"A_PreBoss01",
	"A_Boss01",
	"A_Boss02",
	"A_Boss03",
	"A_PostBoss01",
	"A_MiniBoss01",
	"A_MiniBoss02",
	"A_MiniBoss03",
	"A_MiniBoss04",
	"A_Shop01",
	"A_Story01",
	"A_Reprieve01",
	"A_Combat01",
	"A_Combat02",
	"A_Combat03",
	"A_Combat04",
	"A_Combat05",
	"A_Combat06",
	"A_Combat07",
	"A_Combat08A",
	"A_Combat08B",
	"A_Combat09",
	"A_Combat10",
	"A_Combat11",
	"A_Combat12",
	"A_Combat13",
	"A_Combat14",
	"A_Combat15",
	"A_Combat16",
	"A_Combat17",
	"A_Combat18",
	"A_Combat19",
	"A_Combat20",
	"A_Combat21",
	-- These two rooms have no RoomData table attached, so we don't need to copy them over
	-- "A_Combat22",
	-- "A_Combat23",
	"A_Combat24",
	"A_Combat25",
	--
}

-- Languages supported by Hades
-- Languages other than english are currently not working, as decoding the file from Hades results in a nil value
HelpTextLanguages = {
	-- "de",
	"en",
	-- "es",
	-- "fr",
	-- "it",
	-- "ja",
	-- "ko",
	-- "pl",
	-- "pt-BR",
	-- "ru",
	-- "zh-CN"
}