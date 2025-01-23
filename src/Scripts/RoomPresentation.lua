-- If the door has separate unlock animations for Meta or Run rewards, honour it
modutil.mod.Path.Wrap("ExitDoorUnlockedPresentation", function(base, exitDoor)
	base(exitDoor)

	if exitDoor.UnlockedAnimationMetaReward ~= nil and exitDoor.Room ~= nil and exitDoor.Room.RewardStoreName == "MetaProgress" then
		SetAnimation({ Name = exitDoor.UnlockedAnimationMetaReward, DestinationId = exitDoor.ObjectId })
	end
end)
