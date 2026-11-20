from pathlib import Path

from pkg_builder import build_standalone_pkg

PACKAGE_NAME = "NikkelM-HadesBiomesFamiliarSkins"
PACKAGE_DIR = Path(__file__).resolve().parent
SOURCE_DIR = PACKAGE_DIR / f"{PACKAGE_NAME}_source"
OUTPUT_DIR = PACKAGE_DIR.parents[1] / "data" / "Content" / "Packages"
# Vanilla FrogFamiliar uses the same texture dimensions in both quality tiers
TEXTURE_SIZES = {"1080p": (512, 512), "720p": (512, 512)}


def main():
    sources = sorted(path for path in SOURCE_DIR.glob("*.png") if path.is_file())
    if not sources:
        raise SystemExit(f"No PNG textures found in {SOURCE_DIR}")

    for resolution, (width, height) in TEXTURE_SIZES.items():
        textures = [
            {
                "name": f"{PACKAGE_NAME}\\{path.stem}",
                "png_path": path,
                "width": width,
                "height": height,
                "fmt": 0x1C,
                "mip_count": 6,
            }
            for path in sources
        ]
        output = OUTPUT_DIR / resolution / f"{PACKAGE_NAME}.pkg"
        output.parent.mkdir(parents=True, exist_ok=True)
        build_standalone_pkg(textures, output)


if __name__ == "__main__":
    main()