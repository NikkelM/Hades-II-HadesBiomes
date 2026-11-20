import argparse
import re
from pathlib import Path

from pkg_builder import build_standalone_pkg

PACKAGE_DIR = Path(__file__).resolve().parent
OUTPUT_DIR = PACKAGE_DIR.parents[1] / "data" / "Content" / "Packages"
# Vanilla FrogFamiliar uses the same texture dimensions in both quality tiers
TEXTURE_SIZES = {"1080p": (512, 512), "720p": (512, 512)}


def basename(value: str) -> str:
    if not re.fullmatch(r"[A-Za-z0-9_-]+", value):
        raise argparse.ArgumentTypeError("must be a basename containing only letters, digits, hyphens, and underscores")
    return value


def main():
    parser = argparse.ArgumentParser(description="Build both quality tiers of a familiar texture package.")
    parser.add_argument("package_name", type=basename, help="Package basename without the .pkg extension")
    package_name = parser.parse_args().package_name

    source_dir = PACKAGE_DIR / f"{package_name}_source"
    sources = sorted(path for path in source_dir.glob("*.png") if path.is_file())
    if not sources:
        parser.error(f"No PNG textures found in {source_dir}")

    for resolution, (width, height) in TEXTURE_SIZES.items():
        textures = [
            {
                "name": f"{package_name}\\{path.stem}",
                "png_path": path,
                "width": width,
                "height": height,
                "fmt": 0x1C,
                "mip_count": 6,
            }
            for path in sources
        ]
        output = OUTPUT_DIR / resolution / f"{package_name}.pkg"
        output.parent.mkdir(parents=True, exist_ok=True)
        build_standalone_pkg(textures, output)


if __name__ == "__main__":
    main()