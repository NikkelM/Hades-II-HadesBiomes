Contains the death stingers that are played instead of the normal death music when dying in a modded run.

## How to: Using parameters to toggle Audio tracks dynamically

The game uses `SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })` to toggle on/off Audio tracks dynamically.
This is done through FMOD parameters and automations on the given tracks.

To replicate this, create a second track for the e.g. Vocals on your Event.
Right-click the volume knob and choose "Add Automation".
Clicking into the new automation track will open a small panel at the bottom of the screen.
Choose "Add Curve" there and select/create a new parameter.

In most cases, you will want to use a Discrete parameter, and set it to have values between 0 and 1.
The name should be the same name as what the game uses for this SoundCue, but you can also use new parameter names for your mod.
Make this parameter a local parameter, and leave the default settings.

Once the parameter has been added to the automation track, you can click once into eahc of the two sections (for a value of 0 and a value of 1), and drag the point for the 0 value to the bottom of the curve.
Now, when you toggle the parameter at the top of the event on and off, you should see the track be muted and unmuted accordingly.

This will work the same in the game.
