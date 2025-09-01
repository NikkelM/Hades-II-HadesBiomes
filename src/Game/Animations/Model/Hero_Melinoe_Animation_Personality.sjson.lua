-- Map conversation animations for Zagreus to animations that exist for Melinoe

local animationsFile = rom.path.combine(rom.paths.Content(),
	"Game/Animations/Model/Hero_Melinoe_Animation_Personality.sjson")

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
		Name = "ZagreusTalkDenial_Full",
		InheritFrom = "MelTalkBroodingFull01",
	},
	{
		Name = "ZagreusTalkDenialReturnToIdle",
		InheritFrom = "MelTalkBrooding01ReturnToIdle",
	},
	{
		Name = "ZagreusInteractionThoughtful",
		InheritFrom = "MelTalkBrooding01",
	},
	{
		Name = "ZagreusInteractEquip",
		InheritFrom = "MelTalkGifting01",
		HoldLastFrame = false,
		ChainTo = "MelTalkGifting01ReturnToIdle"
	},
	{
		Name = "ZagreusDeathFullscreen",
		FilePath = "Screens\\ZagreusDeadPool\\ZagreusDeadPool",
		GroupName = "Overlay",
		Type = "Book",
		VideoTexture = "ZagreusDeathFullscreen",
		AngleFromOwner = "Ignore",
		Sound = "/SFX/Player Sounds/PlayerDeathBloodComponents",
		EndFrame = 250,
		HoldLastFrame = true,
		NumFrames = 250,
		PlaySpeed = 30.0,
		StartFrame = 1,
		Material = "Unlit",
		DisableOwnerInteract = true,
		TimeModifierFraction = 0.1,
		Slides = {
			{ DurationFrames = 1, Sound = "/SFX/StabSplatter", Frame = 1, },
		},
	},
}

sjson.hook(animationsFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Animations, sjson.to_object(newValue, order))
	end
end)
