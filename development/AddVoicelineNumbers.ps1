# Bank/FSB name that is being looked at
$speakerName = "Dusa"
$inputFile = ".\dev\FMOD\Fmod Bank Tools\wav\$speakerName\$speakerName.txt"
$outputFile = ".\..\data\Content\Audio\Desktop\VO\$speakerName.txt"

$content = Get-Content $inputFile
$lineCount = $content.Length

# Add the header lines with the speakerName
$header = @("#ifndef _${speakerName}_H", "#define _${speakerName}_H", "")

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