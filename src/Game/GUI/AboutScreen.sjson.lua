local hadesTwoAboutScreenFile = rom.path.combine(rom.paths.Content(), "Game\\GUI\\AboutScreen.sjson")

local modCredits = {
	{ InheritFrom = "ColumnCenter" },
	{ InheritFrom = "ColumnCenter" },
	{ InheritFrom = "ColumnCenter" },

	{ InheritFrom = "CreditH1", HelpTextId = "ModsNikkelMHadesBiomes_Mod_Name" },
	{ InheritFrom = "ColumnCenter", SpacingY = 50 },

	{ InheritFrom = "CreditTitle", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Craft_NikkelM" },
	{ InheritFrom = "CreditName", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Name_NikkelM" },
	{ InheritFrom = "ColumnCenter" },
	{ InheritFrom = "ColumnCenter" },
	{ InheritFrom = "ColumnCenter" },

	{ InheritFrom = "CreditH2", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Info_Special_Shoutouts" },
	{ InheritFrom = "ColumnCenter", SpacingY = 50 },

	{ InheritFrom = "CreditTitle_Left", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Craft_iDeath" },
	{ InheritFrom = "CreditTitle_Right", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Craft_Magic" },
	{ InheritFrom = "CreditName_Left", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Name_iDeath" },
	{ InheritFrom = "CreditName_Right", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Name_Magic" },
	{ InheritFrom = "ColumnCenter" },

	{ InheritFrom = "CreditTitle_Left", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Craft_burn" },
	{ InheritFrom = "CreditTitle_Right", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Craft_zannc" },
	{ InheritFrom = "CreditName_Left", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Name_burn" },
	{ InheritFrom = "CreditName_Right", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Name_zannc" },
	{ InheritFrom = "ColumnCenter" },
	{ InheritFrom = "ColumnCenter" },
	{ InheritFrom = "ColumnCenter" },

	{ InheritFrom = "CreditH2", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Info_Community_Translators" },
	{ InheritFrom = "ColumnCenter", SpacingY = 50 },
	{ InheritFrom = "CreditH4", HelpTextId = "Credits_Lang_FR" },
	{ InheritFrom = "CreditName", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Name_JeanDupin" },

	{ InheritFrom = "ColumnCenter" },
	{ InheritFrom = "ColumnCenter" },
	{ InheritFrom = "ColumnCenter" },

	{ InheritFrom = "CreditTitle", HelpTextId = "ModsNikkelMHadesBiomes_InGameCredits_Info_Community" },

	{ InheritFrom = "ColumnCenter" },
	{ InheritFrom = "ColumnCenter" },
	{ InheritFrom = "ColumnCenter" },
}

sjson.hook(hadesTwoAboutScreenFile, function(data)
	for _, credit in ipairs(modCredits) do
		table.insert(data.AboutScreen.CreditNames, credit)
	end
end)
