# Custom Packages

Some important notes:
- The Portraits package is always loaded in both the Crossroads AND modded runs.
- The Crossroads package is only loaded in the Crossroads.
- The GUIModded package is only loaded in modded runs.

- The Cosmetics package is only loaded in the Crossroads, through the CosmeticsAPI.

# Creating new packages

Each new image/texture should be a single .png file.
All .png files for a package should be in the same folder (e.g. `ModsNikkelMHadesBiomesPortraits_source`).
Important: The folder/package name CANNOT end in the name of an existing package, as this will confuse the game (it will try to load the custom package as the original package).
Can also contain the source files (e.g. GIMP `.xcf` files).

Make sure that packages and their nested folders are not too long!
If the full path to a texture file is too long, the package will not be loaded and the game might even crash on startup.

## Modern approach

There are two modes for `deppth2 hpk`, with the modern TeamName-ModName format, and the legacy "Any" format.
If the source package matches the TeamName-ModName format, all texture paths will have the TeamName-ModName prefix added to them automatically.
If using the legacy "Any" format, the texture paths will not have any prefix added to them.

In the parent folder of the source folder:
For the legacy format, run e.g. `deppth2 hpk -c BC7 -s ModsNikkelMHadesBiomesPortraits_source -t ModsNikkelMHadesBiomesPortraits`.

For the modern format, run e.g. `deppth2 hpk -c BC7 -s NikkelM-HadesBiomesCosmetics_source -t NikkelM-HadesBiomesCosmetics`.

To include hulls, set the `-iH True` flag.

This will create a new package named `NikkelM-NewPackageName.pkg` and the corresponding `NikkelM-NewPackageName.pkg_manifest`.

## Generate 720p package sources

Use `development\Packages\Z_Generate720pSources.py` to recreate the generated `_source_720p` folders.
These folders are reproducible and don't need to be tracked.
The script currently supports:

- `ModsNikkelMHadesBiomesPortraits`
- `NikkelM-HadesBiomesMainMenu`
- `NikkelM-HadesBiomesCosmetics`
- `NikkelM-HadesBiomesCosmeticsCardbacks`
- `NikkelM-HadesBiomesCrossroads`
- `NikkelM-HadesBiomesFxModded`
- `NikkelM-HadesBiomesGUIModded`
- `ModsNikkelMHadesBiomesFxOriginal`
- `ModsNikkelMHadesBiomesGUIOriginal`
- `ModsNikkelMHadesBiomesTheseusGodFxOriginal`

Run the script without package names to process every configured package: `python development\Packages\Z_Generate720pSources.py`

Pass one or more package names as positional arguments to process only those packages: `python development\Packages\Z_Generate720pSources.py ModsNikkelMHadesBiomesFxOriginal ModsNikkelMHadesBiomesGUIOriginal`

For each package, the script recreates its `<1080 source name>_720p` folder from the canonical 1080p `_source` folder.
For every PNG, it looks for a native Hades 1 720p PNG and JSON sidecar through the configured package roots and path aliases.
It uses that native asset only when its logical `originalSize` matches the current shipped 1080p package manifest.

If no native counterpart exists, the asset is forced custom, or the native logical size differs, the script scales the mod's canonical 1080p source using premultiplied-alpha Lanczos resampling, writes exact per-axis `scaleRatio` metadata, and scales source hull metadata when present.
The entire `NikkelM-HadesBiomesMainMenu` package uses this custom-scaling path.

The default Hades 1 packages root is `D:\Program Files (x86)\Steam\steamapps\common\Hades\Content\Win\Packages`.
Override it with `--hades-packages-root` for one invocation, or set the `HADES_PACKAGES_ROOT` environment variable.

Add `--pack` to run `deppth2 hpk -c BC7` and copy the generated `.pkg` and `.pkg_manifest` files into `data\Content\Packages\720p`:

```powershell
python development\Packages\Z_Generate720pSources.py --pack
```

## For Original Biome Packages

For the original biome packages in the "Original Biomes" subfolder, they already have the manifests and atlases set up, as extracted from the Hades game files.

To pack them, use the `pk` command: `deppth2 pk -c BC7 -s TartarusModsNikkelMHadesBiomes_source_original -t TartarusModsNikkelMHadesBiomes.pkg`.

## Deppth2 modifications

The legacy format is a custom modification to the local `deppth2` pip installation (not part of the upstream package at https://github.com/SGG-Modding/deppth).

Changes made to `texpacking.py` in the installed `deppth2` package:

In `build_atlases_hades`, replace the regex check block:
```python
if re.match(regexpattern, basename, flags=re.I|re.A):
		pass
else:
		print("Please provide a target with your mod guid, example ThunderstoreTeamName-Modname")
		return
```
with:
```python
includeBaseNameInFolderPath = True

if re.match(regexpattern, basename, flags=re.I|re.A):
		print("Using team name from target")
		pass
else:
		print("Not using team name")
		includeBaseNameInFolderPath = False
```

In the same function, pass the flag to `transform_atlas`:
```python
atlases.append(transform_atlas(target_dir, basename, f'{basename}{index}.json', namemap, hulls, source_dir, manifest_paths, includeBaseNameInFolderPath))
```

In `transform_atlas`, add the parameter and replace the subatlas name assignment:
```python
def transform_atlas(target_dir, basename, filename, namemap, hulls={}, source_dir='', manifest_paths=[], includeBaseNameInFolderPath=True):
```
```python
if includeBaseNameInFolderPath:
		subatlas['name'] = os.path.join(basename, os.path.splitext(os.path.relpath(namemap[texture_name], source_dir))[0])
else:
		subatlas['name'] = os.path.splitext(os.path.relpath(namemap[texture_name], source_dir))[0]
```

## Old approach

Then run `python.exe texture_packing.py` with the `ROOT_FOLDER` in the script set to the current package folder name (`ModsNikkelMHadesBiomesPortraits_source`).
Output will be the required texture `.png` files and the `atlas.json` file.
The extra `.json` file can be removed.

Create a new folder for the package (e.g. `ModsNikkelMHadesBiomesPortraits`).
Add the `atlas.json` file to the `manifest` subfolder.
Add the required texture `.png` files to the `textures/atlases` subfolder.

Run `deppth2 pk -c BC7 -s ModsNikkelMHadesBiomesPortraits -t ModsNikkelMHadesBiomesPortraits.pkg` to create the package file.

Copy the resulting `.pkg` and `.pkg_manifest` files to the `data/Content/Packages` folder.

Load the new package in `game.RoomData.ModsNikkelMHadesBiomesBaseRoom`, or wherever else it needs to be loaded.

### Setup

To run the script, follow this guide: [Hades-Texture-Packer](https://github.com/excellent-ae/Hades-Texture-Packer/tree/main)
