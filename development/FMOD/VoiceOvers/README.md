## Voiceovers

> The basics for this guidance were adapted from [HadesAudioHelper](https://github.com/AlexKage69/HadesAudioHelper).

Voiceovers in Hades II are stored in a separate `SpeakerName.fsb` file with a corresponding `SpeakerName.txt` file.
All events (`.ogg` files) in the Voiceover `.fsb` file **MUST** start with `SpeakerName_`, otherwise they will not be played in game.

> [!IMPORTANT]
> Not all speaker names work. E.g. `MegaeraHome` causes the VO to not be loaded, while the same files (renamed) in `Megaera` do get loaded.
> This might be due to either the original name being reserved/already used in the engine, or e.g. the pattern (`Home`) not being loaded in the given context.

In Hades, all voicelines are in a single `VO.fsb` file.
These can be extracted using Python-fsb5.

Each Speaker should then get it's own voicebank in a new FMOD project, with the event names corresponding to the bank name.
After building the project, use FMOD Bank Tools to extract the `.fsb` and `.txt` files. for each bank.
They will be in the fsb and wav folders, respectively.
Make sure to use a script to translate the `.txt` files to the Hades II format.

Custom file has been placed in `development/AddVoicelineNumbers.ps1`.

```bash
# Bank name that is being looked at
$bankName = "MegaeraField"
# These paths work for my project setup, adjust if needed
$inputFile = ".\Fmod Bank Tools\wav\$bankName\$bankName.txt"
$outputFile = ".\..\..\data\Content\Audio\Desktop\VO\$bankName.txt"

$content = Get-Content $inputFile
$lineCount = $content.Length

# Add the header lines with the bankName
$header = @("#ifndef _${bankName}_H", "#define _${bankName}_H", "")

# Add line numbers to the specified range
for ($i = 0; $i -lt $lineCount; $i++) {
	$line = $content[$i] -replace '\.wav', ''
  $content[$i] = "#define $line $i"
}

# Combine the header, the modified content, and the footer
$footer = @("", "#endif")
$finalContent = $header + $content + $footer

# Write the final content to the output file
$finalContent | Set-Content $outputFile
```

The `.txt` files will already be placed in the mod's data folder by the above script, make sure to also copy the `.fsb` files.
Also, add all of the speakers to `VoiceoverFileNames` in `RequiredFileData.lua`.
