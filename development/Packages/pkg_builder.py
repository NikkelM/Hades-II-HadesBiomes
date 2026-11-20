"""
Hades II PKG Texture Extractor/Replacer

Extracts and replaces textures from .pkg package files.

Usage:
    python pkg_texture.py list    <pkg_file>
    python pkg_texture.py extract <pkg_file> [--output-dir DIR]
    python pkg_texture.py replace <pkg_file> <texture_name> <new_dds> [--output FILE]

The extract command saves textures as raw .dds files (BC7 compressed).
The replace command swaps the texture data in the .pkg while keeping
the same format and dimensions.
"""
import os
import struct
import sys

try:
    import lz4.block
except ImportError:
    sys.exit("ERROR: lz4 not installed. Run: pip install lz4")


# ── PKG format constants ──────────────────────────────────────────────────────

TEXTURE_FORMATS = {
    0x00: ('B8G8R8A8', 4),   # 4 bytes per pixel
    0x04: ('BC1', 0.5),       # 0.5 bytes per pixel (4bpp)
    0x05: ('BC2', 1),         # 1 byte per pixel (8bpp)
    0x06: ('BC3', 1),         # 1 byte per pixel (8bpp)
    0x0C: ('R8', 1),
    0x0E: ('R8G8B8A8', 4),
    0x1A: ('R8', 1),
    0x1C: ('BC7', 1),         # 1 byte per pixel (8bpp)
    0x1E: ('R8G8', 2),
    0x20: ('Native', 0),
}


# ── PKG reading ───────────────────────────────────────────────────────────────

def _swap32(v):
    """Byte-swap a 32-bit integer (big-endian ↔ little-endian)."""
    return (((v >> 8) & 0xFF00) | ((v & 0xFF00) << 8) |
            (v >> 24) | ((v << 24) & 0xFF000000))


def _read_7bit_int(data, off):
    """Read a 7-bit encoded integer (like .NET BinaryReader.Read7BitEncodedInt)."""
    result = 0
    shift = 0
    while True:
        b = data[off]
        off += 1
        result |= (b & 0x7F) << shift
        if (b & 0x80) == 0:
            break
        shift += 7
    return result, off


def _read_csstring(data, off):
    """Read a length-prefixed string (7-bit encoded length + UTF-8 bytes)."""
    length, off = _read_7bit_int(data, off)
    s = data[off:off + length].decode('utf-8', 'replace')
    return s, off + length

def _compute_mip_count(width, height, fmt_code, pixel_size):
    """Compute how many mip levels are in the pixel data based on total size."""
    total = 0
    w, h = width, height
    mips = 0
    # BC formats: 16 bytes per 4x4 block. Uncompressed: bpp * w * h
    bpp = TEXTURE_FORMATS.get(fmt_code, ('', 1))[1]
    while w >= 4 and h >= 4:
        if fmt_code in (0x04, 0x05, 0x06, 0x1C):  # BCn
            blocks = max(w // 4, 1) * max(h // 4, 1)
            mip_size = blocks * 16 if fmt_code != 0x04 else blocks * 8
        else:
            mip_size = int(w * h * bpp)
        total += mip_size
        mips += 1
        if total >= pixel_size:
            break
        w //= 2
        h //= 2
    return mips


def build_dds_header(width, height, fmt_code, pixel_size):
    """Build a DDS header with correct mipmap count for the given texture."""
    mip_count = _compute_mip_count(width, height, fmt_code, pixel_size)

    # DDS magic
    header = bytearray(128)
    struct.pack_into('<I', header, 0, 0x20534444)  # "DDS "
    struct.pack_into('<I', header, 4, 124)  # header size
    # flags: CAPS | HEIGHT | WIDTH | PIXELFORMAT | MIPMAPCOUNT | LINEARSIZE
    flags = 0x1 | 0x2 | 0x4 | 0x1000
    if mip_count > 1:
        flags |= 0x20000  # DDSD_MIPMAPCOUNT
    struct.pack_into('<I', header, 8, flags)
    struct.pack_into('<I', header, 12, height)
    struct.pack_into('<I', header, 16, width)
    struct.pack_into('<I', header, 20, pixel_size)  # pitch or linear size
    struct.pack_into('<I', header, 28, mip_count)   # mipMapCount

    # Pixel format at offset 76
    struct.pack_into('<I', header, 76, 32)  # pf size

    if fmt_code == 0x1C:  # BC7
        struct.pack_into('<I', header, 80, 0x4)  # DDPF_FOURCC
        struct.pack_into('<4s', header, 84, b'DX10')
        # DX10 extended header
        dx10 = bytearray(20)
        struct.pack_into('<I', dx10, 0, 98)  # DXGI_FORMAT_BC7_UNORM
        struct.pack_into('<I', dx10, 4, 3)   # D3D10_RESOURCE_DIMENSION_TEXTURE2D
        struct.pack_into('<I', dx10, 8, 0)   # misc flags
        struct.pack_into('<I', dx10, 12, 1)  # array size
        struct.pack_into('<I', dx10, 16, 0)  # misc flags 2
        return bytes(header) + bytes(dx10)
    elif fmt_code == 0x06:  # BC3/DXT5
        struct.pack_into('<I', header, 80, 0x4)
        struct.pack_into('<4s', header, 84, b'DXT5')
    elif fmt_code == 0x04:  # BC1/DXT1
        struct.pack_into('<I', header, 80, 0x4)
        struct.pack_into('<4s', header, 84, b'DXT1')
    elif fmt_code in (0x00, 0x0E):  # BGRA/RGBA
        struct.pack_into('<I', header, 80, 0x41)  # DDPF_RGB | DDPF_ALPHAPIXELS
        struct.pack_into('<I', header, 88, 32)  # bits per pixel
        struct.pack_into('<I', header, 92, 0x00FF0000)  # R mask
        struct.pack_into('<I', header, 96, 0x0000FF00)  # G mask
        struct.pack_into('<I', header, 100, 0x000000FF)  # B mask
        struct.pack_into('<I', header, 104, 0xFF000000)  # A mask
    else:
        struct.pack_into('<I', header, 80, 0x4)
        struct.pack_into('<4s', header, 84, b'DX10')
        dx10 = bytearray(20)
        struct.pack_into('<I', dx10, 0, fmt_code)
        struct.pack_into('<I', dx10, 4, 3)
        struct.pack_into('<I', dx10, 12, 1)
        return bytes(header) + bytes(dx10)

    # Caps
    caps = 0x1000  # DDSCAPS_TEXTURE
    if mip_count > 1:
        caps |= 0x8 | 0x400000  # DDSCAPS_COMPLEX | DDSCAPS_MIPMAP
    struct.pack_into('<I', header, 108, caps)
    return bytes(header)


def png_to_dds(png_path, fmt_code, width, height, mip_count):
    """
    Compress a PNG image to DDS with BCn compression and mipmaps.
    Uses etcpak for BC7/BC3/BC1 encoding.
    Returns DDS file bytes (header + all mip levels).
    """
    from PIL import Image
    try:
        import etcpak
    except ImportError:
        raise ImportError("etcpak not installed. Run: pip install etcpak")

    img = Image.open(png_path).convert('RGBA')
    if img.size != (width, height):
        print(f"  Resizing {img.size} -> ({width}, {height})")
        img = img.resize((width, height), Image.LANCZOS)

    # Generate mip chain
    pixel_data = b''
    w, h = width, height
    for mip in range(mip_count):
        if w < 4 or h < 4:
            break
        mip_img = img.resize((w, h), Image.LANCZOS) if (w, h) != img.size else img
        rgba = mip_img.tobytes()

        if fmt_code == 0x1C:  # BC7
            compressed = etcpak.compress_bc7(rgba, w, h)
        elif fmt_code == 0x06:  # BC3/DXT5
            compressed = etcpak.compress_bc3(rgba, w, h)
        elif fmt_code == 0x04:  # BC1/DXT1
            compressed = etcpak.compress_bc1(rgba, w, h)
        elif fmt_code in (0x00, 0x0E):  # Uncompressed RGBA
            compressed = rgba
        else:
            raise ValueError(f"Unsupported format 0x{fmt_code:X} for PNG compression")

        pixel_data += compressed
        w //= 2
        h //= 2

    header = build_dds_header(width, height, fmt_code, len(pixel_data))
    return header + pixel_data


def _update_pkg_checksum(pkg_path):
    """Recompute XXH64 hash for a .pkg file and update checksums.txt."""
    try:
        import xxhash
    except ImportError:
        print("  WARNING: xxhash not installed, cannot update checksums.txt. "
              "Run: pip install xxhash")
        return

    pkg_dir = os.path.dirname(pkg_path)
    pkg_name = os.path.basename(pkg_path)
    checksums_path = os.path.join(pkg_dir, 'checksums.txt')

    if not os.path.isfile(checksums_path):
        print(f"  WARNING: checksums.txt not found in {pkg_dir}")
        return

    # Compute new hash
    h = xxhash.xxh64()
    with open(pkg_path, 'rb') as f:
        while True:
            chunk = f.read(65536)
            if not chunk:
                break
            h.update(chunk)
    new_hash = h.hexdigest()

    # Read and update checksums.txt
    with open(checksums_path, 'r') as f:
        lines = f.readlines()

    updated = False
    for i, line in enumerate(lines):
        parts = line.strip().split('  ', 1)
        if len(parts) == 2 and parts[1] == pkg_name:
            lines[i] = f"{new_hash}  {pkg_name}\n"
            updated = True
            # Don't break - there might be duplicates

    if updated:
        with open(checksums_path, 'w') as f:
            f.writelines(lines)
        print(f"  Updated checksums.txt: {pkg_name} -> {new_hash}")
    else:
        print(f"  WARNING: {pkg_name} not found in checksums.txt")


def find_replacement_targets(pkg_dir, width, height, fmt, count=5):
    """
    Find existing texture entries that can be replaced with a custom texture.
    Prefers exact dimension match, then same pixel_size.
    Returns list of (base_name, info_dict) sorted by best match first.
    """
    index = load_texture_index(pkg_dir)
    if not index:
        return []

    exact = []
    compatible = []
    for key, info in index.items():
        if info['format'] != fmt:
            continue
        if info['width'] == width and info['height'] == height:
            exact.append((key, info))
        elif info['pixel_size'] >= width * height:  # roughly enough space
            compatible.append((key, info))

    # Prefer exact dimension matches, sorted by name (deterministic)
    exact.sort(key=lambda x: x[0])
    compatible.sort(key=lambda x: x[1]['pixel_size'])
    return (exact + compatible)[:count]


def build_standalone_pkg(textures, output_path):
    """
    Build a standalone .pkg file from scratch containing only the given textures.
    textures: list of dicts with {name, dds_path} or {name, png_path, width, height, fmt, mip_count}
    output_path: path for the .pkg file
    Returns True on success.
    """

    # Build the chunk data: sequence of 0xAD entries + 0xFF terminator
    chunk = bytearray()

    for tex in textures:
        entry_name = tex['name']
        dds_path = tex.get('dds_path')

        if dds_path:
            with open(dds_path, 'rb') as f:
                dds_raw = f.read()
        else:
            png_path = tex['png_path']
            fmt = tex.get('fmt', 0x1C)
            w = tex.get('width', 512)
            h = tex.get('height', 512)
            mips = tex.get('mip_count', 6)
            dds_raw = png_to_dds(png_path, fmt, w, h, mips)

        if dds_raw[:4] != b'DDS ':
            raise ValueError(f"Invalid DDS data for '{entry_name}'")

        dds_header_size = 128
        if dds_raw[84:88] == b'DX10':
            dds_header_size += 20
        pixel_data = dds_raw[dds_header_size:]
        dds_w = struct.unpack_from('<I', dds_raw, 16)[0]
        dds_h = struct.unpack_from('<I', dds_raw, 12)[0]
        mip_count = struct.unpack_from('<I', dds_raw, 28)[0] or 1

        # Detect format
        fourcc = dds_raw[84:88]
        if fourcc == b'DX10':
            dxgi = struct.unpack_from('<I', dds_raw, 128)[0]
            fmt = 0x1C if dxgi == 98 else dxgi
        elif fourcc == b'DXT5':
            fmt = 0x06
        elif fourcc == b'DXT1':
            fmt = 0x04
        else:
            fmt = 0x1C

        # CSString: 7-bit length + raw bytes
        name_bytes = entry_name.encode('utf-8')
        if len(name_bytes) < 128:
            cs_string = bytes([len(name_bytes)]) + name_bytes
        else:
            n = len(name_bytes)
            cs = bytearray()
            while n >= 128:
                cs.append((n & 0x7F) | 0x80)
                n >>= 7
            cs.append(n)
            cs_string = bytes(cs) + name_bytes

        # XNB header
        xnb_content_size = 20 + len(pixel_data)
        xnb_total = 10 + xnb_content_size
        xnb_header = b'XNBw\x06\x00' + struct.pack('<I', xnb_total)

        # Texture header
        tex_header = struct.pack('<IIIII', fmt, dds_w, dds_h, mip_count, len(pixel_data))

        # Total data size (big-endian)
        total_data = len(xnb_header) + len(tex_header) + len(pixel_data)

        # Write entry
        chunk.append(0xAD)
        chunk.extend(cs_string)
        chunk.extend(struct.pack('<I', _swap32(total_data)))
        chunk.extend(xnb_header)
        chunk.extend(tex_header)
        chunk.extend(pixel_data)

        print(f"  Added: {entry_name} ({dds_w}x{dds_h} fmt=0x{fmt:X} "
              f"{len(pixel_data):,} bytes)")

    # Terminator
    chunk.append(0xFF)
    # Compress chunk
    comp = lz4.block.compress(bytes(chunk), store_size=False)

    # Build .pkg: header + one compressed chunk
    # Header: version 7 + compressed flag = 0x20000007
    pkg = bytearray()
    pkg.extend(struct.pack('<I', _swap32(0x20000007)))
    pkg.append(0x01)  # flag: compressed
    pkg.extend(struct.pack('<I', _swap32(len(comp))))
    pkg.extend(comp)

    with open(output_path, 'wb') as f:
        f.write(pkg)
    print(f"  Built: {output_path} ({len(pkg):,} bytes, {len(textures)} texture(s))")

    # No .pkg_manifest needed for H2M standalone packages.
    # The manifest is only used by the game's atlas system (2D sprites),
    # not for 3D model textures. H2M validates the manifest content
    # and requires mod GUID in asset paths - skip it entirely.

    return True