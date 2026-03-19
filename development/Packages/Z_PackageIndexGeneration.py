r"""
Powershell commands to be run in the packages folder.
Requires for Powershell 7 for -Parallel flag, remove if on Powershell 5.
Script to be run from same folder.

Get-ChildItem -Name "*.pkg" | ForEach-Object -Parallel { deppth2 ex -s "$_" }
Get-ChildItem -Recurse -Name -Filter "*.png" > .\filename.txt
"""

import json
import re

raw = open("filename.txt")
lines = raw.readlines()

out = {}

for i in lines:
    pathsplit = i.strip().split("\\")
    # print(pathsplit)
    if pathsplit[-1][-4:] == ".png":
        key = "\\".join(pathsplit[2:])[:-4]
        if re.match("[0-9]{4}", key[-4:]) :
            key = key[:-4]
        out[key] = out.get(key,[])
        out[key].append(pathsplit[0])
        out[key] = list(set(out[key]))
        out[key].sort()

json.dump(out,open("index.json","w"), indent=4)