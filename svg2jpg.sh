#!/bin/bash

# Convert an SVG file to JPG via PNG.
# The name of the input SVG file is read from STDIN.
# The output JPEG file is written to STDOUT.

SVG_TMP_FILE="$1"
PNG_TMP_FILE="/tmp/$(mktemp 'svg2jpg.png.XXXXX')"

# Convert input SVG file to temporary PNG file.
# Note: writes all output of 'inkscape' to /dev/null, even (possible) error messages.
inkscape --export-png="${PNG_TMP_FILE}" --export-area-page "${SVG_TMP_FILE}" 2&>1 /dev/null

# Convert temporary PNG file to JPG on STDOUT, delete temporary PNG file.
convert ephemeral:"${PNG_TMP_FILE}" jpeg:-
