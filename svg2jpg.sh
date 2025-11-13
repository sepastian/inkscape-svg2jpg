#!/bin/bash
# Convert an SVG file to JPG via PNG.
# Input: SVG filename as first argument
# Output: JPEG data to STDOUT

# Get SVG filename from command-line argument
SVG_FILE="$1"

# Create temporary PNG file
PNG_FILE=$(mktemp /tmp/svg2jpg.XXXXX.png)

# Convert SVG to PNG using Inkscape
inkscape --export-type=png --export-area-page "$SVG_FILE" --export-filename="$PNG_FILE" >/dev/null 2>&1

# Convert PNG to JPEG and write to stdout
convert "$PNG_FILE" jpeg:-

# Remove temporary file
rm -f "$PNG_FILE"
