#!/bin/bash

# Check input
SVG_FILE="$1"
if [ ! -f "$SVG_FILE" ]; then
    echo "Error: SVG file not found."
    exit 1
fi

# Set DPI (300–600 for sharp results)
DPI=600

# Temporary PNG
TMP_PNG=$(mktemp /tmp/svg2jpg.XXXXX.png)

# Convert SVG to PNG
inkscape "$SVG_FILE" \
    --export-area-page \
    --export-dpi="$DPI" \
    --export-type=png \
    --export-filename="$TMP_PNG" >/dev/null 2>&1

# Check if PNG was created
if [ ! -f "$TMP_PNG" ]; then
    echo "Error: Failed to rasterize SVG."
    exit 1
fi

# Convert PNG to high-quality JPEG and write to stdout
convert "$TMP_PNG" \
    -quality 100 \
    -sampling-factor 4:4:4 \
    -define jpeg:fancy-upsampling=off \
    -interlace Plane \
    jpeg:-

# Clean up
rm -f "$TMP_PNG"
