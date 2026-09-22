import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile

from PIL import Image, ImageChops


PACKAGE_SOURCES = {
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


def scaled_hull(source_hull, width_ratio, height_ratio):
    return [
        {
            "x": round(point["x"] * width_ratio),
            "y": round(point["y"] * height_ratio),
        }
        for point in source_hull
    ]


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
        target_image = source_image.resize(
            (target_width, target_height),
            Image.Resampling.LANCZOS,
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
    source_root = packages_root / package_data["source"]
    destination_root = packages_root / f"{package_data['source']}_720p"
    native_roots = [
        hades_packages_root / "720p" / package_name / "textures"
        for package_name in package_data["hades_packages"]
    ]

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
            native_png = find_native_source(relative_path, native_roots)
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
