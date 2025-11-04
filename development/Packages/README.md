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

The legacy format is a custom hack into deppth2, and not part of the pip package.

In the parent folder of the source folder, run `deppth2 hpk -c BC7 -s NikkelM-HadesBiomesGUIModded_source -t NikkelM-HadesBiomesGUIModded`

This will create a new package named `NikkelM-NewPackageName.pkg` and the corresponding `NikkelM-NewPackageName.pkg_manifest`.

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
