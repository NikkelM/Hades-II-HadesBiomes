import argparse
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

from deppth2.sggpio import PackageReader
from PIL import Image, ImageChops


GUID_PACKAGE_PATTERN = re.compile(r"^[a-z0-9]+(\w+[a-z0-9])?-\w+$", re.IGNORECASE | re.ASCII)


PACKAGE_SOURCES = {
    "ModsNikkelMHadesBiomesPortraits": {
        "source": "ModsNikkelMHadesBiomesPortraits_source",
        "hades_packages": ("GUI",),
        "aliases": (
            ("GUIModded/FamilyPortraits/", "GUI/FamilyPortraits/"),
            ("GUIModded/Icons/ShrinePoint_Small.png", "GUI/Icons/ShrinePoint_Small.png"),
            (
                "GUIModded/Icons/ShrinePoint_Small_Active.png",
                "GUI/Icons/ShrinePoint_Small_Active.png",
            ),
            ("GUIModded/Icons/Status/", "GUI/Icons/Status/"),
            (
                "GUIModded/Screens/ShopIcons/release_parchment_23.png",
                "GUI/Screens/ShopIcons/release_parchment_23.png",
            ),
        ),
    },
    "NikkelM-HadesBiomesMainMenu": {
        "source": "NikkelM-HadesBiomesMainMenu_source",
        "hades_packages": (),
    },
    "NikkelM-HadesBiomesCosmetics": {
        "source": "NikkelM-HadesBiomesCosmetics_source",
        "hades_packages": (),
    },
    "NikkelM-HadesBiomesCosmeticsCardbacks": {
        "source": "NikkelM-HadesBiomesCosmeticsCardbacks_source",
        "hades_packages": (),
    },
    "NikkelM-HadesBiomesCrossroads": {
        "source": "NikkelM-HadesBiomesCrossroads_source",
        "hades_packages": ("DeathArea", "RoomManager"),
        "aliases": (
            (
                "Cauldron/cosmetic_sealedDocument_01.png",
                "GUI/Screens/CosmeticIcons/cosmetic_sealedDocument_01.png",
            ),
        ),
    },
    "NikkelM-HadesBiomesFxModded": {
        "source": "NikkelM-HadesBiomesFxModded_source",
        "hades_packages": ("Fx", "RoomManager"),
        "aliases": (
            (
                "Fx/ModsNikkelMHadesBiomesHadesStunTotemSpawn/"
                "ModsNikkelMHadesBiomesHadesStunTotemSpawn",
                "Fx/HadesStunTotemSpawn/HadesStunTotemSpawn",
            ),
            ("Resources/Boss/BloodPickup/", "Fx/BloodPickup/"),
            ("Resources/Boss/Key/", "Fx/Key/"),
            ("Resources/Boss/SuperGems/", "Fx/SuperGems/"),
        ),
        "custom_prefixes": (
            "Fx/RoomRewardAvailable-Front/",
            "Fx/RoomRewardAvailable-Front_MetaReward/",
        ),
    },
    "NikkelM-HadesBiomesGUIModded": {
        "source": "NikkelM-HadesBiomesGUIModded_source",
        "hades_packages": ("GUI",),
        "aliases": (
            ("GUIModded/Icons/Super.png", "GUI/Icons/Super.png"),
            ("GUIModded/UnlockTextBG/", "GUI/UnlockTextBG/"),
            ("GUIModded/VictoryBG/", "GUI/VictoryBG/"),
        ),
    },
    "ModsNikkelMHadesBiomesFxOriginal": {
        "source": "ModsNikkelMHadesBiomesFxOriginal_source",
        "hades_packages": ("Fx",),
    },
    "ModsNikkelMHadesBiomesGUIOriginal": {
        "source": "ModsNikkelMHadesBiomesGUIOriginal_source",
        "hades_packages": ("GUI",),
    },
    "ModsNikkelMHadesBiomesTheseusGodFxOriginal": {
        "source": "ModsNikkelMHadesBiomesTheseusGodFxOriginal_source",
        "hades_packages": (
            "AthenaUpgrade",
            "DemeterUpgrade",
            "DionysusUpgrade",
            "PoseidonUpgrade",
        ),
    },
}


def images_match(first_path, second_path):
    with Image.open(first_path) as first, Image.open(second_path) as second:
        if first.size != second.size:
            return False
        return ImageChops.difference(first.convert("RGBA"), second.convert("RGBA")).getbbox() is None


def find_native_source(relative_path, native_roots):
    candidates = [root / relative_path for root in native_roots if (root / relative_path).exists()]
    if not candidates:
        return None
    if len(candidates) == 1:
        return candidates[0]
    if all(images_match(candidates[0], candidate) for candidate in candidates[1:]):
        return candidates[0]
    raise RuntimeError(f"Multiple different native 720p sources found for {relative_path}: {candidates}")


def mapped_native_path(relative_path, aliases):
    relative_string = relative_path.as_posix()
    for source_prefix, native_prefix in aliases:
        if relative_string.startswith(source_prefix):
            return Path(native_prefix + relative_string[len(source_prefix) :])
    return relative_path


def is_forced_custom(relative_path, custom_prefixes):
    relative_string = relative_path.as_posix()
    return any(relative_string.startswith(prefix) for prefix in custom_prefixes)


def scaled_hull(source_hull, width_ratio, height_ratio):
    return [
        {
            "x": round(point["x"] * width_ratio),
            "y": round(point["y"] * height_ratio),
        }
        for point in source_hull
    ]


def logical_texture_name(package_name, relative_path):
    relative_name = str(relative_path.with_suffix("")).replace("/", "\\")
    if GUID_PACKAGE_PATTERN.match(package_name):
        return f"{package_name}\\{relative_name}"
    return relative_name


def load_original_sizes(package_name, repository_root):
    manifest_path = (
        repository_root
        / "data"
        / "Content"
        / "Packages"
        / f"{package_name}.pkg_manifest"
    )
    manifest_entries = PackageReader.load_package(str(manifest_path), True)
    original_sizes = {}
    for atlas in manifest_entries.values():
        for subatlas in atlas.subAtlases:
            size = (
                subatlas["originalSize"]["x"],
                subatlas["originalSize"]["y"],
            )
            existing_size = original_sizes.get(subatlas["name"])
            if existing_size is not None and existing_size != size:
                raise RuntimeError(
                    f"Different originalSize values found for {subatlas['name']}: "
                    f"{existing_size} and {size}"
                )
            original_sizes[subatlas["name"]] = size
    return original_sizes


def apply_original_size(destination_png, original_size):
    metadata_path = destination_png.with_suffix(".json")
    metadata = json.loads(metadata_path.read_text(encoding="utf-8-sig"))
    with Image.open(destination_png) as image:
        metadata["scaleRatio"] = {
            "x": original_size[0] / image.width,
            "y": original_size[1] / image.height,
        }
    metadata_path.write_text(
        json.dumps(metadata, indent=2) + "\n",
        encoding="utf-8",
    )


def native_original_size(native_png):
    metadata = json.loads(native_png.with_suffix(".json").read_text(encoding="utf-8-sig"))
    original_size = metadata.get("originalSize")
    if original_size is None:
        return None
    return original_size["x"], original_size["y"]


def scale_custom_source(source_png, destination_png):
    source_json = source_png.with_suffix(".json")
    source_metadata = {}
    if source_json.exists():
        source_metadata = json.loads(source_json.read_text(encoding="utf-8-sig"))

    with Image.open(source_png) as source_image:
        source_image = source_image.convert("RGBA")
        source_width, source_height = source_image.size
        target_width = max(1, round(source_width / 1.5))
        target_height = max(1, round(source_height / 1.5))
        target_image = (
            source_image.convert("RGBa")
            .resize((target_width, target_height), Image.Resampling.LANCZOS)
            .convert("RGBA")
        )
        destination_png.parent.mkdir(parents=True, exist_ok=True)
        target_image.save(destination_png)

    source_scale = source_metadata.get("scaleRatio", {"x": 1.0, "y": 1.0})
    logical_width = source_width * source_scale.get("x", 1.0)
    logical_height = source_height * source_scale.get("y", 1.0)
    width_ratio = target_width / source_width
    height_ratio = target_height / source_height

    destination_metadata = {
        "scaleRatio": {
            "x": logical_width / target_width,
            "y": logical_height / target_height,
        },
        "hull": scaled_hull(source_metadata.get("hull", []), width_ratio, height_ratio),
    }
    destination_png.with_suffix(".json").write_text(
        json.dumps(destination_metadata, indent=2) + "\n",
        encoding="utf-8",
    )


def generate_source(package_name, packages_root, hades_packages_root):
    package_data = PACKAGE_SOURCES[package_name]
    repository_root = packages_root.parents[1]
    source_root = packages_root / package_data["source"]
    destination_root = packages_root / f"{package_data['source']}_720p"
    native_roots = [
        hades_packages_root / "720p" / native_package_name / "textures"
        for native_package_name in package_data["hades_packages"]
    ]
    aliases = package_data.get("aliases", ())
    custom_prefixes = package_data.get("custom_prefixes", ())
    original_sizes = load_original_sizes(package_name, repository_root)

    if not source_root.exists():
        raise RuntimeError(f"Source folder does not exist: {source_root}")
    for native_root in native_roots:
        if not native_root.exists():
            raise RuntimeError(f"Extracted Hades 720p package does not exist: {native_root}")

    temporary_root = Path(tempfile.mkdtemp(prefix=f"{destination_root.name}-", dir=packages_root))
    native_count = 0
    custom_count = 0
    try:
        for source_png in sorted(source_root.rglob("*.png")):
            relative_path = source_png.relative_to(source_root)
            destination_png = temporary_root / relative_path
            logical_name = logical_texture_name(package_name, relative_path)
            if logical_name not in original_sizes:
                raise RuntimeError(
                    f"Current 1080p manifest does not contain {logical_name}"
                )
            original_size = original_sizes[logical_name]
            native_path = mapped_native_path(relative_path, aliases)
            native_png = None
            if not is_forced_custom(relative_path, custom_prefixes):
                native_png = find_native_source(native_path, native_roots)
                if native_png is not None and native_original_size(native_png) != original_size:
                    native_png = None
            if native_png is not None:
                native_json = native_png.with_suffix(".json")
                if not native_json.exists():
                    raise RuntimeError(f"Native sidecar does not exist: {native_json}")
                destination_png.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(native_png, destination_png)
                shutil.copy2(native_json, destination_png.with_suffix(".json"))
                native_count += 1
            else:
                scale_custom_source(source_png, destination_png)
                custom_count += 1
            apply_original_size(destination_png, original_size)

        if destination_root.exists():
            shutil.rmtree(destination_root)
        try:
            temporary_root.replace(destination_root)
        except PermissionError:
            shutil.copytree(temporary_root, destination_root)
            shutil.rmtree(temporary_root)
    except Exception:
        shutil.rmtree(temporary_root, ignore_errors=True)
        raise

    return destination_root, native_count, custom_count


def pack_source(package_name, source_root, packages_root, repository_root):
    workspace_root = packages_root / "720p"
    workspace_root.mkdir(exist_ok=True)
    generated_project = workspace_root / package_name
    if generated_project.exists():
        shutil.rmtree(generated_project)

    subprocess.run(
        [
            "deppth2",
            "hadespack",
            "-c",
            "BC7",
            "-s",
            str(source_root),
            "-t",
            str(generated_project),
        ],
        cwd=packages_root,
        check=True,
        stdout=subprocess.DEVNULL,
    )

    output_root = repository_root / "data" / "Content" / "Packages" / "720p"
    output_root.mkdir(parents=True, exist_ok=True)
    for suffix in (".pkg", ".pkg_manifest"):
        source_path = workspace_root / f"{package_name}{suffix}"
        shutil.copy2(source_path, output_root / source_path.name)


def main():
    packages_root = Path(__file__).resolve().parent
    repository_root = packages_root.parents[1]
    default_hades_root = Path(
        os.environ.get(
            "HADES_PACKAGES_ROOT",
            r"D:\Program Files (x86)\Steam\steamapps\common\Hades\Content\Win\Packages",
        )
    )

    parser = argparse.ArgumentParser(
        description="Generate 720p source folders for custom Hades packages."
    )
    parser.add_argument(
        "packages",
        nargs="*",
        choices=sorted(PACKAGE_SOURCES),
    )
    parser.add_argument(
        "--hades-packages-root",
        type=Path,
        default=default_hades_root,
    )
    parser.add_argument(
        "--pack",
        action="store_true",
        help="Pack generated sources and copy package pairs to data/Content/Packages/720p.",
    )
    args = parser.parse_args()

    selected_packages = args.packages or sorted(PACKAGE_SOURCES)
    for package_name in selected_packages:
        source_root, native_count, custom_count = generate_source(
            package_name,
            packages_root,
            args.hades_packages_root,
        )
        print(
            f"{package_name}: generated {native_count} native and "
            f"{custom_count} custom 720p textures in {source_root}"
        )
        if args.pack:
            pack_source(package_name, source_root, packages_root, repository_root)
            print(f"{package_name}: packed and copied to data/Content/Packages/720p")


if __name__ == "__main__":
    main()
