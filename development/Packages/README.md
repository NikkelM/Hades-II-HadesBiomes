# Creating new packages

Each new image/texture should be a single .png file.
All .png files for a package should be in the same folder (e.g. `ModsNikkelMHadesBiomesPortraits_source`).
Important: The folder/package name CANNOT end in the name of an existing package, as this will confuse the game (it will try to load the custom package as the original package).
Can also contain the source files (e.g. GIMP `.xcf` files).

Then run `python.exe texture_packing.py` with the `ROOT_FOLDER` in the script set to the current package folder name (`ModsNikkelMHadesBiomesPortraits_source`).
Output will be the required texture `.png` files and the `atlas.json` file.
The extra `.json` file can be removed.

Create a new folder for the package (e.g. `ModsNikkelMHadesBiomesPortraits`).
Add the `atlas.json` file to the `manifest` subfolder.
Add the required texture `.png` files to the `textures/atlases` subfolder.

Run `deppth pk -s <packageName> -t <packageName>.pkg` to create the package file.

Copy the resulting `.pkg` and `.pkg_manifest` files to the `data/Content/Packages` folder.

Add the package name to `CustomPackageFileNames` in `RequiredFileData.lua`.
