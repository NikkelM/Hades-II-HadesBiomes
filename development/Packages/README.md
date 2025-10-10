# Creating new packages

Each new image/texture should be a single .png file.
All .png files for a package should be in the same folder (e.g. `ModsNikkelMHadesBiomesPortraits_source`).
Important: The folder/package name CANNOT end in the name of an existing package, as this will confuse the game (it will try to load the custom package as the original package).
Can also contain the source files (e.g. GIMP `.xcf` files).

Make sure that packages and their nested folders are not too long!
If the full path to a texture file is too long, the package will not be loaded and the game might even crash on startup.

## Modern approach

Only use this approach for actual new packages, as the path to the textures will include the package's name, which isn't the case for original Hades packages!

In the parent folder of the source folder, run

```
deppth hpk -s NewPackageName_source -t NikkelM-NewPackageName
```

This will create a new package named `NikkelM-NewPackageName.pkg` and the corresponding `NikkelM-NewPackageName.pkg_manifest`.

## Old approach

Then run `python.exe texture_packing.py` with the `ROOT_FOLDER` in the script set to the current package folder name (`ModsNikkelMHadesBiomesPortraits_source`).
Output will be the required texture `.png` files and the `atlas.json` file.
The extra `.json` file can be removed.

Create a new folder for the package (e.g. `ModsNikkelMHadesBiomesPortraits`).
Add the `atlas.json` file to the `manifest` subfolder.
Add the required texture `.png` files to the `textures/atlases` subfolder.

Run `deppth pk -s <packageName> -t <packageName>.pkg` to create the package file.

Copy the resulting `.pkg` and `.pkg_manifest` files to the `data/Content/Packages` folder.

Load the new package in `game.RoomData.ModsNikkelMHadesBiomesBaseRoom`, or wherever else it needs to be loaded.

### Setup

To run the script, follow this guide: [Hades-Texture-Packer](https://github.com/excellent-ae/Hades-Texture-Packer/tree/main)
