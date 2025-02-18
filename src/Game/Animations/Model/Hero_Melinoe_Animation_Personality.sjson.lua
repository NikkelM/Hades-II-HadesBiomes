-- Map conversation animations for Zagreus to animations that exist for Melinoe

local animationsFile = rom.path.combine(rom.paths.Content,
	'Game/Animations/Model/Hero_Melinoe_Animation_Personality.sjson')

local order = {
	"Name",
	"InheritFrom",
}

local newData = {
	{
		Name = "ZagreusTalkEmpathyStart",
		InheritFrom = "MelTalkExplaining01",
	},
	{
		Name = "ZagreusTalkEmpathy_Return",
		InheritFrom = "MelTalkExplaining01ReturnToIdle",
	},
	{
		Name = "ZagreusTalkDenialStart",
		InheritFrom = "MelTalkBrooding01",
	},
	{
		Name = "ZagreusTalkDenialReturnToIdle",
		InheritFrom = "MelTalkBrooding01ReturnToIdle",
	},
	{
		Name = "ZagreusInteractionThoughtful",
		InheritFrom = "MelTalkBrooding01",
	}
}

sjson.hook(animationsFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Animations, sjson.to_object(newValue, order))
	end
end)
